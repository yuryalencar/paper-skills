# /draft

> Turns the material you already have into a first version of one section, or a skeleton of the whole paper,
> with a red TODO wherever the section needs something your material does not supply.

**Status:** alpha · **Version:** 0.1.0 · **Invocation:** `/draft <section | paper> [sources]` ·
**Auto-loads:** yes
**Companion skills:** [write](write.md), [review](review.md), [organize](organize.md),
[ask-paper](ask-paper.md), [paper-writing-style](paper-writing-style.md)

## What it does

You have notes, a folder of results, a few links, a local project or other papers, and no text yet. `/draft`
reads all of it, maps it onto the section's model, writes every part the material supports, and for each part
it does not, leaves a **red TODO** saying what to supply and why the section needs it. You get something
concrete to react to, and a list of exactly what is missing.

It is not [write](write.md). `/write` interviews you first and then drafts. `/draft` drafts first, from what
exists, and its TODOs become the agenda for `/write`.

Output follows the same house style as every other skill, as an English LaTeX fragment.

## The paper type decides the structure

A systematic mapping study, a tool paper and an industry paper are not built the same way. So before it
drafts, `/draft` asks what kind of paper this is, what it is about, who it is for and which venue it targets,
and talks it through if that leaves the type unclear.

**It does not know a type's structure, and will not pretend to.** The course models the sections of a paper,
not paper types, so a structure written from general knowledge would be an invention that sounds
authoritative. It gets the structure from you, in this order:

1. the venue's author guidelines or template (read from `/organize`'s profile, or a URL),
2. the project's own `\input` list and `src/` files,
3. **your exemplars folder**: previously accepted papers from the same venue and track (see below),
4. other example papers of that type you supply, labelled section by section so only what recurs is kept,
5. your own outline.

It shows you the structure with the source for each section before drafting against it. If none of them
exists, it says the structure is not grounded, drafts only what does not depend on it, and leaves a TODO
asking for the one that would help most.

## The exemplars folder

The best way to give `/draft` a structure is to show it what your target venue has already accepted. Create
an `exemplars/` folder in the project, and put there the papers from the **venue and track you are aiming
for**: previous accepted papers, or the papers a systematic mapping of that track turned up. Ideally 5 to 10
of the same paper type, in `exemplars/<venue-or-track>/`.

[organize](organize.md) creates it in every project, with a `.gitkeep`. `/draft` suggests creating it in an
older project that lacks one, and asks you to fill it when it is empty.

- **Keep it out of git and out of Overleaf.** The papers are other people's copyrighted work and the folder
  can be large. `.gitignore` ignores its contents and keeps the `.gitkeep`.
- **What `/draft` takes from it is structure:** which sections exist, in what order, how long, and what each
  does, keeping only what recurs and saying how many papers it appears in. It never takes sentences, results
  or claims, and facts from these papers are cited as evidence, not reused.

## When to use it

- You have material but no text yet, and want a first version to react to.
- You want a skeleton of the whole paper before writing any section.
- You want to see what a section is missing, concretely, before the interview.

## When *not* to use it

- **The section already has text.** It stops and points at [write](write.md) to update it or
  [review](review.md) to critique it. It never overwrites.
- **You have almost nothing and want to be guided.** It will still draft, mostly TODOs, but
  [write](write.md) is the better start.
- **You want methods, related work or a review article.** The course gives no model for them, so none is
  drafted. See [`todo/`](../todo/methods-family.md).

## Install

```
/plugin marketplace add yuryalencar/paper-skills
/plugin install draft@yuryalencar-paper-skills
/plugin install write@yuryalencar-paper-skills
/plugin install paper-writing-style@yuryalencar-paper-skills
```

Or `./install.sh draft write paper-writing-style` / `.\install.ps1 draft write paper-writing-style`.

**Install `write` alongside it.** `/draft` reuses each section's model from `/write`'s references rather than
keeping a second copy that could drift, and stops if it cannot find them.

## Inputs

