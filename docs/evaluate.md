# /evaluate

> Scores a complete paper from 1 to 10, section by section and overall, against the venue's own review
> criteria and the structure of previous accepted papers, and says why for every score.

**Status:** alpha · **Version:** 0.1.0 · **Invocation:** `/evaluate` ·
**Auto-loads:** no, **manual only**
**Companion skills:** [review](review.md), [write](write.md), [draft](draft.md), [ask-paper](ask-paper.md),
[paper-writing-style](paper-writing-style.md)

## What it does

You paste the venue's review criteria once (the call for papers, the reviewer guidelines, whatever the venue
publishes about what it looks for). The skill saves the text, extracts the criteria and their weights, shows
them to you, and scores every section of your draft against them. It also compares each section with the
structure that recurs in the papers you keep in `exemplars/`.

For each section you get a score from 1 to 10, the criteria met and missed with short quotes from your text,
the exemplar comparison as counts ("in 6 of 8 papers"), and the **one change** that would raise the score
most. The paper gets a weighted overall score. Everything lands in `paper-out/evaluation.md`.

It scores. It does not fix: fixes go to `/review <section>` and `/write <section>`. It also does **not**
predict accept or reject. A predicted decision would be a guess dressed as a measurement, so you get scores,
reasons and the weakest areas instead.

## You paste the venue text once

The pasted text is saved verbatim to `paper-out/venue-criteria.md`, with the date and the URL if you give one,
and the extracted criteria and weights sit below it. Every later run reads that file and says what it loaded
in one line, so you never paste again. You can edit the file by hand (change a weight, drop a criterion), or
run `/evaluate` and say the text changed.

## `/review` keeps the scores current

Once `evaluation.md` exists, running `/review <section>` re-scores that section against the saved criteria,
replaces its block in the report, recomputes the overall score and shows the change:

```
Introduction 6.0 to 7.0, overall 6.4 to 6.7
```

So the report tracks your revisions without running the whole evaluation again. `/review` never creates an
evaluation: only `/evaluate` starts one. The scoring procedure lives in `/evaluate`'s rubric, which `/review`
reads, so the two cannot drift apart.

## When to use it

- Every section exists and you want to know where the paper is weakest before you submit.
- You are choosing which sections to revise first.
- You have the venue's criteria and want the paper held to them, not to a general idea of quality.

## When *not* to use it

- **A section is still empty or an outline.** It stops and points at [draft](draft.md) or [write](write.md).
- **You want fixes.** Use [review](review.md), then [write](write.md).
- **You have no venue text.** It refuses rather than score against criteria it remembers.
- **You want a prediction of the decision.** It will not give one.

## Install

```
/plugin marketplace add yuryalencar/paper-skills
/plugin install evaluate@yuryalencar-paper-skills
/plugin install paper-writing-style@yuryalencar-paper-skills
```

Or `./install.sh evaluate paper-writing-style` / `.\install.ps1 evaluate paper-writing-style`. Install
[review](review.md) and [write](write.md) too: the structure scores use `/write`'s section models, and
`/review` does the re-scoring. Invoke it with `/evaluate`; it will not auto-load.

## Inputs

| Input | Required | Effect |
| :--- | :--- | :--- |
| The manuscript, found through `main.tex` and its `\input` list | yes | What is scored |
| **The venue's review criteria, pasted once** | yes, first run only | Saved to `paper-out/venue-criteria.md`. Without it the skill refuses |
| `exemplars/` | no | Previous accepted papers. Empty: the criteria that depend on them are left **unscored**, and it says so |
| `paper-out/` | no | Earlier decisions, and the saved criteria |

## Outputs

`paper-out/evaluation.md`, overwritten on each `/evaluate` run:

- the overall score, with how it was computed;
- a table of sections with score, weight, date scored and weakest criterion;
- the three weakest areas, each with the skill to run next;
- one block per section: criteria, scores, met and missed with quotes, exemplar counts, the reason, and the
  one change that would raise it most;
- the **unscored** cells, why, and what would unblock them.

