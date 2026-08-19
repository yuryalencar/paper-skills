# /create-introduction

> Writes a paper introduction as a LaTeX fragment on the four-movement model, funnelling from the
> broad field down to your purpose.

**Status:** alpha · **Version:** 0.1.0 · **Invocation:** `/create-introduction` ·
**Auto-loads:** yes · **Tags:** `research`
**Companion skills:** [paper-writing-style](paper-writing-style.md),
[review-introduction](review-introduction.md), [update-introduction](update-introduction.md)

## What it does

Builds an introduction on the four movements the course defines: contextualization, gap, state of
the art, purpose. It works all three dimensions at once, which is what separates a good
introduction from a list of background facts:

| Dimension | What it means |
| :--- | :--- |
| Information | The four movements, each actually present |
| Flow | Continuous narrowing from the broad field to the purpose, never widening |
| Citation | The right class of source in the right movement |

Output is an English LaTeX fragment with movement labels.

## When to use it

- You have results and conclusions written and are ready for the introduction.
- You need to rebuild an introduction that reviewers found unconvincing.

## When *not* to use it

- **Before the results exist.** The course puts the introduction third in the writing order,
  after results and discussion and after conclusions, so that it aims directly at what you
  actually found. It will warn you and continue if you insist, but expect to revise.
- **You have an introduction already.** Use [review-introduction](review-introduction.md) to
  critique it or [update-introduction](update-introduction.md) to evolve it.

## Install

```
/plugin marketplace add yuryalencar/ai-skills
/plugin install create-introduction@yuryalencar-ai-skills
/plugin install paper-writing-style@yuryalencar-ai-skills
```

Or `./install.sh create-introduction paper-writing-style`.

## Inputs

| Input | Effect |
| :--- | :--- |
| A short description of the work | The normal start. Expect several rounds of questions |
| Path to the manuscript or results section | Read first, so it asks only what the paper does not answer |
| A `.bib` file | Read for keys and, importantly, for publication years |
| A list of key papers | Used to populate the three citation classes |
| Nothing | Starts from the interview |

It finds `.tex` files, the `.bib` and the citation style itself.

**Language.** Interviews in the language you open in and stays there for the whole run. Output
LaTeX is always English.

## Outputs

An English LaTeX fragment with `% CONTEXTUALIZATION`, `% GAP`, `% STATE OF THE ART` and
`% PURPOSE` labels, plus the paragraph count and a note on how much context was spent, which
papers went where, and how the funnel narrows. Nothing written to disk until you approve.

## Example

```
> /create-introduction layer-by-layer film stability under physiological shear
```

```latex
% CONTEXTUALIZATION
Layer-by-layer assembly produces ultrathin polymer films with nanometre control over
thickness and composition \citep{decher1997}, and has become a standard route to
functional coatings for biomedical devices \citep{lee2019}.
% GAP
However, the mechanical stability of these films under physiological shear remains poorly
understood, which limits their use in implantable devices \citep{costa2021}.
% STATE OF THE ART
Recently, significant advances have been reported in crosslinking strategies that improve
film cohesion \citep{park2024,mendes2025}, although these have been characterized only
under static conditions.
% PURPOSE
In this paper, we report the shear stability of crosslinked layer-by-layer films under
physiological flow, measured over 30 days.
```

> 4 paragraphs. Contextualization kept short because *Biomacromolecules* readers have the
> field. Decher 1997 placed as the seminal reference; Park 2024 and Mendes 2025 as the state of
> the art, and the "static conditions only" clause is what makes your shear measurement the
> answer to the gap.

## The three citation classes

Choosing from hundreds of candidate references becomes tractable once you sort them:

| Class | Goes in | Purpose |
| :--- | :--- | :--- |
| Seminal, founded the field or technique | Contextualization | Establishes the lineage |
| Most recent relevant work | State of the art, and gap | Shows where the frontier is, and that you are current |
| High-impact work in between | Relevance and motivation | Shows the field matters |

It checks the years in your `.bib`. If the newest entry is more than two years old it says so,
because an introduction whose most recent citation is old reads as out of touch.

## Side effects

Reads `.tex` and `.bib` files in your working directory. Writes nothing unless you approve and
say where. No network access, so it cannot look up literature you have not supplied.

## Design decisions

- **All three dimensions checked, not just the movements.** An introduction with all four
  movements present can still fail by widening halfway through or by citing a 1997 paper as the
  state of the art.
- **The gap is pressed hardest in the interview.** It determines whether the paper looks
  necessary, and it is what a one-line description always omits.
- **State of the art is never invented.** The skill has no network access and will not fabricate
  recent literature. If your `.bib` has nothing recent, it asks rather than inventing a frontier.
- **Warns when run before the results exist**, rather than refusing. The course's writing order
  is a strong recommendation, not a rule, and sometimes a draft introduction is genuinely useful.
- **Verifies against the results section** before finishing. An introduction that promises what
  the paper never delivers is the commonest structural fault in a manuscript.
- **Text reuse called out explicitly.** The course is emphatic: citation records where an idea
  came from, never where text came from. The skill restates and cites, never copies.

## Sources

Module 3 of *Curso de Escrita Científica* by Prof. Dr. Valtencir Zucolotto, IFSC/USP, transcript
in [`sources/`](../sources/curso_escrita_cientifica_valtencir_zucolotto.md). The writing order is
from Module 4.

## Changelog

- **0.1.0**: initial version.
