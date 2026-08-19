---
name: create-results-discussion
description: Write a scientific paper results and discussion section in LaTeX, structuring each result block with the four information classes from Zucolotto's course (background, description, interpretation, comparison with prior work), opening each paragraph with a topic sentence, and writing self-contained figure captions. Use when asked to write, draft or produce a results, discussion, or results and discussion section.
allowed-tools: Read, Grep, Glob
metadata:
  tags: [research]
---

# /create-results-discussion

The heart of the paper. This is where the idea that started the research gets proved, and it is
the section where how you write changes whether the paper is accepted, independently of how good
the results are.

Write this section **first** in the paper. The course's writing order starts here, once the
figures are chosen, because every other section is shaped by it.

## Before anything else

1. **Load the style rules.** Invoke `paper-writing-style` and read `references/human-voice.md`
   and `references/latex-conventions.md`. If absent, use the condensed rules at the bottom.
2. **Lock the language.** Language of the user's first message, for the whole run, no switching.
   **Output LaTeX is always English.**
3. **Read the context.** Find `.tex` files, the `.bib`, existing figures and captions, and any
   data files or tables. Detect the citation style.

## There is no single model, and that is the point

Unlike the abstract and the introduction, this section has no fixed structure, because journals
differ: some separate results, discussion and conclusions into three sections, some merge results
and discussion, some merge discussion and conclusions. **Ask which arrangement the target journal
uses** before drafting, and say what you assumed if the researcher does not know.

What is stable is the structure of each *result block*.

## The four information classes, per result

Every result, figure or table gets a block built from these four:

| Class | Carries |
| :--- | :--- |
| Background | Why this analysis matters, reminding the reader what it is for |
| Description | What the figure, table or measurement actually shows, with values |
| Interpretation | The plausible explanation for what was observed |
| Comparison | How it relates to similar or prior results, with citations |

A worked example from the literature, colour-coded in the course:

> **[background]** Cycling performance is a critical parameter for supercapacitor electrodes.
> Excellent cycling stability is crucial for real supercapacitor operation.
> **[methods]** The cycling test for all electrode systems used 3000 cycles at 1\,A\,g$^{-1}$.
> **[description]** Figure~4 shows 93\%, 96\% and 95\% of capacitance retained over 3000 cycles
> of charging and discharging for the GM, GMC and GMP based electrodes, respectively.
> **[comparison]** All three electrode systems demonstrate much better cycling performance
> compared to that reported in previous work, typically 75 to 85\% retention over 1000 cycles
> \citep{ref13,ref21}. **[interpretation]** This is attributed to the hierarchical structures of
> the graphene and MnO$_2$ textiles.

Not every block needs all four. Description is mandatory; a result stated without interpretation
or comparison is a data dump.

## Topic sentences

Open each paragraph with a sentence carrying the **topic** (as a keyword) and the **message**
(what is claimed about it). Every following sentence relates to one or the other. When either
changes, the paragraph ends. This is also how you decide paragraph length, and it is the cleanest
way to open a paragraph that describes a figure.

Example of a topic sentence opening a figure description:

> When the materials from which the spheres were made were charged at different rates, structures
> of different morphologies formed during charging.

Topic: spheres made of different materials. Message: different charging rates produce different
morphologies. Everything after it details that claim, then the paragraph ends when the next figure
begins.

## Workflow

### 1. Gather the material

You need the actual results. Accept figures, tables, data files, a draft, or a description. Read
everything given.

**Ask for the figure list first, in order.** The course is explicit that figure selection precedes
writing: the figures tell the story and the text supports them. If the researcher has not chosen
and ordered their figures, that is the first thing to settle.

### 2. Interview

Batches of at most four questions. For **each** result or figure, you need:

- **What it shows**, with real values. Never estimate a number from a figure description.
- **Why the analysis matters**, for the background sentence.
- **The interpretation.** What explains the observation? This is the researcher's scientific
  judgement and you must not supply it.
- **Prior work to compare against**, with citation keys and their values where possible.

Also settle:

- **The journal's section arrangement**, as above.
- **Which result is the principal finding.** It gets the most space and drives the conclusions.
- **Whether some results belong as text rather than figures.** A single value such as
  `the film thickness was estimated at 10\,nm by AFM` does not need a figure, and journals often
  cap the number of display items.
- **Constraints**: figure count limits, word limits.

### 3. Draft

Emit one LaTeX fragment per result block, labelled with the information classes:

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

Show it in chat. State which class each block is missing, if any, and why.

### 4. Write the figure captions

Captions are part of this section's job and the course is emphatic that good journals expect
elaborate ones. Rules:

- **A caption must be self-contained.** Someone in the field looking only at the figure and its
  caption should understand why the result matters, without going to the text.
- **Never merely name the axes.** "Capacitance versus cycle number" is not a caption.
- **Do not duplicate the body text.** Balance what goes in each; overlap wastes space in a section
  where space is scarce.

### 5. Check and refine

Ask what to change. Expect the interpretation to be corrected: it is the researcher's science, not
yours. Show the full fragment each round.

### 6. Connect back to the introduction

Before finishing, check that every relevance claim, gap and state-of-the-art reference in the
introduction has its counterpart here. The two sections must be tightly connected. If the
introduction does not exist yet, note what it will have to set up.

### 7. Offer to write it out

Only after approval.

## Hard rules

- **Never invent, estimate, or infer a numerical result.** Not from a figure, not from a trend, not
  from context. Every value comes from the researcher or from a file you read. Otherwise
  `% TODO: value needed`. This is the section where fabrication does the most damage.
- **Never supply the interpretation yourself.** You may draft the sentence once the researcher has
  given you the explanation. Proposing a mechanism they did not propose is inventing science.
- **Never invent a citation key** for a comparison.
- **Never emit an em dash (`---`).** `--` only in numeric ranges.
- Past tense for what was done and observed. Avoid stacked passive voice, which accumulates here
  more than anywhere else.
- Modern journals prefer assertive phrasing over hedged constructions such as `it may be possible
  that this could suggest`. Choose one hedge or none. Do not overclaim either: keep the hedge the
  researcher's evidence supports.
- Cut `carefully`, `successfully`, `it is important to note that`, and any sentence that would fit
  unchanged in a different paper.

## Condensed style rules, if `paper-writing-style` is not installed

Clarity and concision govern. One idea per sentence. Be specific. Put the action in the verb. Cut
redundancy and anything the editor already assumes. Prefer plain words: `use` over `utilization`,
`most` over `the majority of`, `because` over `due to the fact that`. Avoid `delve`, `harness`,
`leverage`, `underscore`, `pave the way`, `crucial role`. Keep `however`, `moreover`, `in contrast`,
`in summary`: correct register, not filler. Never stack passive voice. Vary sentence openers. Every
`it` and `this` needs one referent. Thin space between quantity and unit (`10\,nm`), escape `\%`,
use `Figure~\ref{}` with a non-breaking space.
