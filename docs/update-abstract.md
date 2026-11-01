# /update-abstract

> Moves an existing abstract forward, whether the paper drifted underneath it, someone
> suggested changes, or it was left half-written.

**Status:** alpha · **Version:** 0.2.0 · **Invocation:** `/update-abstract` ·
**Auto-loads:** yes
**Companion skills:** [paper-writing-style](paper-writing-style.md),
[create-abstract](create-abstract.md), [review-abstract](review-abstract.md)

## What it does

An abstract already exists and needs to change. This skill evolves it, in contrast to
`/create-abstract` which starts from nothing and `/review-abstract` which diagnoses without
rewriting.

It handles three situations, and every abstract runs into all three sooner or later:

| Mode | When |
| :--- | :--- |
| **A. Reconcile** | The paper changed and the abstract has drifted from it |
| **B. Apply suggestions** | Reviewer comments, co-author notes, or `/review-abstract` output to incorporate |
| **C. Resume** | The abstract was left half-written and needs picking up |

It says which mode it is in before starting, so you can correct it. More than one can apply at
once, most often B and A together after a revision round, and it runs them in the order B, C, A
so that reconciliation happens last over the finished text.

Throughout, the assumption is that your text was correct once. This is a **revision, not a
rewrite**: sentences that still hold are left exactly as you wrote them.

## When to use it

- You added, dropped or revised results since the abstract was written.
- Reviewers asked for changes and you need them incorporated without losing track of any.
- A co-author sent notes on the abstract.
- You ran `/review-abstract` and want its findings applied.
- You abandoned the abstract half-finished and want to continue.
- Before submission, as a final check that the abstract and the paper agree.

## When *not* to use it

- **You have no abstract yet.** Use [create-abstract](create-abstract.md).
- **You want a critique, not a change.** Use [review-abstract](review-abstract.md).
- **There is no manuscript, no feedback and no unfinished draft.** There is nothing to update
  against; it will tell you so and point you at `/review-abstract`.

## Install

```
/plugin marketplace add yuryalencar/paper-skills
/plugin install update-abstract@yuryalencar-paper-skills
/plugin install paper-writing-style@yuryalencar-paper-skills
```

Or `./install.sh update-abstract paper-writing-style`.

## Inputs

| Input | Selects mode |
| :--- | :--- |
| Nothing, with a manuscript present | A, reconcile |
| Pasted reviewer comments or co-author notes | B, apply suggestions |
| Output from `/review-abstract` | B, apply suggestions |
| An abstract that is visibly incomplete | C, resume |
| Reviewer comments *and* a changed manuscript | B then A |

It finds the abstract, manuscript, `.bib` and citation style itself. It reads figures, tables
and captions too, since a result that exists only as a figure is still a result the abstract may
need.

**Language.** Interviews in the language you open in and stays there for the whole run. Output
LaTeX is always English.

## Outputs

1. **The mode it detected**, stated up front.
2. **Mode A:** a severity-ordered divergence table. **Mode B:** a numbered account of every
   suggestion and what happened to it. **Mode C:** a categorization of what exists and what is
   missing.
3. **Questions**, only where the direction of the change genuinely matters.
4. **The revised abstract** as a LaTeX fragment with `% UPDATED:`, `% ADDED:` and `% TODO:`
   comments.
5. **A summary** of what changed.

Nothing is written to disk until you approve it.

## Example, mode A

```
> /update-abstract
```

```
Mode A: reconciling against the manuscript. No feedback supplied and the
abstract looks complete.

DIVERGENCES

| Abstract says          | Paper says              | Where    | Severity |
|------------------------|-------------------------|----------|----------|
| viability fell to 71%  | 62%                     | Table 2  | HIGH     |
| threefold LDH increase | 4.2-fold                | Fig. 4b  | HIGH     |
| 48 h exposure          | 72 h                    | Sec. 2.3 | HIGH     |
| (not mentioned)        | size-dependence result  | Sec. 3.4 | MEDIUM   |

Methods, gap and purpose still match.

One I cannot resolve for you: the conclusions section softened from
"establish" to "indicate". If that answered a reviewer, the abstract should
follow. If the body was softened by accident, the abstract was right.
```

## Example, mode B

```
> /update-abstract  (pasting reviewer 2's comments)
```

```
Mode B: applying suggested updates. Four distinct requests in that paragraph.

1. "state the sample size in the abstract"          DIRECT      applied
2. "the contribution is not clear"                  INTERPRETIVE proposed
   -> rewrote the conclusions sentence to name the concentration
      threshold as the contribution. Flagging that I interpreted this.
3. "shorten to 200 words"                           DIRECT      applied
   -> to fit, the methods sentence lost the LDH assay mention. Your call
      whether that is the right sacrifice.
4. "the statistics need revising"                    OUT OF SCOPE
   -> concerns Sec. 2.4, not the abstract wording. Left alone.

Note: request 1 and request 3 pull against each other. Adding the sample
size costs 9 words while you are being asked to cut 50.
```

Every suggestion is accounted for, including the ones not applied. A reviewer request silently
dropped is the main failure mode in this mode, and with reviewers it has consequences.

## Why it asks instead of assuming

In mode A, a divergence has two resolutions and only you know which: the abstract is stale and
should follow the paper, or the paper changed by mistake and the abstract was right. Assuming
the paper always wins would quietly propagate an accidental edit into your abstract.

In mode B, a conflicting pair of suggestions has no correct answer without you. It surfaces the
conflict rather than picking a side.

Where the answer is obvious, such as a value the results section clearly revised, it states the
assumption and lets you correct it rather than making you answer a question.

## Side effects

Reads the manuscript, figures and bibliography in your working directory. Writes nothing unless
you approve and say where. No network access.

## Design decisions

- **Separate skill from `/create-abstract`**, on the researcher's instruction. Creating and
  updating are different operations: creating starts from nothing, updating starts from
  something that was right once and must preserve it.
- **Three modes rather than one.** The first version only reconciled against a changed
  manuscript, which made `update` look useful merely for sections *derived* from the paper. The
  researcher pointed out the two commoner cases, incorporating suggested changes and resuming
  after a pause, which apply to every section. That is why `update` now exists across the whole
  family rather than only for abstract, introduction, conclusions and title.
- **Mode order B, C, A**, so a reconciliation pass runs last over finished text.
- **Every suggestion accounted for** in mode B, including the rejected ones.
- **Reviewer outranks the style guide.** Where a request conflicts with the house style, it is
  applied and the tension noted.
- **Preserve wording aggressively.** Restyling sentences that were already fine hides what
  actually changed. Churn is a defect here, not a bonus.
- **Never assume the paper wins.** See above.
- **Every value traceable or `% TODO:`.**
- **A clean result is a valid outcome.** If there is nothing to change, it says so rather than
  making cosmetic edits to look busy.
- **Resume does not restyle.** Mixing a resume with a critique makes both worse, so mode C
  matches the existing voice and suggests `/review-abstract` separately.

## Sources

Module 2 (the six-part model) and Module 4 (the writing order that makes the abstract downstream
of everything else) and Module 8 (the editorial process, revised manuscripts and response
letters) of *Curso de Escrita Científica* by Prof. Dr. Valtencir Zucolotto, IFSC/USP, transcript
in [`sources/`](../sources/curso_escrita_cientifica_valtencir_zucolotto.md).

## Changelog

- **0.2.0**: broadened from reconcile-only to three modes: reconcile, apply suggestions, resume.
- **0.1.0**: initial version. Abstract vertical slice, phase 1.
