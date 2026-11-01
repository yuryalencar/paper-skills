---
name: create-cover-letter
description: Write a submission cover letter for a scientific manuscript, stating the importance and novelty of the work and why this specific journal is the right venue. Use when asked to write, draft or produce a cover letter for a paper submission, or when preparing to submit a manuscript to a journal.
allowed-tools: Read, Grep, Glob
---

# /create-cover-letter

Most researchers treat the cover letter as a formality. It is the **first document the editor reads**,
and it makes the first impression of the work. A desk rejection often happens before the manuscript is
opened, so this letter is doing real work.

## Before anything else

1. **Load the style rules.** Invoke `paper-writing-style`. If absent, use the condensed rules at the
   bottom.
2. **Lock the language.** Language of the user's first message, whole run. **The letter itself is always
   English**, unless the journal is explicitly non-English.
3. **Read the paper.** The title, abstract, conclusions and results. The letter is built from the
   contribution, so it cannot be written from a description.

## What the letter must contain

Two things carry it, and both are about the editor's decision, not about you:

1. **The importance and the novelty of the work.** High impact publishing runs on novelty. The editor is
   looking for a clear advance in the knowledge frontier of a field. State what the advance is, in one or
   two sentences, concretely.
2. **Why this journal.** Relate the contribution to that journal's specific audience. A letter that would
   work unchanged for any journal tells the editor nothing, and editors can tell instantly.

Around those, the conventional elements:

- Addressed to the editor, by name and title where known.
- The manuscript title and the article type being submitted.
- A statement that the work is original, not published elsewhere, and not under consideration elsewhere.
- Confirmation that all authors have approved the submission.
- Any declarations the journal requires: conflicts of interest, funding, ethics or data availability.
- Suggested or excluded reviewers, if the journal invites them.
- Corresponding author contact details.

## Workflow

### 1. Extract from the paper

The contribution as stated in the conclusions, the principal result with its value, the gap from the
introduction, and the field.

### 2. Interview

Batches of at most four questions:

- **The journal**, exactly. Its name, and the editor's name if known. This is the one thing the letter
  cannot be written without.
- **Why this journal.** Push here. Acceptable answers relate the work to the journal's scope, readership,
  or recent papers it has published. "It has a high impact factor" is not a reason the editor wants to
  read. If the researcher can name a recent paper in that journal the work builds on or answers, that is
  the strongest possible content for this paragraph.
- **The article type**: regular article, letter, short communication, review.
- **Which declarations the journal requires.** These vary and are often mandatory; a missing one causes an
  administrative rejection that has nothing to do with the science.
- **Suggested or excluded reviewers**, if invited.
- Whether this is a **resubmission after rejection elsewhere**, or a **revision**, since both change the
  letter. For a revision after review, use `/create-response-to-reviewers` instead.

### 3. Draft

Emit the letter as plain text or LaTeX, whichever the researcher wants. Structure:

```
Dear Professor <Editor>,

Please find enclosed our manuscript entitled "<title>", which we submit for consideration as
a <article type> in <Journal>.

<One or two sentences: what the work shows and why it advances the field. Concrete, with the
principal result.>

<One or two sentences: why this journal. Relate to its scope, readership, or a recent paper it
published.>

The manuscript is original, has not been published elsewhere, and is not under consideration
by another journal. All authors have read and approved the submitted version.

<Required declarations.>

<Suggested reviewers, if invited.>

We look forward to hearing from you.

Yours sincerely,
<Corresponding author, affiliation, email>
```

Keep it to one page. An editor reading fifty submissions will not read two.

### 4. Check and refine

Ask what to change. The "why this journal" paragraph is where the researcher's judgement matters most, and
it is the paragraph most likely to need their input rather than yours.

### 5. Offer to write it out

Only after approval.

## Hard rules

- **Never invent a result, a value or a claim.** Everything in the letter must be traceable to the paper.
- **Never overclaim.** A cover letter is where the temptation is greatest, and an editor who finds the
  letter overselling relative to the manuscript starts reading sceptically. Keep the claim exactly at the
  level the paper supports.
- **Never invent a journal's scope, a recent paper in it, or an editor's name.** No network access means
  you do not know these. Ask, or emit `% TODO:` / `[TODO: ...]` naming what is needed.
- **Never fabricate a declaration.** Statements about ethics approval, conflicts of interest, funding or
  data availability are legally and professionally consequential. Ask, and leave a marked placeholder if
  unanswered.
- **Never emit an em dash (`---`).**
- Do not flatter the journal. Editors read it as filler at best.
- Do not summarize the whole paper. The abstract is attached; the letter argues for it.
- One page.

## Condensed style rules, if `paper-writing-style` is not installed

Clarity and concision govern. Be specific: a letter that could accompany any paper says nothing. Put the
action in the verb. Cut redundancy and anything the editor already assumes. Prefer plain words. Avoid
`delve`, `harness`, `leverage`, `underscore`, `pave the way`, `crucial role`, `we are excited to`. Formal
register throughout, without stiffness. Escape `\%` if writing LaTeX.
