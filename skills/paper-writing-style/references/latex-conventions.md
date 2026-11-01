# LaTeX conventions for generated manuscript text

## Read the project's own `CLAUDE.md` first

**If the manuscript directory has a `CLAUDE.md`, it outranks everything in this file.** A working paper
repository usually documents its own layout, section files, label conventions, page limit, build command
and data provenance rules. Read it before touching anything, and follow it where it differs from the
defaults below. Never restructure a project to match this file.

Typical contents worth looking for: the `\input` order, which file holds which section, where figures go
and how they are included, the macros file, the page limit, and where the numbers in the paper are allowed
to come from.

## Project layout: sections live in `src/`

The common layout, and what `/organize` scaffolds:

```
<paper>/
├── main.tex                     preamble, title, author block, \input order. The only file with
│                                document-level structure
├── src/
│   ├── macros.tex               shared macros and switches. Read this first
│   ├── abstract.tex
│   ├── introduction.tex
│   └── <one file per section>
├── references.bib
├── figures/
├── build.ps1  or  Makefile      build script
├── exemplars/                   local only, never committed (only .gitkeep): previous papers from the venue
├── CLAUDE.md                    the project's own conventions. Authoritative
└── paper-out/                   session state
```

**Detect the layout before reading or writing anything:**

- **`src/` exists.** Read that section's file, and when the researcher approves a change, offer to write it
  there. Do not touch `main.tex` unless the change is genuinely to the preamble, the title block, the
  author block or the `\input` order.
- **No `src/`.** Work with the section wherever it lives. Do not restructure the project uninvited.

**Map section names to files, never assume them.** Read `main.tex`'s `\input` list to find out what the
project actually calls things. Real projects vary, and guessing wrong means reading the wrong file:

| Section | Seen as |
| :--- | :--- |
| Conclusions | `conclusion.tex` or `conclusions.tex` |
| Results and discussion | one `results-discussion.tex`, or split `results.tex` and `discussion.tex` |
| Methods | `methods.tex`, `study-design.tex`, `experimental.tex` |
| Background | `background.tex`, sometimes merged into the introduction |
| Related work | `related-work.tex`, sometimes part of the introduction |
| Threats to validity | `threats.tex` |
| End matter | `end-matter.tex`: CRediT, competing interests, data availability, acknowledgements |

A title lives in `main.tex`, in the template's `\title{}`. A cover letter and a response to reviewers are
not part of the manuscript and belong at the project root, for example `cover-letter.tex` and
`response-to-reviewers.md`.

Some venue templates require a section inline, most often an abstract inside a command argument rather
than an environment. When `src/` exists but a section's file does not, look in `main.tex` before concluding
the section is missing.

## Use the project's macros

**Read `src/macros.tex` before writing anything.** A well-run paper project defines terminology and
recurring values once so they stay consistent, and text that hardcodes what a macro already covers breaks
that.

| Pattern | What to do |
| :--- | :--- |
| `\newcommand{\nparticipants}{54\xspace}` | Write `\nparticipants participants`, never `54 participants` |
| `\newcommand{\RQ}[1]{\textbf{RQ#1}}` | Write `\RQ{1}`, never `\textbf{RQ1}` |
| `\newif\ifblind` | The paper is double blind. Never insert author names, affiliations, or self-identifying phrasing such as "our previous work \citep{ourpaper}" |
| `\newcommand{\todo}[1]{...}` | Use `\todo{...}` for gaps instead of a `% TODO:` comment. See below |

**When a value recurs and has no macro, propose one.** A number appearing in the abstract, the results and
the conclusions should be defined once in `src/macros.tex`, so a revision changes it in one place instead
of three. Offer this rather than silently writing the literal three times.

**When a value changes, change the macro, not the occurrences.** If `\nparticipants` is defined as 54 and
the real figure is now 52, the edit is one line in `src/macros.tex`. Editing the prose instead leaves the
macro wrong and the paper inconsistent.

## Marking gaps: `\todo{}` beats `% TODO:`

A `% TODO:` comment is invisible in the compiled PDF, so it survives to submission. If the project defines
a rendering annotation macro, use it:

```latex
% project defines: \newcommand{\todo}[1]{\textcolor{red}{[TODO: #1]}}
Viability fell to \todo{confirm the 72 h value, results give two figures} at the highest
concentration tested.
```

That shows up in red in the PDF and is impossible to miss. Fall back to `% TODO:` only when the project has
no such macro, and say that you did.

## Labels

If the project's `CLAUDE.md` defines a label convention, follow it exactly. A common one is a type prefix
plus a kebab-case name from the element's own title: `sec:study-design`, `fig:detection-accuracy`,
`tab:participant-demographics`. Reference with `\Cref{}` or `\cref{}` when the project loads `cleveref`,
otherwise `Figure~\ref{}` with a non-breaking space.

