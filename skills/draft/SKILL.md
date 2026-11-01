---
name: draft
description: Produce a first-pass draft of one paper section, or a skeleton of the whole paper, from whatever material the researcher already has (notes, pasted text, local files or a whole local project, links, other papers), marking every gap with a red TODO that says what is missing and why the section needs it. Asks what kind of paper it is (systematic mapping, tool, industry, empirical study and so on) because the type decides the structure, and gets that structure from the researcher, never from memory. Sections are abstract, introduction, results-discussion, conclusions, title, cover-letter and response-to-reviewers. Use when asked to draft, sketch, outline, bootstrap or give a first version of a paper or a section from existing material.
argument-hint: <section | paper> [sources: files, folders, URLs, notes]
allowed-tools: Read, Grep, Glob, WebFetch
---

# /draft

Material in, first version out. The researcher has scattered material and wants something concrete to react
to. This skill drafts every part the material supports, and for every part it does not, leaves a **red
TODO** saying what to supply and why the section needs it, so the gaps are visible and nothing is invented.

It is not `/write`. `/write` interviews first and then drafts. `/draft` drafts first, from what exists, and
its TODOs become the agenda for `/write`.

## Usage

```
/draft introduction notes.md https://arxiv.org/abs/...        # one section, from material
/draft conclusions src/results.tex                            # derive from what is written
/draft paper ~/projects/my-tool                               # skeleton of the whole paper
/draft                                                        # asks what to draft and from what
```

## Before anything else

1. **Check for `paper-out/STATE.md`** and read it, with `decisions.md` and `interviews/*.md`, before asking
   anything. The venue profile and an earlier paper-type answer are probably already there.
2. **Load the style rules.** Invoke `paper-writing-style` and read `references/human-voice.md` and
   `references/latex-conventions.md`. The project's own `CLAUDE.md` outranks them.
3. **Find the section models.** They live in the `/write` skill's `references/<section>.md`. Glob for
   `**/skills/write/references/<section>.md` and, if it is not found, stop and say that `/draft` needs
   `/write` installed alongside it. Do not reconstruct a model from memory.
4. **Lock the language.** Language of the user's first message, whole run. **LaTeX output is always English.**

## Workflow

### 1. Settle the target

A section name, or `paper` for a skeleton. Match loosely and infer from a file path or `paper-out/STATE.md`,
as `/write` does; ask when unclear. Methods and any section the course gives no model for is not drafted:
say so and add the item to `todo/` when the researcher wants it tracked.

**If the section already has real text, stop.** Point at `/write <section>` to update it or
`/review <section>` to critique it. Never overwrite. An empty stub file from `/organize` is not text.

### 2. Understand the paper

Ask what kind of paper this is, because the type decides the structure: a systematic mapping, a tool paper,
an industry paper and an empirical study are not built alike. Follow
[references/paper-structure.md](references/paper-structure.md): one batch of questions on type, topic,
audience and venue, then ground the structure in a source the researcher supplies, preferably the
**exemplars folder** of previously accepted papers from the same venue and track. If there is no such
folder, suggest creating one (gitignored). **Never take a type's structure from memory.** Record the answers in `paper-out/interviews/paper-type.md`.

### 3. Gather the material

Read everything the researcher points at, following
[references/sources.md](references/sources.md): what counts as evidence, how other papers are used (as
evidence and citations only, never their sentences), and how to handle links you cannot reach. Note, for
each fact you will use, **which source it came from**.

### 4. Map material to the model

Take the section's model from the `/write` reference. For each part of the model, mark whether the material
**supports it, partly supports it, or does not**. Thin material is fine: draft anyway.

### 5. Draft

Emit one LaTeX fragment in the house style, covering every part the material supports, with the model's
structure comments so the researcher can see the shape. For every part it does not support, write a red
TODO following [references/todo-conventions.md](references/todo-conventions.md): what to supply, why this
section needs it, and where it will probably come from.

For `paper`, produce a skeleton: one block per section file, in the structure grounded in step 2, with prose
only for the sections the course models and a TODO for each section's open content.

### 6. Show it, then offer to write it

Show the fragment in chat, then the **TODO list only**: each TODO in the order to resolve them, one line
each. No coverage table. Then the **proposed `.bib` entries**, built only from metadata you actually read,
and ask before adding them. Offer to write the draft to `src/<section>.tex` only after the researcher has
seen it. Then name the next step: `/write <section>` to resolve the TODOs by interview.

### 7. Update `paper-out/`

Before you finish, as `references/session-state.md` in `paper-writing-style` sets out, creating it if
absent: the section's row in `STATE.md` as `partial` with its TODO count, `interviews/paper-type.md` and
`interviews/<section>.md`, a `decisions.md` entry for the sources used and where the structure came from,
and `open-questions.md` for TODOs that need a researcher decision. Name the files you wrote. The TODOs
themselves live in the `.tex`, so never copy their text into `paper-out/`.

## Hard rules

- **Never invent a result, number, method detail or citation key.** A missing one is a red TODO.
- **Never take a paper type's structure from memory.** It comes from the venue's guidelines, example papers
  the researcher supplies, or the researcher's own outline. Where none exists it is a TODO.
- **Never reuse another paper's sentences.** Its facts are evidence to cite; its wording is not yours.
- **Never suggest committing `exemplars/`.** It holds other people's papers: keep it gitignored and out of
  Overleaf.
- **Never overwrite existing text.** Stop and point at `/write` or `/review`.
- **Never add to the `.bib` or write a file before the researcher has seen it.** `paper-out/` is the
  exception: update it every run, and say so.
- **Never hide a gap to make the draft look finished.** A TODO is the product, not a failure.
- **Never finish a run without updating `paper-out/`.**
- **Never emit an em dash (`---`).**
