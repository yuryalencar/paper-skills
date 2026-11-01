---
name: setup-paper-project
description: Set up a new scientific paper project before writing starts: find the target conference or journal's LaTeX template, scaffold the repository with the right structure and gitignore, create the GitHub repository, and connect it to Overleaf in the order Overleaf actually supports. Use when starting a new paper, asked to set up a paper project or repository, or asked how to begin writing a paper for a specific venue.
disable-model-invocation: true
allowed-tools: Read, Grep, Glob
---

# /setup-paper-project

Step zero, before figures and before any writing. Produces a repository containing the venue's template,
connected to Overleaf, that the rest of the family can then work inside.

This skill **creates a GitHub repository and pushes to it**. Those are outward-facing actions, so confirm
the repository name and visibility with the researcher before running anything, and never create a public
repository holding an unpublished manuscript without asking explicitly.

## Before anything else

1. **Load the style rules.** Invoke `paper-writing-style`, and read `references/session-state.md` since
   this skill creates the initial `paper-out/`.
2. **Lock the language.** Language of the user's first message, whole run.
3. **Check what already exists.** If the working directory already contains a `.tex` file or a git repo,
   stop and ask before doing anything. Scaffolding over an existing project is destructive.

## The order matters, and it is not obvious

Overleaf **cannot link an Overleaf project to a GitHub repository that already exists**. You get one of two
directions, chosen once at creation. **Ask which one applies before doing anything**, because it determines
the whole sequence:

**Direction A, starting from nothing.** Template into a local repo, push to GitHub, then create the Overleaf
project **from** that repository.

**Direction B, starting from Overleaf.** The researcher already has an Overleaf project, usually created by
importing the venue template through Overleaf's own template gallery. Then the GitHub repository is created
**from** the Overleaf project, cloned locally, and restructured into `src/` from there. This is common and
perfectly fine; the first commit ends up being the Overleaf import.

What does not work in either direction is attaching an existing repository to an existing Overleaf project.
If the researcher has both already, one has to be recreated from the other, so establish this first rather
than discovering it later.

For direction B, skip repository creation below: clone what Overleaf produced, then apply the scaffold to it
as a restructuring commit.

## What Overleaf sync does and does not do

State these honestly up front. Several of them surprise people.

| Fact | Consequence |
| :--- | :--- |
| GitHub sync is **premium only**: Overleaf Commons, a group subscription, or an individual subscription | Many universities provide it through Commons. If the researcher has no premium access, use the fallback below |
| Sync is **manual**, triggered from the project menu | Nothing happens automatically. Push before you edit locally, pull before you edit on Overleaf |
| **No branching** in Overleaf's git integration | Branch locally if you want, but Overleaf only ever sees the default branch |
| Simultaneous edits on both sides **cannot auto-merge** | Overleaf pushes a branch with its version and you resolve it on GitHub or locally |
| **Track changes and comments can be lost** on pull | Co-authors commenting in Overleaf should be warned before a pull |
| **github.com only**, not GitHub Enterprise | An institutional GHE host will not work |
| Recommended limits: under 100 files per commit, under 100 MB total | Keep raw data out of the repo |
| No Git LFS, no submodules; symlinks become regular files | Do not plan around them |

**Fallback without premium.** Keep the repository as the source of truth, work locally, and use Overleaf
only when a co-author needs to edit in a browser, moving files by upload and download. Say plainly that
this is manual and error-prone, and that a repository alone is a perfectly good way to write a paper.

## Workflow

### 1. Identify the venue and get its template

Ask for the target conference or journal. Then find its template. Common ones:

| Venue family | Class | Where it comes from |
| :--- | :--- | :--- |
| IEEE conferences and journals | `IEEEtran` | IEEE author centre, or CTAN |
| ACM conferences | `acmart` | ACM template page, or CTAN |
| Springer LNCS | `llncs` | Springer author instructions |
| Springer journals | `sn-jnl` | Springer template page |
| Elsevier journals | `elsarticle` | Elsevier author page, or CTAN |
| ACS journals | `achemso` | ACS author guidelines, or CTAN |
| APS journals | `revtex4-2` | APS author page, or CTAN |
| Nature, Science | often a plain Word or LaTeX skeleton | Journal author instructions |

**Do not guess a template or write one from memory.** Ask the researcher for the official template, as a
URL or a downloaded zip, and say why: venues change requirements between years and editions, an
out-of-date template causes a desk rejection for formatting, and a hand-written approximation of a class
file is worse than none. If they have the call for papers, the template link is usually in it.

