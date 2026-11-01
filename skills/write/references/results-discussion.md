# Results and discussion

## Create mode

The heart of the paper. This is where the idea that started the research gets proved, and it is
the section where how you write changes whether the paper is accepted, independently of how good
the results are.

Write this section **first** in the paper. The course's writing order starts here, once the
figures are chosen, because every other section is shaped by it.

### Context to read

**Read the context.** Find `.tex` files, the `.bib`, existing figures and captions, and any data files or tables. Detect the citation style.

### There is no single model, and that is the point

Unlike the abstract and the introduction, this section has no fixed structure, because journals
differ: some separate results, discussion and conclusions into three sections, some merge results
and discussion, some merge discussion and conclusions. **Ask which arrangement the target journal
uses** before drafting, and say what you assumed if the researcher does not know.

What is stable is the structure of each *result block*.

### The four information classes, per result

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

### Topic sentences

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

### Workflow

#### 1. Gather the material

You need the actual results. Accept figures, tables, data files, a draft, or a description. Read
everything given.

**Ask for the figure list first, in order.** The course is explicit that figure selection precedes
writing: the figures tell the story and the text supports them. If the researcher has not chosen
and ordered their figures, that is the first thing to settle.

#### 2. Interview

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

#### 3. Draft

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

#### 4. Write the figure captions

Captions are part of this section's job and the course is emphatic that good journals expect
elaborate ones. Rules:

- **A caption must be self-contained.** Someone in the field looking only at the figure and its
  caption should understand why the result matters, without going to the text.
- **Never merely name the axes.** "Capacitance versus cycle number" is not a caption.
- **Do not duplicate the body text.** Balance what goes in each; overlap wastes space in a section
  where space is scarce.

#### 5. Check and refine

Ask what to change. Expect the interpretation to be corrected: it is the researcher's science, not
yours. Show the full fragment each round.

#### 6. Connect back to the introduction

Before finishing, check that every relevance claim, gap and state-of-the-art reference in the
introduction has its counterpart here. The two sections must be tightly connected. If the
introduction does not exist yet, note what it will have to set up.

#### 7. Offer to write it out

Only after approval.

### Hard rules

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

## Update mode

The section exists and needs to change. This is the most frequently updated section in any
manuscript: reviewers ask for extra experiments, data gets reanalysed, and drafts stall halfway
through the figure list.

Assume the text was correct once. This is a **revision, not a rewrite**. In this section that rule
is stricter than elsewhere: **the researcher's interpretations are theirs**, and you preserve them
verbatim unless the data no longer supports them, in which case you flag it rather than replacing
them.

### Context to read

**Read the context.** The section, all figures and captions, tables, the `.bib`, any data files, and the introduction and conclusions.

### Pick the mode

State the mode before starting.

| Mode | Signal | What it does |
| :--- | :--- | :--- |
| **A. Integrate new or revised data** | New figures, changed values, a reanalysis | Fold the new results in and fix what they contradict |
| **B. Apply suggestions** | Reviewer comments, co-author notes, `/review results-discussion` output | Incorporate each change deliberately |
| **C. Resume** | The section stops partway through the figure list | Continue from where it stopped |

Where several apply, run B, then C, then A.

Mode A here is not the same as reconcile-against-the-paper elsewhere: this section *is* the paper's
evidence, so what it reconciles against is the data.

### Mode A: integrate new or revised data

1. **Inventory what changed.** List every value, figure and table that differs from what the section
   describes. Read the figures and data files; do not rely on the researcher's summary alone.
2. **Report the consequences**, in this order of severity:
   - **An interpretation the new data contradicts.** Most serious. Quote the interpretation, the old
     value and the new one, and stop. **Do not rewrite the interpretation yourself**; ask the
     researcher what the new data means. This is their science.
   - **A comparison that no longer holds**, for example a result that was better than prior work and
     now is not.
   - **A value stated in the text that no longer matches the figure.**
   - **A new result with no block at all**, needing a full four-class block written.
   - **A figure whose number changed**, breaking `\ref` ordering and the narrative sequence.
   - **A result now removed** but still discussed.
