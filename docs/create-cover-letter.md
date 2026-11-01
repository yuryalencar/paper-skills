# /create-cover-letter

> Writes the submission cover letter: what the work shows, why it matters, and why this journal.

**Status:** alpha · **Version:** 0.1.0 · **Invocation:** `/create-cover-letter` ·
**Auto-loads:** yes
**Companion skills:** [paper-writing-style](paper-writing-style.md),
[review-cover-letter](review-cover-letter.md), [update-cover-letter](update-cover-letter.md),
[create-response-to-reviewers](create-response-to-reviewers.md)

## What it does

Most researchers treat the cover letter as a formality. It is the **first document the editor reads**, and desk
rejections often happen before the manuscript is opened, so the letter is doing real work.

Two things carry it:

1. **The importance and novelty of the work**, stated concretely. High impact publishing runs on novelty, and
   the editor is looking for a clear advance in a field's knowledge frontier.
2. **Why this journal.** Related to that journal's scope, readership, or a recent paper it published. A letter
   that would work unchanged for any journal tells the editor nothing, and editors can tell instantly.

Around those it assembles the conventional elements: the title and article type, the originality statement,
author approval, required declarations, suggested reviewers, and contact details.

## When to use it

- You are about to submit a manuscript for the first time.
- You have a letter that reads like a template and want it to argue for the paper.

## When *not* to use it

- **This is a revision after peer review.** That letter accompanies a point-by-point response, so use
  [create-response-to-reviewers](create-response-to-reviewers.md).
- **You are resubmitting to a different journal after rejection.** Use
  [update-cover-letter](update-cover-letter.md), mode A, which rebuilds the journal-fit argument and strips
  every trace of the previous venue.
- **The paper is not written.** The letter is built from the contribution.

## Install

```
/plugin marketplace add yuryalencar/paper-skills
/plugin install create-cover-letter@yuryalencar-paper-skills
/plugin install paper-writing-style@yuryalencar-paper-skills
```

Or `./install.sh create-cover-letter paper-writing-style`.

## Inputs

Reads the title, abstract, conclusions and results itself. Then asks for what the paper cannot supply:

| Asked | Why |
| :--- | :--- |
| The journal, and the editor's name if known | The one thing the letter cannot be written without |
| **Why this journal** | The paragraph that separates a working letter from a template |
| Article type | Regular article, letter, short communication, review |
| Required declarations | Conflicts, funding, ethics, data availability. These vary by journal and are often mandatory |
| Suggested or excluded reviewers | If the journal invites them |

**Language.** Interviews in the language you open in. The letter is English unless the journal is explicitly
non-English.

## Outputs

A one-page letter, plain text or LaTeX as you prefer, with `[TODO: ...]` for anything it could not obtain.
Nothing written until you approve.

## The question it will push you on

**"Why this journal?"** Acceptable answers relate the work to the journal's scope, its readership, or a
specific recent paper it published. "It has a high impact factor" is not a reason the editor wants to read.

If you can name a recent paper in that journal your work builds on or answers, that is the strongest possible
content for this paragraph, and the skill will ask for it.

## Side effects

Reads `.tex` files in your working directory. Writes nothing unless you approve. **No network access**, so it
cannot look up the journal's scope, its recent papers, or the editor's name. It asks or leaves a placeholder.

## Design decisions

- **Novelty and journal fit are the two required paragraphs.** Everything else is boilerplate that a template
  can supply; these two are what the editor actually reads.
- **The journal-fit question is pressed, not accepted at face value.** A generic answer produces a generic
  paragraph, and it is worth saying so.
- **Declarations are never fabricated.** Statements about ethics approval, conflicts of interest, funding and
  data availability are legally and professionally consequential. They get a placeholder if unanswered, never
  a plausible guess.
- **Journal facts are never invented.** No network access means the scope, the recent papers and the editor's
  name are unknown, and inventing any of them would be immediately visible to the person reading.
- **Overclaiming treated as a first-class risk.** An editor who finds the letter overselling relative to the
  manuscript starts reading sceptically, and the temptation is greatest here.
- **One page, enforced.** An editor reading fifty submissions will not read two.
- **No flattery, no paper summary.** The abstract is attached. The letter argues for it.

## Sources

Module 8 of *Curso de Escrita Científica* by Prof. Dr. Valtencir Zucolotto, IFSC/USP, transcript in
[`sources/`](../sources/curso_escrita_cientifica_valtencir_zucolotto.md), where the cover letter and the
editorial process are covered from the perspective of a working journal editor.

## Changelog

- **0.1.0**: initial version.
