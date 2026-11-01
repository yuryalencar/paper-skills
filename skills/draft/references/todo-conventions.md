# Red TODOs

The TODOs are the point of a draft. A good one tells the researcher exactly what to supply and why, so the
list reads as a work plan.

## The marker

Use the project's `\todo{}` macro if `src/macros.tex` (or the preamble) defines one: it renders in red in
the PDF, so a gap is visible and cannot survive to submission unnoticed.

If the project has none, propose adding this to `src/macros.tex` or the preamble and ask before doing so:

```latex
\usepackage{xcolor}
\newcommand{\todo}[1]{\textcolor{red}{[TODO: #1]}}
```

If the researcher declines, use a `% TODO:` comment instead, and say that it will not show in the PDF.

## What a good TODO says

Three things, in one or two sentences:

1. **What to supply**, concretely.
2. **Why the section needs it**, tied to the section's model.
3. **Where it will probably come from**, when you can tell.

```latex
\todo{Contribution sentence: what the field can do now that it could not before. The conclusions need it
to close the funnel at its widest point. Probably follows from your retention result and the durability
gap you state in the introduction.}
```

Not this:

```latex
\todo{add contribution}
\todo{fix}
```

## Placement

Put the TODO **where the missing content belongs**, in the position the model puts it, so the draft keeps
its shape and the researcher can see what is absent. Do not collect them at the end.

## What gets a TODO

- A part of the section's model the material does not support. Mandatory parts first.
- A number, value or figure reference you cannot find in a source.
- A citation you cannot ground. Name what kind of source is needed.
- A claim the material suggests but does not establish.
- A structural question the researcher must settle, such as which result is principal.

## Examples by section

Take the model parts from the `/write` reference, and phrase each TODO against that model. Illustrative:

- **Conclusions** (inverse funnel: result, interpretation, contribution). Missing the middle part:
  `\todo{Brief interpretation: what the retention result means. The conclusions widen from your result to
  the field, and this is the step that links them. Probably the mechanism you propose in the discussion.}`
- **Abstract** (six parts). No numbers available:
  `\todo{Principal result with actual values. An abstract without numbers is not an abstract, and the
  purpose and conclusions depend on it. Take them from your results table.}`
- **Introduction** (four movements). No state of the art:
  `\todo{State of the art: the most recent work on this problem. Without it a reader cannot judge whether
  you advance anything. Add the 3--5 closest papers and cite them.}`

Write the real TODOs against the real model in the `/write` reference, not these paraphrases.

## The TODO list

After the draft, list the TODOs **only as a list**, in the order to resolve them: mandatory parts of the
section's model first, then values, then citations, then the optional. One line each, enough to recognise
it. Then name the next step, `/write <section>`, which resolves them through an interview.

Do not copy the TODO text into `paper-out/`. It lives in the `.tex`, which is the source of truth.
