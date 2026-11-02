---
name: evaluate
description: Score a complete scientific paper section by section and as a whole, against the venue's review criteria (pasted once by the researcher and saved) and the structure that recurs in previous accepted papers in exemplars/. Writes paper-out/evaluation.md with a 1 to 10 score and the reason for every section plus a weighted overall score, and does not predict accept or reject. Use when asked to evaluate, score, grade, rate or assess a whole paper, to check whether a draft is ready to submit, or to see where it is weakest against what the venue looks for.
argument-hint: [manuscript file]
disable-model-invocation: true
allowed-tools: Read, Grep, Glob
---

# /evaluate

Scores a finished draft against what the target venue says it looks for. Each section gets a 1 to 10
score with the reason, the evidence, and the one change that would raise it most. The paper gets a
weighted overall score. The report lands in `paper-out/evaluation.md`.

It scores. It does not fix: fixes go to `/review <section>` and `/write <section>`. It does not predict
accept or reject, because that would be a guess presented as a measurement.

It is manual-only: a whole-paper read that writes a file is something you time yourself.

## Usage

```
/evaluate                         # finds the manuscript, asks for the venue text if there is none saved
/evaluate main.tex
```

## Before anything else

1. **Check for `paper-out/STATE.md`** and read it, with `decisions.md` and `open-questions.md`. Read
   `references/session-state.md` in `paper-writing-style` before writing any state.
2. **Load the style rules.** Invoke `paper-writing-style`. The project's `CLAUDE.md` outranks it.
3. **Lock the language.** Language of the user's first message, whole run.
4. **Check the draft is complete.** Follow the `\input` list in `main.tex` and read every section file. If
   any is empty or a placeholder, **stop**, name them, and point at `/draft <section>` or
   `/write <section>`. Do not score an outline.

## Workflow

### 1. Get the venue criteria

Check for `paper-out/venue-criteria.md`.

- **It exists:** read it and say in one line what you loaded, for example
  `Using venue-criteria.md (pasted 2026-11-02, 7 criteria, weighted)`, so a stale file is visible. The
  researcher does not paste again unless they say the text changed.
- **It does not exist:** ask the researcher to paste the venue text: the review criteria, call for papers,
  or reviewer guidelines. **Without it, refuse and say why.** Never score against criteria you remember
  for the venue.
- **The researcher has new text:** replace the pasted section, and append the replacement to `decisions.md`.

Save, extract and confirm the criteria as [references/venue-criteria.md](references/venue-criteria.md)
sets out. Show the criteria table with the sentence each came from, mark every weight the text did not give
as **unstated** (equal weight, said so), and get confirmation before scoring. If the text names only
paper-level criteria, **ask** how each maps to sections rather than inventing the mapping.

### 2. Read the exemplars

If `exemplars/` holds papers, label each one's structure with the categorization method, keep what recurs,
and record how many papers it recurred in (`6 of 8`). Structure only, never sentences or results. Save the
recurring pattern in `venue-criteria.md` so a later `/review` can reuse it.

If `exemplars/` is empty, **continue**, say plainly that the exemplar comparison is missing, and mark every
cell that depends on it **unscored**. Never fill it from memory of what the venue's papers look like.

### 3. Score

Read the manuscript section by section and score as [references/rubric.md](references/rubric.md) sets out:
1 to 10 per criterion with the anchors, a quote from the draft as evidence, the exemplar count where one
applies, and the single change that would raise the section most. Methods, related work and other
sections with no `/write` model are scored on the venue's criteria and clarity only, never against an
invented structure.

### 4. Compute and write

Compute the section scores and the weighted overall score exactly as the rubric defines them, so the
reader can recompute them from the table. Write `paper-out/evaluation.md` from
[references/report-template.md](references/report-template.md), overwriting the previous one.

### 5. Update `paper-out/`

- `evaluation.md`: written.
- `venue-criteria.md`: created or updated.
- `STATE.md`: the overall score and the evaluation date, and the weakest section as the next step.
- `decisions.md`: one dated line with the overall score, and the previous one if there was one, since the
  report is overwritten.
- `open-questions.md`: each criterion that could not be scored, and what would unblock it.

Name every file you wrote. A run is not finished until this is done.

### 6. Hand off

Name the three lowest sections and the skill for each: `/review <section>` for a diagnosis, then
`/write <section>` to apply it. Say once that `/review` updates that section's score in `evaluation.md`
when it runs, so the report stays current without running `/evaluate` again.

## Hard rules

- **Never run without pasted venue criteria.** Refuse, and ask for the paste.
- **Never ask the researcher to paste again** while `venue-criteria.md` exists and is readable.
- **Never fill a criterion, weight or exemplar pattern from memory.** Unknown or unscored stays marked.
- **Never predict accept, reject or a decision.** Report scores, reasons and the change that raises each.
- **Never score a section that is empty or a placeholder.** Stop and say which.
- **Never copy an exemplar's sentences or results.** Structure only.
- **Never rewrite the researcher's text.** This skill scores.
- **Never give a score without its reason, evidence and criterion.**
- **Never finish a run without updating `paper-out/`.** Say which files you changed.
- **Never emit an em dash (`---`).**
