---
name: ask-paper
description: The paper-writing helper. Explains every skill in this package, why it exists and when to use it, tells you where your manuscript stands and what to do next, and keeps the session state across weeks. Follows the recommended writing order from Zucolotto's course (results and discussion, conclusions, introduction, methods, abstract, title). Use when asked which skill to use, what /write, /review, /draft, /evaluate or /organize do, how to start writing a paper, what to write next, what order to write in, where we left off, or to be walked through a manuscript end to end.
allowed-tools: Read, Grep, Glob
---

# /ask-paper

The helper for the whole package. It does three jobs: it **explains** the skills (what each one does,
why it exists, when to reach for it), it **orients** (where the manuscript stands and what to write next,
since sections are not written in the order they are read), and it **remembers** (it keeps the session
state across weeks accurate).

It does not write or review any section itself. It explains, surveys, reports, and hands off to `/write`,
`/review`, `/draft` or `/organize`.

## Usage

```
/ask-paper                         # where are we, and what next?
/ask-paper which skill do I use to check my introduction?
/ask-paper what does /organize do?
/ask-paper explain everything
```

## Before anything else

1. **Check for `paper-out/STATE.md`.** This is the fast path and it comes first. If it exists, read it
   plus `decisions.md` and `open-questions.md` before anything else. If it does not, this is either a
   new paper or a manuscript nobody has used these skills on yet.
2. **Load the style rules.** Invoke `paper-writing-style`, which holds the writing order, the house
   style, and the session state protocol in `references/session-state.md`. Read that reference before
   creating or updating any state.
3. **Lock the language.** Language of the user's first message, whole run. Any LaTeX the writing skills
   produce is English.
4. **Survey the manuscript.** Read the `.tex` files, the `.bib`, the figures and their captions. Work
   out what exists rather than asking.

## This skill reconciles the state folder

Every skill in the package reads `paper-out/` and **updates it at the end of every run**, as
`references/session-state.md` in `paper-writing-style` sets out. `/write`, `/review`, `/draft` and
`/organize` each update their own section's row, their decisions and their interviews, so `STATE.md` stays
current even when this skill is never invoked.

`/evaluate` also writes `venue-criteria.md` and `evaluation.md`, and `/review` updates a section's score in
`evaluation.md`. Read both when they exist, report the overall score and its date, and flag a section whose
score predates changes you can see in the manuscript. Never re-score it yourself: that is `/review`'s job.

What is specific to this skill is that it **sees the whole manuscript**. It reconciles `STATE.md` against
it: verifies every row, corrects what drifted, recomputes the position and the next step, and catches
what no single section skill can (a result that changed under a finished abstract). It also creates the
folder when nothing else has.

### Resuming

When `paper-out/STATE.md` exists, open with a short reconciliation, not a fresh interview:

> Resuming from 2026-08-19. Target journal ACS Nano, 250 word abstract. Your principal result is the
> 96% versus 71% retention comparison, and the size-dependence result was deferred pending TEM data.
> Last position: results and discussion done, conclusions next.
>
> Two things have changed in the manuscript since then: Section 3.6 is new, and Table 2 now reads 91%
> where the state records 96%. The manuscript wins, so I have corrected the state. Does the new
> section change which result is principal?

Three moves in that order: **state what you know**, **report what has changed underneath it**, then
**ask only what the change raises**. Never replay the original interview.

**Verify state against the manuscript every time.** Stored position is a hint, not a fact. A section
recorded as done that no longer looks done, or a value that no longer matches, means the state is stale:
say so, correct it, and continue. Silent trust in stale state is worse than having no state at all.

### Creating it

Whichever skill runs first creates `paper-out/` at the end of a run that did or decided something, not on
arrival. When this skill is the one creating it:

- Tell the researcher it was created, and list the files.
- Say once that it is intended to be **committed alongside the manuscript**, since the decision log is
  project history a co-author benefits from, and it carries the same sensitivity as the unpublished
  paper itself. Offer to add it to `.gitignore` if they prefer. Record the answer in `STATE.md` so it is
  not raised again.

### Updating it

At the end of any run that changed something, rewrite `STATE.md` in place: the position table, the next
step, the open question count, and the decisions that shape everything downstream. `STATE.md` is a
snapshot; `decisions.md` is the append-only log.

## The writing order

| # | Step | Skill | Precondition |
| :-- | :--- | :--- | :--- |
| -1 | Set up the project: template, repo, Overleaf | `/organize` | A target venue is chosen |
| 0 | Select and order the figures | none, this is yours | The research is finished |
| 1 | Results and discussion | `/write results-discussion` | Figures selected and ordered |
| 2 | Conclusions | `/write conclusions` | Results written |
| 3 | Introduction | `/write introduction` | Results and conclusions written |
| 4 | Methods or experimental | none yet, see `todo/` | The work is done |
| 5 | Abstract | `/write abstract` | Everything above written |
| 6 | Title | `/write title` | Everything above written |
| 6b | Score the whole paper against the venue's criteria | `/evaluate` | Every section exists, and the venue text is pasted once |
| 7 | Cover letter | `/write cover-letter` | Target journal chosen |
| 8 | Submit, then revise | `/write response-to-reviewers` | Reviews received |

