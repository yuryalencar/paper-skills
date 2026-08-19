# LaTeX conventions for generated manuscript text

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
