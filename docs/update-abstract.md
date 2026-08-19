# /update-abstract

> Reads the paper as it stands now, finds where the abstract has drifted from it, and proposes
> a reconciled abstract that keeps your wording wherever it still holds.

**Status:** alpha · **Version:** 0.1.0 · **Invocation:** `/update-abstract` ·
**Auto-loads:** yes · **Tags:** `research`
**Companion skills:** [paper-writing-style](paper-writing-style.md),
[create-abstract](create-abstract.md), [review-abstract](review-abstract.md)

## What it does

An abstract is downstream of the paper. When you add a result, revise a value, or rewrite the
introduction's gap, the abstract silently stops being true. This skill reads the current
manuscript, builds a picture of what the paper now says, diffs it against what the abstract
claims, and proposes the revision.

It is a **reconciliation, not a rewrite**. The starting assumption is that your abstract was
correct once, so sentences that still hold are left exactly as you wrote them.

## When to use it

- You added, dropped or revised results since the abstract was written.
- You rewrote the introduction and are not sure the abstract's gap still matches.
- Before submission, as a final check that the abstract and the paper agree.
- After a revision round, when reviewers pushed you to change claims in the body.

## When *not* to use it

- **There is no manuscript to compare against.** This skill has nothing to work from without
  the paper; it will tell you so and point you at [review-abstract](review-abstract.md).
- **You have no abstract yet.** Use [create-abstract](create-abstract.md).
- **You want a style critique.** Use [review-abstract](review-abstract.md). This skill checks
  that the six-part structure survived the update but deliberately does not duplicate the full
  style pass.

## Install

```
/plugin marketplace add yuryalencar/ai-skills
/plugin install update-abstract@yuryalencar-ai-skills
/plugin install paper-writing-style@yuryalencar-ai-skills
```

Or `./install.sh update-abstract paper-writing-style`.

## Inputs

**Required:** both a current abstract and a current manuscript body. It finds them itself in
the working directory, or you can pass paths.

| Input | Effect |
| :--- | :--- |
| Nothing | Finds the `.tex` files, abstract and `.bib` in the working directory |
| Path to the manuscript | Uses that instead of searching |
| Separate abstract and body paths | For split manuscripts |

It reads figures, tables and captions too, since a result that exists only as a figure is
still a result the abstract may need to mention.

**Language.** Interviews in the language you open in and stays there. Output LaTeX is English.

## Outputs

1. **A divergence table**: what the abstract says, what the paper says, where in the paper,
   and how serious it is.
2. **Questions**, only for divergences where the direction of reconciliation genuinely matters.
3. **The revised abstract** as a LaTeX fragment, with `% UPDATED:` comments explaining each
   changed block and `% TODO:` for anything unverifiable.
4. **A short summary** of what changed.

Nothing is written until you approve it.

## Example

```
> /update-abstract
```

```
DIVERGENCES

| Abstract says              | Paper says               | Where       | Severity |
|----------------------------|--------------------------|-------------|----------|
| viability fell to 71%      | 62%                      | Table 2     | HIGH     |
| threefold LDH increase     | 4.2-fold                 | Fig. 4b     | HIGH     |
| 48 h exposure              | 72 h                     | Sec. 2.3    | HIGH     |
| (not mentioned)            | size-dependence result   | Sec. 3.4    | MEDIUM   |
| "establish a safe          | conclusions now say      | Sec. 5      | MEDIUM   |
|  concentration"            | "indicate a threshold"   |             |          |

The methods, gap and purpose still match the paper.

The size-dependence result in 3.4 looks principal to me: it is the only finding
that distinguishes this work from ref. 14. Should it go in the abstract? It would
cost you the second methods sentence to fit within 250 words.

One I cannot resolve for you: the conclusions section softened from "establish"
to "indicate". If that was a deliberate response to a reviewer, the abstract
should follow. If the body was softened by accident, the abstract was right.
Which direction?
```

Then the revised fragment:

```latex
% RESULTS
% UPDATED: 62\% per Table~2, was 71\%
Viability fell to 62\% at 25\,\textmu g\,mL$^{-1}$ over 72\,h,
% UPDATED: exposure time corrected from 48\,h per Sec.~2.3
while lactate dehydrogenase release increased 4.2-fold over the same range.
```

## Why it asks instead of assuming

A divergence has two possible resolutions and only you know which: the abstract is stale and
should follow the paper, or the paper changed by mistake and the abstract was right. Assuming
the paper always wins would quietly propagate an accidental edit into your abstract.

Where the answer is obvious, such as a value the results section clearly revised, it states
the assumption and lets you correct it rather than making you answer a question. Explicit
questions are reserved for cases that genuinely change the outcome.

## Side effects

Reads the manuscript, figures and bibliography in your working directory. Writes nothing
unless you approve and say where. No network access.

## Design decisions

- **Separate skill from `/create-abstract`**, on the researcher's instruction. Creating and
  updating are different operations: creating starts from nothing, updating starts from
  something that was right once and must preserve it.
- **Preserve wording aggressively.** Restyling sentences that were already fine hides what
  actually changed and erodes trust in the update. Churn is a defect here, not a bonus.
- **Severity-ordered divergences**, because a contradicted number is a different class of
  problem from a missing mention.
- **Never assume the paper wins.** See above.
- **Every value traceable or `% TODO:`.** No number enters the revised abstract unless it was
  found at a specific place in the manuscript.
- **A clean result is a valid outcome.** If the abstract and paper already agree, it says so
  and changes nothing rather than making cosmetic edits to look busy.
- **Structure check yes, full style pass no.** It verifies the six-part model survived, then
  points at `/review-abstract` rather than duplicating it.

## Sources

Module 2 (the six-part model) and Module 4 (the writing order that makes the abstract
downstream of everything else) of *Curso de Escrita Científica* by Prof. Dr. Valtencir
Zucolotto, IFSC/USP, transcript in
[`sources/`](../sources/curso_escrita_cientifica_valtencir_zucolotto.md).

## Changelog

- **0.1.0**: initial version. Abstract vertical slice, phase 1.
