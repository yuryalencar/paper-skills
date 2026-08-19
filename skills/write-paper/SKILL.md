---
name: write-paper
description: Guide a scientific manuscript from figures to submission, following the recommended writing order from Zucolotto's course (results and discussion, conclusions, introduction, methods, abstract, title), reporting where the paper currently stands and invoking the right section skill for the next step. Use when asked how to start writing a paper, what to write next, what order to write a paper in, or to be walked through writing a manuscript end to end.
allowed-tools: Read, Grep, Glob
metadata:
  tags: [research]
---

# /write-paper

The map for the whole family. Sections are not written in the order they are read, and this skill
keeps track of where a manuscript actually stands and what to do next.

It does not write anything itself. It surveys, reports, and hands off to the section skill that does
the work.

## Before anything else

1. **Load the style rules.** Invoke `paper-writing-style`, which holds the writing order and the
   house style.
2. **Lock the language.** Language of the user's first message, whole run. Any LaTeX the section
   skills produce is English.
3. **Survey the manuscript.** Read the `.tex` files, the `.bib`, the figures and their captions.
   Work out what exists rather than asking.

## The writing order

| # | Step | Skill | Precondition |
| :-- | :--- | :--- | :--- |
| 0 | Select and order the figures | none, this is yours | The research is finished |
| 1 | Results and discussion | `/create-results-discussion` | Figures selected and ordered |
| 2 | Conclusions | `/create-conclusions` | Results written |
| 3 | Introduction | `/create-introduction` | Results and conclusions written |
| 4 | Methods or experimental | none yet, see `todo/` | The work is done |
| 5 | Abstract | `/create-abstract` | Everything above written |
| 6 | Title | `/create-title` | Everything above written |
| 7 | Cover letter | `/create-cover-letter` | Target journal chosen |
| 8 | Submit, then revise | `/create-response-to-reviewers` | Reviews received |

Step 3 is the one that matters. Writing the introduction after the results keeps the two sections
connected, because a gap promised in the introduction and never answered in the results is the
commonest structural fault in a manuscript.

**Step 4 has no create skill.** The course proposes no model for the methods section, so one was not
invented. See `todo/methods-family.md`. Write it yourself, or ask for `/review-methods` guidance once
it exists.

## Workflow

### 1. Survey and report position

Determine, for each section, whether it is absent, partial, or complete. A section is **partial** if
it exists but is missing mandatory parts, which you can check quickly:

| Section | Complete when |
| :--- | :--- |
| Results and discussion | Every figure has a block with a description carrying values |
| Conclusions | Principal result, interpretation and contribution all present |
| Introduction | All four movements present, purpose in the last paragraph |
| Abstract | Purpose, results and conclusions present |
| Title | Not a placeholder |

Present a status table: section, status, and what is missing. Then name **the single next step** and
why it is next. Do not present a list of everything outstanding; one next action is more useful.

### 2. Check the precondition

Before recommending a step, verify its precondition holds. The two that matter:

- **Figures selected and ordered**, before results and discussion. If they are not, say so: this is
  step 0 and no skill can do it. The figures tell the story and the text supports them, so writing
  before they are chosen means writing to a story that is still changing.
- **Results and conclusions written**, before the introduction. If someone wants to start with the
  introduction, say what it costs: an introduction written first states a gap that the results may
  not answer, and it usually needs rewriting.

If a precondition fails, say so, explain the cost, and let the researcher decide. Working out of
order is a judgement call, not an error.

### 3. Hand off

Invoke the section skill for the next step. Do not reimplement its work: each section skill has its
own interview, model and checks, and duplicating them here would produce a worse version.

After it finishes, offer to continue to the next step or to stop.

### 4. Track the ripple

Once more than one section exists, a change in one makes others stale. After any step, check and
report:

- Results changed, so the **abstract, conclusions and introduction gap** may be stale.
- Conclusions changed, so the **abstract's closing sentences and the title** may be stale.
- The introduction's gap changed, so the **abstract's gap** may be stale.
- Any section changed, so the **title** may no longer name the principal finding.

Name the affected sections and the `update-*` skill for each. Do not run them unasked.

### 5. Pre-submission pass

When every section exists, offer a review sweep rather than declaring the paper finished:

1. `/review-abstract`, `/review-introduction`, `/review-results-discussion`,
   `/review-conclusions`, `/review-title`
2. Then the cross-section checks that no single review can make: the abstract, introduction final
   paragraph and conclusions must all state the same purpose and contribution; every value in the
   abstract and conclusions must match the results; every gap in the introduction must be answered.
3. Then `/create-cover-letter`.

Report the cross-section checks yourself, since they fall between the section skills.

## Answering "what should I write next?"

This is the commonest reason to invoke this skill, and the answer should be short. Survey, then:

> Your results and discussion covers Figures 1 to 3 but not Figures 4 and 5. Finish those first:
> everything downstream is shaped by them. Run `/update-results-discussion`, mode C, to resume.
>
> After that, conclusions, since it is step 2 and it derives directly from the results.

One next action, the reason, the skill to run.

## Hard rules

- **Never write section content yourself.** Hand off. This skill's value is orientation, and a
  half-implemented section skill inside it would be worse than the real one.
- **Never invent the state of the manuscript.** If you cannot tell whether a section is complete, say
  what you could not determine and ask.
- **Never declare a paper finished.** Offer the pre-submission pass instead.
- **Never insist on the order.** State the cost of deviating and let the researcher choose.
- **Never emit an em dash (`---`).**
- If there is no manuscript and no figures, the honest answer is that the research has to be finished
  and the figures chosen before any of this applies. Say that rather than starting an interview.
