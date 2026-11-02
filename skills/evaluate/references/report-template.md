# `paper-out/evaluation.md` template

Overwritten on every `/evaluate` run. Section blocks are replaced one at a time by `/review`, so keep the
heading and table shapes exactly. Everything is markdown the researcher can read and edit.

```markdown
# Paper evaluation

**Manuscript:** main.tex
**Venue criteria:** venue-criteria.md (pasted 2026-11-02, 7 criteria, weighted)
**Evaluated:** 2026-11-02
**Exemplars:** 8 papers in exemplars/ (or "none: exemplar comparison unavailable")
**Weights:** from the venue text (or "unstated by the venue: equal weights")

## Overall: 6.7 / 10

Computed from the table below, as the weighted mean of every scored cell. [Provisional: unscored
cells carry 31% of the weight.] (omit when below a quarter)

| Section | Score | Weight | Scored | Weakest criterion |
| :--- | :--- | :--- | :--- | :--- |
| Abstract | 7.0 | 3.2 | 2026-11-02 | Clarity |
| Introduction | 6.0 | 4.1 | 2026-11-02 | Novelty |

## Weakest areas

The three lowest sections, each with the skill to run next.

1. **Introduction, 6.0.** No contributions list. `/review introduction`, then `/write introduction`.

## Introduction: 6.0 / 10

**Scored:** 2026-11-02 · **Weight:** 4.1

| # | Criterion | Score | Met | Missed | Exemplars |
| :-- | :--- | :--- | :--- | :--- | :--- |
| 1 | Novelty | 5 | "we propose X" (`src/intro.tex:14`) | no statement of what is new against the closest work | recurs in 7 of 8 |
| P1 | Structure | 6 | context and gap present | no contributions list | list in 7 of 8 |

**Why this score.** Two or three sentences, tied to the cells above.

**The one change that would raise it most.** Add a contributions list after the gap. Estimated 7.0, if
made.

## Unscored

| Section | Criterion | Why | What would unblock it |
| :--- | :--- | :--- | :--- |
| Methods | Structure | no model, and exemplars/ was empty | add papers to exemplars/ |

## How the overall score was computed

The weights, the section scores and the arithmetic, so the number can be recomputed by hand.
```

## Rules

- **One block per section, in the paper's order**, each opening `## <Section>: <score> / 10`. `/review`
  finds and replaces a block by that heading.
- **Every score has its criterion, its quote and its reason.** A row with a score and no quote is a defect.
- **The weakest-areas list names only skills that exist.** `/review <section>` then `/write <section>`.
- **Never write a predicted decision.** No "likely accept", no "borderline".
- **Quotes are short** and always from the researcher's own manuscript, never from an exemplar.
