# `paper-out/venue-criteria.md`

The one file that lets the researcher paste the venue text once. `/evaluate` creates it, and the
`/review` re-score reads it. It is markdown the researcher can edit by hand, and it is meant to be
committed with the rest of `paper-out/`. It holds the venue's public call text and nothing copied from
other people's papers.

## Layout

```markdown
# Venue criteria

**Venue:** ICSE 2027 research track
**Source:** https://example.org/call-for-papers   (or "pasted, no URL")
**Pasted:** 2026-11-02
**Scale:** 1 to 10

## Pasted text

<!-- begin pasted text -->
...the researcher's paste, verbatim, never edited or summarised...
<!-- end pasted text -->

## Criteria

| # | Criterion | Weight | Where the text says it | Sections carrying the evidence |
| :-- | :--- | :--- | :--- | :--- |
| 1 | Novelty | 0.30 | "contributions must be new" | introduction, conclusions |
| 2 | Soundness | 0.30 | "rigorous and sound" | study design, results |
| 3 | Clarity | unstated | "well written" | all |

Weights: stated by the text for rows 1 and 2. Row 3 is unstated and carries the mean of the stated
weights. Package criteria below carry the same.

## Package criteria

| Criterion | Weight | Applies to |
| :--- | :--- | :--- |
| Structure against the section's model and the exemplars | mean of the stated weights | every section that has a model or an exemplar pattern |
| Clarity and style | mean of the stated weights | every section |

## Exemplar pattern

Derived from `exemplars/` on 2026-11-02, 8 papers, structure only.

| Section | What recurs | Papers |
| :--- | :--- | :--- |
| Introduction | context, gap, contributions list | 7 of 8 |

(empty when `exemplars/` was empty: say so here)
```

## Rules

- **The pasted text is verbatim.** Save exactly what the researcher gave, between the two markers, with
  the date and the URL if they supply one. Never summarise, fix or reorder it.
- **The criteria table is extraction, and it is confirmed.** Each row cites the sentence it came from. A
  row with no supporting sentence does not exist.
- **Weights.** Use the weights the text states. Where it states none, use equal weights and write
  `unstated` in the cell, so the researcher can see which numbers are theirs to set. Normalise nothing in
  place: the report divides by the sum of the weights that applied.
- **Package criteria.** `Structure` and `Clarity and style` are this package's own, not the venue's. Label
  them so, and give each the mean of the venue's stated weights unless the researcher sets another.
- **Hand edits win.** The researcher can change a weight, a mapping or a criterion by editing the file.
  The next run uses what the file says. If it can no longer be read as criteria (no table, a weight that is
  not a number), say what could not be parsed, show the line, and ask. Never guess.
- **Replacing the text.** When the researcher supplies new venue text, ask whether to keep the old one. If
  not, replace it and log the replacement in `decisions.md`. Re-confirm the criteria table.
