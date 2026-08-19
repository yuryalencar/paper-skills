# /create-title

> Produces three to five title options, labelled by strategy, favouring titles that state your finding
> rather than name your topic.

**Status:** alpha · **Version:** 0.1.0 · **Invocation:** `/create-title` ·
**Auto-loads:** yes · **Tags:** `research`
**Companion skills:** [paper-writing-style](paper-writing-style.md),
[review-title](review-title.md), [update-title](update-title.md)

## What it does

The title is the most-read and least-worked-on part of a paper. Write it **last**, which is where the
course's writing order puts it: provisional titles along the way are fine, but the title should be
revisited once you know what the paper says.

It reads your paper, extracts the principal finding, and produces a **spread of options** rather than one
title, each labelled by strategy with its word count and what it gives up.

## The one thing that matters most

High impact journals have moved from descriptive titles to declarative ones that state the contribution.
It follows directly from the genre having no room for suspense:

| Descriptive | Declarative |
| :--- | :--- |
| `A study of graphene oxide coatings for supercapacitors` | `Crosslinked graphene oxide coatings retain 96% capacitance over 3000 cycles` |
| `Expression of the S100-related MRP in human placenta tissue` | `Metal-polymer nanocomplexes induce spontaneous regression of lung tumours` |

A reader seeing the second kind knows the finding immediately.

## When to use it

- The paper is written and you need the real title.
- Your title is descriptive and you want to see the declarative version.

## When *not* to use it

- **The paper is not written.** It will offer a provisional title, clearly flagged, but a title written
  from a topic description will describe the topic, which is what to avoid.
- **A title exists and needs checking.** Use [review-title](review-title.md).
- **A working title needs replacing.** Use [update-title](update-title.md), mode C.

## Install

```
/plugin marketplace add yuryalencar/ai-skills
/plugin install create-title@yuryalencar-ai-skills
/plugin install paper-writing-style@yuryalencar-ai-skills
```

Or `./install.sh create-title paper-writing-style`.

## Inputs

Needs the abstract, conclusions and results section. It reads them itself. It asks only three things:
the target journal (for the length limit and venue style), which finding is the headline if there are
several, and whether your subfield still expects descriptive titles.

**Language.** Interviews in the language you open in. Titles are English.

## Outputs

Three to five `\title{}` options as LaTeX, each with a strategy label, word count, and one line on what
it emphasizes and what it sacrifices. Plus which one it would pick and why.

## Example

```latex
% OPTION 1  declarative, states the finding
\title{Crosslinking determines cycling durability in layer-by-layer supercapacitor electrodes}
% 11 words. Names the mechanism, drops the value.

% OPTION 2  declarative with the value, strongest for a specialist venue
\title{Crosslinked layer-by-layer electrodes retain 96\% capacitance over 3000 cycles}
% 10 words. Concrete and searchable. Commits to a number, so it must match Table 2 exactly.

% OPTION 3  mechanism-forward
\title{Hierarchical graphene--MnO$_2$ textiles accommodate volume change during cycling}
% 9 words. Best if the mechanism is the contribution rather than the durability number.

% OPTION 4  descriptive, if the venue expects it
\title{Cycling durability of crosslinked layer-by-layer graphene--MnO$_2$ electrodes}
% 8 words. Safe, searchable, states no finding.
```

Expect to combine parts of different options. That is the point of a spread.

## Crutch phrases it removes

`Report of a case of`, `A study of`, `An investigation into`, `On the`, `Some observations on`,
`Towards a`, `Preliminary results on`, `Novel`, `A note on`, `Aspects of`, `Contribution to the study of`.

The test is deletion: if the title still identifies the work, the phrase was a crutch.

## Side effects

Reads `.tex` files in your working directory. Writes nothing unless you approve. No network access.

## Design decisions

- **A spread, never one title.** A title is a judgement call about emphasis, and the researcher can only
  make it by seeing the alternatives side by side with their tradeoffs named.
- **Declarative is recommended, not imposed.** Some subfields still expect descriptive titles, and a
  title clashing with venue norms is a liability however good it is. So it asks.
- **Written from the paper, not from a description**, since a title built on a topic will name the topic.
- **Overclaiming checked on every option.** A declarative title asserts a finding, and a title is the
  most visible place in a paper to assert one too strongly. Every option is verified against what the
  results actually show.
- **Values must match exactly.** No rounding, ever, in a title.
- **`--` is permitted in compound names.** `graphene--MnO$_2$` is correct typography and one of the en
  dash's legitimate uses, alongside numeric ranges.
- **Brief interview.** Three questions. A long interrogation for a ten-word output would be absurd.

## Sources

Module 2 of *Curso de Escrita Científica* by Prof. Dr. Valtencir Zucolotto, IFSC/USP, transcript in
[`sources/`](../sources/curso_escrita_cientifica_valtencir_zucolotto.md). The writing order is from
Module 4.

## Changelog

- **0.1.0**: initial version.
