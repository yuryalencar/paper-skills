# /review-cover-letter

> Seven checks on the first document the editor reads, led by the two that decide whether it works at all.

**Status:** alpha · **Version:** 0.1.0 · **Invocation:** `/review-cover-letter` ·
**Auto-loads:** yes
**Companion skills:** [paper-writing-style](paper-writing-style.md),
[create-cover-letter](create-cover-letter.md), [update-cover-letter](update-cover-letter.md)

## What it does

Most cover letters fail in one of two ways: they state no concrete novelty, or they give no real reason for
choosing this journal. Both are fatal to the letter's purpose and both are quick to fix, so both come first.

| # | Check |
| :--- | :--- |
| 1 | Is the novelty concrete, or a topic restated, or merely asserted? |
| 2 | Is there a real reason for this journal, or a line that would fit any journal? |
| 3 | **Overclaiming** relative to what the paper shows |
| 4 | Required elements, including the declarations the journal mandates |
| 5 | Length: one page |
| 6 | Does it summarize the paper instead of arguing for it? |
| 7 | Style and register |

## When to use it

- Before submitting.
- Your letter is a reused template and you want to know how visible that is.

## When *not* to use it

- **No letter yet.** Use [create-cover-letter](create-cover-letter.md).
- **This is a revision after review.** Use
  [review-response-to-reviewers](review-response-to-reviewers.md).

## Install

```
/plugin marketplace add yuryalencar/paper-skills
/plugin install review-cover-letter@yuryalencar-paper-skills
/plugin install paper-writing-style@yuryalencar-paper-skills
```

Or `./install.sh review-cover-letter paper-writing-style`.

## Inputs

The letter, pasted or as a path. **Give it the paper too**: the overclaiming check is impossible without it,
and it is the check with the most at stake. It reports which checks it could not run rather than guessing.

**Language.** Reviews in the language you open in. Rewrites are English.

## Outputs

Failing checks in severity order, each with the text quoted and a concrete replacement, then one rewritten
letter with `[TODO: ...]` where you must supply a declaration, a name, or the journal-fit reason.

## Example

```
> /review-cover-letter

FAILING CHECKS

2. NO REAL REASON FOR THIS JOURNAL  (most serious)
   You wrote: "We believe this manuscript is well suited to your esteemed
   journal, which has a wide readership and high impact factor."
   That sentence would fit any journal in existence, which is exactly what
   an editor reads it as. Does your work build on or answer anything
   Advanced Materials has published recently? That is the strongest thing
   this paragraph can contain.

1. NOVELTY IS A TOPIC, NOT A FINDING
   You wrote: "In this manuscript we investigate the cycling behaviour of
   crosslinked graphene electrodes."
   That is what the paper is about, not what it found. Your conclusions
   say crosslinking is the determining factor in durability, at 96% versus
   71% retention. Say that.

4. MISSING REQUIRED ELEMENTS
   - No data availability statement. Advanced Materials requires one.
     A missing mandatory declaration causes an administrative rejection
     that has nothing to do with your science.
   - No confirmation that all authors approved the submission.

5. LENGTH  1.6 pages. Paragraphs 3 and 4 walk through the methods and
   results section by section. The abstract is attached; cut both.

7. STYLE
   "We are very excited to present our groundbreaking findings" ->
   "We report" and then the finding. Excitement is not evidence.
```

## The check with the most at stake

**Overclaiming.** An editor who finds the letter overselling relative to the manuscript starts reading
sceptically, and the cover letter is where the temptation is greatest because nobody peer-reviews it. It
checks whether a conditional result became unconditional, whether values match the paper, and whether the
letter claims generality the paper does not establish.

## Side effects

Reads `.tex` files. Writes nothing unless you approve. **No network access**, so it cannot verify a journal's
scope or its recent papers; where the letter makes a claim about the journal, it can only ask.

## Design decisions

- **Novelty and journal fit lead the report**, because they are what makes a letter work or fail. Missing
  declarations are more likely to get the paper rejected administratively, but they are boilerplate to fix,
  so they come third.
- **Generic journal-fit language is quoted back.** Seeing "your esteemed journal" in isolation is more
  persuasive than being told the paragraph is weak.
- **Missing declarations flagged prominently despite being boilerplate**, since an administrative rejection
  wastes a submission cycle for a reason unrelated to the work.
- **Journal facts are never invented**, only asked about.
- **Declarations are never fabricated**, only placeheld.
- **Brief output for a sound letter.** Cover letters are short.

## Sources

Module 8 of *Curso de Escrita Científica* by Prof. Dr. Valtencir Zucolotto, IFSC/USP, transcript in
[`sources/`](../sources/curso_escrita_cientifica_valtencir_zucolotto.md). Style checks via
[paper-writing-style](paper-writing-style.md).

## Changelog

- **0.1.0**: initial version.
