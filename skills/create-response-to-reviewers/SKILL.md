---
name: create-response-to-reviewers
description: Write a point-by-point response letter to reviewer comments for a revised manuscript, pairing every comment with a reply and the change made, plus the accompanying cover letter to the editor. Use when asked to respond to reviewers, write a response letter, address referee comments, or prepare a revision after peer review.
allowed-tools: Read, Grep, Glob
metadata:
  tags: [research]
---

# /create-response-to-reviewers

A revision goes back with two documents: the revised manuscript with changes marked, and a letter answering
the reviewers. The letter is read by the editor and by the same reviewers who wrote the comments, and it is
what decides whether the revision is accepted. Reviewers look for one thing: was every point they raised
actually addressed?

The process can iterate two or three times, so a response that leaves points unanswered guarantees another
round.

## Before anything else

1. **Load the style rules.** Invoke `paper-writing-style`. If absent, use the condensed rules at the bottom.
2. **Lock the language.** Language of the user's first message, whole run. **The letter is always English.**
3. **Read the manuscript**, and the revised version if it exists. You need to know what was actually changed,
   and where.

## The structure

Two documents, usually combined into one file:

**1. The cover letter to the editor**, short:

```
Dear Professor <Editor>,

Please find enclosed the revised version of our manuscript entitled "<title>"
(<manuscript number>), together with our point-by-point response to the reviewers'
comments.

All reviewers' comments have been taken on board. The manuscript has been modified
accordingly, and the new information appears highlighted in the corrected version.

Yours sincerely,
<Corresponding author>
```

**2. The point-by-point response.** For every comment, three things in this order:

| Element | Content |
| :--- | :--- |
| The comment | Quoted verbatim, numbered, attributed to its reviewer |
| The response | The answer, addressing what was actually asked |
| The change | What was altered in the manuscript, and **where**, by section, paragraph, page or line |

Quoting the comment verbatim is not padding. The reviewer needs to find their own point without going back
to their review.

## Workflow

### 1. Enumerate every comment

Split the reviews into individually numbered comments, per reviewer. **This is the step that determines
whether the revision succeeds.** Reviewer prose hides multiple requests in single paragraphs: a sentence
beginning "Furthermore, the authors should" is a separate comment even if it sits mid-paragraph. Split
generously; a comment answered twice costs nothing, a comment missed costs a round.

Present the enumerated list back to the researcher for confirmation before writing responses.

### 2. Classify each comment

| Class | Handling |
| :--- | :--- |
| **Accepted** | The change was or will be made. Say what and where |
| **Accepted in part** | Some of it was done. Say which part and why not the rest |
| **Respectfully declined** | Not changed, with a reason. Legitimate, and sometimes correct |
| **Clarification** | The reviewer misunderstood. Explain, and consider whether the text invited the misunderstanding |
| **Out of scope** | Beyond this paper. Say so, courteously |

A response consisting entirely of "accepted" for twenty comments is either a very good review or a lack of
scientific confidence. Declining a point with a clear reason is normal and reviewers accept it.

### 3. Interview

For each comment, you need from the researcher:

- **What they did about it**, or decided not to do.
- **Where in the manuscript** the change lives. Section, paragraph, page or line. Vague locations are the
  commonest complaint reviewers make about response letters.
- **For declined points, the reason.** This is the researcher's scientific argument and you cannot supply it.
- **For new data**, the actual values.

Ask in batches of at most four. If a comment requires new experiments or analysis that has not been done,
say so and stop on that comment rather than writing a response implying it was addressed.

### 4. Draft

```
Reviewer 1, Comment 3

  "The authors claim that crosslinking improves durability, but no
   comparison with untreated films is presented."

  Response: We agree, and thank the reviewer for identifying this omission.
  We have added the untreated film measurements as a control.

  Change: New panel added as Figure 4(c), with the comparison described in
  Section 3.4, paragraph 2 (page 11, lines 14 to 22). The abstract has been
  updated to state the 96\% versus 71\% comparison.
```

Tone throughout: courteous, direct, not obsequious. Thank the reviewer once where a comment genuinely
improved the paper, and do not thank them for every comment; it reads as filler. Never argue emotionally,
and never imply the reviewer was careless. Where they misread something, the useful reply explains and then
notes that the text has been clarified to prevent the misreading.

### 5. Verify coverage

Before delivering, check every enumerated comment has a response and a change or a stated reason. Present
this as a coverage table: comment number, class, and whether a manuscript location is given. **Any row
without a location is a defect**, because the reviewer will not go looking.

### 6. Remind about highlighting

The revised manuscript must have the changes marked, and the letter says so. If the researcher has not
highlighted them, say that this is expected and that reviewers rely on it to check the revision quickly.

### 7. Offer to write it out

Only after approval.

## Hard rules

- **Never claim a change was made that was not made.** This is the most serious failure available to this
  skill. The reviewers have the manuscript and will check. If the researcher has not made a change, the
  response says what is planned or declines the point.
- **Never invent a manuscript location.** Line and page numbers must come from the researcher or from a
  document you read. Otherwise `[TODO: location]`.
- **Never invent a reason for declining a point.** That is the researcher's scientific argument.
- **Never invent data or values** offered as new evidence.
- **Never leave a comment unanswered.** If it cannot be answered yet, mark it clearly for the researcher
  rather than omitting it.
- **Never emit an em dash (`---`).**
- Do not argue with the reviewer's competence, even when they are wrong.

## Condensed style rules, if `paper-writing-style` is not installed

Clarity and concision govern. One idea per sentence. Be specific, especially about locations. Put the action
in the verb. Cut redundancy. Avoid `delve`, `harness`, `leverage`, `underscore`, `pave the way`, and
repeated effusive thanks. Formal, courteous register. Escape `\%` if writing LaTeX.