It also writes `paper-out/venue-criteria.md` on the first run, the overall score and date into `STATE.md`,
one line in `decisions.md` (the report is overwritten, so this keeps the history), and unscorable criteria into
`open-questions.md`.

## How a score is computed

The rubric is this package's own method. It says nothing about what a venue values: that comes only from your
pasted text. What it fixes is how a judgement becomes a number you can check.

- Each venue criterion is scored in the sections that carry its evidence, plus two package criteria, **Structure**
  (against `/write`'s model for the section and the exemplar pattern) and **Clarity and style**. Each cell is
  1 to 10 against fixed anchors (9 to 10 meets the criterion in full, 5 to 6 partly, 1 to 2 absent).
- A **section score** is the weighted mean of its cells. The **overall score** is the weighted mean of every
  scored cell, so you can recompute it from the table.
- Weights are the ones the venue text states. Where it states none, every criterion weighs the same and the
  report says so on its first line.
- **Unscored cells are left out**, listed, and counted: if they carry more than a quarter of the weight, the
  overall is marked provisional.

Sections without a `/write` model (methods, related work) are scored on the venue's criteria and clarity, and on
structure only where the exemplars show a pattern. They are never scored against a structure made up for them.

## Example

Illustrative only: the venue, criteria and numbers below are made up to show the shape of the output.

```
> /evaluate

Every section has text. No saved venue criteria yet. Please paste the venue's review
criteria or call for papers, and the URL if you have one.

> (pastes)

Saved to paper-out/venue-criteria.md. I found 4 criteria. Weights are stated for two:

  1 Novelty      0.35  "contributions must be new"
  2 Soundness    0.35  "rigorous and well supported"
  3 Relevance    unstated
  4 Presentation unstated

Unstated weights take the mean of the stated ones. Is this right?

> yes

exemplars/ holds 8 papers; structure pattern saved.

Overall 6.7 / 10. Weakest: Introduction 6.0 (no contributions list, which recurs in
7 of 8 exemplars), Results 6.3, Abstract 7.0.
Written to paper-out/evaluation.md. Run /review introduction, then /write introduction.
```

## Side effects

Reads your manuscript and, if present, `exemplars/`. Writes `paper-out/evaluation.md` and
`paper-out/venue-criteria.md`, and updates `paper-out/STATE.md`, `decisions.md` and `open-questions.md`. It
never edits your manuscript. No network access.

## Design decisions

The goal: *this skill helps a researcher with a complete draft score it section by section, and as a whole,
against the venue's review criteria and the accepted papers in `exemplars/`, so they know where it is weak and
why before submitting.*

- **Separate from `/review`, scores only.** `/review` diagnoses and offers fixes, `/evaluate` measures. The
  re-score keeps the two in step without duplicating either.
- **The venue text is pasted, not remembered.** The skill does not know what a venue values and does not guess:
  the repository rule against inventing a model applies, so it refuses without the paste.
- **Pasted once, saved verbatim.** Added at the researcher's instruction. `venue-criteria.md` is editable,
  committed with `paper-out/`, and read by every later run.
- **Scale 1 to 10** with fixed anchors, chosen for enough resolution to show movement between revisions.
- **Weighted by the venue's stated emphasis**, equal weights when it states none, always shown.
- **No predicted outcome.** A guess presented as a measurement.
- **Exemplars optional.** Without them the structure comparison is marked unscored instead of inferred.
- **Each score carries a quote, a criterion and a reason**, and the single change that would raise it most.
- **One file, overwritten.** Chosen in the interview. The overall score is logged in `decisions.md` so the
  history survives.
- **Manual only.** A whole-paper read that writes a file is something you time yourself.
- **`/review` re-scores a section when an evaluation exists.** Added at the researcher's instruction, so the
  report stays current as the paper improves.

## Sources

The criteria come from the researcher's pasted venue text and the section models from
[`/write`](write.md), distilled from the course in
[`sources/`](../sources/curso_escrita_cientifica_valtencir_zucolotto.md). The exemplar structure uses the
categorization method from Module 2 of that course. The 1 to 10 rubric and its weighting are this package's own
design and are not from the course.

## Changelog

- **0.1.0**: initial version.
