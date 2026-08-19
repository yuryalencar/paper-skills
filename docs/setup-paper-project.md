# /setup-paper-project

> Step zero: the venue's template in a GitHub repository, connected to Overleaf in the order Overleaf
> actually supports, ready for the writing skills to work inside.

**Status:** alpha · **Version:** 0.1.0 · **Invocation:** `/setup-paper-project` ·
**Auto-loads:** no, **manual only** · **Tags:** `research`
**Companion skills:** [write-paper](write-paper.md), [paper-writing-style](paper-writing-style.md)

## What it does

Every other skill in this family assumes a `.tex` file already exists. This one creates the project that
makes them usable: finds the target venue's LaTeX template, scaffolds the repository, creates it on GitHub,
and connects it to Overleaf.

It is **manual-only** (`disable-model-invocation: true`). It creates a GitHub repository and pushes to it,
which are outward-facing actions with consequences, so it never runs because Claude inferred you wanted it.

## The thing worth knowing before you start

**Overleaf cannot link an Overleaf project to a GitHub repository that already exists.** You get one
direction, chosen at creation: either create the Overleaf project *from* a GitHub repo, or create a GitHub
repo *from* an Overleaf project.

So the order is:

```
venue template  ->  local repo  ->  GitHub  ->  Overleaf project created FROM the repo
```

The intuitive order fails. Starting a project on Overleaf with the venue template, then trying to attach a
repository afterwards, is not supported. This skill exists partly to stop that.

## What Overleaf sync actually does

Stated up front, because several of these surprise people:

| Fact | Consequence |
| :--- | :--- |
| GitHub sync is **premium only** (Commons, group, or individual subscription) | Many universities provide it via Commons. Check before planning around it |
| Sync is **manual**, from the project menu | Nothing is automatic. Push before editing locally, pull before editing on Overleaf |
| **No branching** in Overleaf's git | Branch locally if you like; Overleaf sees only the default branch |
| Simultaneous edits **cannot auto-merge** | Overleaf pushes its version as a branch and you resolve it yourself |
| **Track changes and comments can be lost** on pull | Warn co-authors who comment in Overleaf before you pull |
| **github.com only** | An institutional GitHub Enterprise host will not work |
| Under 100 files per commit, under 100 MB total recommended | Keep raw data out |
| No Git LFS, no submodules; symlinks flatten | Do not plan around them |

**No premium?** The repository stays the source of truth, you work locally, and Overleaf is used only when
a co-author needs a browser, by upload and download. The skill says plainly that this is manual and
error-prone, and that a repository on its own is a perfectly good way to write a paper.

## When to use it

- Starting a new paper for a specific conference or journal.
- You want the repository and Overleaf set up correctly the first time.

## When *not* to use it

- **A project already exists.** It stops and asks rather than scaffolding over anything.
- **You just want to know what to write next.** Use [write-paper](write-paper.md).
- **You have no target venue yet.** The template is venue-specific, so pick the venue first. A generic
  `article` scaffold now means redoing the formatting later.

## Install

```
/plugin marketplace add yuryalencar/ai-skills
/plugin install setup-paper-project@yuryalencar-ai-skills
```

Or `./install.sh setup-paper-project`. Invoke it with `/setup-paper-project`; it will not auto-load.

## Inputs

| Asked | Why |
| :--- | :--- |
| The target conference or journal | Determines the template |
| **The official template**, as a URL or downloaded zip | It will not write or approximate a class file. See below |
| Repository name and visibility | Defaults to private |
| Whether you have Overleaf premium | Determines which path it describes |

## Outputs

```
<paper-name>/
├── main.tex              preamble, title block, \input order, bibliography
├── src/
│   ├── macros.tex        \ifblind switch, \RQ, recurring values, 	odo and 
ote
│   └── <section>.tex     one per section, named for your paper's actual structure
├── references.bib
├── figures/              plus .gitkeep, with \graphicspath set in main.tex
├── <venue .cls, .bst, .sty>
├── build.ps1             gates on main.log, reports the page count
├── .gitignore            LaTeX build artefacts
├── CLAUDE.md             the project's own conventions. Authoritative
└── paper-out/
    └── STATE.md          position: step 0, figures not yet selected
```

Sections live one per file in `src/`, pulled in by `main.tex`. The venue template's preamble, title block
and author block stay untouched; only its body is replaced with `\input` lines. Every `src/*.tex` is created
as an empty file with a comment naming what belongs there, so **the project compiles from the first
commit**: a scaffold that does not build is worse than no scaffold, because building it is the first thing
a co-author tries.

