# /write-paper

> The map for the whole family. Tells you where your manuscript stands and what to write next, then
> hands off to the skill that does it.

**Status:** alpha · **Version:** 0.1.0 · **Invocation:** `/write-paper` ·
**Auto-loads:** yes · **Tags:** `research`
**Companion skills:** [paper-writing-style](paper-writing-style.md), and every `create-*`,
`review-*` and `update-*` skill in the family

## What it does

Sections are not written in the order they are read. This skill holds the recommended order, works out
where your manuscript actually stands, names the single next step, and invokes the right section skill
for it.

It writes nothing itself. Its value is orientation.

## The writing order

| # | Step | Skill | Precondition |
| :-- | :--- | :--- | :--- |
| 0 | Select and order the figures | yours | The research is finished |
| 1 | Results and discussion | [create-results-discussion](create-results-discussion.md) | Figures selected and ordered |
| 2 | Conclusions | [create-conclusions](create-conclusions.md) | Results written |
| 3 | **Introduction** | [create-introduction](create-introduction.md) | Results and conclusions written |
| 4 | Methods or experimental | none yet, see [`todo/`](../todo/methods-family.md) | The work is done |
| 5 | Abstract | [create-abstract](create-abstract.md) | Everything above |
| 6 | Title | [create-title](create-title.md) | Everything above |
| 7 | Cover letter | [create-cover-letter](create-cover-letter.md) | Target journal chosen |
| 8 | Revise after review | [create-response-to-reviewers](create-response-to-reviewers.md) | Reviews received |

## Why this order, and why step 3 matters most

**Results and discussion first** because it is the hardest section and every other section is shaped by
it. **Conclusions second** while the findings are fresh, since they derive directly from the results.

**The introduction third** is the step that earns the whole sequence. Writing it after the results
means the gap you state is the gap your paper actually answers. Write it first and you state a gap
before knowing what you found, which is how manuscripts end up promising something the results never
address. That mismatch is the commonest structural fault in a paper and the one reviewers catch hardest.

**Abstract fifth** because you cannot summarize what does not exist. **Title last** because it should
name the contribution, and you only know the contribution when the paper is done. Provisional titles
along the way are fine; what matters is rewriting it at the end.

## Step 4 has no create skill, deliberately

The course proposes an explicit model for the abstract, the introduction, results and discussion, and
conclusions. For the methods section it proposes **none**, so one was not invented. Writing a
confident-sounding skill on a made-up structure would teach the wrong conventions.

It is recorded in [`todo/methods-family.md`](../todo/methods-family.md), to be replaced by narrower
skills such as `/create-threats-to-validity` once real exemplar sections are available to derive a
model from.

## When to use it

- You have finished the research and do not know where to start.
- You have a half-written manuscript and want to know what to do next.
- You want to know what order to write a paper in.
- You are approaching submission and want a pre-submission sweep.

## When *not* to use it

- **You know which section you are working on.** Go straight to that section's skill; this one would
  just add a hop.
- **The research is not finished and the figures are not chosen.** It will tell you that plainly rather
  than starting an interview.

## Install

```
/plugin marketplace add yuryalencar/ai-skills
/plugin install write-paper@yuryalencar-ai-skills
./install.sh --tag research     # or just install the whole family
```

It is most useful with the rest of the family installed, since its job is to hand off to them.

## Inputs

Nothing. It surveys your working directory: `.tex` files, the `.bib`, figures and captions. Tell it the
target journal if you have one.

**Language.** Follows the language you open in.

## Outputs

A status table, the single next step with its reason, and the skill to run. Then it invokes that skill.

## Example

```
> /write-paper

STATUS

| Section              | Status   | Missing                              |
|----------------------|----------|--------------------------------------|
| Figures              | complete | 5 figures, ordered                   |
| Results & discussion | partial  | Figures 4 and 5 have no blocks       |
| Conclusions          | absent   |                                      |
| Introduction         | partial  | context and gap only, written first  |
| Methods              | complete |                                      |
| Abstract             | absent   |                                      |
| Title                | partial  | "Layer-by-layer graphene coatings"   |
|                      |          | looks provisional                    |

NEXT

Finish results and discussion. Figures 4 and 5 have no blocks, and
everything downstream is shaped by them: your conclusions, abstract and
title all derive from what those results say.

  /update-results-discussion   (mode C, resume)

NOTE ON YOUR INTRODUCTION

It was written before the results, which is out of order. That is not an
error, but expect to revise it: the gap in your ¶3 is about cost, and
your Figures 1 to 3 are about durability. Once the results are finished,
/update-introduction mode A will reconcile them.
```

## The ripple check

Once several sections exist, changing one makes others stale. After any step it reports which:

| Changed | Now possibly stale |
| :--- | :--- |
| Results | Abstract, conclusions, the introduction's gap |
| Conclusions | The abstract's closing sentences, the title |
| The introduction's gap | The abstract's gap |
| Anything | The title, if it no longer names the principal finding |

It names the affected sections and the `update-*` skill for each. It does not run them unasked.

## Pre-submission pass

When every section exists it offers a sweep rather than declaring the paper finished: the five
`review-*` skills, then the **cross-section checks no single review can make** (abstract, introduction
final paragraph and conclusions all stating the same purpose and contribution; every value in the
abstract and conclusions matching the results; every gap in the introduction answered), then the cover
letter.

It reports those cross-section checks itself, since they fall between the section skills.

## Side effects

Reads `.tex`, `.bib`, figures and captions. Writes nothing itself. The skills it hands off to write
nothing without your approval either. No network access.

## Design decisions

- **It orchestrates and never writes.** A half-implemented section skill inside this one would be worse
  than the real thing, so it hands off.
- **One next action, not a backlog.** A list of everything outstanding is less useful than the single
  thing to do now.
- **Preconditions are checked and the cost of skipping them is stated, then the researcher decides.**
  Working out of order is a judgement call, not an error, and real projects deviate for real reasons.
- **The ripple check exists because a section family without it leaves silent staleness.** Each update
  skill reports its own downstream effects, but only this one sees the whole manuscript.
- **It never declares a paper finished.** It offers the pre-submission pass instead.
- **The cross-section checks live here** because they fall between sections and no section skill owns
  them.
- **The missing methods step is stated openly** rather than papered over, with a pointer to why.

## Sources

Module 4 of *Curso de Escrita Científica: Produção de Artigos de Alto Impacto* by Prof. Dr. Valtencir
Zucolotto, IFSC/USP, transcript in
[`sources/`](../sources/curso_escrita_cientifica_valtencir_zucolotto.md), where the writing order is
given as the assignment closing the first half of the course. Module 8 supplies the submission and
revision steps.

## Changelog

- **0.1.0**: initial version.
