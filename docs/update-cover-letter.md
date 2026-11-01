# /update-cover-letter

> Retargets a letter to a different journal after rejection, reconciles it with a changed paper, applies
> feedback, or finishes a draft.

**Status:** alpha · **Version:** 0.1.0 · **Invocation:** `/update-cover-letter` ·
**Auto-loads:** yes
**Companion skills:** [paper-writing-style](paper-writing-style.md),
[create-cover-letter](create-cover-letter.md), [review-cover-letter](review-cover-letter.md)

## What it does

Four modes. The first is by far the most common:

| Mode | When |
| :--- | :--- |
| **A. Retarget** | Submitting to a different journal after rejection |
| **B. Reconcile** | The paper changed since the letter was written |
| **C. Apply suggestions** | A co-author or supervisor commented, or `/review-cover-letter` output |
| **D. Resume** | The letter is unfinished |

Modes A and B frequently coincide, since a paper rejected from one journal is usually revised before going to
the next.

## When to use it

- Your paper was rejected and you are sending it elsewhere.
- Results changed after you drafted the letter.
- Your supervisor commented on it.

## When *not* to use it

- **This is a revision after peer review**, not a fresh submission to a new journal. That letter accompanies a
  point-by-point response, so use [create-response-to-reviewers](create-response-to-reviewers.md). The skill
  checks for this and redirects you.
- **No letter exists.** Use [create-cover-letter](create-cover-letter.md).

## Install

```
/plugin marketplace add yuryalencar/paper-skills
/plugin install update-cover-letter@yuryalencar-paper-skills
/plugin install paper-writing-style@yuryalencar-paper-skills
```

Or `./install.sh update-cover-letter paper-writing-style`.

## Inputs

| Input | Selects mode |
| :--- | :--- |
| A new journal name | A, retarget |
| Nothing, with a changed manuscript | B, reconcile |
| Comments on the letter | C, apply |
| An unfinished letter | D, resume |

**Language.** Follows the language you open in. The letter is English.

## Outputs

The detected mode, the findings, then the full letter, since it is short enough that showing all of it beats a
diff. Changes annotated with bracketed notes. `[TODO: ...]` for anything it could not obtain.

## Retargeting is three changes, not one

The mistake this mode exists to prevent is swapping the journal name and sending it.

**1. The journal-fit paragraph is rewritten entirely.** Whatever argued for the old venue does not argue for
the new one. If you have no answer beyond impact factor, it will say plainly that the paragraph will be weak,
and that **an editor reads a generic letter as a sign the paper is being shopped around**.

**2. The novelty framing may need to move.** A more specialist journal needs less field justification and more
technical specificity; a broader one needs the importance of the whole field established. It says which
direction it moved and why.

**3. Declarations and article type are rechecked** against the new journal's requirements, which differ. They
are not carried over blindly.

Then it does the thing that matters most:

> **It strips every trace of the previous journal** and reports that it checked. The name, the article-type
> vocabulary, the editor's name, and any argument shaped around that venue. A letter mentioning the wrong
> journal is the most embarrassing possible submission error and it happens constantly.

It also **never mentions the previous rejection.** There is no obligation to disclose it and nothing to gain.

## Example, mode A

```
> /update-cover-letter  targeting Advanced Materials now

Mode A: retargeting from ACS Nano to Advanced Materials.

REWRITTEN
- Journal-fit paragraph, entirely. The old one argued from ACS Nano's
  nanomaterials focus, which says nothing about Advanced Materials.
- Novelty framing widened slightly: Advanced Materials has a broader
  readership than ACS Nano, so the letter now establishes why durable
  layer-by-layer coatings matter to materials science generally before
  narrowing to the crosslinking result.

CHECKED AND REMOVED
- "ACS Nano" in paragraphs 1 and 3
- "Dear Professor Weiss" -> [TODO: current Advanced Materials editor name]
- "as a Letter" -> Advanced Materials calls this article type a
  Communication. Confirm which you are submitting.

STILL NEEDED
- [TODO: why Advanced Materials?] I have written a placeholder from its
  general scope, but it will read as generic. Does your work build on or
  answer anything they have published recently?
- [TODO: does Advanced Materials require a data availability statement?]
  ACS Nano did and your old letter has one. I have kept it, but confirm
  the wording they want.

Previous rejection: not mentioned anywhere, as it should not be.
```

## Side effects

Reads `.tex` files. Writes nothing unless you approve. **No network access**, so it cannot look up the new
journal's requirements, scope, recent papers or editor. Everything it does not know becomes an explicit
placeholder.

## Design decisions

- **Retargeting is treated as a rewrite, not a find-and-replace.** The commonest real-world use of this skill
  is also the one most likely to be done carelessly.
- **Removal of the previous journal is explicitly verified and reported.** Silent success is not enough for an
  error this embarrassing.
- **Previous rejections are never mentioned.**
- **Declarations are never carried over without confirmation**, since they differ by journal and a wrong one
  is worse than a missing one.
- **Redirects to the response-letter skill** when it detects a post-review revision, rather than producing the
  wrong document type.
- **Full letter shown every round**, since it is one page and a diff of a one-page document is harder to read
  than the document.

## Sources

Module 8 of *Curso de Escrita Científica* by Prof. Dr. Valtencir Zucolotto, IFSC/USP, transcript in
[`sources/`](../sources/curso_escrita_cientifica_valtencir_zucolotto.md).

## Changelog

- **0.1.0**: initial version, with the four-mode design from the start.
