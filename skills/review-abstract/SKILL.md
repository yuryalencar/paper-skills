---
name: review-abstract
description: Review an existing scientific abstract from a writing perspective using the categorization exercise from Zucolotto's course, labelling every sentence with the part of the six-part model it implements, then reporting missing parts, a weak gap, vague results, and style defects with concrete rewrites. Use when asked to review, critique, check, improve, or give feedback on an abstract.
allowed-tools: Read, Grep, Glob
metadata:
  tags: [research]
---

# /review-abstract

Diagnose an abstract and hand back specific, actionable rewrites. This is a reviewer's pass
over the writing, not over the science: you are not judging whether the results are good,
only whether the text delivers them.

## Before anything else

1. **Load the style rules.** Invoke `paper-writing-style` and read
   `references/human-voice.md`. If it is not installed, work from the condensed rules in
   `create-abstract`.
2. **Lock the language.** Use the language of the user's first message for the whole run and
   do not switch. Any rewritten text you produce is in English.
3. **Get the abstract.** Read it from the path given, from the manuscript in the working
   directory, or from what the user pasted. If there is a full manuscript available, read it
   too: it is the only way to tell whether the abstract's claims match the paper.

## Step 1: categorization

This is the exercise the course builds the whole method on. Go sentence by sentence and
label each with the part it implements:

| Label | Part |
| :--- | :--- |
| `CONTEXT` | Broad field and its importance |
| `GAP` | What is unresolved. Usually opens with `however` |
| `PURPOSE` | What this paper reports |
| `METHODS` | How it was done |
| `RESULTS` | The principal findings |
| `CONCLUSIONS` | How the results advance the field |
| `NONE` | Implements nothing. This is a finding in itself |

One sentence may carry two parts; label both. Present the categorization as a table with
each sentence and its label, so the researcher sees the structure of their own text.

## Step 2: structural verdict

Report, in this order:

1. **Missing mandatory parts.** Purpose, results and conclusions are mandatory. A missing
   one is the most serious defect available and goes first.
2. **Missing recommended parts.** Context and gap. Judge against the target journal: a
   specialist venue may legitimately drop them, a broad one may not. Ask which journal if it
   is not obvious and it changes the verdict.
3. **Order.** The parts should run context, gap, purpose, methods, results, conclusions.
   Note any part that appears out of sequence and whether it actually hurts.
4. **Unlabelled sentences.** Anything labelled `NONE` is a candidate for deletion. Say what,
   if anything, would be lost.
5. **Proportion.** Flag an abstract that spends half its words on context and two sentences
   on results, which is the most common imbalance.

Do not report a review article or short communication as defective for missing parts. Those
legitimately follow a different structure; check what kind of document this is first.

## Step 3: the gap and the results

These two carry the abstract, so give each its own judgement.

**The gap.** Is it specific enough that the purpose answers it? A gap phrased as "more
research is needed" is not a gap. Look for what is unexplained, contested, unmeasured, or
too costly in the current state of the art, and check that the purpose lands on exactly that.
A purpose that does not answer the stated gap is a structural fault, not a wording one.

**The results.** Are there real numbers? An abstract that says performance "was improved" or
that a material "showed good stability" without values wastes its most important sentences.
Quote what is there and name what is absent.

## Step 4: style pass

Check against the house style and report each hit with the sentence and a rewrite:

- **Em dashes.** Any `---`, or `--` outside a numeric range, must go.
- **Specificity.** Any sentence that could appear unchanged in a different paper in the field.
- **Sentence length.** Any sentence long enough that its opening is forgotten by its end.
- **Nominalization.** `an improvement was observed` for `improved`, `made the measurement of`
  for `measured`.
- **Redundancy.** `completely eliminated`, `introduce a new`, and anything the editor already
  assumes: that results were analysed, that samples were prepared carefully.
- **Words to use sparingly.** `preliminary`, `careful`, `novel`, `successfully`.
- **Plain English.** `utilization`, `in order to`, `the majority of`, `due to the fact that`.
- **Empty openers.** `it is important to note that`, `it is relevant to mention here that`.
- **AI tells.** `delve`, `harness`, `leverage`, `underscore`, `pave the way`,
  `plays a crucial role`, `it is not just X, it is Y`.
- **Stacked passive voice.**
- **Ambiguity.** `as` or `since` where `because` is meant; any `it`, `this`, or `they` with
  more than one possible referent.
- **Abbreviations.** Defined at first use, and not several crowded into one short sentence.
- **Tense.** Past for what was done, present for what the results indicate.

Do **not** flag `however`, `moreover`, `in contrast`, `in this paper`, `here we report`, or
single deliberate hedges such as `may` and `suggests`. Those are correct scientific register.
Flagging them is a false positive and makes the review untrustworthy.

## Step 5: consistency with the paper

Only if the full manuscript is available. Check that:

- Every number in the abstract appears identically in the results.
- The conclusion claimed is the conclusion the paper actually supports.
- The gap promised in the abstract is the gap the introduction develops.
- Nothing important in the paper is missing from the abstract.

Report any divergence as a discrepancy, naming both values or claims. Do not silently prefer
one; the researcher decides which is right.

## Step 6: deliver

Give the researcher, in this order:

1. The categorization table.
2. The structural verdict, most serious first.
3. The style hits, each with sentence and rewrite.
4. Any discrepancies against the manuscript.
5. **One rewritten abstract** as a LaTeX fragment with structure labels, applying everything
   above, with `% TODO:` where a missing value must come from them.

Then ask whether to apply it. Never edit their files unasked.

## Hard rules

- **Never invent a number or citation** to fill a gap you found. Name what is missing.
- **Never emit an em dash.**
- Separate the writing verdict from the science. If a result looks scientifically weak, that
  is outside this skill's remit; say so briefly and move on.
- Report honestly. If the abstract is already good, say that plainly and keep the review
  short rather than manufacturing findings.
