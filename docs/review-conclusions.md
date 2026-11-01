# /review-conclusions

> Checks the three movements, traces the funnel in reverse, catches text copied from the results
> section, and verifies your numbers and claims against the rest of the paper.

**Status:** alpha · **Version:** 0.1.0 · **Invocation:** `/review-conclusions` ·
**Auto-loads:** yes
**Companion skills:** [paper-writing-style](paper-writing-style.md),
[create-conclusions](create-conclusions.md), [update-conclusions](update-conclusions.md)

## What it does

Three defects account for almost every weak conclusions section, and the five passes are ordered to
find them fast:

| Pass | Reports |
| :--- | :--- |
| Movements | Whether principal result, interpretation and contribution are all present |
| Funnel | Whether the section widens continuously, or drops back into experimental detail |
| Restatement | Sentences copied verbatim from the results and discussion |
| Consistency | Values against the results, contribution against the introduction's gap, agreement with the abstract |
| Style | Grandiosity, tense, vague results, filler openers |

The three defects: **the contribution is missing** so the section concludes nothing, **the funnel does
not widen** so it reads as a second results summary, and **sentences are copied** from the results.

## When to use it

- Before submitting.
- After a review saying the conclusions overstate the findings, just repeat the results, or leave the
  contribution unclear. All three map to specific passes above.

## When *not* to use it

- **You want the contribution written for you.** It reports a missing contribution and asks what the
  field gains. It will not supply one.
- **No conclusions exist.** Use [create-conclusions](create-conclusions.md).
- **You want scientific peer review.** Out of scope.

## Install

```
/plugin marketplace add yuryalencar/paper-skills
/plugin install review-conclusions@yuryalencar-paper-skills
/plugin install paper-writing-style@yuryalencar-paper-skills
```

Or `./install.sh review-conclusions paper-writing-style`.

## Inputs

| Input | Effect |
| :--- | :--- |
| The conclusions section | Minimum |
| Results and discussion | Unlocks the restatement and value checks |
| The introduction | Unlocks the gap check |
| The abstract | Unlocks the agreement check |

Four of the five passes need another section to compare against, so give it the whole manuscript.

**Language.** Reviews in the language you open in. Rewrites are English.

## Outputs

Movement labels, structural verdict, the reverse funnel trace, any reused text quoted, consistency
mismatches, style hits with rewrites, and one rewritten conclusions section. Nothing written unless you
approve.

## Example

```
> /review-conclusions

MOVEMENTS

  s1  RESULT          "In summary, in this work we have presented..."  -> also NONE
  s2  RESULT
  s3  RESULT
  s4  INTERPRETATION
  s5  NONE

- Missing movement: CONTRIBUTION. The section never says what the field
  gains. As written it restates three results and stops, which means it
  does not conclude. This is the most costly defect available here.
- Proportion: three sentences restating results, one interpreting, none
  concluding.
- s1 opens "In summary, in this work we have presented a study of". The
  whole section is a summary. Delete the opener and start on the result.
- s5 "Further studies are needed in this area" could close any paper ever
  written. Delete, or make it a specific limitation.

FUNNEL (should widen)

  s1 specific
  s2 specific
  s3 MORE specific  <- narrows, mentions the 1 A/g test current
  s4 widening
  s5 vague, not general

  s3 drops back into experimental detail. That is what makes this section
  read as a second results summary. Move the test current out.

RESTATEMENT

  s2 is verbatim identical to ¶7 of your results section:
     "The GMC electrode retained 96% of initial capacitance over 3000
      cycles."
  Copying between sections is self-plagiarism and reads as padding.
  Restate: results describes what was measured, conclusions state what it
  establishes.

CONSISTENCY

  s3 says 93%. Results Table 2 says 91%. Which is right?
  The introduction's gap is about shear stability. Nothing here addresses
  shear, so the contribution, once you write it, should land there.

STYLE

- s4 "plays a crucial role in determining" -> "determines".
- s4 is in past tense ("this established"). Contribution and
  interpretation sentences read stronger in the present: "this
  establishes".
```

## What it will not flag

`however`, `moreover`, `in contrast`, and `in summary` or `in conclusion` used **once** as a genuine
transition. It flags `In summary, in this work we have presented` as a filler opener, which is a
different thing: the objection is to the empty framing, not the connector.

## Side effects

Reads `.tex` and `.bib` files. Writes nothing unless you approve. No network access.

## Design decisions

- **Missing contribution is reported first**, always. It is the commonest defect and the one that makes
  the section pointless.
- **The funnel is traced in reverse**, sentence by sentence, because a single narrowing sentence is what
  turns conclusions into a results rerun and it is invisible when reading linearly.
- **Restatement is checked by diffing against the results section**, not by judgement. Copied sentences
  are a factual finding, so they are quoted.
- **Grandiosity is a first-class check.** This is the section where overclaiming concentrates and where
  a reviewer's objection to it lands.
- **Past-tense contribution sentences are flagged**, following the course's observation that present
  tense suits conclusions.
- **The contribution is never written for you.**
- **Short review for a good section.** Conclusions are short; a long review of a sound one is noise.

## Sources

Module 4 of *Curso de Escrita Científica* by Prof. Dr. Valtencir Zucolotto, IFSC/USP, transcript in
[`sources/`](../sources/curso_escrita_cientifica_valtencir_zucolotto.md). Tense guidance from Module 5,
text reuse from Modules 1 and 3, style checks via
[paper-writing-style](paper-writing-style.md).

## Changelog

- **0.1.0**: initial version.
