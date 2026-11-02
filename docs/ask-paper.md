# /ask-paper

> The helper for the whole package. Explains every skill, tells you where your manuscript stands and what
> to write next, and remembers across sessions.

**Status:** alpha · **Version:** 0.3.0 · **Invocation:** `/ask-paper` ·
**Auto-loads:** yes
**Companion skills:** [organize](organize.md), [write](write.md), [review](review.md), [evaluate](evaluate.md),
[paper-writing-style](paper-writing-style.md)

Formerly `write-paper`.

## What it does

Three jobs.

- **Explains.** Ask which skill to use, what one does, or for the full tour. It answers from a skill guide:
  what each skill does, why it exists, when to use it and when not to.
- **Orients.** Sections are not written in the order they are read. It holds the recommended order, works
  out where your manuscript actually stands, names the single next step, and hands off to `/write`,
  `/review` or `/organize`.
- **Remembers.** Every skill updates `paper-out/` after each run; this one reconciles it against the whole
  manuscript, so work resumes after weeks away.

It writes and reviews no section itself. Its value is orientation.

## Previous papers

`/ask-paper` also explains, and nudges you toward, the `exemplars/` folder that `/organize` creates. It is
for **previous papers from the venue and track you are targeting**: accepted papers, ideally 5 to 10 of the
kind of paper you are writing, in `exemplars/<venue-or-track>/`. They are among the most useful things you
can have when writing a new paper, because [draft](draft.md) bases your paper's structure on what recurs
across them, which is what that venue actually accepts, instead of on a guess about a paper type.

When you are about to draft and the folder is empty, it says so once. The folder is local only: its contents
are gitignored, because they are other people's copyrighted work, and only the `.gitkeep` is tracked.

## Asking it about the skills

```
> /ask-paper which skill do I use to check my introduction?

/review introduction. It labels each of the four movements (contextualization,
gap, state of the art, purpose), traces the funnel, and audits your citations.
It needs a draft; if you have none, /write introduction comes first.
```

```
> /ask-paper what is the exemplars folder for?
```

explains it (above), and

```
> /ask-paper explain everything
```

gives the tour in writing order: `/organize`, `/write` and its seven sections, `/review`, this skill, and
the Claude-only `paper-writing-style` rulebook. It also says what is not covered (methods, and choosing your
figures).

## The writing order

| # | Step | Command | Precondition |
| :-- | :--- | :--- | :--- |
| -1 | Set up the project from the venue's format | [organize](organize.md) | A target venue is chosen |
| 0 | Select and order the figures | yours | The research is finished |
| 1 | Results and discussion | `/write results-discussion` | Figures selected and ordered |
| 2 | Conclusions | `/write conclusions` | Results written |
| 3 | **Introduction** | `/write introduction` | Results and conclusions written |
| 4 | Methods or experimental | none yet, see [`todo/`](../todo/methods-family.md) | The work is done |
| 5 | Abstract | `/write abstract` | Everything above |
| 6 | Title | `/write title` | Everything above |
| 6b | Score the whole paper against the venue's criteria | [evaluate](evaluate.md) | Every section exists |
| 7 | Cover letter | `/write cover-letter` | Target journal chosen |
| 8 | Revise after review | `/write response-to-reviewers` | Reviews received |

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

## Step 4 has no writing command, deliberately

The course proposes an explicit model for the abstract, the introduction, results and discussion, and
conclusions. For the methods section it proposes **none**, so one was not invented. Writing a
confident-sounding skill on a made-up structure would teach the wrong conventions.

It is recorded in [`todo/methods-family.md`](../todo/methods-family.md), to be replaced by narrower
skills such as `/write threats-to-validity` once real exemplar sections are available to derive a
model from.

## When to use it

- You have finished the research and do not know where to start.
- You have a half-written manuscript and want to know what to do next.
- You want to know what order to write a paper in.
- You are not sure which skill does what.
- You are approaching submission and want a pre-submission sweep.

## When *not* to use it

- **You know which section you are working on.** Go straight to `/write` or `/review` with it; this one
  would just add a hop.
- **The research is not finished and the figures are not chosen.** It will tell you that plainly rather
  than starting an interview.
- **There is no project yet.** Use [organize](organize.md) for step -1: the venue's format, the template
  and the project structure.

## Install

```
/plugin marketplace add yuryalencar/paper-skills
/plugin install ask-paper@yuryalencar-paper-skills
```

It is most useful with the rest of the package installed, since its job is to hand off to them.

## Inputs

Nothing. It surveys your working directory: `.tex` files, the `.bib`, figures and captions. Tell it the
target journal if you have one.

**Language.** Follows the language you open in.

## Outputs

An explanation of the skills, or a status table, the single next step with its reason, and the command to
run. Then it hands off.

## Example

```
> /ask-paper

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

  /write results-discussion   (choose the resume option)

NOTE ON YOUR INTRODUCTION

It was written before the results, which is out of order. That is not an
error, but expect to revise it: the gap in your ¶3 is about cost, and
your Figures 1 to 3 are about durability. Once the results are finished,
/write introduction will reconcile them.
```

## Resuming after weeks away

A paper is not written in one sitting. The family keeps a `paper-out/` folder beside your manuscript so
that work resumes where it stopped instead of restarting.

```
my-paper/
├── main.tex
├── references.bib
├── figures/
└── paper-out/
    ├── STATE.md            position, next step, key decisions
    ├── decisions.md         append-only log, each entry dated
    ├── open-questions.md    unresolved items
    ├── interviews/          answers given, so they are not asked twice
    └── revision/            reviewer rounds and coverage
```

