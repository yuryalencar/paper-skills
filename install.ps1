<#
.SYNOPSIS
    Install skills from this repo into ~/.claude/skills.

.DESCRIPTION
    skills/ is flat, matching the layout Claude Code installs. Grouping lives in each
    skill's metadata.tags, so a skill can belong to several groups at once.

.EXAMPLE
    .\install.ps1 scientific-writing
.EXAMPLE
    .\install.ps1 -All
.EXAMPLE
    .\install.ps1 -Tag research
.EXAMPLE
    .\install.ps1 -List
.EXAMPLE
    .\install.ps1 scientific-writing -Link      # symlink instead of copy
.EXAMPLE
    .\install.ps1 scientific-writing -Project   # install into .\.claude\skills
#>
[CmdletBinding()]
param(
    [Parameter(Position = 0, ValueFromRemainingArguments = $true)]
    [string[]] $Skill,

    [string] $Tag,
    [switch] $All,
    [switch] $List,
    [switch] $Link,
    [switch] $Project,
    [switch] $Force
)

$ErrorActionPreference = 'Stop'

$repoDir = $PSScriptRoot
$srcDir = Join-Path $repoDir 'skills'
$destDir = if ($Project) {
    Join-Path (Get-Location).Path '.claude\skills'
} else {
    Join-Path $HOME '.claude\skills'
}

# Read metadata.tags from a skill's frontmatter. Expects a single-line flow
# sequence: "  tags: [a, b]".
function Get-SkillTags {
    param([string] $Path)

    $file = Join-Path $Path 'SKILL.md'
    if (-not (Test-Path $file)) { return @() }

    $lines = Get-Content -Path $file
    $inFrontmatter = $false

    for ($i = 0; $i -lt $lines.Count; $i++) {
        $line = $lines[$i]
        if ($i -eq 0 -and $line -match '^---\s*$') { $inFrontmatter = $true; continue }
        if (-not $inFrontmatter) { continue }
        if ($line -match '^---\s*$') { break }
        if ($line -match '^\s*tags:\s*\[(.*)\]') {
            return $Matches[1] -split ',' |
                ForEach-Object { $_.Trim() } |
                Where-Object { $_ }
        }
    }
    return @()
}

function Get-AvailableSkills {
    if (-not (Test-Path $srcDir)) { return @() }

    Get-ChildItem -Path $srcDir -Directory |
        Where-Object { Test-Path (Join-Path $_.FullName 'SKILL.md') } |
        ForEach-Object {
            [pscustomobject]@{
                Name = $_.Name
                Path = $_.FullName
                Tags = @(Get-SkillTags -Path $_.FullName)
            }
        }
}

function Show-AvailableSkills {
    $available = @(Get-AvailableSkills)
    if ($available.Count -eq 0) {
        Write-Host '  (no skills in this repo yet)'
        return
    }
    foreach ($s in $available | Sort-Object Name) {
        $tagLabel = if ($s.Tags.Count -gt 0) { "[$($s.Tags -join ',')]" } else { '(untagged)' }
        Write-Host ('  {0,-28} {1}' -f $s.Name, $tagLabel)
    }
}

if ($List) {
    Write-Host 'skills in this repo:'
    Show-AvailableSkills
    return
}

$available = @(Get-AvailableSkills)

$targets = if ($All) {
    $available.Name
} elseif ($Tag) {
    $tagged = @($available | Where-Object { $_.Tags -contains $Tag })
    if ($tagged.Count -eq 0) {
        Write-Warning "no skill carries the tag '$Tag'"
        Write-Host ''
        Write-Host 'available:'
        Show-AvailableSkills
        exit 1
    }
    $tagged.Name
} else {
    $Skill
}

if (-not $targets -or @($targets).Count -eq 0) {
    Write-Host 'nothing to install. Pass a skill name, -Tag <tag>, -All, or -List.'
    Write-Host ''
    Write-Host 'available:'
    Show-AvailableSkills
    exit 1
}

$failed = $false
$installed = 0

foreach ($name in $targets) {
    $src = Join-Path $srcDir $name

    if (-not (Test-Path (Join-Path $src 'SKILL.md'))) {
        Write-Warning "no skill named '$name'"
        $failed = $true
        continue
    }

    if (-not (Test-Path $destDir)) {
        New-Item -ItemType Directory -Path $destDir -Force | Out-Null
    }

    $dest = Join-Path $destDir $name

    if (Test-Path $dest) {
        if (-not $Force) {
            $reply = Read-Host "replace existing $dest? [y/N]"
            if ($reply -notmatch '^[yY]') {
                Write-Host "skipped $name"
                continue
            }
        }
        Remove-Item -Path $dest -Recurse -Force -Confirm:$false
    }

    if ($Link) {
        try {
            New-Item -ItemType SymbolicLink -Path $dest -Target $src -ErrorAction Stop | Out-Null
            Write-Host "linked  $name -> $dest"
            $installed++
        } catch {
            Write-Warning "symlink failed for $name (needs Developer Mode or an elevated shell): $($_.Exception.Message)"
            $failed = $true
        }
    } else {
        Copy-Item -Path $src -Destination $dest -Recurse
        Write-Host "copied  $name -> $dest"
        $installed++
    }
}

if ($installed -gt 0) {
    Write-Host ''
    Write-Host 'restart Claude Code (or run /reload-plugins) to pick up new skills.'
}

if ($failed) { exit 1 }