Record the venue, the template version, and where it came from, since a future session will need to know
whether the template is current.

### 2. Confirm the plan before touching anything

Present the plan and get explicit agreement:

- Repository name and **visibility**. Default to **private**: it will hold an unpublished manuscript.
  Never create it public without an explicit instruction.
- Local directory path.
- Whether they have Overleaf premium, so you know which path to describe in step 5.

### 3. Scaffold locally

```
<paper-name>/
├── main.tex              venue template: preamble, title block, \input order, bibliography.
│                         The only file with document-level structure
├── src/                  one file per section, this is where the writing happens
│   ├── macros.tex        shared macros and switches. Created first, read first
│   └── <section>.tex     one per section, named for the paper's actual structure
├── references.bib        empty, ready
├── figures/              all figures, plus a .gitkeep so the directory is tracked
├── <venue class files>   .cls, .bst, .sty shipped with the template
├── build.ps1 or Makefile build script
├── .gitignore            LaTeX build artefacts
├── CLAUDE.md             the project's own conventions. See below
└── paper-out/            created by the writing skills on first decision
```

#### Sections in `src/`

**One file per section**, pulled in by `main.tex`. Keep the venue template's preamble, title block and
author block untouched; replace only its body with `\input` lines.

**Ask what the section structure is** rather than imposing one. It depends on the venue and the kind of
paper, and one question settles it:

| Kind of paper | Typical `src/` files |
| :--- | :--- |
| Empirical software engineering | `abstract`, `introduction`, `background`, `study-design`, `results`, `discussion`, `threats`, `related-work`, `conclusion`, `end-matter` |
| Experimental physical sciences | `abstract`, `introduction`, `experimental`, `results-discussion`, `conclusions` |
| Anything | whatever the venue's accepted papers actually use |

`results` and `discussion` are often separate files even where the venue merges the section, and
`conclusion` singular is as common as `conclusions`. Use what the researcher says: the writing skills read
the `\input` list rather than assuming names.

`end-matter.tex` earns its own file where the venue expects CRediT statements, competing interest
declarations, data availability statements and acknowledgements. Those also identify the authors, so under
double-blind review they belong behind the `\ifblind` switch.

Create each file with a single comment naming what belongs there, so **the project compiles from the first
commit**. A scaffold that does not build is worse than none, because building it is the first thing a
co-author tries.

Where a venue template requires a section inline, most often an abstract inside a command argument rather
than an environment, leave it in `main.tex` and say which ones you had to, so the writing skills know where
to look.

#### `src/macros.tex`

Create this even when it starts nearly empty. It is what keeps terminology and numbers consistent across
section files, and every writing skill reads it before drafting.

```latex
% Project-specific macros. Define terminology once here so wording stays
% consistent across all section files.

% Double-blind switch. \blindtrue for submission, \blindfalse for camera-ready.
% Controls the author block in main.tex and the identifying end matter.
\newif\ifblind
\blindtrue

% Research questions. Do not name this \rq: LaTeX already defines it.
\newcommand{\RQ}[1]{\textbf{RQ#1}}

% Recurring values. Change once, changes everywhere.
% \newcommand{\nparticipants}{54\xspace}

% Draft annotations. Remove before submission.
\newcommand{\todo}[1]{\textcolor{red}{[TODO: #1]}}
\newcommand{\note}[1]{\textcolor{blue}{[Note: #1]}}
```

Three of these earn their place immediately:

- **`\ifblind`** for a double-blind venue, so the author block and identifying end matter switch with one
  line at camera-ready instead of being edited by hand. Ask whether the venue is double blind.
- **Recurring values as macros**, so a revised number changes in one place instead of separately in the
  abstract, the results and the conclusions. The writing skills propose new ones as values recur.
- **`\todo{}` rendering in red**, so a gap is visible in the compiled PDF. A `% TODO:` comment is invisible
  and survives to submission. The writing skills use this macro wherever it exists.

`\todo` and `\note` need `xcolor`, and `\xspace` needs `xspace`. Add both to the preamble if the template
does not already load them.

#### Figures

Set `\graphicspath{{figures/}}` in `main.tex` so figures are included **without a path or extension**:
`\includegraphics{detection-accuracy}`. Add `figures/.gitkeep` so the empty directory is tracked.

#### `.gitignore`

Build artefacts in a repository synced with Overleaf cause noise and conflicts:

