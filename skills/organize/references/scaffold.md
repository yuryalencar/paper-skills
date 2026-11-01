# Scaffold

What `/organize` creates locally, and why each file earns its place.

## Layout

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

### Sections in `src/`

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

### `src/macros.tex`

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

### Figures

Set `\graphicspath{{figures/}}` in `main.tex` so figures are included **without a path or extension**:
`\includegraphics{detection-accuracy}`. Add `figures/.gitkeep` so the empty directory is tracked.

### `.gitignore`

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

### `build.ps1` or `Makefile`

Ship a build script rather than leaving people to remember the pass order. A full build is `pdflatex`,
`bibtex`, `pdflatex`, `pdflatex`. Offer a quick single-pass mode for iteration, and say that it leaves
cross-references and citations stale.

Two things the script must do that a bare `pdflatex` call does not:

- **Gate on the log, not the exit code.** `pdflatex` exits non-zero on warnings alone, so its exit status is
  not a usable pass or fail signal. Parse `main.log` for real errors instead, and surface undefined
  references separately as warnings.
- **Report the page count.** Conference limits are hard, and an over-length paper is desk rejected without
  being read.

### `CLAUDE.md`

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

