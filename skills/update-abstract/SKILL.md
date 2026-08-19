---
name: update-abstract
description: Update an existing abstract against the current state of the manuscript, reading the paper as it stands now, detecting where the abstract has drifted from the results, purpose or conclusions it claims, and proposing a revised LaTeX abstract. Use when the paper has changed since the abstract was written, after adding or revising results, or when asked whether the abstract still matches the paper.
allowed-tools: Read, Grep, Glob
metadata:
  tags: [research]
---

# /update-abstract

The abstract is downstream of the paper. When results are added, dropped, or revised, the
abstract silently stops being true. This skill reads the manuscript as it stands now and
reconciles the abstract with it.

This is not `/create-abstract` on an existing text. The starting assumption is that the
current abstract was correct once, so the question is **what changed and what must follow**,
preserving the researcher's wording wherever it still holds.

## Before anything else

1. **Load the style rules.** Invoke `paper-writing-style`. If it is not installed, work from
   the condensed rules in `create-abstract`.
2. **Lock the language.** Use the language of the user's first message throughout. Output
   LaTeX is always English.
3. **Find the manuscript.** You need both the current abstract and the current body. Read the
   `.tex` files, detect the citation style, and read the `.bib` keys. If there is no
   manuscript to compare against, stop and say so: without the paper this skill has nothing
   to work from, and `/review-abstract` is the right tool instead.

## Step 1: build both pictures

From the **current abstract**, extract what it claims, part by part: the field, the gap, the
purpose, the methods, each numerical result, and the conclusion.

From the **current manuscript**, extract the same six things as the paper now supports:

- Purpose, from the last paragraph of the introduction.
- Methods actually described in the methods or experimental section.
- Every principal result, with its values, from the results and discussion.
- The conclusion the conclusions section now draws.
- The gap the introduction now develops.

Read the figures and tables too, including captions. A result that exists only as a figure
is still a result the abstract may need.

## Step 2: diff them

Report divergences in this order, because that is the order of severity:

1. **Contradicted numbers.** The abstract states a value the paper no longer supports. This
   is the most serious case and the reason this skill exists. Quote both values with their
   locations.
2. **Unsupported claims.** The abstract asserts something the paper does not show, usually
   left over from a version where it did.
3. **Missing principal results.** The paper now has a finding important enough for the
   abstract that the abstract does not mention. Say why you judge it principal.
4. **Drifted purpose.** The introduction's final paragraph now states a different objective
   than the abstract does. Papers drift this way during revision, and reviewers notice.
5. **Drifted conclusions.** The conclusions section now claims more, less, or something other
   than the abstract's closing sentences.
6. **Stale gap.** The introduction's gap has been rewritten and the abstract still frames the
   old one, so the purpose no longer answers the gap the abstract states.
7. **Obsolete detail.** Methods or materials named in the abstract that the paper no longer
   uses.

Present this as a table: what the abstract says, what the paper says, where in the paper, and
how serious it is. Where the two agree, say so briefly rather than listing every match.

## Step 3: decide with the researcher, not for them

A divergence has two possible resolutions and only the researcher knows which: the abstract
is stale and should follow the paper, or the paper changed by mistake and the abstract was
right. **Never assume the paper wins.** For every divergence beyond a plain stale number, ask
which direction to reconcile.

Where the answer is obvious, for example a value the results section clearly revised, state
your assumption and let them correct it rather than making it a question. Reserve explicit
questions for the ones that genuinely change the outcome.

## Step 4: propose the revision

Emit the updated abstract as a LaTeX fragment with structure labels, and:

- **Preserve the researcher's wording wherever it still holds.** This is a revision, not a
  rewrite. Do not restyle sentences that were already fine; unnecessary churn makes it hard
  to see what actually changed and erodes trust in the update.
- Mark each changed block with a comment saying why, for example
  `% UPDATED: viability value now 62\% per Table~2`.
- Keep the word count within the same limit the abstract already respected. If the update
  cannot fit, say which existing sentence must give way and let the researcher choose.
- Where a value is still unknown, emit `% TODO:` naming it. Never carry forward a number you
  could not verify in the paper.

Show the fragment in chat, then summarize the changes in a few lines.

## Step 5: check whether the structure still holds

While you are here, verify the six-part model survived the revision: purpose, results and
conclusions still present, gap still answered by the purpose. If the update has broken the
structure, say so. Do not run a full style review; that is `/review-abstract`, and you should
suggest it rather than duplicating it.

## Step 6: offer to write it out

Only after the researcher approves, offer to patch the manuscript or write the fragment to a
file. Never edit their files before that.

## Hard rules

- **Never invent or estimate a number.** Every value in the updated abstract must be
  traceable to a specific place in the manuscript, or be a `% TODO:`.
- **Never emit an em dash.** `--` only in numeric ranges.
- **Never silently drop** something the researcher wrote. If a sentence has to go, say which
  and why.
- If the abstract and the paper already agree, say so and change nothing. A clean result is a
  valid outcome and should not be padded with cosmetic edits.