**Every skill reads it and updates it at the end of every run.** `/organize`, `/draft`, `/write` and
`/review` each update their section's row, decisions and interviews, so `STATE.md` is current even when
`/ask-paper` never ran. `/ask-paper` reconciles it, since only it sees the whole manuscript.

### The rule that keeps it honest

**The manuscript is the only source of truth for content.** `paper-out/` stores only what cannot be
re-derived from it:

| Stored | Never stored, always re-read |
| :--- | :--- |
| Target journal, word limit, article type | The prose of any section |
| Which result is principal, and why | Section structure, or whether a section is complete |
| Why this journal | Values, figure numbers, citation keys |
| The reasoning behind a gap phrasing | Anything in the `.tex` or `.bib` |
| What was deliberately deferred | |
| Interview answers | |
| Open questions | |
| Declined reviewer points, with reasons | |

A duplicated draft goes stale and then lies to you. Structure is cheap to re-derive and expensive to keep
in sync, so it is re-derived every run. **If stored state and the manuscript disagree, the manuscript
wins**, and the skill says the state was stale and corrects it.

### What resuming looks like

```
> /ask-paper

Resuming from 2026-08-19. Target journal ACS Nano, 250 word abstract.
Your principal result is the 96% versus 71% retention comparison, and the
size-dependence result was deferred pending TEM data. Last position:
results and discussion done, conclusions next.

Two things changed in the manuscript since then. Section 3.6 is new, and
Table 2 now reads 91% where the state recorded 96%. The manuscript wins,
so I have corrected paper-out/STATE.md.

Does the new section change which result is principal?
```

Three moves, in that order: **state what it knows**, **report what changed underneath it**, then **ask
only what the change raises**. It never replays the original interview, and it never re-asks a question
answered in `interviews/`.

### Git

`paper-out/` is meant to be **committed alongside your manuscript**. The decision log is real project
history, a co-author benefits from seeing why a gap was framed a particular way, and it survives a
machine change. It lives in the same repository as your unpublished manuscript, so it carries the same
sensitivity as the paper itself and no more. The skill says this once on creation and offers to
`.gitignore` it instead if you prefer.

Everything in the folder is markdown you can read and edit by hand. No JSON, no internal formats.

## The ripple check

Once several sections exist, changing one makes others stale. After any step it reports which:

| Changed | Now possibly stale |
| :--- | :--- |
| Results | Abstract, conclusions, the introduction's gap |
| Conclusions | The abstract's closing sentences, the title |
| The introduction's gap | The abstract's gap |
| Anything | The title, if it no longer names the principal finding |

It names the affected sections and the `/write <section>` command for each. It does not run them unasked.

## Pre-submission pass

When every section exists it offers a sweep rather than declaring the paper finished: `/review` on
each of the five core sections, then the **cross-section checks no single review can make** (abstract, introduction
final paragraph and conclusions all stating the same purpose and contribution; every value in the
abstract and conclusions matching the results; every gap in the introduction answered), then the cover
letter, and [`/evaluate`](evaluate.md) for a section-by-section score against the venue's criteria (it asks for the venue text once and
saves it; afterwards `/review` keeps the scores current).

It reports those cross-section checks itself, since they fall between the sections.

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
- **The ripple check exists because a section family without it leaves silent staleness.** Only this skill
  sees the whole manuscript.
- **It never declares a paper finished.** It offers the pre-submission pass instead.
- **The cross-section checks live here** because they fall between sections and no section skill owns
  them.
- **The missing methods step is stated openly** rather than papered over, with a pointer to why.
- **Session state was added because the first version re-derived everything from the manuscript each
  run.** That works for structure and fails for decisions: which journal, which result is principal,
  what was deliberately left out. Those live nowhere in the `.tex` and were being lost between sessions,
  so the researcher got re-interviewed on settled questions weeks later.
- **State stores only non-derivable decisions**, never prose or structure. The failure mode of a state
  file is drifting from reality and being believed anyway, so the surface area is kept as small as
  possible and the manuscript always wins a disagreement.
- **The protocol lives in `paper-writing-style`, not here.** Every skill already loads that rulebook, so
  one edit taught every skill to read and append to `paper-out/`. Putting it here would have meant
  editing each skill and letting them drift.
- **State is verified against the manuscript every run**, never trusted. Silent trust in stale state is
  worse than having no state.
- **Markdown, not JSON.** The researcher has to be able to read the decision log, and hand-editing it
  must work.
- **Created on first real decision, not on arrival**, so a directory where somebody ran one review does
  not acquire an empty folder.

## Sources

Module 4 of *Curso de Escrita Científica: Produção de Artigos de Alto Impacto* by Prof. Dr. Valtencir
Zucolotto, IFSC/USP, transcript in
[`sources/`](../sources/curso_escrita_cientifica_valtencir_zucolotto.md), where the writing order is
given as the assignment closing the first half of the course. Module 8 supplies the submission and
revision steps.

- **Renamed and widened.** The authoring interview for 0.2.0 turned `write-paper` into the package's helper:
  it keeps the order and state, and adds the explain-every-skill role, so one place answers "which skill do
  I use, and why".

## Changelog

- **0.3.0**: explains `/evaluate`, adds it to the writing order and the pre-submission pass, and reads `evaluation.md`
  and `venue-criteria.md` when reconciling state.
- **0.2.1**: explains the `exemplars/` folder and nudges you to fill it before drafting.
- **0.2.0**: renamed from `write-paper`. Adds the skill guide, and hands off to `/write`, `/review` and
  `/organize`.
- **0.1.0**: initial version.
