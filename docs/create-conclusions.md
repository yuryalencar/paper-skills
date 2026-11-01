# /create-conclusions

> Writes the conclusions as a LaTeX fragment on the inverse funnel: opens on your principal result and
> widens to what the field gains.

**Status:** alpha · **Version:** 0.1.0 · **Invocation:** `/create-conclusions` ·
**Auto-loads:** yes
**Companion skills:** [paper-writing-style](paper-writing-style.md),
[review-conclusions](review-conclusions.md), [update-conclusions](update-conclusions.md)

## What it does

The conclusions section is the mirror image of the introduction. Where the introduction narrows from
the broad field to your purpose, the conclusions widen from your principal result back out to the
field, closing the hourglass shape of the paper:

| Movement | Carries | Altitude |
| :--- | :--- | :--- |
| Principal result | Your main finding, restated | Most specific |
| Brief interpretation | What it means | Widening |
| Contribution | How this advances the broad field | Most general |

Write it **second**, straight after results and discussion, while the findings are fresh. That is the
course's writing order.

## When to use it

- Results and discussion is written and you are following the course's order.
- Reviewers said the conclusions just repeat the results, or that the contribution is unclear.

## When *not* to use it

- **Results are not written yet.** The conclusions are built from them and cannot be written from a
  topic description. It will ask for the findings directly if the section is missing.
- **A conclusions section exists.** Use [review-conclusions](review-conclusions.md) or
  [update-conclusions](update-conclusions.md).

## Install

```
/plugin marketplace add yuryalencar/paper-skills
/plugin install create-conclusions@yuryalencar-paper-skills
/plugin install paper-writing-style@yuryalencar-paper-skills
```

Or `./install.sh create-conclusions paper-writing-style`.

## Inputs

| Input | Effect |
| :--- | :--- |
| The results and discussion section | The main input. Read for findings, values and interpretations |
| The introduction | Checked, so the contribution answers the stated gap |
| The abstract | Cross-checked for agreement |
| Nothing but a description | It will ask for the findings; a topic is not enough |

**Language.** Interviews in the language you open in, for the whole run. Output LaTeX is English.

## Outputs

A LaTeX fragment with `% PRINCIPAL RESULT`, `% INTERPRETATION` and `% CONTRIBUTION` labels, plus a note
on how the altitude rises across it. Nothing written until you approve.

## Example

```latex
% PRINCIPAL RESULT
Crosslinked layer-by-layer films retained 96\% of their initial capacitance after 3000
charge-discharge cycles, compared with 71\% for untreated films.
% INTERPRETATION
This difference establishes crosslinking as the determining factor in cycling durability for
these composites, rather than electrode loading.
% CONTRIBUTION
Crosslinked assemblies are therefore viable for devices requiring extended cycling, which
removes the principal barrier to using layer-by-layer coatings in implantable
supercapacitors.
```

A specific retention figure, then what it establishes, then what the field gains. The last sentence is
the most general in the section.

## Restate, never repeat

The principal result already appeared in results and discussion. Here it must be **restated with a
different framing**: results describes what was measured, conclusions state what it establishes.

Copying your own sentences between sections is the self-plagiarism the course warns about, it reads as
padding, and editors notice. The skill will not do it, and it checks the draft against the results
section before finishing.

## Tense

Past tense for what was done and found. **Present tense for the contribution**, because it states what
is now true rather than what happened: `these assemblies are viable`, `this approach offers`. The
course notes that present tense fits conclusions better than any other section, and contribution
sentences left in the past tense read weaker than they should.

## Two things it will not do

**It will not invent the contribution.** If you cannot say what the field gains, that is a conversation
to have, not a blank to fill. An invented contribution is an overclaim published under your name.

**It will not widen into grandiosity.** The contribution is what this paper enables, not what the field
might one day achieve. `paves the way for`, `opens new avenues` and `has the potential to
revolutionize` are cut. This is the section where overclaiming concentrates.

## Side effects

Reads `.tex` and `.bib` files in your working directory. Writes nothing unless you approve. No network
access.

## Design decisions

- **Built from the results section, not from a description.** A conclusion is a claim about evidence, so
  the evidence has to be in hand.
- **The contribution is asked for explicitly and never supplied.** It is the movement researchers most
  often omit and the one an AI has least business guessing.
- **Grandiosity is treated as a defect, not a style preference.** A conclusions section is where a
  reviewer's overclaiming objection lands.
- **Present tense is actively recommended for the contribution**, following the course, rather than
  applying past tense uniformly across the paper.
- **Checked against the results, introduction and abstract** before delivery: values must match, the
  contribution must answer the stated gap, and the abstract must agree.
- **Restatement enforced by comparison.** The draft is diffed against the results section to catch
  copied sentences.

## Sources

Module 4 of *Curso de Escrita Científica* by Prof. Dr. Valtencir Zucolotto, IFSC/USP, transcript in
[`sources/`](../sources/curso_escrita_cientifica_valtencir_zucolotto.md). The tense guidance is from
Module 5, and the text-reuse rule from Modules 1 and 3.

## Changelog

- **0.1.0**: initial version.
