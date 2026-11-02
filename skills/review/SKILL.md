---
name: review
description: Review one section of a scientific paper against the course-derived model for that section and report what is missing, weak or inconsistent, without rewriting it unasked. Sections are abstract, introduction, results-discussion, conclusions, title, cover-letter and response-to-reviewers. Name the section as the argument. Use when asked to review, critique, check, audit, proofread or give feedback on an abstract, introduction, results and discussion, conclusions, title, cover letter, or response to reviewers.
argument-hint: <section> [file path]
allowed-tools: Read, Grep, Glob
---

# /review

One entry point for critiquing every section of a paper. The researcher says what to review; this skill
loads the checks for that section and runs them. Each section is judged against its own model, so the
checks live in `references/`.

## Usage

```
/review abstract
/review introduction src/introduction.tex
/review response-to-reviewers
/review                                   # infers the section, else asks
```

## Sections

| Section | Reference |
| :--- | :--- |
| Abstract | [abstract](references/abstract.md) |
| Introduction | [introduction](references/introduction.md) |
| Results and discussion | [results-discussion](references/results-discussion.md) |
| Conclusions | [conclusions](references/conclusions.md) |
| Title | [title](references/title.md) |
| Cover letter | [cover-letter](references/cover-letter.md) |
| Response to reviewers | [response-to-reviewers](references/response-to-reviewers.md) |

Methods is not offered, because the course gives no model to judge it against. Say so if asked.

## Before anything else

1. **Check for `paper-out/STATE.md`** and read it, with `decisions.md` and the relevant `interviews/*.md`,
   so you do not re-ask what is already settled and can check the section against earlier decisions.
2. **Load the style rules.** Invoke `paper-writing-style` and read its `references/human-voice.md`. The
   project's own `CLAUDE.md` outranks them. If it is not installed, say so, and fall back to the condensed
   rules at the bottom of the `/write` skill's `references/<section>.md` if that skill is installed.
3. **Lock the language.** Language of the user's first message, whole run. Rewrites are English.

## Pick the section

1. **From the argument.** Match it loosely: `results` and `discussion` are one section; `conclusion`,
   `rebuttal`, `reviewer response`, `cover`, `letter` all map to a row above.
2. **From a file path**, if given: the file's name or contents say which section it is.
3. **From context**, if there is no argument: the open file, or the section `paper-out/STATE.md` says was
   last written. Say what you inferred and let the researcher correct it.
4. **Otherwise ask.** Offer the most likely sections (at most four, plus "other"), or list all seven in
   chat. Never guess a section and start reviewing.

## Needs a draft

A review needs text to review. Find the section in `src/` and `main.tex`, following the `\input` list.
If it does not exist, **stop and say so**, and point at `/write <section>`. Do not review an outline or
invent a draft to criticise.

## Run it

Read the chosen reference in full and follow it. Do not mix checks from two sections.

## After it finishes

- **Update `paper-out/` before you finish**, as `references/session-state.md` in `paper-writing-style`
  sets out, creating it if absent: this section's row in `STATE.md` (reviewed on this date, how many
  findings), a `decisions.md` entry for what was accepted or declined and why, `open-questions.md` for
  what was left, and the section's score in `evaluation.md` if it was re-scored. Name the files you wrote. A
  run is not finished until this is done.
- **Re-score the section if an evaluation exists.** If `paper-out/evaluation.md` exists, follow "Re-scoring one
  section" in the `evaluate` skill's `references/rubric.md`: score the section again against the stored
  `paper-out/venue-criteria.md`, replace that section's block, recompute the overall score, and show the change
  (`Introduction 6.0 to 7.0, overall 6.4 to 6.7`). The user does not paste the venue text again. If there is no
  `evaluation.md`, do nothing and do not create one. If `venue-criteria.md` is missing or unreadable, or the
  `evaluate` skill is not installed, skip the re-score and say why.
- Offer to apply the fixes with `/write <section>`, which picks up the suggestions in its Update mode.

## Hard rules

- **Never rewrite the researcher's text unasked.** Report, then offer rewrites for the weak parts only.
- **Never invent a result, number or citation key** in a suggested rewrite. Flag it with `\todo{}` or
  `% TODO:`.
- **Never review a section that does not exist.**
- **Never create `evaluation.md` or `venue-criteria.md`**, and never score from criteria you did not read
  from the file. Only `/evaluate` starts an evaluation.
- **Never finish a run without updating `paper-out/`.** Say which files you changed.
- **Never emit an em dash (`---`).**
