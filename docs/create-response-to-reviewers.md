# /create-response-to-reviewers

> Pairs every reviewer comment with a response and the exact place in the manuscript where the change lives.

**Status:** alpha · **Version:** 0.1.0 · **Invocation:** `/create-response-to-reviewers` ·
**Auto-loads:** yes
**Companion skills:** [paper-writing-style](paper-writing-style.md),
[review-response-to-reviewers](review-response-to-reviewers.md),
[update-response-to-reviewers](update-response-to-reviewers.md),
[create-cover-letter](create-cover-letter.md)

## What it does

A revision goes back with two documents: the revised manuscript with changes marked, and a letter answering
the reviewers. The letter is read by the editor **and by the same reviewers who wrote the comments**, and they
check one thing above all: was every point actually addressed?

The revision cycle commonly runs two or three times, so a response that leaves points unanswered guarantees
another round.

It produces both documents: a short editor cover letter, and the point-by-point response where every comment
gets three things.

| Element | Content |
| :--- | :--- |
| The comment | Quoted verbatim, numbered, attributed to its reviewer |
| The response | The answer to what was actually asked |
| The change | What was altered, and **where**: section, paragraph, page, line |

## When to use it

- Reviewer comments arrived and you are preparing the revision.
- You have made the changes and need them written up.

## When *not* to use it

- **First submission.** Use [create-cover-letter](create-cover-letter.md).
- **A second round of comments on an already-revised manuscript.** Use
  [update-response-to-reviewers](update-response-to-reviewers.md), mode A, which checks consistency against
  your previous response.
- **You have not decided what to do about the comments yet.** It will ask you comment by comment, which is
  useful, but it cannot decide for you.

## Install

```
/plugin marketplace add yuryalencar/paper-skills
/plugin install create-response-to-reviewers@yuryalencar-paper-skills
/plugin install paper-writing-style@yuryalencar-paper-skills
```

Or `./install.sh create-response-to-reviewers paper-writing-style`.

## Inputs

| Input | Effect |
| :--- | :--- |
| The reviewer comments | Required. Pasted or as a file |
| The original manuscript | Read for context |
| The revised manuscript | Read to locate the changes you made |

**Language.** Interviews in the language you open in. The letter is English.

## Outputs

The enumerated comment list for your confirmation first, then the editor cover letter, the point-by-point
response, and a **coverage table**: every comment, its class, and whether a manuscript location is given.

## The step that decides whether the revision succeeds

**Enumeration.** Reviewer prose hides multiple requests inside single paragraphs. A sentence beginning
"Furthermore, the authors should" is a separate comment even mid-paragraph.

It splits generously and shows you the list before writing anything, because a comment answered twice costs
nothing and a comment missed costs a round.

## The five classes

| Class | Handling |
| :--- | :--- |
| **Accepted** | The change was made. Say what and where |
| **Accepted in part** | Say which part, and why not the rest |
| **Respectfully declined** | Not changed, with your reason. Legitimate and sometimes correct |
| **Clarification** | The reviewer misunderstood. Explain, and consider whether the text invited it |
| **Out of scope** | Beyond this paper. Say so, courteously |

Twenty comments all marked accepted is either a very good review or a lack of scientific confidence. Declining
a point with a clear reason is normal and reviewers accept it.

## Example

```
Reviewer 1, Comment 3

  "The authors claim that crosslinking improves durability, but no
   comparison with untreated films is presented."

  Response: We agree, and thank the reviewer for identifying this omission.
  We have added the untreated film measurements as a control.

  Change: New panel added as Figure 4(c), with the comparison described in
  Section 3.4, paragraph 2 (page 11, lines 14 to 22). The abstract has been
  updated to state the 96% versus 71% comparison.
```

Tone: courteous, direct, not obsequious. Thank a reviewer once where a comment genuinely improved the paper,
not on every comment, which reads as filler.

## The rule it will not bend

**It will never claim a change that was not made.** The reviewers have the manuscript and they will check.
If you have not made a change, the response says what is planned or declines the point.

It also will not invent a manuscript location. Page and line numbers come from you or from a document it read,
otherwise `[TODO: location]`. Every row of the coverage table without a location is reported as a defect,
because a reviewer will not go looking.

## Side effects

Reads `.tex` files and the documents you supply. Writes nothing unless you approve. No network access.

## Design decisions

- **Enumeration is a separate confirmed step.** It is the highest-leverage part of the whole process and the
  easiest place to lose a point.
- **Every response carries a location.** The commonest complaint reviewers make about response letters is
  vague or absent locations.
- **Never claims an unmade change.** The most serious failure available to this skill.
- **Declining is presented as normal**, with the class built into the structure, so the letter does not default
  to conceding everything.
- **The reason for declining is always yours.** It is a scientific argument and cannot be supplied.
- **Tone is actively managed.** Response letters are read by people deciding the paper's fate, and authors are
  usually the last to notice defensiveness in their own writing.
- **It reminds you to highlight changes** in the revised manuscript, since the letter states they are
  highlighted and reviewers rely on it.
- **It stops on comments needing work not yet done** rather than writing a response implying otherwise.

## Sources

Module 8 of *Curso de Escrita Científica* by Prof. Dr. Valtencir Zucolotto, IFSC/USP, transcript in
[`sources/`](../sources/curso_escrita_cientifica_valtencir_zucolotto.md), which covers the revision cycle from
the perspective of a working journal editor, including the highlighted revised manuscript and the response
letter format.

## Changelog

- **0.1.0**: initial version.
