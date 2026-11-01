---
name: review-introduction
description: Review a scientific paper introduction from a writing perspective, labelling each paragraph and sentence with the movement it implements (contextualization, gap, state of the art, purpose), checking the general-to-specific funnel, auditing the three citation classes, and reporting style defects with concrete rewrites. Use when asked to review, critique, check or improve an introduction.
allowed-tools: Read, Grep, Glob
---

# /review-introduction

Diagnose an introduction on all three dimensions the course defines: the information it carries,
the way its ideas flow, and how it uses the literature. Report specific rewrites, not impressions.

This reviews the writing, not the science.

## Before anything else

1. **Load the style rules.** Invoke `paper-writing-style` and read `references/human-voice.md`.
2. **Lock the language.** Use the language of the user's first message for the whole run. Any
   rewritten text is English.
3. **Get the material.** Read the introduction, and the rest of the manuscript if available: the
   results section is what tells you whether the introduction's promises are kept. Read the
   `.bib` file to audit the citations.

## Dimension 1: information

Label each paragraph, and each sentence within it, with the movement it implements:

| Label | Movement |
| :--- | :--- |
| `CONTEXT` | Broad field, its importance, terms and jargon defined |
| `GAP` | What is unresolved, unexplained, contested, or too costly |
| `SOTA` | Where the knowledge frontier is now |
| `PURPOSE` | What this paper does |
| `NONE` | Implements no movement. A finding in itself |

Present it as a table of paragraph number, opening words, and label.

Then report:

1. **Missing movements**, most serious first. A missing purpose is fatal. A missing gap makes the
   paper look unnecessary. A missing state of the art is the commonest omission and means the
   reader cannot tell whether anything was advanced.
2. **Order.** Movements should run context, gap, state of the art, purpose. Purpose belongs in the
   last paragraph; flag it appearing early unless it works.
3. **Paragraphs labelled `NONE`.** Say what would be lost by deleting them.
4. **Proportion.** Three paragraphs of context and one sentence of gap is the usual imbalance.

## Dimension 2: flow

The section must funnel from general to specific, continuously, and never widen back out.

- **Trace the funnel.** For each paragraph, state whether it is broader than, narrower than, or
  level with the one before. Report every place it widens.
- **Check inside paragraphs too.** A paragraph should also narrow across its own sentences.
- **Check the purpose is the narrowest point** in the whole section. Nothing should be more
  specific than what this paper set out to do.

Report a widening as a concrete problem: name the two paragraphs and what the reader loses.

## Dimension 3: citation and referencing

Audit against the three classes the course defines:

| Class | Should appear in | Check |
| :--- | :--- | :--- |
| Seminal, founding the field or technique | Context, sometimes gap | Present at all? |
| Most recent relevant work | State of the art, gap | **Check the years.** How old is the newest citation? |
| High-impact work between the poles | Relevance and motivation | Present? |

Then check:

- **Recency.** If the newest citation is more than two years old, say so plainly. It reads as out
  of touch and reviewers notice.
- **Density.** A gap or state-of-the-art claim with no citation at all is a defect. So is a
  paragraph where every sentence carries four keys.
- **Placement.** A seminal 1997 paper cited as the state of the art is a misuse of the class.
- **Uncited claims.** Any statement about the field or prior work that carries no reference.
- **Keys that are not in the `.bib`**, which will not compile.

**Text reuse.** If a passage reads as copied rather than restated, flag it. The rule is absolute:
citation records where an idea came from, never where text came from. Paraphrasing while citing is
correct; reproducing sentences while citing is still plagiarism. The one exception is a direct
quotation in quotation marks, which is rare in this genre. Flag suspected reuse as something for
the researcher to verify; do not accuse.

## Style pass

Report each hit with the sentence and a rewrite:

- **Em dashes.** Any `---`, or `--` outside a numeric range.
- **Specificity.** Any sentence that could appear unchanged in another paper in the field.
- **Sentence length.** Any sentence whose opening is forgotten by its end.
- **Nominalization.** `an improvement was observed` for `improved`.
- **Redundancy**, including `introduce a new`, which appears constantly in purpose paragraphs.
- **`in this work`**, which should be `in this paper`, `in this study` or `here we report`.
- **Words to use sparingly.** `preliminary`, `careful`, `novel`, `successfully`.
- **Plain English.** `utilization`, `in order to`, `the majority of`, `due to the fact that`.
- **Empty openers.** `it is important to note that`.
- **AI tells.** `delve`, `harness`, `leverage`, `underscore`, `pave the way`, `crucial role`,
  `in recent years there has been growing interest in`.
- **Stacked passive voice.**
- **Monotonous sentence openers.** If most sentences in a paragraph open subject-then-verb, the
  paragraph lacks rhythm. Propose replacements using an adverb, a prepositional phrase, a
  dependent clause or an infinitive phrase.
- **Ambiguity.** `as` or `since` where `because` is meant; any pronoun with two possible referents.
- **Abbreviations** defined at first use, not stacked several to a short sentence.

Do **not** flag `however`, `moreover`, `in contrast`, `nevertheless`, `in this paper`,
`here we report`, `Recently, significant advances have been made in X \cite{}`, or single
deliberate hedges. These are the vocabulary the course teaches. Flagging them is a false positive
and makes the whole review untrustworthy.

## Connection to the rest of the paper

Only if the manuscript is available, and this is the check reviewers make hardest:

- **Does the gap get answered?** Every gap the introduction states should have its counterpart in
  the results and discussion. A promise the paper never keeps is the commonest structural fault in
  a manuscript.
- **Does the purpose match?** Compare the introduction's final paragraph against the abstract's
  purpose and the conclusions. All three should agree.
- **Is the relevance claim supported** by what the paper actually shows?

Report each mismatch naming both places.

## Deliver

1. The three labelled tables: movements, funnel trace, citation audit.
2. Structural verdict, most serious first.
3. Style hits, each with sentence and rewrite.
4. Connection mismatches against the rest of the paper.
5. **One rewritten introduction** as a LaTeX fragment with movement labels, applying everything
   above, with `% TODO:` where the researcher must supply a citation or a fact.

Then ask whether to apply it. Never edit their files unasked.

## Hard rules

- **Never invent a citation** to fill a gap you found. Name what is needed.
- **Never invent recent literature.** If the state of the art is thin, report that it is thin and
  ask the researcher which papers belong there.
- **Never emit an em dash.**
- Separate the writing verdict from scientific merit.
- If the introduction is already good, say so and keep the review short rather than manufacturing
  findings.
