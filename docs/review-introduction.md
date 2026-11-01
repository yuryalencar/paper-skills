# /review-introduction

> Labels each paragraph with the movement it implements, traces the funnel, audits your citations
> by class and by year, then reports style defects with rewrites.

**Status:** alpha · **Version:** 0.1.0 · **Invocation:** `/review-introduction` ·
**Auto-loads:** yes
**Companion skills:** [paper-writing-style](paper-writing-style.md),
[create-introduction](create-introduction.md), [update-introduction](update-introduction.md)

## What it does

Diagnoses an introduction on the three dimensions from Module 3, then checks whether the section
keeps its promises to the rest of the paper.

| Pass | Reports |
| :--- | :--- |
| Information | Which of the four movements are present, in what order, in what proportion |
| Flow | A paragraph-by-paragraph funnel trace, and every place the section widens |
| Citation | Whether all three source classes appear, whether they are in the right movements, and **how old your newest citation is** |
| Style | Em dashes, vague sentences, nominalization, monotonous openers, AI tells |
| Connection | Whether the gap you promise is answered in the results |

It reviews the writing, not the science.

## When to use it

- Before submitting, to catch the faults reviewers catch.
- After a rejection citing unclear motivation or novelty.
- On introductions from papers you admire, to learn the pattern. That is the course's own homework.

## When *not* to use it

- **You have no introduction yet.** Use [create-introduction](create-introduction.md).
- **You already know what to change.** Use [update-introduction](update-introduction.md), which
  applies changes rather than diagnosing.
- **You want scientific peer review.** Out of scope by design.

## Install

```
/plugin marketplace add yuryalencar/paper-skills
/plugin install review-introduction@yuryalencar-paper-skills
/plugin install paper-writing-style@yuryalencar-paper-skills
```

Or `./install.sh review-introduction paper-writing-style`.

## Inputs

| Input | Effect |
| :--- | :--- |
| Pasted introduction | Works immediately |
| Path to a `.tex` file | Reads the introduction from it |
| The full manuscript | Unlocks the connection check, which is the most valuable pass |
| A `.bib` file | Unlocks the citation audit, including the recency check |

Give it the whole manuscript and the `.bib` if you can. Two of the five passes depend on them.

**Language.** Reviews in the language you open in. Rewritten text is English.

## Outputs

Three labelled tables (movements, funnel trace, citation audit), then the structural verdict, the
style hits with rewrites, any connection mismatches, and one rewritten introduction as a LaTeX
fragment. Nothing written unless you approve.

## Example

```
> /review-introduction
```

```
MOVEMENTS

| ¶ | Opens with                              | Label   |
|---|-----------------------------------------|---------|
| 1 | "Nanotechnology has attracted..."       | CONTEXT |
| 2 | "Several groups have studied..."        | CONTEXT |
| 3 | "Many challenges remain..."             | GAP     |
| 4 | "In this work we utilize..."            | PURPOSE |

- Missing movement: STATE OF THE ART. The reader cannot tell where the frontier
  is, so they cannot judge whether your work advances it. This is the most
  common omission and the most costly.
- Proportion: two paragraphs of context, one sentence of gap. Inverted.

FUNNEL

  ¶1 broad
  ¶2 level with ¶1        <- does not narrow
  ¶3 narrower
  ¶4 narrowest (purpose)  OK

  ¶2 restates ¶1 at the same altitude. Either narrow it or merge it into ¶1.

CITATIONS

| Class            | Present | Notes                                    |
|------------------|---------|------------------------------------------|
| Seminal          | yes     | Iijima 1991, correctly placed in ¶1      |
| Most recent      | NO      | newest citation is 2021, four years old  |
| High impact      | yes     | 3 refs in ¶2                             |

Recency: your newest reference is from 2021. An introduction whose most recent
citation is four years old reads as out of touch, and it is impossible to claim
novelty against a frontier you have not shown. Which papers from the last two
years belong here?

¶3 "Many challenges remain" carries no citation. A gap claim needs support.

STYLE

- ¶4 "in this work" -> "in this paper". Calling the document the reader holds
  "this work" is imprecise.
- ¶4 "we utilize" -> "we use".
- ¶3 "Many challenges remain to be addressed in this area" could appear
  unchanged in any nanotechnology paper. Name the challenge.
- ¶2 five consecutive sentences open subject-then-verb. Vary with an adverb or
  a dependent clause.
```

## What it will not flag

The vocabulary the course teaches: `however`, `moreover`, `in contrast`, `nevertheless`,
`in this paper`, `here we report`, and `Recently, significant advances have been made in X \cite{}`.
Those are correct scientific register. Note the last one is *protected* while
`in recent years there has been growing interest in` is *flagged*: the difference is whether the
sentence makes a specific cited claim or merely announces that a topic exists.

## Side effects

Reads `.tex` and `.bib` files. Writes nothing unless you approve. No network access, so the
recency check tells you your newest citation's age but cannot find newer papers for you.

## Design decisions

- **The funnel gets its own pass with an explicit trace.** Widening is invisible when reading
  linearly and obvious in a paragraph-altitude table.
- **The citation audit checks years, not just presence.** A missing state of the art usually shows
  up as an old newest-citation before it shows up as a missing movement.
- **The connection check is listed last but matters most.** A gap the paper never answers is the
  commonest structural fault in a manuscript.
- **An explicit protected-vocabulary list.** Without it, a style pass strips the connectors the
  course teaches and makes the introduction worse.
- **Suspected text reuse is flagged for you to verify, never asserted.** The distinction between
  close paraphrase and reuse needs the source in hand.
- **Honest empty result.** A good introduction gets a short review, not manufactured findings.

## Sources

Module 3 of *Curso de Escrita Científica* by Prof. Dr. Valtencir Zucolotto, IFSC/USP, transcript
in [`sources/`](../sources/curso_escrita_cientifica_valtencir_zucolotto.md). Style checks from
Modules 5 to 8 via [paper-writing-style](paper-writing-style.md).

## Changelog

- **0.1.0**: initial version.