## Figures

If `main.tex` sets `\graphicspath{{figures/}}`, include figures **without a path or extension**:
`\includegraphics{detection-accuracy}`. Adding `figures/` or `.pdf` when `\graphicspath` is set is
redundant and breaks if the path changes.

## Page limits

Conference papers have hard limits, often stated in the project's `CLAUDE.md`, for example ten pages plus
two of references. When a limit is known, treat it as a constraint on every draft: say what a section costs
and, when something has to give way, name the candidate rather than silently overrunning. A paper over
length is desk rejected without being read.

## Emit class-agnostic fragments

Produce section-level LaTeX that drops into any document class. No `\documentclass`, no
preamble, no package requirements the user did not already have. The fragment must compile
inside `elsarticle`, `IEEEtran`, `revtex4-2`, `achemso`, or plain `article` without edits.

This means:

- No custom macros. If a construct needs a package, write it the portable way instead.
- No `\begin{document}`, no `\maketitle`, no bibliography setup.
- Use `\section{}` / `\subsection{}` only when the fragment genuinely spans them. For a
  single section, emit the body and let the user place the heading.

## Dashes and ranges

| Case | Emit |
| :--- | :--- |
| Numeric range | `10--20\,nm`, `300--400\,°C`, `pp.~13--17` |
| Connector, aside, interruption | never a dash. Use a comma, colon, semicolon, parentheses, or full stop |
| Em dash `---` | never, in any position |

## Units and numbers

- Thin space between quantity and unit: `10\,nm`, `1.5\,mg`, `37\,°C`.
- No space before `%`, `°`, or a currency symbol when it binds tightly: `93\%`.
- Non-breaking space before a reference or a number that must not wrap: `Figure~\ref{fig:xrd}`,
  `Table~\ref{tab:params}`, `pp.~13--17`.
- Use `\times` for multiplication in math mode: `$3 \times 10^{8}$`.
- Escape the percent sign in text: `93\%`. An unescaped `%` silently comments out the rest
  of the line, which is the single most common defect in generated LaTeX.

## Characters that must be escaped

`&`, `%`, `$`, `#`, `_`, `{`, `}` need escaping in text mode. `~` and `^` need
`\textasciitilde` and `\textasciicircum`. Chemical formulae and subscripted variables go in
math mode: `$\mathrm{TiO_2}$`, `MnO$_2$`.

Prefer `\ldots` over three literal periods.

## Citations: detect, do not assume

Before emitting any citation, determine what the project already uses:

1. Look for `.bib` files and read the keys.
2. Grep the manuscript for `\usepackage{natbib}`, `\usepackage[...]{biblatex}`, or
   `\bibliographystyle{}`.
3. Grep for existing `\cite`, `\citep`, `\citet`, `\parencite` calls and match the style
   already present.

| Detected | Emit |
| :--- | :--- |
| natbib | `\citep{key}` for parenthetical, `\citet{key}` for textual |
| biblatex | `\parencite{key}`, `\textcite{key}` |
| plain, or nothing found in the file | `\cite{key}` |
| No `.bib` and no manuscript at all | ask which the user wants |

**Never invent a citation key.** If the source is known but its key is not, emit
`% TODO: cite Silva 2024 on thermal stability` on its own line. If the claim needs a
citation the user has not supplied, say so in the annotation rather than attaching the
nearest plausible key.

## Annotation comments

Annotate the fragment so the researcher can see the structure being followed and act on
what is missing. Two kinds of comment, and no others:

```latex
% CONTEXTUALIZATION
Silver nanoparticles are widely used as antimicrobial agents in wound dressings
\citep{silva2024}.
% GAP
However, their long-term cytotoxicity towards human keratinocytes remains poorly
understood.
% PURPOSE
In this paper, we report the cytotoxicity of citrate-capped silver nanoparticles
% TODO: confirm the capping agent, the draft assumes citrate
towards HaCaT keratinocytes over 72\,h.
```

- **Structure labels** name the part of the model each block implements, in capitals.
  They let the researcher verify the structure at a glance and are trivial to strip.
- **`% TODO:`** marks something the researcher must supply or confirm. Every one must name
  precisely what is missing. Never leave a gap silent, and never fill it with a guess.

Tell the user how to strip the labels when they are done: they are ordinary LaTeX comments,
so a regex over `^% [A-Z ]+$` removes them, and `% TODO:` lines should be resolved rather
than deleted.

## Escaping in verbatim output

When showing the fragment in chat, present it in a fenced `latex` block so the user can copy
it directly. Do not re-wrap lines at arbitrary widths; keep one sentence per line or wrap at
a consistent column, since that is what makes version control diffs readable in a manuscript
repository.
