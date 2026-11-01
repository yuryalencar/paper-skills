# /review-abstract

> Reviews an abstract from a writing perspective: labels every sentence with the model part it
> implements, then reports what is missing, weak or badly worded, with concrete rewrites.

**Status:** alpha · **Version:** 0.1.0 · **Invocation:** `/review-abstract` ·
**Auto-loads:** yes
**Companion skills:** [paper-writing-style](paper-writing-style.md),
[create-abstract](create-abstract.md), [update-abstract](update-abstract.md)

## What it does

Runs the *categorização* exercise the source course is built on. It goes sentence by sentence
through your abstract, labels what each one is doing, and shows you the structure of your own
text as a table. Then it reports structural defects, judges the gap and the results
specifically, runs a style pass, and hands back one rewritten abstract.

It reviews the **writing**, not the science. It will not tell you whether your results are
interesting.

## When to use it

- You have an abstract and want to know what a writing-focused reviewer would say.
- An abstract was rejected or criticized as unclear and you want to find out why.
- You want to check your abstract against a known structure before submitting.
- Learning: running it on abstracts from papers you admire is the course's own homework.

## When *not* to use it

- **You have no abstract yet.** Use [create-abstract](create-abstract.md).
- **The paper changed and you suspect the abstract is stale.** Use
  [update-abstract](update-abstract.md), which diffs against the manuscript instead of
  reviewing prose in isolation.
- **You want scientific peer review.** This skill deliberately stays out of that. It judges
  whether the text delivers the results, not whether the results are good.

## Install

```
/plugin marketplace add yuryalencar/paper-skills
/plugin install review-abstract@yuryalencar-paper-skills
/plugin install paper-writing-style@yuryalencar-paper-skills
```

Or `./install.sh review-abstract paper-writing-style`.

## Inputs

| Input | Effect |
| :--- | :--- |
| Pasted abstract text | Works immediately |
| Path to a `.tex` file | Reads the abstract from it |
| Nothing | Looks for a manuscript in the working directory |
| A full manuscript, in addition | Unlocks the consistency check in step 5 |

Giving it the whole paper is worth it: that is the only way it can tell you that a number in
your abstract no longer matches your results table.

**Language.** Reviews in the language you open in and stays there for the run. Any rewritten
text is English.

## Outputs

Five things, in order:

1. **Categorization table**: every sentence with its label (`CONTEXT`, `GAP`, `PURPOSE`,
   `METHODS`, `RESULTS`, `CONCLUSIONS`, or `NONE` for a sentence implementing nothing).
2. **Structural verdict**: missing mandatory parts first, then recommended parts, order,
   unlabelled sentences, and proportion.
3. **Gap and results judgement**: the two parts that carry an abstract, each judged on its own.
4. **Style hits**: each with the offending sentence and a rewrite.
5. **One rewritten abstract** as a LaTeX fragment, with `% TODO:` where you must supply a
   value.

Then it asks whether to apply the rewrite. It never edits your files unasked.

## Example

```
> /review-abstract
```

```
CATEGORIZATION

| # | Sentence (opening)                                  | Label      |
|---|-----------------------------------------------------|------------|
| 1 | Nanotechnology has attracted considerable attention | CONTEXT    |
| 2 | Many strategies have been proposed to overcome...    | GAP        |
| 3 | In this work we utilize a novel approach...          | PURPOSE    |
| 4 | Samples were carefully prepared and analysed...      | METHODS    |
| 5 | The results showed good stability and improved...    | RESULTS    |
| 6 | It is important to note that this is relevant...     | NONE       |

STRUCTURE

- Missing mandatory part: CONCLUSIONS. The abstract never says how these results
  advance the field. Sentence 6 occupies the position but carries no content.
- Sentence 2 is not a gap. "Many strategies have been proposed to overcome the
  limitations" names no strategy, no limitation and no disease. The purpose in
  sentence 3 therefore answers nothing specific.
- Proportion: 2 sentences of context and gap, 1 of results. Inverted.

RESULTS

Sentence 5 has no numbers. "Good stability" and "improved performance" are the
two weakest claims available. What was the retention, over how many cycles?

STYLE

- s3 "in this work" -> "in this paper". Calling the document the reader is holding
  "this work" is imprecise.
- s3 "a novel approach" -> drop "novel". If you are introducing it, it is new.
- s4 "carefully prepared" -> drop. The editor assumes it.
- s4 "were carefully prepared and analysed and errors were eliminated" -> stacked
  passive, and the second half is what the editor assumes you did anyway.
- s6 "It is important to note that" -> nine words carrying nothing. Delete and
  state the actual implication, which is the missing CONCLUSIONS part.
```

Followed by the rewritten fragment.

## What it will not flag

It deliberately leaves alone the vocabulary the source course teaches, because flagging it
would be a false positive: `however`, `moreover`, `in contrast`, `on the other hand`,
`in this paper`, `here we report`, `in summary`, and single deliberate hedges such as `may`
and `suggests`. `However` opening your gap sentence is a feature, not a defect.

## Side effects

Reads files in your working directory. Writes nothing unless you approve a rewrite and say
where. No network access.

## Design decisions

- **Categorization first, verdict second.** Showing you the structure of your own text before
  criticizing it is what makes the criticism land, and it is how the course teaches the skill.
- **The gap and the results get their own step.** They are where abstracts actually fail, and
  burying them in a general style list understates them.
- **An explicit protected vocabulary list.** Without it, a style pass strips the connectors
  the course teaches and makes the abstract worse. This was the main risk identified when the
  skill was designed.
- **Writing verdict separated from scientific merit**, so the skill stays in its lane and its
  output stays trustworthy.
- **Honest empty result.** If the abstract is good, it says so and keeps the review short
  rather than manufacturing findings to look useful.
- **Review article guard.** It checks what kind of document it is before reporting missing
  parts, since review articles legitimately consist mostly of context and gap.

## Sources

Module 2 of *Curso de Escrita Científica* by Prof. Dr. Valtencir Zucolotto, IFSC/USP,
transcript in [`sources/`](../sources/curso_escrita_cientifica_valtencir_zucolotto.md). The
style checks come from Modules 5 to 8 via [paper-writing-style](paper-writing-style.md).

## Changelog

- **0.1.0**: initial version. Abstract vertical slice, phase 1.