3. **Check the downstream sections.** New or changed results almost always invalidate something in
   the abstract, the conclusions or the introduction's gap. Name what is now stale and suggest
   `/write abstract`, `/write conclusions` and `/write introduction` rather than editing them
   here.

### Mode B: apply suggested updates

Reviewer comments on this section cluster into recognizable requests:

| Comment | Usually means |
| :--- | :--- |
| "The discussion is superficial" | Interpretation and comparison classes are thin or missing |
| "How does this compare to X?" | A missing comparison block. Ask for the values; never invent them |
| "The mechanism is not supported" | The interpretation overclaims relative to the evidence. The researcher decides how to soften it |
| "Statistics needed" | Out of scope for the wording. Say so and leave it |
| "Figure N is unclear" | Usually the caption, not the figure. Check self-containment first |
| "Too long" | Which blocks compress. Background sentences are the usual candidate |

Then:

1. **Enumerate every suggestion** as a numbered item, splitting reviewer prose.
2. **Classify each**: *direct*, *interpretive*, *conflicting*, *out of scope*.
3. **Apply, propose, resolve.** Requests that need new scientific claims are not yours to satisfy:
   surface them and ask.
4. **Account for every item**, including the ones not applied and why.

Where a request conflicts with the house style, apply it and note the tension. The reviewer outranks
the style guide.

### Mode C: resume after a pause

1. **Inventory the figure list** and mark which figures already have blocks. This shows exactly where
   the draft stopped, and it is usually mid-figure-list rather than mid-sentence.
2. **Run the information-class matrix** over the blocks that exist. A stalled draft often has several
   blocks with description only, written quickly before the writer ran out of momentum.
3. **Ask for what is genuinely missing**, in batches of at most four: the values for undescribed
   figures, and the interpretation for each. Read the data files first so you only ask for what the
   files do not contain.
4. **Match the existing voice**: tense pattern, hedging level, caption style, how much background
   each block carries.
5. **Check the narrative order still works.** A resumed section commonly loses the thread of why the
   figures are in this sequence. Say so if the order no longer tells a story.

Do not restyle the blocks already written. If they have defects, say so and suggest
`/review results-discussion` separately.

### Produce the revision

Emit the changed blocks as LaTeX fragments with information-class labels, and:

- **Preserve the researcher's wording and interpretations.**
- Emit **only the blocks that changed**, not the whole section, since it is long. Say clearly which
  blocks you are showing and leave the rest untouched.
- Mark each change: `% UPDATED: retention now 96\% per Fig.~4`,
  `% ADDED: comparison block, reviewer 2 asked about Park 2024`,
  `% FLAG: this interpretation may no longer hold, see note above`.
- `% TODO:` for every value or interpretation you could not obtain.

Show the fragments, then summarize. Finish by listing which other sections are now stale.

### Offer to write it out

Only after approval.

### Hard rules

- **Never invent, estimate or infer a value.** Not from a figure, not from a trend. This is the
  section where fabrication does the most damage.
- **Never write or rewrite an interpretation the researcher did not give you.** If new data breaks an
  old interpretation, flag it and ask. Supplying a mechanism is inventing science.
- **Never invent a comparison citation.**
- **Never emit an em dash.** `--` only in numeric ranges.
- **Never silently drop** researcher text, an interpretation, or a suggestion.
- If nothing needs changing, say so and change nothing.

## Condensed style rules

Fallback when `paper-writing-style` is not installed.

Clarity and concision govern. One idea per sentence. Be specific. Put the action in the verb. Cut
redundancy and anything the editor already assumes. Prefer plain words: `use` over `utilization`,
`most` over `the majority of`, `because` over `due to the fact that`. Avoid `delve`, `harness`,
`leverage`, `underscore`, `pave the way`, `crucial role`. Keep `however`, `moreover`, `in contrast`,
`in summary`: correct register, not filler. Never stack passive voice. Vary sentence openers. Every
`it` and `this` needs one referent. Thin space between quantity and unit (`10\,nm`), escape `\%`,
use `Figure~\ref{}` with a non-breaking space.