| Input | Used as |
| :--- | :--- |
| The section, or `paper` | The target |
| Your notes, drafts and results | The content of the draft |
| A local file, folder or whole project | What was built and measured |
| The `exemplars/` folder | **The structure** of the draft, by what recurs across the papers. Also evidence to cite |
| Other people's papers and links | **Evidence and citations only.** Never their sentences, never their results as yours |
| Answers about the paper | Type, topic, audience, venue |
| Venue guidelines, example papers, an outline | The source of the structure |

If a link cannot be fetched it asks you to paste the content, and does not summarise a page it did not read.

## Outputs

- A **LaTeX fragment** in chat, with the model's structure comments. Gaps are red `\todo{}` markers placed
  where the missing content belongs.
- The **TODO list only**, in the order to resolve them, one line each, then the next step.
- **Proposed `.bib` entries**, built only from metadata it actually read. They are added after you approve.
- Written to `src/<section>.tex` only after you have seen it.
- `paper-out/` is updated every run, as every skill does.

Where the project has no `\todo{}` macro it proposes a red-rendering one and asks before adding it.

## Example

```
> /draft conclusions src/results.tex notes.md

Paper type? -> empirical study, targeting an experimental journal.
I will use the conclusions model: your result, a brief interpretation, the contribution.
```

```latex
% PRINCIPAL RESULT
Crosslinking raised capacitance retention from 71\% to 96\% over 3000 cycles.
% INTERPRETATION
\todo{Brief interpretation: what the retention result means. The conclusions widen from your result to
the field, and this is the step that links them. Probably the mechanism in your notes.}
% CONTRIBUTION
\todo{Contribution sentence: what the field can do now that it could not before. This closes the funnel at
its widest point. It should follow from the durability gap in your introduction.}
```

```
TODO list, in order:
1. Contribution sentence (mandatory)
2. Brief interpretation (mandatory)

Next: /write conclusions, which asks for both.
```

The result sentence and its numbers come from `src/results.tex`. The two missing parts are red in the PDF.

## Side effects

Reads the files and links you point at. Writes nothing to your manuscript or `.bib` until you approve, apart
from the `paper-out/` update, which it names. Fetches URLs over the network.

## Design decisions

The authoring interview, recorded so the next revision does not relitigate it.

- **Goal.** Help researchers with scattered material get a first-pass draft, with red TODOs wherever the
  section's model needs something the material lacks, so they have a concrete version to react to without
  anything being invented.
- **A separate skill from `/write`.** Different contract: material in, first version out, no interview up
  front. `/write` stays the interview-led path and `/draft` hands off to it.
- **Scope is the seven modelled sections plus a whole-paper skeleton.** The skeleton gets prose only for
  sections the course models. Related work and review articles need exemplars from the researcher first,
  per the repository rule against inventing models.
- **Paper type is asked, and its structure comes from the researcher.** Added at the researcher's
  instruction, because a systematic mapping, a tool paper and an industry paper are structured differently.
  A built-in catalogue was rejected because it would be written from general knowledge, which is exactly
  the invention the repository forbids.
- **Other papers are evidence and citations only.** Their facts are cited through `.bib` keys; their
  sentences and results are never reused.
- **An exemplars folder grounds the structure.** Added at the researcher's instruction: previously accepted
  papers from the target venue and track show what that venue accepts, so the structure is derived from
  what recurs across them. It is the one place other papers shape the draft, and only their structure does.
  The folder is gitignored because the papers are copyrighted and large.
- **Chat first, file on approval.** Same as `/write`. Gaps use the project's red `\todo{}`.
- **Thin material still gets a draft**, mostly TODOs. The TODOs are the interview agenda for `/write`.
- **Citations are proposed, not added.** Entries are built only from metadata actually read, and a missing
  detail becomes a TODO.
- **TODO list only after the draft**, with no coverage table: the red markers carry the rest.
- **Reuses `/write`'s section models** rather than duplicating them, at the cost of requiring `/write`.
- **Updates `paper-out/` every run**, like every skill.

## Sources

The section models are Zucolotto's, from *Curso de Escrita Científica: Produção de Artigos de Alto Impacto*,
transcript in [`sources/`](../sources/curso_escrita_cientifica_valtencir_zucolotto.md). The categorization
method used on example papers is from Module 2. The course gives no paper-type structures, which is why they
come from the researcher.

## Changelog

- **0.1.0**: initial version.