```gitignore
*.aux
*.bbl
*.blg
*.fdb_latexmk
*.fls
*.log
*.out
*.synctex.gz
*.toc
*.lof
*.lot
*.spl
*.nav
*.snm
*.vrb
*.run.xml
*.bcf
main.pdf
```

Keep `main.pdf` ignored unless the venue or the co-authors want a built PDF committed. Say which you chose.

Do **not** gitignore `paper-out/`: the decision log is meant to be committed alongside the manuscript.

#### `build.ps1` or `Makefile`

Ship a build script rather than leaving people to remember the pass order. A full build is `pdflatex`,
`bibtex`, `pdflatex`, `pdflatex`. Offer a quick single-pass mode for iteration, and say that it leaves
cross-references and citations stale.

Two things the script must do that a bare `pdflatex` call does not:

- **Gate on the log, not the exit code.** `pdflatex` exits non-zero on warnings alone, so its exit status is
  not a usable pass or fail signal. Parse `main.log` for real errors instead, and surface undefined
  references separately as warnings.
- **Report the page count.** Conference limits are hard, and an over-length paper is desk rejected without
  being read.

#### `CLAUDE.md`

Write the project's own conventions file. It is what makes every later session start correctly, and it
outranks the defaults in `paper-writing-style`. Record at minimum:

- The target venue, the submission deadlines, and the template provenance and version.
- The layout, and the rule that section prose never goes in `main.tex`.
- Where new packages go (`main.tex`) versus new macros (`src/macros.tex`).
- The label convention, for example `sec:`, `fig:` and `tab:` prefixes with kebab-case names.
- The build command and **the page limit**.
- **Where the numbers come from.** If the analysis lives in a separate replication package, name its path
  and state that every statistic must trace to a file in it. This is the most valuable line in the file:
  it is what stops a number being invented three months later.

### 4. Create the GitHub repository and push

Use `gh` if available. Confirm name and visibility first, then initialise, commit the scaffold, create the
repository, and push. Report the URL.

If `gh` is not installed or not authenticated, say so and give the researcher the two commands to run
themselves rather than guessing at credentials.

### 5. Connect Overleaf

This step happens in the Overleaf web interface and cannot be automated from here. For **direction A**, give
the researcher the exact steps and wait. For **direction B** the project already exists on Overleaf and the
repository came from it, so the connection is already in place: confirm it still pushes and pulls, and skip
to step 6.

Direction A:

1. On Overleaf, choose **New Project**, then **Import from GitHub**.
2. Authorise Overleaf's GitHub access if prompted.
3. Pick the repository just created.
4. Confirm the project compiles. If it does not, the template is usually missing a class or bibliography
   style file, so check those were committed.
5. Paste the Overleaf project link back, and add it to `README.md`.

Remind them that from here on, sync is manual in both directions, and that pulling into Overleaf can drop
comments and track changes a co-author has left.

### 6. Hand off to the writing workflow

The project is ready. Say what comes next and why:

> The repository is set up and Overleaf is connected. The next step is not writing, it is **selecting and
> ordering your figures**. The figures tell the story and the text supports them, so the results and
> discussion section is written to a figure sequence that is already settled.
>
> Once the figures are chosen, run `/write-paper` in this folder and it will take you through the rest.

Create `paper-out/STATE.md` recording the venue, the template provenance, the repository and Overleaf
links, and the position as step 0, figures not yet selected.

## Hard rules

- **Never create a GitHub repository without confirming name and visibility.** Default private.
- **Never create a public repository holding an unpublished manuscript** unless explicitly told to.
- **Never scaffold over an existing project.** Stop and ask.
- **Never write or approximate a venue class file.** Get the official template or stop.
- **Never claim Overleaf sync works on a free account.** It is premium only, and saying otherwise wastes
  the researcher's afternoon.
- **Never tell the researcher to link an existing Overleaf project to an existing repository.** It is not
  supported. Establish which direction applies before starting, since one side has to be created from the
  other.
- **Never impose a section structure.** Ask what the paper's sections are; they depend on the venue and the
  kind of study.
- **Never skip `src/macros.tex` or the project `CLAUDE.md`.** They are what make every later session start
  correctly.
- **Never commit raw data.** Overleaf recommends staying under 100 files and 100 MB, and data belongs in a
  repository or archive of its own.
- **Never emit an em dash (`---`).**
- If `gh` is unavailable, hand the commands over rather than improvising with credentials.
