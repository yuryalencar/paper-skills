# Cover letter

## Create mode

Most researchers treat the cover letter as a formality. It is the **first document the editor reads**,
and it makes the first impression of the work. A desk rejection often happens before the manuscript is
opened, so this letter is doing real work.

### Context to read

**Read the paper.** The title, abstract, conclusions and results. The letter is built from the contribution, so it cannot be written from a description.

### What the letter must contain

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

### Workflow

#### 1. Extract from the paper

The contribution as stated in the conclusions, the principal result with its value, the gap from the
introduction, and the field.

#### 2. Interview

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
  letter. For a revision after review, use `/write response-to-reviewers` instead.

#### 3. Draft

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

#### 4. Check and refine

Ask what to change. The "why this journal" paragraph is where the researcher's judgement matters most, and
it is the paragraph most likely to need their input rather than yours.

#### 5. Offer to write it out

Only after approval.

### Hard rules

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

## Update mode

A cover letter exists and needs to change. The commonest reason by far is **resubmission to a different
journal after rejection**, which requires more rewriting than researchers expect, because the paragraph
that matters most is the one about the journal.

### Context to read

**Read the paper and the existing letter.**

### Pick the mode

State the mode before starting.

| Mode | Signal | What it does |
| :--- | :--- | :--- |
| **A. Retarget** | Submitting to a different journal | Rebuild the journal-fit argument, keep the novelty |
| **B. Reconcile** | The paper changed since the letter was written | Fix claims and values the paper no longer supports |
| **C. Apply suggestions** | A co-author or supervisor commented, or `/review cover-letter` output | Incorporate each change |
| **D. Resume** | The letter is unfinished | Complete it |

Modes A and B frequently coincide: a paper rejected from one journal is usually revised before going to
the next.

**If this is a revision after peer review**, not a fresh submission, this is the wrong skill. The
resubmission letter accompanies a point-by-point response to the reviewers, so use
`/write response-to-reviewers`.

### Mode A: retarget to a different journal

The mistake to avoid is swapping the journal name and sending it. Three things change, not one:

1. **The journal-fit paragraph is rewritten entirely.** Whatever argued for the old venue does not argue
   for the new one. Ask what relates the work to *this* journal's scope, readership, or recent papers. If
   the researcher has no answer beyond impact factor, say plainly that the paragraph will be weak and that
   an editor reads a generic letter as a sign the paper is being shopped around.
2. **The novelty framing may need adjusting for the audience.** A more specialist journal needs less field
   justification and more technical specificity; a broader one needs the importance of the whole field
   established. Say which direction you moved and why.
3. **The declarations and the article type must be checked against the new journal's requirements**, which
   differ. Ask; do not carry the old ones over blindly.

Also: **remove every trace of the previous journal.** Its name, its article-type vocabulary, its editor's
name, and any argument shaped around it. A letter mentioning the wrong journal is the most embarrassing
possible submission error and it happens constantly. Check explicitly and report that you checked.

**Never mention the previous rejection.** There is no obligation to disclose it and nothing to gain.

### Mode B: reconcile with the paper

Check, in order of severity:

1. **A claim the paper no longer supports.** If it is a substantive claim rather than a number, ask the
   researcher rather than rewriting it.
2. **A value that no longer matches** the results.
3. **The novelty statement built on a finding that is no longer principal.**
4. **The stated article type or length no longer fitting** what the manuscript became, for example a letter
   that grew into a full article.
5. **Author list changes** not reflected in the approval statement or the corresponding author details.

### Mode C: apply suggested updates

Enumerate every comment, classify it as *direct*, *interpretive*, *conflicting* or *out of scope*, apply or
propose, and account for every one including those not applied.

Supervisor comments on cover letters cluster into: "state the novelty more strongly" (usually means make it
concrete, not louder), "explain why this journal" (the fit paragraph), and "too long" (cut the paper
summary, which duplicates the abstract).

### Mode D: resume

Report which required elements are present and which are missing, recover the novelty statement from the
paper's conclusions, and ask only for what the manuscript cannot supply: the editor's name, the journal-fit
reason, and the declarations.

### Produce the revision

Emit the full letter, since it is short enough that showing all of it is clearer than showing a diff, and:

- **Preserve the researcher's wording wherever it still holds.**
- Annotate each change with a bracketed note or a comment saying why, for example
  `[UPDATED: journal-fit paragraph rewritten for Advanced Materials]`.
- `[TODO: ...]` for every declaration, name or reason you could not obtain.
- Keep it to one page.

Show it, then summarize the changes. In mode A, state explicitly that you checked for and removed all
references to the previous journal.

### Offer to write it out

Only after approval.

### Hard rules

- **Never invent a journal's scope, a recent paper in it, or an editor's name.** No network access. Ask, or
  leave a marked placeholder.
- **Never carry over a declaration** without confirming it applies to the new journal.
- **Never fabricate a declaration.** These are legally and professionally consequential.
- **Never invent or strengthen a claim.**
- **Never mention a previous rejection.**
- **Never emit an em dash.**
- **Never leave the previous journal's name anywhere in the letter.**
- If nothing needs changing, say so and change nothing.

## Condensed style rules

Fallback when `paper-writing-style` is not installed.

Clarity and concision govern. Be specific: a letter that could accompany any paper says nothing. Put the
action in the verb. Cut redundancy and anything the editor already assumes. Prefer plain words. Avoid
`delve`, `harness`, `leverage`, `underscore`, `pave the way`, `crucial role`, `we are excited to`. Formal
register throughout, without stiffness. Escape `\%` if writing LaTeX.
