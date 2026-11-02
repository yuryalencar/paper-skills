# Scoring rubric

This rubric is this package's own method. It is not from the Zucolotto course, and it says nothing about
what any venue values: that comes only from `paper-out/venue-criteria.md`. What the rubric fixes is how a
judgement becomes a number the researcher can check.

## Cells

The unit is one **cell**: one criterion scored in one section. Take each criterion's "sections carrying the
evidence" from `venue-criteria.md`, plus the two package criteria. Score every cell 1 to 10, or mark it
**unscored** with the reason.

## Anchors

Apply to every criterion alike. Score what the draft does against what the criterion asks, never against
the researcher's effort or the topic's importance.

| Score | Meaning |
| :--- | :--- |
| 9 to 10 | Meets the criterion in full, with specific evidence in the text, and matches what recurs in the exemplars |
| 7 to 8 | Meets it. One or two gaps that a reviewer would note but not hold against the paper |
| 5 to 6 | Partly meets it. The intent is visible but something a reviewer would raise is missing or vague |
| 3 to 4 | Mostly misses it. A reviewer would raise it as a principal weakness |
| 1 to 2 | Absent, or contradicted elsewhere in the paper |

Use whole numbers. If you cannot decide between two scores, take the lower one and say what would earn
the higher.

## What a cell must contain

1. **The criterion**, by its number in the criteria table.
2. **Met and missed**, each with a **short quote** from the draft (a clause, not a paragraph), with the
   file and line.
3. **The exemplar comparison**, where one applies: "context, gap and contributions list recur in 7 of 8;
   this section has no contributions list". Counts only. If `exemplars/` was empty, write `exemplar
   comparison unavailable` and do not infer.
4. A score that follows from 2 and 3. If the text under a score would not persuade a sceptical co-author,
   the score is wrong.

## The package criteria

- **Structure.** For the seven sections `/write` models (abstract, introduction, results and discussion,
  conclusions, title, cover letter, response to reviewers), judge against that section's model in
  `skills/write/references/<section>.md`, and against the exemplar pattern if there is one. For any other
  section (methods, related work, background and so on), judge against the exemplar pattern only, and mark
  the cell **unscored** if `exemplars/` has none. Never score a section against a structure you made up.
- **Clarity and style.** Judge against `paper-writing-style`: specific claims, no filler, consistent tense,
  no ambiguity. Quote the sentences that cost the most.

## One change per section

For each section, name the **single** change that would raise its score most, and the score it would reach
if made, as an estimate, labelled so. One change, not a list: the researcher fixes the biggest weakness
first, and `/review` produces the full list.

## Computing the scores

Let `s(c, x)` be the score of criterion `c` in section `x`, and `w(c)` the criterion's weight from
`venue-criteria.md`.

- **Section score** = sum of `w(c) * s(c, x)` over the scored cells of `x`, divided by the sum of `w(c)`
  over those same cells.
- **Section weight** = the sum of `w(c)` over the scored cells of `x`.
- **Overall score** = sum of `(section weight * section score)` over all sections, divided by the sum of the
  section weights. Equivalent to the weighted mean of every scored cell.
- **Unscored cells are left out of both sums**, and the report lists them and says how much of the total
  weight they carry. If unscored cells carry more than a quarter of the weight, say the overall is
  provisional.
- Round to one decimal place, only at the end. Show the weights used, so the number can be recomputed from
  the table.

If the venue stated no weights, every criterion has weight 1 (the package criteria too) and the report says
so on its first line.

## Re-scoring one section (used by `/review`)

When `/review <section>` finds `paper-out/evaluation.md` and a readable `venue-criteria.md`, it re-scores
that section after its review:

1. Score the section's cells again by the rules above, using the stored criteria, weights and exemplar
   pattern. Do not re-read `exemplars/`.
2. Replace that section's block in `evaluation.md`: scores, quotes, comparison, the one change, and
   today's date in its `Scored` column.
3. Recompute the overall score with the same formula. The other sections' cells are untouched.
4. Show the change in the chat: `Introduction 6.0 to 7.0, overall 6.4 to 6.7`.
5. Mark any section whose `Scored` date is older than the section's last review or edit you can see as
   `scored earlier`, without re-scoring it.
6. Append one line to `decisions.md` with the section, the old and new scores and the new overall, and
   update the evaluated date in `STATE.md`.

If `evaluation.md` does not exist, `/review` does not create one: only `/evaluate` starts an evaluation.
If `venue-criteria.md` is missing or unreadable, skip the re-score, say why, and say that `/evaluate`
refreshes it. If the section is not in `evaluation.md` (added since), say so and do not add it: that is a
job for `/evaluate`.
