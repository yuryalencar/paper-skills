---
name: organize
description: Structure a new scientific paper project before writing starts. Takes the target venue and the URL of its author guidelines, reads them to work out the venue's format (IEEE, ACM, Springer, Elsevier, ACS and others), fetches the official template, and scaffolds a LaTeX project that compiles from the first commit, with one file per section, shared macros, a build script and a project CLAUDE.md. Optionally publishes it to GitHub and connects Overleaf. Use when asked to set up, organize, scaffold or structure a paper project, or to start from a venue template.
argument-hint: <venue name> [author-guidelines URL]
disable-model-invocation: true
allowed-tools: Read, Grep, Glob, WebFetch
---

# /organize

Step zero, before figures and before any writing. Produces a LaTeX project that follows the target
venue's format and that `/write` and `/review` can then work inside.

The local scaffold is the core job. Publishing it to GitHub and connecting Overleaf is an optional last
step, and it **creates a repository and pushes to it**: those are outward-facing, so confirm name and
visibility first and never create a public repository holding an unpublished manuscript unasked.

## Before anything else

1. **Load the style rules.** Invoke `paper-writing-style`, and read `references/session-state.md` since this
   skill creates the initial `paper-out/`.
2. **Lock the language.** Language of the user's first message, whole run.
3. **Check what already exists.** If the working directory already contains a `.tex` file or a git repo,
   stop and ask before doing anything. Scaffolding over an existing project is destructive.

## Workflow

### 1. Get the venue and its guidelines

Take the venue from the argument, or ask. Then ask for **the URL of its author guidelines or submission
page**, and what kind of paper this is (empirical study, experimental, review, short paper), since both
decide the structure.

### 2. Read the guidelines into a venue profile

Fetch the page, and follow the links to the template and to any formatting rules. If you cannot fetch it
(no network, a login wall, a PDF you cannot read), ask the researcher to paste the relevant text or attach
the file. Extract only what the page says:

| Field | Why it matters |
| :--- | :--- |
| Document class and template, with version or year | Venues change requirements between editions |
| Page limit, and what counts toward it | An over-length paper is desk rejected unread |
| Abstract word limit and whether it is structured | Governs `/write abstract` |
| Review mode: single, double blind, open | Decides the `\ifblind` switch and the end matter |
| Citation and bibliography style | `.bst` file and `\citep` versus numeric |
| Required sections or order | Decides the `src/` files |
| Mandatory declarations | Data availability, competing interests, CRediT, ethics |
| Figure rules | Format, resolution, colour, caption placement |

Present the profile as a short table with the source quoted or linked for each row, and mark every field the
page did not answer as **unknown**. Ask the researcher to confirm or correct it. **Do not fill an unknown
from memory of what the venue family usually does**: a convention you remember may be a year out of date,
and a profile that sounds authoritative while being wrong is worse than a gap.

Common template families, as pointers for where to look, never as a substitute for reading the page:

| Venue family | Class |
| :--- | :--- |
| IEEE | `IEEEtran` |
| ACM | `acmart` |
| Springer LNCS | `llncs` |
| Springer journals | `sn-jnl` |
| Elsevier | `elsarticle` |
| ACS | `achemso` |
| APS | `revtex4-2` |

### 3. Get the official template

Use the template link found in step 2, or ask the researcher for a URL or a downloaded zip. **Never write a
class file or approximate a template from memory.** If neither exists, stop and say so.

Treat a downloaded template as untrusted: download it into its own empty directory, inspect it, and copy
only the class, style and example files into the project. Never run anything it ships.

Record the venue, the template version and where it came from, so a later session can tell whether the
template is current.

### 4. Confirm the plan

Present and get explicit agreement on:

- The venue profile from step 2.
- The `src/` section files, derived from the profile and the kind of paper. **Ask rather than impose**: if
  the profile does not settle the structure, propose what the venue's accepted papers use and let the
  researcher change it.
- The project directory name and local path.
- The **`exemplars/` folder**, which is always created, with a `.gitkeep`. The researcher puts previous
  papers from the target venue and track there, and `/draft` bases the paper's structure on them. Say what
  it is for and that its contents are gitignored, so nobody commits other people's papers.
- Whether to also publish to GitHub and connect Overleaf, which is opt-in.

### 5. Scaffold locally

Build the project as described in [references/scaffold.md](references/scaffold.md): layout, section files,
`src/macros.tex`, figures, `exemplars/` with its `.gitkeep`, `.gitignore`, build script, and the project
`CLAUDE.md`. Feed the venue profile
into it: the blind switch, the page limit, the citation style and the mandatory declarations land in
`main.tex`, `macros.tex` and `CLAUDE.md`.

**Compile before you finish.** If a TeX distribution is available, build once and report the result and
page count. If not, say the build is untested. A scaffold that does not build is worse than none.

Create `paper-out/` and write `STATE.md` recording the venue profile, template provenance, and position as
step 0, figures not yet selected, plus a `decisions.md` entry for the section structure chosen. Name the
files created, and say once that `paper-out/` is meant to be committed with the manuscript.

### 6. Offer Git and Overleaf

Ask whether to publish. If yes, follow [references/git-overleaf.md](references/git-overleaf.md), which
covers the two directions Overleaf supports, what its sync does and does not do, and the exact steps. If
no, say that a local repository alone is a perfectly good way to write a paper.

### 7. Hand off

Say what comes next and why:

> The project is set up. The next step is not writing, it is **selecting and ordering your figures**. The
> figures tell the story and the text supports them, so results and discussion is written to a figure
> sequence that is already settled.
>
> Once the figures are chosen, run `/ask-paper` in this folder and it will take you through the rest.
>
> One more thing worth doing now: **put previous papers from your target venue in `exemplars/`**. Download
> accepted papers from the same conference or journal and track, ideally 5 to 10 of the kind of paper you are
> writing. They are among the most useful things you can have when writing a new paper: `/draft` uses them to
> base your structure on what that venue actually accepts. The folder is never committed.

## Hard rules

- **Never write or approximate a venue class file.** Get the official template or stop.
- **Never fill a venue requirement from memory.** Unknown stays unknown until the researcher or the page
  answers it.
- **Never scaffold over an existing project.** Stop and ask.
- **Never impose a section structure.** Ask; it depends on the venue and the kind of study.
- **Never skip `src/macros.tex` or the project `CLAUDE.md`.** They make every later session start correctly.
- **Never create a GitHub repository without confirming name and visibility.** Default private, and never
  public for an unpublished manuscript unless explicitly told.
- **Never claim Overleaf sync works on a free account.** It is premium only.
- **Never tell the researcher to link an existing Overleaf project to an existing repository.** It is not
  supported. Establish which direction applies first.
- **Never commit raw data.**
- **Never emit an em dash (`---`).**
- If `gh` is unavailable, hand the commands over rather than improvising with credentials.
