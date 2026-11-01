---
name: update-results-discussion
description: Move an existing results and discussion section forward, in any of three situations: new or revised data has to be integrated, there are suggested changes to incorporate from reviewers or a co-author, or the section was left half-written and needs resuming. Preserves the researcher's wording and interpretations where they still hold. Use when a results or discussion section already exists and needs to change.
allowed-tools: Read, Grep, Glob
---

# /update-results-discussion

The section exists and needs to change. This is the most frequently updated section in any
manuscript: reviewers ask for extra experiments, data gets reanalysed, and drafts stall halfway
through the figure list.

Assume the text was correct once. This is a **revision, not a rewrite**. In this section that rule
is stricter than elsewhere: **the researcher's interpretations are theirs**, and you preserve them
verbatim unless the data no longer supports them, in which case you flag it rather than replacing
them.

## Before anything else

1. **Load the style rules.** Invoke `paper-writing-style`. If absent, use the condensed rules in
   `create-results-discussion`.
2. **Lock the language.** Language of the user's first message, whole run. Output LaTeX is English.
3. **Read the context.** The section, all figures and captions, tables, the `.bib`, any data files,
   and the introduction and conclusions.

## Pick the mode

State the mode before starting.

| Mode | Signal | What it does |
| :--- | :--- | :--- |
| **A. Integrate new or revised data** | New figures, changed values, a reanalysis | Fold the new results in and fix what they contradict |
| **B. Apply suggestions** | Reviewer comments, co-author notes, `/review-results-discussion` output | Incorporate each change deliberately |
| **C. Resume** | The section stops partway through the figure list | Continue from where it stopped |

Where several apply, run B, then C, then A.

Mode A here is not the same as reconcile-against-the-paper elsewhere: this section *is* the paper's
evidence, so what it reconciles against is the data.

## Mode A: integrate new or revised data

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
   `/update-abstract`, `/update-conclusions` and `/update-introduction` rather than editing them
   here.

## Mode B: apply suggested updates

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

## Mode C: resume after a pause

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
`/review-results-discussion` separately.

## Produce the revision

Emit the changed blocks as LaTeX fragments with information-class labels, and:

- **Preserve the researcher's wording and interpretations.**
- Emit **only the blocks that changed**, not the whole section, since it is long. Say clearly which
  blocks you are showing and leave the rest untouched.
- Mark each change: `% UPDATED: retention now 96\% per Fig.~4`,
  `% ADDED: comparison block, reviewer 2 asked about Park 2024`,
  `% FLAG: this interpretation may no longer hold, see note above`.
- `% TODO:` for every value or interpretation you could not obtain.

Show the fragments, then summarize. Finish by listing which other sections are now stale.

## Offer to write it out

Only after approval.

## Hard rules

- **Never invent, estimate or infer a value.** Not from a figure, not from a trend. This is the
  section where fabrication does the most damage.
- **Never write or rewrite an interpretation the researcher did not give you.** If new data breaks an
  old interpretation, flag it and ask. Supplying a mechanism is inventing science.
- **Never invent a comparison citation.**
- **Never emit an em dash.** `--` only in numeric ranges.
- **Never silently drop** researcher text, an interpretation, or a suggestion.
- If nothing needs changing, say so and change nothing.
