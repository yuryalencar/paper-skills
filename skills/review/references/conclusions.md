# Conclusions: review

Diagnose a conclusions section. Three defects account for almost every weak one: the contribution is
missing so the section concludes nothing, the funnel does not widen so it reads as a second results
summary, or sentences are copied verbatim from the results and discussion.

This reviews the writing, not the science.

## Context to read

**Get the material.** The conclusions, plus the results and discussion section, the introduction and the abstract if available. Every one of the four checks below needs another section to compare against.

## Pass 1: the three movements

Label each sentence:

| Label | Movement |
| :--- | :--- |
| `RESULT` | The principal finding restated |
| `INTERPRETATION` | What it means |
| `CONTRIBUTION` | How this advances the broad field |
| `NONE` | Implements no movement |

Report, most serious first:

1. **Missing contribution.** The commonest and most costly defect. Without it the section does not
   conclude, it just repeats. Say so plainly.
2. **Missing principal result**, or several results given equal weight so that none reads as principal.
   Ask which one a reader should remember.
3. **Sentences labelled `NONE`.** Usually filler openers such as "In summary, in this work we have
   presented a study of". Propose deletion and say what is lost.
4. **Proportion.** Five sentences of result restatement and none of contribution is the standard
   imbalance.

## Pass 2: the funnel, in reverse

The section must widen continuously: specific result, then meaning, then what the field gains. Trace
it:

- For each sentence, mark whether it is narrower than, level with, or broader than the one before.
- **Report every narrowing** after the widening has begun. Dropping back into experimental detail
  midway is the defect that makes conclusions read as a second results section.
- **Check the last sentence is the most general in the section.**
- **Check the first sentence is the most specific.**

## Pass 3: restatement versus repetition

Compare against the results and discussion section:

- **Quote any sentence that appears in both**, verbatim or near-verbatim. This is self-plagiarism, it
  reads as padding, and editors notice.
- **Check the framing differs.** Results and discussion describes what was measured; conclusions state
  what it establishes. A conclusions section that only reports measurements again has not done its job
  even if the wording is fresh.
- **Check the interpretation is not a copy** of the one given earlier. It should differ in emphasis.

## Pass 4: consistency across the paper

- **Values.** Every number here must match the results section exactly. Report any mismatch with both
  values and locations.
- **The gap.** Does the contribution answer the gap the introduction stated? If the introduction
  promised one thing and the conclusions deliver another, that is a structural fault reviewers catch.
- **The abstract.** The abstract's closing sentences and these conclusions should agree. Report
  divergence and suggest `/write abstract`.

## Pass 5: style

Report each hit with the sentence and a rewrite:

- **Em dashes.** Any `---`, or `--` outside a numeric range.
- **Grandiosity.** `paves the way for`, `opens new avenues`, `has the potential to revolutionize`,
  `will transform`. The contribution is what this paper enables, not what the field might achieve one
  day. This is the section where overclaiming concentrates, so check it hard.
- **Tense.** Past for what was done and found; **present is correct for the contribution sentences**,
  since they state what is now true. Flag contribution sentences stuck in the past tense, which read
  as weaker than they should.
- **Vague results.** `good`, `excellent`, `improved` without a value.
- **Filler openers.** `In summary, in this work we have presented`. The whole section is a summary.
- **Nominalization**, **stacked passive voice**, **hedge stacking**.
- **Specificity.** Any sentence that could appear unchanged in another paper.
- **Words to use sparingly.** `novel`, `successfully`, `preliminary`, `careful`.
- **Plain English.** `utilization`, `in order to`, `the majority of`.
- **AI tells.** `delve`, `harness`, `leverage`, `underscore`, `plays a crucial role`,
  `it is not just X, it is Y`.

Do **not** flag `however`, `moreover`, `in contrast`, `in summary` or `in conclusion` used once as a
genuine transition, or single deliberate hedges. Those are correct register.

## Deliver

1. The movement labels.
2. Structural verdict, missing contribution first if applicable.
3. The funnel trace, with every narrowing named.
4. Any text reused from the results section, quoted.
5. Consistency mismatches against results, introduction and abstract.
6. Style hits with rewrites.
7. **One rewritten conclusions section** as a LaTeX fragment with movement labels, with `% TODO:`
   where the researcher must supply the contribution or a value.

Then ask whether to apply. Never edit their files unasked.

## Hard rules

- **Never invent the contribution.** If it is missing, report it as missing and ask what the field
  gains. Writing one yourself puts an overclaim in the researcher's name.
- **Never invent or adjust a value.**
- **Never emit an em dash.**
- Separate the writing verdict from scientific merit.
- If the section is already good, say so and keep the review short. Conclusions are short; a long
  review of a good one is noise.
