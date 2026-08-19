# /create-results-discussion

> Writes the results and discussion section, one four-class block per figure, with topic sentences
> and self-contained captions.

**Status:** alpha · **Version:** 0.1.0 · **Invocation:** `/create-results-discussion` ·
**Auto-loads:** yes · **Tags:** `research`
**Companion skills:** [paper-writing-style](paper-writing-style.md),
[review-results-discussion](review-results-discussion.md),
[update-results-discussion](update-results-discussion.md)

## What it does

Builds the section the course calls the heart of the paper. Each result gets a block assembled from
four information classes:

| Class | Carries |
| :--- | :--- |
| Background | Why this analysis matters |
| Description | What the figure or table shows, **with values** |
| Interpretation | The explanation for what was observed |
| Comparison | How it relates to prior work, with citations |

It also writes the figure captions, because good journals expect elaborate ones and the balance
between caption and body text is part of composing this section.

This is the section to write **first**. The course's writing order starts here, once the figures are
chosen, because every other section is shaped by what this one says.

## When to use it

- You have your figures selected and ordered and are ready to write.
- You have a draft that is really just a figure walkthrough and needs restructuring into blocks.

## When *not* to use it

- **Your figures are not chosen yet.** The skill will ask for the figure list first, because
  selection precedes writing: the figures tell the story and the text supports them.
- **You want the interpretation supplied.** It will not do that, by design. See below.
- **A section already exists.** Use [review](review-results-discussion.md) or
  [update](update-results-discussion.md).

## Install

```
/plugin marketplace add yuryalencar/ai-skills
/plugin install create-results-discussion@yuryalencar-ai-skills
/plugin install paper-writing-style@yuryalencar-ai-skills
```

Or `./install.sh create-results-discussion paper-writing-style`.

## Inputs

| Input | Effect |
| :--- | :--- |
| A figure list, in order | The first thing it asks for. Drives everything else |
| Figures, tables, data files | Read for real values |
| Existing captions | Reviewed for self-containment |
| A draft section | Restructured into blocks rather than replaced |
| A `.bib` file | Used for the comparison sentences |

It asks which section arrangement your journal uses, since some separate results, discussion and
conclusions, some merge results and discussion, and some merge discussion and conclusions. There is
no single model for this section and pretending otherwise would produce the wrong structure.

**Language.** Interviews in the language you open in, for the whole run. Output LaTeX is English.

## Outputs

One labelled LaTeX fragment per result block, plus figure captions, plus a note on which class each
block is missing and why. Nothing written to disk until you approve.

## Example

```latex
\subsection{Cycling stability}

% BACKGROUND
Cycling performance determines whether an electrode is viable in a working device.
% DESCRIPTION
Figure~\ref{fig:cycling} shows 93\%, 96\% and 95\% capacitance retention over 3000
charge-discharge cycles for the GM, GMC and GMP electrodes, respectively.
% COMPARISON
These values exceed the 75 to 85\% retention over 1000 cycles reported for comparable
composites \citep{ref13,ref21}.
% INTERPRETATION
We attribute this to the hierarchical structure of the graphene and MnO$_2$ textiles, which
accommodates volume change during cycling.
```

## The two things it refuses to do

**It will not invent a value.** Not from a figure, not from a trend, not from context. Every number
comes from you or from a file it read. Anything else becomes `% TODO: value needed`. This is the
section where fabrication does the most damage, because a fabricated result is research misconduct
rather than a writing error.

**It will not supply the interpretation.** It will draft the interpretation sentence once you have
told it what explains the observation, but it will not propose a mechanism you did not propose.
Deciding what your data means is the scientific contribution, and an AI guessing at it would be
inventing science. Expect to be asked "what explains this?" for every block.

## Side effects

Reads `.tex`, `.bib`, figures, captions and data files in your working directory. Writes nothing
unless you approve. No network access.

## Design decisions

- **No single structural model, by design.** Journals arrange these sections four different ways, so
  it asks rather than assuming. What is stable is the four-class block, which is what the course
  actually derives from the literature.
- **Interpretation is never supplied.** The strongest constraint in the whole family.
- **Figure list requested before drafting**, following the course's order: choose the figures, then
  write to them.
- **Captions are in scope.** They are part of this section's job, and the caption-versus-text balance
  cannot be decided by writing only one of them.
- **Topic sentences decide paragraph boundaries.** When the topic or the message changes, the
  paragraph ends. That gives a principled answer to "how long should this paragraph be".
- **Assertive over hedge-stacked**, matching what modern editors prefer, without pushing towards
  overclaiming: the hedge your evidence supports is the hedge that stays.
- **Verifies against the introduction** before finishing, since the two sections must connect.

## Sources

Module 4 of *Curso de Escrita Científica* by Prof. Dr. Valtencir Zucolotto, IFSC/USP, transcript in
[`sources/`](../sources/curso_escrita_cientifica_valtencir_zucolotto.md). Topic sentences are from
Module 8, via *Essentials of Writing Biomedical Research Papers*.

## Changelog

- **0.1.0**: initial version.
