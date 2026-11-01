---
name: write
description: Write or update one section of a scientific paper in LaTeX, using the course-derived model for that section. Sections are abstract, introduction, results-discussion, conclusions, title, cover-letter and response-to-reviewers. Name the section as the argument; with no draft it interviews you and drafts, with an existing draft it updates it to match the paper, applies your suggestions, resumes it, or rewrites it. Use when asked to write, draft, create, update, revise, retarget or finish an abstract, introduction, results and discussion, conclusions, title, cover letter, or response to reviewers.
argument-hint: <section> [file path or notes]
allowed-tools: Read, Grep, Glob
---

# /write

One entry point for writing every section of a paper. The researcher says what to write; this skill loads
the procedure for that section and runs it. The sections are not interchangeable, so each has its own
model, interview and checks in `references/`.

## Usage

```
/write abstract
/write results-discussion
/write introduction src/introduction.tex
/write cover-letter                      # asks for the journal if unknown
/write                                   # infers the section, else asks
```

## Sections

| Section | Reference | Typical file in `src/` |
| :--- | :--- | :--- |
| Abstract | [abstract](references/abstract.md) | `abstract.tex` |
| Introduction | [introduction](references/introduction.md) | `introduction.tex` |
| Results and discussion | [results-discussion](references/results-discussion.md) | `results.tex`, `discussion.tex` or one file |
| Conclusions | [conclusions](references/conclusions.md) | `conclusion.tex` or `conclusions.tex` |
| Title | [title](references/title.md) | `main.tex` |
| Cover letter | [cover-letter](references/cover-letter.md) | outside the manuscript |
| Response to reviewers | [response-to-reviewers](references/response-to-reviewers.md) | outside the manuscript |

Methods is not offered. The course proposes no model for it, so none was invented; see `todo/` in the
repository. If asked, say so and offer to help in plain conversation instead.

## Before anything else

1. **Check for `paper-out/STATE.md`** and read it, with `decisions.md` and the relevant
   `interviews/*.md`, before asking anything. State what you already know in two or three lines.
2. **Load the style rules.** Invoke `paper-writing-style` and read its `references/human-voice.md` and
   `references/latex-conventions.md`. The project's own `CLAUDE.md` outranks them.
3. **Lock the language.** Language of the user's first message, whole run. **LaTeX output is always English.**

## Pick the section

1. **From the argument.** Match it loosely: `results`, `discussion` and `results and discussion` are one
   section; `conclusion`, `rebuttal`, `reviewer response`, `cover`, `letter` all map to a row above.
2. **From a file path**, if given: the file's name or contents say which section it is.
3. **From context**, if there is no argument: the open file, or the next step in `paper-out/STATE.md`.
   Say what you inferred and let the researcher correct it.
4. **Otherwise ask.** Offer the sections most likely given the state (at most four, plus "other"), or list
   all seven in chat. Never guess a section and start writing.

An unrecognised section is a question, not an error: show the table and ask.

## Pick the mode

Look for the section in `src/` and in `main.tex`, following the `\input` list rather than assuming file
names.

- **No draft exists.** Run the reference's **Create mode**.
- **A draft exists.** Say what you found and ask which applies: **update it** (the reference's Update mode
  offers reconcile with the paper, apply suggestions, or resume), or **rewrite it from scratch** (Create
  mode, after confirming that the existing text may be discarded). If the researcher's request already says
  "update", "revise", "fix" or "finish", skip the question.
- **Cover letter and response to reviewers** often live outside the manuscript. Ask for the file if you
  cannot find it, and treat a letter written for another journal as a draft to retarget.

## Run it

Read the chosen reference in full and follow it. Do not reimplement it here and do not mix procedures from
two sections.

## After it finishes

- **Update `paper-out/` before you finish**, as `references/session-state.md` in `paper-writing-style`
  sets out, creating it if absent: this section's row in `STATE.md`, `interviews/<section>.md`, a
  `decisions.md` entry for each decision, `open-questions.md` for anything unresolved. Name the files you
  wrote. A run is not finished until this is done.
- Check the **ripple**: results changed means abstract, conclusions and the introduction gap may be stale;
  conclusions changed means the abstract's closing and the title may be stale. Name the affected sections
  and suggest `/write <section>` for each. Do not run them unasked.
- Suggest `/review <section>` on what was just written, and `/ask-paper` for the next step.

## Hard rules

- **Never invent a result, number, method detail or citation key.** Emit the project's `\todo{}` macro, or
  `% TODO:` where there is none.
- **Never write to the researcher's files before they approve the text.** `paper-out/` is the exception:
  update it every run, and say so.
- **Never emit an em dash (`---`).**
- **Never start writing until the section is settled** and the reference's interview has what it needs.
- **Never write a section the course gives no model for.** Say so instead.
- **Never finish a run without updating `paper-out/`.** Say which files you changed.
