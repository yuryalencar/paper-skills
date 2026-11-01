# /review-response-to-reviewers

> Re-enumerates the comments independently, then verifies that every change your letter claims actually exists
> in the manuscript.

**Status:** alpha · **Version:** 0.1.0 · **Invocation:** `/review-response-to-reviewers` ·
**Auto-loads:** yes
**Companion skills:** [paper-writing-style](paper-writing-style.md),
[create-response-to-reviewers](create-response-to-reviewers.md),
[update-response-to-reviewers](update-response-to-reviewers.md)

## What it does

Five checks before you send the revision back:

| # | Check |
| :--- | :--- |
| 1 | **Coverage**: comments re-enumerated from the original reviews, independently of how the letter numbered them |
| 2 | **Claimed changes actually exist** in the revised manuscript |
| 3 | Classification honesty: does the class match the content? |
| 4 | Tone: will this antagonize the people deciding your paper's fate? |
| 5 | Structure and style |

The highest-value check is not stylistic. It is check 2.

## When to use it

- Before resubmitting, always.
- Your co-author wrote the response and you want it verified.
- The revision came back a second time and you suspect a point was missed.

## When *not* to use it

- **No response letter yet.** Use [create-response-to-reviewers](create-response-to-reviewers.md).
- **You want to write the next round.** Use
  [update-response-to-reviewers](update-response-to-reviewers.md).

## Install

```
/plugin marketplace add yuryalencar/paper-skills
/plugin install review-response-to-reviewers@yuryalencar-paper-skills
/plugin install paper-writing-style@yuryalencar-paper-skills
```

Or `./install.sh review-response-to-reviewers paper-writing-style`.

## Inputs

**Give it all three documents.** Each check needs a different pair, and the most important one needs all three:

| Input | Enables |
| :--- | :--- |
| The original reviewer comments | Check 1, independent re-enumeration |
| The response letter | All checks |
| **The revised manuscript** | Check 2, verifying claimed changes exist |

Without the revised manuscript it says plainly that check 2 could not be run, and that it is the one worth
running before sending.

**Language.** Reviews in the language you open in. Rewrites are English.

## Outputs

The coverage table first, then unverifiable claimed changes prominently, then classification and tone findings
with rewrites, then structure and style. It rewrites only the responses that failed, not the whole letter.

## Example

```
> /review-response-to-reviewers

COVERAGE  (re-enumerated from the reviews: 14 comments, letter numbered 11)

| # | Comment                                  | Answered | Location |
|---|------------------------------------------|----------|----------|
| 1 | control comparison missing               | yes      | yes      |
| 2 | statistics on n=3                        | yes      | NO       |
| 3 | "furthermore, XRD assignment unclear"    | NO       | -        |
| 4 | mechanism not supported                  | partial  | yes      |
...

THREE FINDINGS

1. COMMENT 3 IS UNANSWERED.
   R1 wrote: "The peak at 24 degrees is assigned to the (002) reflection;
   furthermore, the XRD assignment in Figure 2 is unclear."
   Your letter answered the first half. The clause after "furthermore" is a
   separate request and has no response. This alone would send the paper
   back for another round.

2. CLAIMED CHANGE NOT FOUND  (R2 comment 7)
   Your letter says: "We have added a discussion of the shear results in
   Section 3.6."
   There is no Section 3.6 in the revised manuscript, and I could not find
   shear discussion anywhere in Section 3. This is the worst possible thing
   to send: the reviewers have the manuscript and they will look.

3. COMMENT 2 HAS NO LOCATION.
   "We have clarified the statistical treatment." Where? A reviewer will
   not go looking.

CLASSIFICATION

- R1 comment 9 is classed as accepted but the response actually declines
  it, hedged into vagueness: "we consider that the current treatment is
  appropriate given the scope." Reviewers read this as evasion. An honest
  "respectfully declined, because..." is stronger and safer.

TONE

- R2 comment 4: "The reviewer appears to have misread Figure 3, which
  clearly shows..." -> "Figure 3 shows [x]. We have relabelled the panels
  to make this clearer." Never imply the reviewer was careless, even when
  they were.
- Eleven of your fourteen responses open with "We thank the reviewer for
  this insightful comment." Once reads as sincere. Eleven times reads as
  filler.
```

## Why check 2 matters most

A response claiming a change that was not made is the worst outcome available. It distinguishes two cases,
because they differ in severity: **the change is not at the cited location** (a numbering error, common and
fixable) versus **it is not there at all** (far more serious).

It will not soften either finding.

## Side effects

Reads the documents you supply. Writes nothing unless you approve. No network access.

## Design decisions

- **Comments are re-enumerated from the reviews, not read off the letter.** A letter that numbered them
  generously may still have merged two, and the merge is invisible if you trust its numbering. The example
  above found 14 where the letter had 11.
- **Verification of claimed changes is a first-class check**, not a style note. It is the only check whose
  failure is a factual misstatement to reviewers.
- **The two failure cases are distinguished**, since a stale line number and a missing change need different
  responses from you.
- **Findings are never softened.**
- **Tone gets its own pass.** Authors are the last people able to see defensiveness in their own writing, and
  tone problems in a response letter cost papers.
- **Hedged concession is flagged as its own defect.** A response classed accepted that actually declines is
  worse than an honest refusal, because reviewers read it as evasion.
- **Only failing responses are rewritten.** Response letters are long and most responses are usually fine.
- **Honest reassurance when it passes**, stating explicitly that claimed changes were verified, since that is
  the thing worth knowing before you send.

## Sources

Module 8 of *Curso de Escrita Científica* by Prof. Dr. Valtencir Zucolotto, IFSC/USP, transcript in
[`sources/`](../sources/curso_escrita_cientifica_valtencir_zucolotto.md). Style checks via
[paper-writing-style](paper-writing-style.md).

## Changelog

- **0.1.0**: initial version.
