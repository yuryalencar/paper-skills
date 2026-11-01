---
name: update-cover-letter
description: Update an existing cover letter, whether the paper changed since it was written, the manuscript is being submitted to a different journal after rejection, feedback was given on the letter, or it was left unfinished. Use when a cover letter already exists and needs to change rather than be written from scratch.
allowed-tools: Read, Grep, Glob
---

# /update-cover-letter

A cover letter exists and needs to change. The commonest reason by far is **resubmission to a different
journal after rejection**, which requires more rewriting than researchers expect, because the paragraph
that matters most is the one about the journal.

## Before anything else

1. **Load the style rules.** Invoke `paper-writing-style`. If absent, use the condensed rules in
   `create-cover-letter`.
2. **Lock the language.** Language of the user's first message, whole run. The letter is English.
3. **Read the paper and the existing letter.**

## Pick the mode

State the mode before starting.

| Mode | Signal | What it does |
| :--- | :--- | :--- |
| **A. Retarget** | Submitting to a different journal | Rebuild the journal-fit argument, keep the novelty |
| **B. Reconcile** | The paper changed since the letter was written | Fix claims and values the paper no longer supports |
| **C. Apply suggestions** | A co-author or supervisor commented, or `/review-cover-letter` output | Incorporate each change |
| **D. Resume** | The letter is unfinished | Complete it |

Modes A and B frequently coincide: a paper rejected from one journal is usually revised before going to
the next.

**If this is a revision after peer review**, not a fresh submission, this is the wrong skill. The
resubmission letter accompanies a point-by-point response to the reviewers, so use
`/create-response-to-reviewers`.

## Mode A: retarget to a different journal

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

## Mode B: reconcile with the paper

Check, in order of severity:

1. **A claim the paper no longer supports.** If it is a substantive claim rather than a number, ask the
   researcher rather than rewriting it.
2. **A value that no longer matches** the results.
3. **The novelty statement built on a finding that is no longer principal.**
4. **The stated article type or length no longer fitting** what the manuscript became, for example a letter
   that grew into a full article.
5. **Author list changes** not reflected in the approval statement or the corresponding author details.

## Mode C: apply suggested updates

Enumerate every comment, classify it as *direct*, *interpretive*, *conflicting* or *out of scope*, apply or
propose, and account for every one including those not applied.

Supervisor comments on cover letters cluster into: "state the novelty more strongly" (usually means make it
concrete, not louder), "explain why this journal" (the fit paragraph), and "too long" (cut the paper
summary, which duplicates the abstract).

## Mode D: resume

Report which required elements are present and which are missing, recover the novelty statement from the
paper's conclusions, and ask only for what the manuscript cannot supply: the editor's name, the journal-fit
reason, and the declarations.

## Produce the revision

Emit the full letter, since it is short enough that showing all of it is clearer than showing a diff, and:

- **Preserve the researcher's wording wherever it still holds.**
- Annotate each change with a bracketed note or a comment saying why, for example
  `[UPDATED: journal-fit paragraph rewritten for Advanced Materials]`.
- `[TODO: ...]` for every declaration, name or reason you could not obtain.
- Keep it to one page.

Show it, then summarize the changes. In mode A, state explicitly that you checked for and removed all
references to the previous journal.

## Offer to write it out

Only after approval.

## Hard rules

- **Never invent a journal's scope, a recent paper in it, or an editor's name.** No network access. Ask, or
  leave a marked placeholder.
- **Never carry over a declaration** without confirming it applies to the new journal.
- **Never fabricate a declaration.** These are legally and professionally consequential.
- **Never invent or strengthen a claim.**
- **Never mention a previous rejection.**
- **Never emit an em dash.**
- **Never leave the previous journal's name anywhere in the letter.**
- If nothing needs changing, say so and change nothing.
