# /review-results-discussion

> Builds a matrix of your result blocks against the four information classes, so the gaps are visible
> at a glance, then checks topic sentences, captions and style.

**Status:** alpha · **Version:** 0.1.0 · **Invocation:** `/review-results-discussion` ·
**Auto-loads:** yes · **Tags:** `research`
**Companion skills:** [paper-writing-style](paper-writing-style.md),
[create-results-discussion](create-results-discussion.md),
[update-results-discussion](update-results-discussion.md)

## What it does

Five passes over the section:

| Pass | Reports |
| :--- | :--- |
| Information classes | A matrix of result blocks against background, description, interpretation, comparison |
| Topic sentences | Which paragraphs lack one, which stray from it, where a paragraph should split |
| Captions | Whether each is self-contained, or merely names the axes, or duplicates the text |
| Style | Vague result language, stacked passives, hedge stacking, monotonous openers, unit formatting |
| Connection | Whether the introduction's gap is answered here, and every result here motivated there |

The failures in this section are mostly structural, not stylistic, which is why the matrix comes
first.

## When to use it

- Before submitting.
- After a review calling the discussion superficial, which almost always means missing interpretation
  or comparison classes.
- On a section that has grown organically and you suspect has lost its shape.

## When *not* to use it

- **You want the missing interpretation written for you.** It reports that interpretation is absent
  and asks you for the explanation. It will not propose a mechanism.
- **You want scientific peer review.** Out of scope.
- **No section exists yet.** Use [create-results-discussion](create-results-discussion.md).

## Install

```
/plugin marketplace add yuryalencar/ai-skills
/plugin install review-results-discussion@yuryalencar-ai-skills
/plugin install paper-writing-style@yuryalencar-ai-skills
```

Or `./install.sh review-results-discussion paper-writing-style`.

## Inputs

| Input | Effect |
| :--- | :--- |
| The section, pasted or as a path | Works immediately |
| Figures and captions | Unlocks the caption pass |
| The `.bib` | Checks comparison citations resolve |
| The introduction | Unlocks the connection pass |

**Language.** Reviews in the language you open in. Rewrites are English.

## Outputs

The class matrix, the structural verdict, topic sentence and paragraph findings with proposed
sentences and split points, caption findings, style hits with rewrites, connection mismatches, and a
rewrite of the **two or three weakest blocks only**. Results sections are long; rewriting all of it
would bury the diagnosis.

## Example

```
> /review-results-discussion

INFORMATION CLASSES

| Block            | Background | Description | Interpretation | Comparison |
|------------------|------------|-------------|----------------|------------|
| Fig 1 morphology | yes        | yes         | yes            | NO         |
| Fig 2 XRD        | NO         | yes         | yes            | NO         |
| Fig 3 stability  | yes        | vague       | NO             | NO         |
| Table 1 params   | NO         | yes         | NO             | NO         |

The pattern is the finding: you describe well and compare almost never.
Four blocks, zero comparisons. A reader cannot tell whether any of these
results are good, because nothing is placed against prior work. This is
the cheapest high-value fix available to you.

MOST SERIOUS

1. Fig 3 description is vague. "The films showed excellent stability
   over the test period" gives no value and no duration. What was the
   retention, over how long?
2. Fig 3 and Table 1 have no interpretation. Both are data dumps as
   written. I am not going to guess the mechanism: what explains the
   stability difference between the two film types?

TOPIC SENTENCES

- ¶4 opens "Figure 3 shows the stability data." That is a pointer, not a
  topic sentence: no claim. Proposed: "Crosslinked films retained
  capacitance far longer than untreated films under continuous cycling."
- ¶6 covers Figures 4, 5 and 6 in one paragraph. Topic changes twice.
  Split after "...consistent with the XRD result." and again after
  "...at higher loadings."

CAPTIONS

- Fig 2: "XRD patterns." Names the content, nothing else. A reader in
  your field should be able to see from the caption alone why the
  pattern matters. Add the phases identified and the key peak shift.
- Fig 4 caption repeats the ¶7 description almost verbatim. Choose one.
```

## What it will not do

It will not invent a value to fill a missing description, and it will not supply a missing
interpretation. Both are reported as gaps with a question back to you. Proposing a mechanism you did
not propose is the single most dangerous thing a writing skill could do to a paper, so it is
prohibited outright.

## Side effects

Reads `.tex`, `.bib`, figures and captions. Writes nothing unless you approve. No network access.

## Design decisions

- **The matrix comes first**, because the *pattern* of gaps is more informative than any individual
  gap. "Zero comparisons across four blocks" is a diagnosis; four separate notes are noise.
- **Missing interpretation is reported, never filled.**
- **Only the weakest blocks are rewritten.** Rewriting a long section wholesale hides the findings and
  produces churn you cannot review.
- **Vague result language is flagged everywhere.** `good`, `excellent`, `improved`, `significant`
  without a value is the defect that most weakens a results section.
- **Stacked passive gets its own check.** It accumulates here more than in any other section.
- **Hedge stacking is flagged, but hedging is not.** The skill will not push you towards overclaiming;
  the hedge your evidence supports stays.
- **`increase` / `enhance` / `improve` checked as distinct words**, since the course flags them as
  commonly confused and they carry different claims.

## Sources

Module 4 of *Curso de Escrita Científica* by Prof. Dr. Valtencir Zucolotto, IFSC/USP, transcript in
[`sources/`](../sources/curso_escrita_cientifica_valtencir_zucolotto.md). Topic sentences from Module
8; style checks from Modules 5 to 8 via [paper-writing-style](paper-writing-style.md).

## Changelog

- **0.1.0**: initial version.