Step 3 is the one that matters. Writing the introduction after the results keeps the two sections
connected, because a gap promised in the introduction and never answered in the results is the
commonest structural fault in a manuscript.

**Step 4 has no create skill.** The course proposes no model for the methods section, so one was not
invented. See `todo/methods-family.md`. Write it yourself for now.

## Workflow

### 1. Survey and report position

Also look at `exemplars/`: whether it exists, and whether it holds any papers beyond the `.gitkeep`. Never
open the papers to survey the manuscript; just note whether the folder is filled.

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

Invoke `/write <section>` (or `/organize`, or `/evaluate` for a complete draft) for the next step. If the researcher has material but no text for
it, `/draft <section>` gives them a first version to react to instead of starting with an interview. Do not reimplement its work: each section has its
own interview, model and checks, and duplicating them here would produce a worse version.

After it finishes, offer to continue to the next step or to stop.

### 4. Track the ripple

Once more than one section exists, a change in one makes others stale. After any step, check and
report:

- Results changed, so the **abstract, conclusions and introduction gap** may be stale.
- Conclusions changed, so the **abstract's closing sentences and the title** may be stale.
- The introduction's gap changed, so the **abstract's gap** may be stale.
- Any section changed, so the **title** may no longer name the principal finding.

Name the affected sections and `/write <section>` for each (it updates an existing draft). Do not run them unasked.

### 5. Pre-submission pass

When every section exists, offer a review sweep rather than declaring the paper finished:

1. `/review abstract`, `/review introduction`, `/review results-discussion`,
   `/review conclusions`, `/review title`
2. Then the cross-section checks that no single review can make: the abstract, introduction final
   paragraph and conclusions must all state the same purpose and contribution; every value in the
   abstract and conclusions must match the results; every gap in the introduction must be answered.
3. Then `/evaluate`, which scores every section and the paper against the venue's pasted criteria and the
   exemplars, and writes `paper-out/evaluation.md`. It asks for the venue text once and saves it to
   `paper-out/venue-criteria.md`. If an evaluation already exists, `/review` keeps each section's score current,
   so offer `/evaluate` again only when the venue text changed or sections were added.
4. Then `/write cover-letter`.

Report the cross-section checks yourself, since they fall between the sections.

## Explaining the skills

When the question is about the skills themselves ("which one do I use?", "what does this do?", "explain
everything"), read [references/skill-guide.md](references/skill-guide.md) and answer from it. Match the
depth to the question: one skill gets a short paragraph, "explain everything" gets the full tour in
writing order.

For each skill say **what it does, why it exists, and when to use it, and when not to**. Then point at the
one to try first. If the question is really "what should I do now?", switch to the next-step answer below
instead of describing skills nobody needs yet.

## Previous papers

The `exemplars/` folder is one of the most useful things a project can hold, and the one researchers forget
to fill. When it is empty or missing and the researcher is about to draft, **say so once**, briefly: put
previous papers from the target venue and track there (ideally 5 to 10 of the same paper type), because
`/draft` bases the paper's structure on what that venue has accepted. Explain it in full from the
"Previous papers" section of [references/skill-guide.md](references/skill-guide.md) when asked.

Never suggest committing it: its contents are other people's papers and are gitignored. If the project has no
`exemplars/` (an older one), offer to create it with a `.gitkeep` and the `.gitignore` entries
`exemplars/*` and `!exemplars/.gitkeep`.

## Answering "what should I write next?"

This is the commonest reason to invoke this skill, and the answer should be short. Survey, then:

> Your results and discussion covers Figures 1 to 3 but not Figures 4 and 5. Finish those first:
> everything downstream is shaped by them. Run `/write results-discussion` and choose the resume option.
>
> After that, conclusions, since it is step 2 and it derives directly from the results.

One next action, the reason, the skill to run.

## Answering "where were we?"

The other common reason to invoke this skill, and it should be answerable in one screen. Read
`STATE.md`, verify it against the manuscript, and report: where the paper stands, what changed since
last time, what is open, and the next step. Then stop and let the researcher direct.

## Hard rules

- **Never write section content yourself.** Hand off. This skill's value is orientation, and a
  half-implemented copy of `/write` or `/review` inside it would be worse than the real one.
- **Never invent the state of the manuscript.** If you cannot tell whether a section is complete, say
  what you could not determine and ask.
- **Never trust stored state over the manuscript.** Verify every time; report and correct staleness.
- **Never re-ask a question answered in `paper-out/interviews/`.**
- **Never write to `paper-out/` silently.** Name the files created or changed.
- **Never block on missing or malformed state.** Carry on without it and say so. The manuscript is what
  matters.
- **Never declare a paper finished.** Offer the pre-submission pass instead.
- **Never insist on the order.** State the cost of deviating and let the researcher choose.
- **Never emit an em dash (`---`).**
- If there is no manuscript at all, point at `/organize` for step -1. If there is a project but
  no figures chosen, say that the research has to be finished and the figures selected and ordered before
  any writing applies, rather than starting an interview.
