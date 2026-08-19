---
name: update-response-to-reviewers
description: Update an existing response letter to reviewers, whether a second round of comments arrived on the revised manuscript, the manuscript changed after the letter was drafted, a co-author commented on the letter, or it was left unfinished. Use when a response letter already exists and needs to change.
allowed-tools: Read, Grep, Glob
metadata:
  tags: [research]
---

# /update-response-to-reviewers

Peer review iterates. The course notes the revision cycle commonly runs two or three times, so a response
letter is rarely written once. The most frequent case is a **second round**: the reviewers read the revision
and came back with fewer, sharper comments, some of them following up on the previous response.

## Before anything else

1. **Load the style rules.** Invoke `paper-writing-style`. If absent, use the condensed rules in
   `create-response-to-reviewers`.
2. **Lock the language.** Language of the user's first message, whole run. The letter is English.
3. **Gather the history.** You need the current manuscript, the previous response letter, the previous
   reviewer comments, and the new comments if this is a second round. The previous letter matters: a second
   round response that contradicts the first is a serious problem.

## Pick the mode

State the mode before starting.

| Mode | Signal | What it does |
| :--- | :--- | :--- |
| **A. New round** | A fresh set of comments on the revised manuscript | Write the new round, checked for consistency against the previous one |
| **B. Reconcile** | The manuscript changed after the letter was drafted | Fix locations and claims that no longer hold |
| **C. Apply suggestions** | A co-author or supervisor commented on the letter | Incorporate each change |
| **D. Resume** | The letter is unfinished, usually mid-comment-list | Complete it |

## Mode A: a new round of comments

Write the new round as `/create-response-to-reviewers` does, with three additions specific to being round two
or later:

1. **Check consistency with the previous response.** If you said last time that a limitation was inherent to
   the method, you cannot now say it has been fixed without explaining what changed. Report any contradiction
   you find between the new draft responses and the previous letter. Reviewers have both letters and they do
   compare.
2. **Identify follow-up comments.** A new comment that revisits a previous one needs its response to
   acknowledge the history: what was done last round, why the reviewer is still not satisfied, and what has
   changed now. Treating a follow-up as a fresh comment reads as not having listened.
3. **Identify resolved comments.** Reviewers usually drop points they are satisfied with. Do not re-answer
   those; say briefly in the cover letter that the remaining points are addressed.

Where a reviewer repeats a comment you declined last round, that is a decision point for the researcher, not
for you: concede, or hold the position with a stronger argument. Present the choice and let them make it.

## Mode B: reconcile with the manuscript

The manuscript moved after the letter was drafted, which happens whenever a co-author edits during revision.
Check:

1. **Claimed changes that are no longer at the cited location**, because sections or paragraphs shifted. Line
   and page numbers are especially fragile.
2. **Claimed changes no longer present at all.** Report prominently: sending a letter claiming a change that
   was later reverted is the worst outcome available here.
3. **New changes not mentioned** in the letter that a reviewer would want to know about.
4. **Values quoted in the letter** that no longer match the manuscript.

Re-verify every location rather than trusting the letter. That is the point of this mode.

## Mode C: apply suggestions

Enumerate every comment from the co-author or supervisor, classify each as *direct*, *interpretive*,
*conflicting* or *out of scope*, apply or propose, and account for every one.

Comments on response letters cluster into: "this sounds defensive" (tone), "we should push back on this one"
(a class change from accepted to declined, and the researcher supplies the argument), and "say where the
change is" (missing locations).

## Mode D: resume

Report which enumerated comments have responses and which do not, since a stalled response letter stops
mid-list. Recover locations from the manuscript where you can. Ask only for what the manuscript cannot supply:
what was decided for each unanswered comment, and the reasons for any declines.

## Produce the revision

- **Preserve the researcher's wording wherever it still holds**, including their scientific arguments in
  declined responses. Those are theirs.
- Emit the full letter for a new round, or only the changed responses for modes B and C, saying clearly which
  you are showing.
- Annotate changes: `[UPDATED: location now Sec. 3.4 ¶2, page 11]`,
  `[FLAG: this contradicts the round 1 response, see note]`.
- `[TODO: ...]` for anything unverifiable.
- **Finish with a coverage table** for the round being sent: every comment, its class, and whether a location
  is given. A row without a location is a defect.

## Offer to write it out

Only after approval.

## Hard rules

- **Never claim a change that is not in the manuscript.** Verify every location; report every one you cannot.
- **Never contradict a previous response without flagging it.** Reviewers have both letters.
- **Never invent a manuscript location, a reason for declining, or new data.**
- **Never leave a comment unanswered.** Mark it for the researcher instead.
- **Never write the researcher's scientific argument** for holding a declined position.
- **Never emit an em dash.**
- Do not argue with the reviewer's competence, especially in a second round where patience is thinner on both
  sides.
