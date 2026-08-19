---
name: update-abstract
description: Move an existing abstract forward, in any of three situations: the paper changed underneath it and the abstract has drifted, there are suggested changes to incorporate from reviewers or a co-author, or it was left half-written and needs resuming. Produces a revised LaTeX abstract that preserves the researcher's wording wherever it still holds. Use when an abstract already exists and needs to change rather than be written from scratch.
allowed-tools: Read, Grep, Glob
metadata:
  tags: [research]
---

# /update-abstract

An abstract already exists and needs to change. This skill evolves it, in contrast to
`/create-abstract`, which starts from nothing, and `/review-abstract`, which diagnoses without
rewriting.

The starting assumption is always that the current text was correct once. So this is a
**revision, not a rewrite**: sentences that still hold are left exactly as the researcher
wrote them.

## Before anything else

1. **Load the style rules.** Invoke `paper-writing-style`. If it is not installed, work from
   the condensed rules in `create-abstract`.
2. **Lock the language.** Use the language of the user's first message throughout the run and
   do not switch. Output LaTeX is always English.
3. **Read the context.** Find the abstract, the manuscript body, the `.bib` keys and the
   citation style in the working directory. Read figures, tables and captions too: a result
   that exists only as a figure is still a result the abstract may need.

## Pick the mode

Determine which of three situations this is. Say which one you are in before you start, so the
researcher can correct you.

| Mode | Signal | What it does |
| :--- | :--- | :--- |
| **A. Reconcile** | The paper changed. No explicit feedback given | Diff the abstract against the manuscript and fix the drift |
| **B. Apply suggestions** | Reviewer comments, co-author notes, or `/review-abstract` output was supplied | Incorporate each suggested change, deliberately |
| **C. Resume** | The abstract is incomplete or clearly unfinished | Continue from where it stopped |

More than one can apply at once, most often B and A together after a revision round. Run them
in the order B, then C, then A, so that a reconciliation pass runs last over the finished text.

If none applies because there is no abstract yet, stop and point at `/create-abstract`. If
there is an abstract but no manuscript and no feedback, there is nothing to update against;
suggest `/review-abstract` instead.

## Mode A: reconcile with the paper

Build two pictures and diff them.

From the **current abstract**, extract what it claims part by part: field, gap, purpose,
methods, each numerical result, conclusion.

From the **current manuscript**, extract the same six as the paper now supports: purpose from
the last paragraph of the introduction, methods from the methods section, every principal
result with its values, the conclusion the conclusions section now draws, and the gap the
introduction now develops.

Report divergences in this order, which is the order of severity:

1. **Contradicted numbers.** The abstract states a value the paper no longer supports. Quote
   both, with locations.
2. **Unsupported claims.** The abstract asserts something the paper does not show.
3. **Missing principal results.** A finding important enough for the abstract that the abstract
   omits. Say why you judge it principal.
4. **Drifted purpose.** The introduction's final paragraph now states a different objective.
5. **Drifted conclusions.** The conclusions section now claims more, less, or something else.
6. **Stale gap.** The introduction's gap was rewritten, so the purpose no longer answers the
   gap the abstract states.
7. **Obsolete detail.** Methods or materials named in the abstract that the paper no longer uses.

Present it as a table: what the abstract says, what the paper says, where in the paper, and
severity. Where the two agree, say so briefly rather than listing every match.

**Never assume the paper wins.** A divergence has two resolutions and only the researcher knows
which: the abstract is stale and should follow the paper, or the paper changed by mistake and
the abstract was right. Where the answer is obvious, such as a value the results section clearly
revised, state your assumption and let them correct it. Reserve explicit questions for the ones
that change the outcome.

## Mode B: apply suggested updates

The suggestions may arrive as reviewer comments, a co-author's notes, tracked changes, an email,
or the output of `/review-abstract`.

1. **Enumerate them.** List each suggestion as a separate item, numbered. If they arrived as
   prose, split them; a single reviewer paragraph often contains three distinct requests.
2. **Classify each one.** Say which of these it is:
   - *Direct*: a specific change to make. Apply it.
   - *Interpretive*: a criticism without a prescribed fix, for example "the contribution is
     unclear". Propose the fix and flag that you interpreted it.
   - *Conflicting*: contradicts another suggestion, or contradicts what the paper shows. Do not
     silently pick a side; surface the conflict and ask.
   - *Out of scope*: concerns the science or another section, not the abstract's wording. Say so
     and leave it.
3. **Apply the direct ones**, propose the interpretive ones, resolve the conflicts with the
   researcher.
4. **Account for every item.** Report what happened to each one, including any you did not
   apply and why. A suggestion silently dropped is the main failure mode here, and with
   reviewers it has consequences.

Where a suggestion would break the six-part structure or contradict the house style, apply it
anyway if it is a reviewer's request, and note the tension. The reviewer outranks the style
guide.

## Mode C: resume after a pause

The abstract is unfinished. Work out what state it is in before adding anything.

1. **Categorize what exists.** Label each existing sentence with the part it implements, as
   `/review-abstract` does. This shows exactly where the draft stopped.
2. **Identify what is missing**, distinguishing the mandatory parts (purpose, results,
   conclusions) from the recommended ones (context, gap).
3. **Recover the thread.** Read the manuscript to work out what the missing parts should say,
   rather than asking the researcher to repeat information the paper already contains.
4. **Ask only for what is genuinely absent**, in batches of at most four questions.
5. **Match the existing voice.** The finished parts set the register, the tense pattern and the
   level of detail. A resumed abstract that changes voice halfway is obvious to a reader.

Do not restyle the parts that were already written. If they have defects, mention it and
suggest `/review-abstract` afterwards, rather than mixing a resume with a critique.

## Produce the revision

Emit the updated abstract as a LaTeX fragment with structure labels, and:

- **Preserve the researcher's wording wherever it still holds.** Unnecessary churn hides what
  actually changed and erodes trust in the update.
- Mark each changed block with a comment saying why:
  `% UPDATED: viability value now 62\% per Table~2`,
  `% UPDATED: reviewer 2 asked for the sample size here`,
  `% ADDED: conclusions part was missing from the draft`.
- Keep within the word limit the abstract already respected. If the update cannot fit, say
  which existing sentence must give way and let the researcher choose.
- Where a value is still unknown, emit `% TODO:` naming it.

Show the fragment in chat, then summarize what changed in a few lines.

Finally, verify the six-part model survived: purpose, results and conclusions present, gap
answered by the purpose. If the update broke the structure, say so. Do not run a full style
review; that is `/review-abstract`, and you should suggest it rather than duplicating it.

## Offer to write it out

Only after the researcher approves, offer to patch the manuscript or write the fragment to a
file. Never edit their files before that.

## Hard rules

- **Never invent or estimate a number.** Every value must be traceable to a specific place in
  the manuscript, or be a `% TODO:`.
- **Never emit an em dash.** `--` only in numeric ranges.
- **Never silently drop** something the researcher wrote, or a suggestion someone made. If it
  goes, say which and why.
- If the abstract and the paper already agree and there is nothing to apply, say so and change
  nothing. A clean result is a valid outcome and should not be padded with cosmetic edits.