**It asks what your sections are** rather than imposing a set. An empirical software engineering paper wants
`background`, `study-design`, `results`, `discussion`, `threats`, `related-work` and `end-matter`; an
experimental physical sciences paper wants `experimental` and `results-discussion`. The writing skills read
the `\input` list rather than assuming names, so `conclusion` and `conclusions` both work.

`src/macros.tex` is created even when nearly empty, because three things in it pay for themselves at once:
`\ifblind` so a double-blind author block switches with one line at camera-ready, recurring values as macros
so a revised number changes in one place instead of three, and `	odo{}` rendering in red so a gap is
visible in the compiled PDF rather than hiding in a comment until submission.

Where a venue template requires a section inline, most often an abstract that must sit in a command
argument rather than an environment, that section stays in `main.tex` and the skill says which ones it had
to leave there.

Every writing skill detects this layout. With `src/` present they read and write that section's file and
leave `main.tex` alone. Without it they work in whatever file holds the section and do not restructure your
project uninvited.

Plus the GitHub repository, and instructions for the Overleaf step, which happens in the browser and
cannot be automated from here.

## Why it will not fetch the template for you

It asks you for the official template rather than producing one. Three reasons, and they are not caution
for its own sake:

- Venues change requirements between years and editions.
- An out-of-date template causes a **desk rejection for formatting**, before anyone reads the science.
- A hand-written approximation of a class file is worse than no class file, because it looks right and
  is not.

If you have the call for papers, the template link is usually in it. The skill records the template
version and where it came from, so a later session can tell whether it is still current.

## Example

```
> /setup-paper-project

Target venue? -> ICSE 2027

ICSE uses the ACM acmart class. Before anything else, one thing that
determines the whole order:

Overleaf cannot connect to a GitHub repo that already exists. So we go
template -> local repo -> GitHub -> Overleaf project created FROM the repo.
If you have already made an Overleaf project for this, tell me now, because
we would take the other direction instead.

Do you have Overleaf premium, through JKU's Commons or otherwise? GitHub
sync is premium only.

Please give me the official acmart template from the ICSE 2027 call for
papers, as a link or a zip. I will not write a class file from memory: ACM
revises acmart between editions and a stale template gets desk rejected on
formatting.

Then confirm:
  repository name: icse2027-crosslinked-films
  visibility:      private   (it will hold an unpublished manuscript)
  local path:      ~/papers/icse2027-crosslinked-films
```

After the scaffold, the GitHub push, and the Overleaf steps, it hands off:

> The repository is set up and Overleaf is connected. The next step is not writing, it is **selecting and
> ordering your figures**. Once they are settled, run `/write-paper` in this folder.

## Side effects

**This skill has real side effects**, which is why it is manual only:

- Creates files and directories locally.
- Runs `git init`, commits, and **creates a GitHub repository** via `gh`, then pushes.
- Reads the network only if you give it a template URL.

It confirms the repository name and visibility before creating anything, defaults to **private**, and will
not create a public repository holding an unpublished manuscript without an explicit instruction. If `gh`
is missing or unauthenticated it hands you the commands instead of improvising with credentials.

## Design decisions

- **Manual only.** Creating a GitHub repository is not something to infer from context.
- **Private by default.** The repository holds an unpublished manuscript.
- **The Overleaf ordering constraint is stated first**, before any work, because it determines the whole
  sequence and is invisible until it fails.
- **Overleaf's limitations are stated honestly**, including that sync is premium and manual, and that pulls
  can drop co-authors' comments. A skill that oversells an integration wastes an afternoon.
- **It never writes a class file.** The failure mode is a desk rejection on formatting, which is the worst
  possible reason to lose a submission.
- **It refuses to scaffold over an existing project.**
- **Raw data stays out**, following Overleaf's file and size guidance.
- **`paper-out/` is not gitignored**, unlike build artefacts: the decision log is meant to be committed.
- **It hands off to figure selection, not to writing.** Step 0 of the writing order is choosing and
  ordering the figures, and no skill can do that.

## Sources

The writing order and the figures-first principle are from Module 4 of *Curso de Escrita Científica* by
Prof. Dr. Valtencir Zucolotto, IFSC/USP, transcript in
[`sources/`](../sources/curso_escrita_cientifica_valtencir_zucolotto.md). The Overleaf synchronization
constraints are from Overleaf's own GitHub synchronization documentation, checked 2026-08-19.

## Changelog

- **0.1.0**: initial version.
