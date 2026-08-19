# /create-abstract

> Writes a scientific paper abstract as a LaTeX fragment, following the six-part model, by
> interviewing you for what it does not know.

**Status:** alpha · **Version:** 0.1.0 · **Invocation:** `/create-abstract` ·
**Auto-loads:** yes · **Tags:** `research`
**Companion skills:** [paper-writing-style](paper-writing-style.md) (style rules),
[review-abstract](review-abstract.md) (critique an existing one),
[update-abstract](update-abstract.md) (reconcile with a changed paper)

## What it does

Produces a publication-quality abstract built on the six-part model from Zucolotto's course:
contextualization, gap, purpose, methods, results, conclusions. It does not draft from
whatever you happened to say first. It interviews you until every mandatory part can be
written from real information, drafts once, then refines with you until you are satisfied.

Output is an English LaTeX fragment with structure labels, so you can see which part each
sentence implements and argue with the choices.

## When to use it

- Starting an abstract from a description of finished work.
- You have a written manuscript and need the abstract that belongs to it.
- Your abstract was rejected as unclear and you want to rebuild it on a known structure.

## When *not* to use it

- **The work is not finished.** The course is explicit that the abstract is written near the
  end, after results, conclusions, introduction and methods. An abstract for work in progress
  will be built on results that change.
- **You already have an abstract you basically like.** Use [review-abstract](review-abstract.md)
  to critique it, which preserves your wording.
- **The paper changed and the abstract is now stale.** Use
  [update-abstract](update-abstract.md), which reconciles rather than rewrites.
- **You are writing a review article or short communication.** The six-part model is for
  regular research articles. Review articles legitimately consist mostly of context and gap.

## Install

```
/plugin marketplace add yuryalencar/ai-skills
/plugin install create-abstract@yuryalencar-ai-skills
/plugin install paper-writing-style@yuryalencar-ai-skills
```

Or `./install.sh create-abstract paper-writing-style` / `.\install.ps1 create-abstract paper-writing-style`.

Install `paper-writing-style` alongside it. The skill works without it, falling back to a
condensed rule set, but the full rulebook is what makes the prose hold up.

## Inputs

Any of these, or none:

| Input | Effect |
| :--- | :--- |
| A short description of the work | The normal starting point. Expect several questions after it |
| Path to a manuscript `.tex` | Read first, so it asks only what the paper does not answer |
| Path to a results section | Same, for the results and conclusions parts |
| Nothing at all | It starts from the interview |

It also reads your working directory on its own to find `.tex` files, `.bib` keys and the
citation style in use. You do not need to tell it any of that.

**Language.** It interviews you in the language you open in, and stays in that language for
the whole run. If you start in English it stays in English. The LaTeX it produces is always
English, because the source course is emphatic that papers are written in English and warns
specifically against Portuguese sentence structure carried over into English words.

## Outputs

An English LaTeX fragment, shown in chat in a fenced block, plus the word count and a short
note on the choices made. Nothing is written to disk until you approve it, and then only where
you say.

The fragment is class-agnostic: it drops into `elsarticle`, `IEEEtran`, `revtex`, `achemso` or
plain `article` with no preamble changes.

## Example

```
> /create-abstract silver nanoparticle cytotoxicity in wound dressings
```

It reads the directory, finds `main.tex` and `refs.bib` with `natbib`, then asks about the
target journal, the gap, the principal result with values, and the contribution. Then:

```latex
% CONTEXTUALIZATION
Silver nanoparticles are widely used as antimicrobial agents in wound dressings
\citep{silva2024}.
% GAP
However, their long-term cytotoxicity towards human keratinocytes remains poorly understood.
% PURPOSE
In this paper, we report the cytotoxicity of citrate-capped silver nanoparticles towards
HaCaT keratinocytes over 72\,h.
% METHODS
Cell viability was assessed by MTT assay and membrane integrity by lactate dehydrogenase
release.
% RESULTS
Viability fell to 62\% at 25\,\textmu g\,mL$^{-1}$ and to 18\% at 100\,\textmu g\,mL$^{-1}$,
while lactate dehydrogenase release increased threefold over the same range.
% CONCLUSIONS
These results indicate a concentration threshold below which silver dressings remain
compatible with keratinocyte monolayers, which is directly relevant to the design of
antimicrobial wound care materials.
```

> 214 words. Contextualization kept to one sentence because ACS Nano's audience already has
> the field. The gap is framed as a durability question so the purpose answers it directly.

Then it asks what to change. Expect to push back on the gap; that is the part only you can
settle.

## Structure labels and TODO markers

`% CONTEXTUALIZATION` and friends are ordinary LaTeX comments naming the model part. Strip
them with a regex over `^% [A-Z ]+$` when you are done, or leave them as a map of the section.

`% TODO:` marks something it refused to invent:

```latex
% RESULTS
Viability fell to 62\% at the highest concentration tested
% TODO: confirm the LDH release factor, the results section gives two different values
```

Every `% TODO:` names exactly what is missing. This is deliberate: the skill will not produce
a plausible number, because a fabricated result is worse than a visible gap.

## Side effects

Reads files in your working directory to detect context. Writes nothing unless you approve it
and say where. No network access.

## Design decisions

From the authoring interview, recorded so the next revision does not relitigate them:

- **Interview before drafting, always.** Drafting from a one-line description and asking
  afterwards was rejected: the gap and the principal result are exactly what a short
  description omits, and they are what the abstract lives on.
- **Interview language follows the user and locks for the run**, output is always English.
- **Journal is asked, not assumed.** Module 1 establishes that audience changes the writing:
  a specialist venue needs little field justification, a broad one needs the whole field
  motivated. Word limit and structured-abstract format follow from it too.
- **Fragments, not full documents**, so output pastes into an existing manuscript.
- **Citation style detected, not assumed**, by reading `.bib` files and grepping for
  `natbib`/`biblatex` and existing `\cite` calls.
- **Chat first, files only on approval**, to keep the draft-check-refine loop fast and never
  touch a manuscript unasked.
- **Never invent numbers or citation keys.** This is the one rule with no exception.
- **No em dashes**, on the researcher's instruction, since they read as generated text. `--`
  survives in numeric ranges only, where it is correct typography.

## Sources

Distilled from *Curso de Escrita Científica: Produção de Artigos de Alto Impacto* by
Prof. Dr. Valtencir Zucolotto, IFSC/USP, transcript in
[`sources/`](../sources/curso_escrita_cientifica_valtencir_zucolotto.md). The six-part model
and the categorization method are from Module 2.

## Changelog

- **0.1.0**: initial version. Abstract vertical slice, phase 1.
