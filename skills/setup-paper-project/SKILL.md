---
name: setup-paper-project
description: Set up a new scientific paper project before writing starts: find the target conference or journal's LaTeX template, scaffold the repository with the right structure and gitignore, create the GitHub repository, and connect it to Overleaf in the order Overleaf actually supports. Use when starting a new paper, asked to set up a paper project or repository, or asked how to begin writing a paper for a specific venue.
disable-model-invocation: true
allowed-tools: Read, Grep, Glob
metadata:
  tags: [research]
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

Overleaf **cannot link an Overleaf project to a GitHub repository that already exists**. You get one of
two directions, chosen at creation:

- Create an Overleaf project **from** a GitHub repository, or
- Create a GitHub repository **from** an Overleaf project.

So the sequence is: **template into a local repo, push to GitHub, then create the Overleaf project from
that repository.** Starting on Overleaf with the venue template and then trying to attach a repo does not
work, and it is the mistake this skill exists to prevent.

Tell the researcher this before starting, because it determines everything that follows.

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
├── main.tex              from the venue template: preamble, title, authors, \input lines
├── src/                  one file per section, this is where the writing happens
│   ├── abstract.tex
│   ├── introduction.tex
│   ├── methods.tex
│   ├── results-discussion.tex
│   └── conclusions.tex
├── refs.bib              empty, ready
├── figures/              one file per figure, source formats kept
├── <venue class files>   .cls, .bst, .sty shipped with the template
├── .gitignore            LaTeX build artefacts
├── README.md             venue, deadline, template provenance, how to build
└── paper-out/            created by the writing skills on first decision
```

**Sections live in `src/`, one file each**, and `main.tex` pulls them in. Keep the venue template's
preamble, title block and author block in `main.tex` untouched, and replace only its body with the
`\input` lines:

```latex
% main.tex, body only. Preamble and title block stay as the template shipped them.
\begin{abstract}
\input{src/abstract}
\end{abstract}

\input{src/introduction}
\input{src/methods}
\input{src/results-discussion}
\input{src/conclusions}

\bibliography{refs}
```

Create each `src/*.tex` as an empty file with a single comment naming what belongs there, so the project
compiles from the first commit. A scaffold that does not compile is worse than no scaffold, because the
first thing a co-author does is try to build it.

Some venue templates fight this, most often by expecting the abstract inside a command argument rather
than an environment. Where the template requires it, keep that section inline in `main.tex` and say which
ones you had to leave there, so the writing skills know where to look.

`.gitignore` for LaTeX, since build artefacts in a repo synced with Overleaf cause noise and conflicts:

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
*.nav
*.snm
*.vrb
*.run.xml
*.bcf
main.pdf
```

Keep `main.pdf` ignored unless the venue or the co-authors want a built PDF committed. Say which you chose.

Do **not** gitignore `paper-out/`: it is meant to be committed alongside the manuscript.

`README.md` should record the venue, the submission deadline, the template source and version, the build
command, and the Overleaf project link once it exists. That is the information a co-author or a future
session needs first.

### 4. Create the GitHub repository and push

Use `gh` if available. Confirm name and visibility first, then initialise, commit the scaffold, create the
repository, and push. Report the URL.

If `gh` is not installed or not authenticated, say so and give the researcher the two commands to run
themselves rather than guessing at credentials.

### 5. Create the Overleaf project from the repository

This step happens in the Overleaf web interface and cannot be automated from here. Give the researcher the
exact steps, then wait:

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
  supported, and the resulting workaround is worse than starting over in the right order.
- **Never commit raw data.** Overleaf recommends staying under 100 files and 100 MB, and data belongs in a
  repository or archive of its own.
- **Never emit an em dash (`---`).**
- If `gh` is unavailable, hand the commands over rather than improvising with credentials.
