# Session state: `paper-out/`

A paper takes weeks or months. Sessions stop and resume, often after a gap long enough that nobody
remembers what was decided. This is the protocol every skill in the family follows so that work
resumes where it stopped instead of restarting.

## The one rule that keeps it honest

**The manuscript is the only source of truth for content. `paper-out/` stores only what cannot be
re-derived from it.**

| Store in `paper-out/` | Never store, always re-read |
| :--- | :--- |
| Target journal, word limit, article type | The prose of any section |
| Which result is principal, and why | Section structure and which parts are present |
| Why this journal, for the cover letter | Values, figure numbers, citation keys |
| The reasoning behind a gap phrasing | Whether a section is complete |
| What was deliberately deferred or excluded | Anything in the `.tex` or `.bib` |
| Interview answers, so they are not asked twice | |
| The venue text the researcher pasted, so they paste it once | |
| Open questions the researcher has not settled | |
| Which reviews ran, and what was accepted or rejected | |
| Declined reviewer points and the reasons | |

A duplicated draft goes stale and then lies to you. Structure is cheap to re-derive and expensive to
keep in sync, so re-derive it every time.

## Layout

```
paper-out/
├── STATE.md              the entry point. Position, next step, decisions summary
├── decisions.md          append-only log, newest last, each entry dated
├── open-questions.md     unresolved items, removed when resolved
├── venue-criteria.md     the venue text the researcher pasted, verbatim, plus the criteria extracted from it
├── evaluation.md         the latest whole-paper score, one block per section
├── interviews/
│   ├── paper-type.md     what kind of paper, and where its structure came from
│   ├── abstract.md       answers given, so they are not asked again
│   ├── introduction.md
│   └── ...
└── revision/
    ├── round-1-comments.md
    ├── round-1-response-coverage.md
    └── round-2-comments.md
```

Everything is markdown, readable and editable by the researcher. No JSON, no internal formats. If they
edit `decisions.md` by hand, that must work.

## Fast path: check for it first

**Before anything else, in every skill: check whether `paper-out/STATE.md` exists.**

- **If it exists**, read `STATE.md`, `decisions.md` and the relevant `interviews/*.md` before asking
  the researcher a single question. Then say what you already know, in two or three lines, so they can
  correct anything stale. Do not re-ask a question whose answer is in `interviews/`.
- **If it does not exist**, proceed normally, and **create it at the end of the run**. Every skill that does
  work creates `paper-out/` when it finds none, so the state never depends on which skill ran first. Do not
  create it on arrival or for a run that did and decided nothing.

## What to write, and when

**After any decision the researcher makes**, append to `decisions.md`:

```markdown
## 2026-08-19

- Target journal: ACS Nano. 250 word abstract limit, specialist audience,
  so contextualization stays to one sentence.
- Principal result: the 96% versus 71% retention comparison. Chosen over the
  size-dependence result because it answers the durability gap directly.
- Deferred: the size-dependence result in Sec. 3.4. Interesting but it needs
  the TEM data we do not have yet, so it stays out of the abstract.
```

Absolute dates, never "today" or "last session". Append; never rewrite history. If a decision is
reversed, append the reversal with its reason rather than editing the original.

**After an interview**, write the answers to `interviews/<section>.md`, so the next session inherits
them instead of repeating the questions.

**When something is left unresolved**, add it to `open-questions.md` with enough context to answer it
cold:

```markdown
- Does the gap in the introduction cover dynamic conditions specifically?
  Mendes 2025 quantifies the static case, so as written the gap may be
  overstated. Raised while drafting the introduction, 2026-08-19.
```

Remove an entry when it is resolved, and append the resolution to `decisions.md`.

## Every skill updates it, every run

`paper-out/` is how the next session, and Claude itself, knows what is going on. So **no skill finishes a
run without updating it**: not just `/ask-paper`. Each skill records what it did, in the files below, and
names what it wrote.

