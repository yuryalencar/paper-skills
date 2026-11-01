# /organize

> Step zero: give it the venue and its author guidelines, and it builds a LaTeX project in that venue's
> format, ready for `/write` and `/review` to work inside. GitHub and Overleaf are an optional last step.

**Status:** alpha · **Version:** 0.2.1 · **Invocation:** `/organize` ·
**Auto-loads:** no, **manual only**
**Companion skills:** [ask-paper](ask-paper.md), [write](write.md), [review](review.md),
[paper-writing-style](paper-writing-style.md)

Formerly `setup-paper-project`.

## What it does

Every other skill in this package assumes a `.tex` file already exists. This one creates the project that
makes them usable. You give it the target venue and the URL of its author guidelines. It reads the page into
a **venue profile** (document class, page limit, abstract limit, review mode, citation style, required
sections and declarations, figure rules), shows you the profile with a source for each row, fetches the
official template, and scaffolds a project that compiles from the first commit.

Anything the page does not answer stays marked **unknown**. It never fills a venue requirement from memory
of what IEEE, ACM or Springer "usually" do, because that convention may be a year out of date and a wrong
profile that sounds authoritative is worse than a visible gap.

It is **manual-only** (`disable-model-invocation: true`). The optional last step creates a GitHub repository
and pushes to it, which are outward-facing actions, so it never runs because Claude inferred you wanted it.

## When to use it

- Starting a new paper for a specific conference or journal.
- You want the structure, macros, build script and project conventions right the first time.

## When *not* to use it

- **A project already exists.** It stops and asks rather than scaffolding over anything.
- **You just want to know what to write next.** Use [ask-paper](ask-paper.md).
- **You have no target venue yet.** The template is venue-specific, so pick the venue first. A generic
  `article` scaffold now means redoing the formatting later.

## Install

```
/plugin marketplace add yuryalencar/paper-skills
/plugin install organize@yuryalencar-paper-skills
/plugin install paper-writing-style@yuryalencar-paper-skills
```

Or `./install.sh organize paper-writing-style`. Invoke it with `/organize`; it will not auto-load.

## Inputs

| Asked | Why |
| :--- | :--- |
| The venue, as the argument or when asked | Determines the template |
| **The URL of its author guidelines or submission page** | The source of the venue profile. If it cannot be fetched, paste the text or attach the file |
| The kind of paper | Decides the `src/` sections |
| Whether to publish to GitHub and connect Overleaf | Opt-in. Repository name and visibility, default private, are asked only if yes |

## Outputs

```
<paper-name>/
├── main.tex              preamble, title block, \input order, bibliography
├── src/
│   ├── macros.tex        \ifblind switch, \RQ, recurring values, \todo and \note
│   └── <section>.tex     one per section, named for your paper's actual structure
├── references.bib
├── figures/              plus .gitkeep, with \graphicspath set in main.tex
├── <venue .cls, .bst, .sty>
├── build.ps1 or Makefile gates on main.log, reports the page count
├── .gitignore            LaTeX build artefacts, and the contents of exemplars/
├── exemplars/            local only: previous papers from the target venue
│   └── .gitkeep
├── CLAUDE.md             the project's own conventions. Authoritative
└── paper-out/
    └── STATE.md          venue profile, template provenance, position: step 0
```

Sections live one per file in `src/`, pulled in by `main.tex`. The venue template's preamble, title block
and author block stay untouched; only its body is replaced with `\input` lines. Every `src/*.tex` starts as
a file with a comment naming what belongs there, and the skill builds once to confirm **the project
compiles from the first commit**: a scaffold that does not build is worse than none.

**It asks what your sections are** rather than imposing a set, using the venue profile as the starting
point. An empirical software engineering paper wants `background`, `study-design`, `results`, `discussion`,
`threats`, `related-work` and `end-matter`; an experimental physical sciences paper wants `experimental` and
`results-discussion`. `/write` and `/review` read the `\input` list rather than assuming names.

`src/macros.tex` is created even when nearly empty, because three things in it pay for themselves at once:
`\ifblind` so a double-blind author block switches with one line at camera-ready, recurring values as macros
so a revised number changes in one place instead of three, and `\todo{}` rendering in red so a gap is
visible in the compiled PDF rather than hiding in a comment until submission.

## The `exemplars/` folder

Every project gets an `exemplars/` folder, created with a `.gitkeep`. **Fill it with previous papers from your
target venue and track**: ideally accepted ones, and ideally 5 to 10 of the kind of paper you are writing. A
systematic mapping of the track is a good way to collect them. A previous paper from the same venue is one
of the most useful things you can have when writing a new one, and an empty folder in the project is a
standing reminder to add them.

