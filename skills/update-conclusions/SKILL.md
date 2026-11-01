---
name: update-conclusions
description: Move an existing conclusions section forward, in any of three situations: the results changed and the conclusions no longer follow from them, there are suggested changes to incorporate from reviewers or a co-author, or the section was left unfinished. Preserves the researcher's wording and claims where they still hold. Use when a conclusions section already exists and needs to change.
allowed-tools: Read, Grep, Glob
---

# /update-conclusions

The conclusions are downstream of everything. When results change, this is the section most likely to
become quietly false, because a conclusion is a claim and claims do not survive changed evidence.

Assume the text was correct once. This is a **revision, not a rewrite**: what still holds stays exactly
as the researcher wrote it.

## Before anything else

1. **Load the style rules.** Invoke `paper-writing-style`. If absent, use the condensed rules in
   `create-conclusions`.
2. **Lock the language.** Language of the user's first message, whole run. Output LaTeX is English.
3. **Read the context.** The conclusions, the results and discussion, the introduction, the abstract,
   the `.bib` and the citation style. All four sections are needed.

## Pick the mode

State the mode before starting.

| Mode | Signal | What it does |
| :--- | :--- | :--- |
| **A. Reconcile** | Results changed, no explicit feedback | Check each claim still follows from the evidence |
| **B. Apply suggestions** | Reviewer comments, co-author notes, `/review-conclusions` output | Incorporate each change deliberately |
| **C. Resume** | The section is unfinished, usually missing the contribution | Continue from where it stopped |

Where several apply, run B, then C, then A.

## Mode A: reconcile with the results

Conclusions fail in one specific way: a claim outliving its evidence. Check each in this order:

1. **A claim the results no longer support.** The most serious case and the reason this skill exists.
   Quote the claim, the value it rested on, and the current value. **Do not rewrite the claim yourself**
   if the change is substantive; ask the researcher what the new evidence concludes. A conclusion is a
   scientific claim with their name on it.
2. **A value that no longer matches** the results section. If it is a plain numerical correction with
   the claim intact, state the assumption and fix it.
3. **The principal result is no longer principal.** New or revised data can promote a different finding.
   Say which finding now looks principal and why, and let the researcher decide.
4. **The contribution no longer answers the introduction's gap**, usually because the gap was rewritten.
5. **A new finding important enough to conclude on** that the section does not mention.
6. **A claim contradicting the abstract's closing sentences.** Report both; the researcher decides
   which is right.
7. **Grandiosity that has become untenable.** A weaker result makes a broad claim look worse than it
   did.

Present as a table: what the conclusions claim, what the results now show, where, and severity.

**Never assume the results win.** Either the conclusions are stale, or the results changed by mistake.

## Mode B: apply suggested updates

Reviewer comments on conclusions cluster tightly:

| Comment | Usually means |
| :--- | :--- |
| "The conclusions overstate the findings" | Grandiosity, or a claim wider than the evidence. The researcher decides how far to pull back |
| "The contribution is unclear" | The contribution movement is missing or buried |
| "This just repeats the results" | The funnel does not widen, or text was copied from the results section |
| "Add limitations" | Ask whether the journal wants them here or in the discussion |
| "Add future work" | Same question |

Then:

1. **Enumerate every suggestion** as a numbered item, splitting reviewer prose.
2. **Classify each**: *direct*, *interpretive*, *conflicting*, *out of scope*.
3. **Apply, propose, resolve.** A request to soften or strengthen a claim is the researcher's call:
   propose the wording and let them set the level.
4. **Account for every item**, including those not applied and why.

Where a request conflicts with the house style, apply it and note the tension. The reviewer outranks
the style guide.

## Mode C: resume after a pause

1. **Label what exists** by movement: principal result, interpretation, contribution.
2. **Identify what is missing.** It is almost always the contribution, which is both the last movement
   and the hardest to write. Say so directly.
3. **Recover what you can from the paper.** The principal result and its values come from the results
   section; the gap the contribution should answer comes from the introduction. Do not ask the
   researcher to repeat what the manuscript already contains.
4. **Ask for the contribution.** This one cannot be recovered from the paper: what the field gains is
   a judgement only the researcher can make. Ask directly rather than proposing something plausible.
5. **Check the funnel widens across the join.** A resumed conclusions section commonly drops back into
   experimental detail at the restart point.
6. **Match the existing voice**, including the tense pattern and the hedging level.

Do not restyle what is already written; suggest `/review-conclusions` separately.

## Produce the revision

Emit the updated conclusions as a LaTeX fragment with movement labels, and:

- **Preserve the researcher's wording and claims wherever they still hold.**
- Mark each change: `% UPDATED: retention now 96\% per Table~2`,
  `% ADDED: contribution movement was missing`,
  `% FLAG: this claim may no longer follow from the revised data, see note above`.
- Keep the section's existing length.
- `% TODO:` for anything you could not verify or obtain.

Show the fragment, then summarize. Finish by checking whether the abstract's closing sentences now
diverge, and suggest `/update-abstract` if so.

## Offer to write it out

Only after approval.

## Hard rules

- **Never invent or strengthen a claim.** If revised data breaks a conclusion, flag it and ask. Writing
  a replacement claim is inventing science and it carries the researcher's name.
- **Never invent the contribution**, in any mode.
- **Never invent or estimate a value.** Every number must match the results section.
- **Never emit an em dash.** `--` only in numeric ranges.
- **Never silently drop** researcher text, a claim, or a suggestion.
- If the conclusions still follow from the results and there is nothing to apply, say so and change
  nothing.