| Skill | Writes at the end of a run |
| :--- | :--- |
| `/organize` | Creates `paper-out/`. `STATE.md` with the venue profile, template provenance and position step 0. A `decisions.md` entry for the section structure chosen |
| `/draft` | The section's row in `STATE.md` (`partial`, with the TODO count), `interviews/paper-type.md` and `interviews/<section>.md`, `decisions.md` for the sources used and the structure source, unresolved TODOs summarised in `open-questions.md` |
| `/write` | The section's row in `STATE.md`, `interviews/<section>.md`, `decisions.md` for each decision made, `open-questions.md` for anything left unresolved, `revision/` files for response letters |
| `/review` | The section's row in `STATE.md` (reviewed on this date, how many findings), `decisions.md` for which findings were accepted or declined and why, `open-questions.md` for what was left. If `evaluation.md` exists, that section's re-scored block in it and the new overall score |
| `/evaluate` | `venue-criteria.md` (the pasted text, once), `evaluation.md` (overwritten), the score and date in `STATE.md`, one line in `decisions.md` with the overall score, unscorable criteria in `open-questions.md` |
| `/ask-paper` | Reconciles `STATE.md` against the whole manuscript: position table, next step, staleness, open-question count |

**`STATE.md` is updated by whichever skill ran last**, so its rows reflect the latest run even when
`/ask-paper` was never invoked. The skills share one rule for the update: change only the rows, fields and
entries your run touched, and rewrite the snapshot fields (`Last worked`, `Next step`) from what you know.
Never overwrite another skill's decisions. If a row disagrees with what you can see in the manuscript, the
manuscript wins and you correct the row.

A run that changed nothing and decided nothing (a question answered, an explanation given) writes
nothing, and says so.


## STATE.md

One screen. It is read first and read most, so keep it short and current.

```markdown
# Paper state

**Manuscript:** main.tex
**Target journal:** ACS Nano (250 word abstract, specialist audience)
**Last worked:** 2026-08-19
**Git:** paper-out/ is committed alongside the manuscript

## Position

Writing order step 2 of 6.

| Section              | Status   | Note                                   |
| :------------------- | :------- | :------------------------------------- |
| Figures              | done     | 5 figures, ordered                     |
| Results & discussion | done     | reviewed 2026-08-19, 3 fixes applied   |
| Conclusions          | next     |                                        |
| Introduction         | partial  | context and gap only, written early    |
| Methods              | done     |                                        |
| Abstract             | absent   |                                        |
| Title                | partial  | provisional                            |

## Next step

/write conclusions. Results are finished, so the conclusions derive
directly from them.

## Open questions

2 open, see open-questions.md.

## Key decisions

Full log in decisions.md. The ones that shape everything downstream:

- Principal result: 96% versus 71% retention comparison
- Size-dependence result deliberately deferred, needs TEM data
- Introduction was written before the results and will need reconciling
```

Rewrite `STATE.md` in place each time; it is a snapshot, not a log. The log is `decisions.md`.

## Git

`paper-out/` is **committed alongside the manuscript** by default. The decision log is real project
history, co-authors benefit from seeing why a gap was framed a particular way, and it survives a
machine change. It lives in the same repository as the unpublished manuscript, so it carries the same
sensitivity as the paper itself and no more.

Say so once, on creation, and record the choice in `STATE.md` so it is not raised again. If the
researcher prefers it ignored, offer to add `paper-out/` to `.gitignore`.

## Multiple papers

State is per manuscript directory, so two papers in two directories cannot collide. If a single
directory holds more than one manuscript, ask which one before writing anything, and record the
manuscript filename in `STATE.md`.

## What not to do

- **Never write `paper-out/` without saying so.** Name the files you created or changed.
- **Never treat stored state as more current than the manuscript.** If `STATE.md` says a section is
  done and the `.tex` disagrees, the `.tex` wins. Say the state was stale and correct it.
- **Never let state accumulate silently.** A decision worth storing is worth mentioning.
- **Never store a value, a figure number or a citation key** as fact. Re-read those.
- **Never block on it.** If `paper-out/` is missing, unreadable, or hand-edited into something
  unexpected, carry on without it and say so. The manuscript is what matters.