[draft](draft.md) reads them to base your paper's structure on what that venue actually accepts, keeping what
recurs across them. It takes structure only, never sentences or results.

**It is local only.** `.gitignore` ignores everything in `exemplars/` except the `.gitkeep`, so the papers
never reach git or Overleaf: they are other people's copyrighted work and the folder can be large. The
project `CLAUDE.md` records that.

## Why it will not write the template itself

It uses the official template from the link it found, or from one you supply. Three reasons, and they are
not caution for its own sake:

- Venues change requirements between years and editions.
- An out-of-date template causes a **desk rejection for formatting**, before anyone reads the science.
- A hand-written approximation of a class file is worse than no class file, because it looks right and
  is not.

A downloaded template is treated as untrusted: it is unpacked in its own directory, inspected, and only the
class, style and example files are copied in. Nothing it ships is run.

## The optional Git and Overleaf step

**Overleaf cannot link an Overleaf project to a GitHub repository that already exists.** You get one
direction, chosen at creation: either create the Overleaf project *from* a GitHub repo, or create a GitHub
repo *from* an Overleaf project. The skill establishes which applies before doing anything, and states the
limits up front:

| Fact | Consequence |
| :--- | :--- |
| GitHub sync is **premium only** (Commons, group, or individual subscription) | Many universities provide it via Commons. Check before planning around it |
| Sync is **manual**, from the project menu | Push before editing locally, pull before editing on Overleaf |
| **No branching** in Overleaf's git | Overleaf sees only the default branch |
| Simultaneous edits **cannot auto-merge** | Overleaf pushes its version as a branch and you resolve it |
| **Track changes and comments can be lost** on pull | Warn co-authors who comment in Overleaf |
| **github.com only** | An institutional GitHub Enterprise host will not work |
| Under 100 files per commit, under 100 MB total | Keep raw data out |
| No Git LFS, no submodules; symlinks flatten | Do not plan around them |

It confirms the repository name and visibility before creating anything, defaults to **private**, and will
not create a public repository holding an unpublished manuscript without an explicit instruction. If `gh`
is missing or unauthenticated it hands you the commands instead of improvising with credentials. If you skip
this step, a local repository alone is a perfectly good way to write a paper.

## Example

Illustrative only: the venue, URL and values below are made up to show the shape of the exchange, not
real ICSE requirements.

```
> /organize ICSE 2027 https://conf.researchr.org/track/icse-2027/icse-2027-research-track

Read the page. Venue profile:

  Class            acmart, sigconf   (page linked: "ACM Master Article Template")
  Page limit       10 pages + references   (stated under "Submission Format")
  Review mode      double blind   (stated under "Anonymity")
  Abstract limit   unknown, the page does not say
  Required         data availability section   (stated under "Open Science")

Is this right? And what are your sections? For an empirical study I would
propose: abstract, introduction, background, study-design, results,
discussion, threats, related-work, conclusion, end-matter.
```

After the scaffold and a test build:

> The project is set up. The next step is not writing, it is **selecting and ordering your figures**.
> Once they are settled, run `/ask-paper` in this folder.

## Side effects

- Creates files and directories locally, and builds once if a TeX distribution is installed.
- Fetches the author-guidelines page and the template over the network.
- **Only if you opt in:** runs `git init`, commits, creates a GitHub repository via `gh`, and pushes.

## Design decisions

- **Venue profile from the page, never from memory.** The brief for this version asked for the venue name
  and a description of its site so the format could be recovered. Unknown fields stay unknown, per the
  repository rule against inventing a model the source does not contain.
- **Local scaffold first, Git and Overleaf optional.** Chosen in the authoring interview, since the
  structure is the core job and publishing is a separate, outward-facing decision.
- **`exemplars/` is always created, with a `.gitkeep`.** Added at the researcher's instruction: previous
  papers from the target venue are among the most useful inputs to a new paper, so the folder is part of
  every scaffold rather than an opt-in. Its contents are gitignored; only the `.gitkeep` is tracked.
- **Manual only.** Creating a GitHub repository is not something to infer from context.
- **Private by default.** The repository holds an unpublished manuscript.
- **The Overleaf ordering constraint is stated first**, before any work, because it determines the whole
  sequence and is invisible until it fails.
- **Overleaf's limitations are stated honestly**, including that sync is premium and manual, and that pulls
  can drop co-authors' comments.
- **It never writes a class file.** The failure mode is a desk rejection on formatting.
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

- **0.2.1**: always creates a gitignored `exemplars/` folder with a `.gitkeep`, and asks you to fill it.
- **0.2.0**: renamed from `setup-paper-project`. Reads the venue's author guidelines into a profile,
  Git and Overleaf become optional, and the scaffold is built and compiled before hand-off.
- **0.1.0**: initial version.
