# /update-response-to-reviewers

> Writes the second round, checked for consistency against what you said the first time.

**Status:** alpha · **Version:** 0.1.0 · **Invocation:** `/update-response-to-reviewers` ·
**Auto-loads:** yes · **Tags:** `research`
**Companion skills:** [paper-writing-style](paper-writing-style.md),
[create-response-to-reviewers](create-response-to-reviewers.md),
[review-response-to-reviewers](review-response-to-reviewers.md)

## What it does

Peer review iterates. The revision cycle commonly runs two or three times, so a response letter is rarely
written once.

| Mode | When |
| :--- | :--- |
| **A. New round** | A fresh set of comments on the revised manuscript |
| **B. Reconcile** | The manuscript changed after the letter was drafted |
| **C. Apply suggestions** | A co-author or supervisor commented on the letter |
| **D. Resume** | The letter stops mid-comment-list |

## When to use it

- Round two arrived: fewer comments, sharper, some following up on your previous answers.
- A co-author edited the manuscript after you drafted the letter, so your line numbers may be wrong.
- Your supervisor said a response sounds defensive, or that you should push back on one.

## When *not* to use it

- **First round of comments.** Use
  [create-response-to-reviewers](create-response-to-reviewers.md).
- **You want the letter checked, not changed.** Use
  [review-response-to-reviewers](review-response-to-reviewers.md).

## Install

```
/plugin marketplace add yuryalencar/ai-skills
/plugin install update-response-to-reviewers@yuryalencar-ai-skills
/plugin install paper-writing-style@yuryalencar-ai-skills
```

Or `./install.sh update-response-to-reviewers paper-writing-style`.

## Inputs

It needs the **history**, not just the current documents:

| Input | Why |
| :--- | :--- |
| The new reviewer comments | Mode A |
| **The previous response letter** | To catch contradictions. Reviewers have both letters |
| The previous reviewer comments | To identify follow-ups and resolved points |
| The current manuscript | To verify locations |

**Language.** Follows the language you open in. The letter is English.

## Outputs

The detected mode, the findings, the letter (full for a new round, changed responses only for B and C), and a
coverage table for the round being sent.

## What mode A does that a fresh letter cannot

Three things specific to being round two or later:

**1. Consistency against your previous response.** If you said last time that a limitation was inherent to the
method, you cannot now say it has been fixed without explaining what changed. Contradictions are reported.
Reviewers have both letters and they do compare.

**2. Follow-up comments identified.** A new comment revisiting a previous one needs its response to acknowledge
the history: what was done last round, why the reviewer is still not satisfied, what has changed now. Treating
a follow-up as a fresh comment reads as not having listened.

**3. Resolved comments left alone.** Reviewers usually drop points they are satisfied with. Re-answering them
pads the letter.

Where a reviewer **repeats a comment you declined**, that is a decision point for you, not for the skill:
concede, or hold the position with a stronger argument. It presents the choice and lets you make it.

## Example, mode A

```
> /update-response-to-reviewers  (round 2 comments pasted)

Mode A: new round. 5 new comments, down from 14. Checked against your
round 1 letter.

FOLLOW-UPS  (2 of the 5)

- R1 comment 2 revisits round 1 comment 9, which you respectfully declined
  on scope grounds. They are not satisfied. Your response needs to open by
  acknowledging that, not by restating the original argument as though it
  were new.
- R2 comment 1 follows up on the control comparison you added. They accept
  the addition and now ask about the n=3 statistics, which is a narrower
  question.

CONTRADICTION FOUND

  Round 1, your response to R2 comment 7:
    "The delamination behaviour is inherent to the layer-by-layer
     architecture and cannot be eliminated without compromising film
     thickness control."

  Your draft round 2 response to R1 comment 4:
    "We have eliminated the delamination by adjusting the crosslinking
     density."

  These cannot both be true as written. If the new work genuinely solved
  what you called inherent, the response must say what changed and why the
  earlier statement no longer applies. Reviewers have both letters.

DECISION FOR YOU

  R1 comment 2 is the repeat of a declined point. Concede and do the
  analysis, or hold the position with a stronger argument than last time?
  Restating the same reason will not work twice.
```

## Side effects

Reads the documents you supply and the manuscript. Writes nothing unless you approve. No network access.

## Design decisions

- **The previous letter is a required input, not optional.** Contradicting yourself across rounds is the
  distinctive failure of a second-round response and it is invisible without the history.
- **Follow-ups are distinguished from fresh comments**, because the required response shape differs.
- **A repeated declined point is surfaced as a decision, not resolved.** Conceding or holding is a scientific
  and strategic judgement, and restating the same reason twice is specifically called out as ineffective.
- **Locations are re-verified in mode B rather than trusted.** That is the entire point of the mode: a
  co-author's edits shift line and page numbers silently.
- **Your scientific arguments in declined responses are preserved verbatim.** They are yours.
- **A coverage table closes every run**, matching the create skill, since the failure mode is always an
  unanswered point.
- **Tone caution is heightened for round two**, where patience is thinner on both sides.

## Sources

Module 8 of *Curso de Escrita Científica* by Prof. Dr. Valtencir Zucolotto, IFSC/USP, transcript in
[`sources/`](../sources/curso_escrita_cientifica_valtencir_zucolotto.md), which notes the revision cycle can
run two or three times.

## Changelog

- **0.1.0**: initial version, with the four-mode design from the start.
