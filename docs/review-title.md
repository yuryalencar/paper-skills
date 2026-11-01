# /review-title

> Seven checks on your title, from crutch phrases to overclaiming, then two or three rewrites. Short
> skill, short review.

**Status:** alpha · **Version:** 0.1.0 · **Invocation:** `/review-title` ·
**Auto-loads:** yes
**Companion skills:** [paper-writing-style](paper-writing-style.md),
[create-title](create-title.md), [update-title](update-title.md)

## What it does

Runs seven checks and reports only what fails:

| # | Check |
| :--- | :--- |
| 1 | Descriptive or declarative? Does it state the contribution or name the topic? |
| 2 | Crutch phrases: `A study of`, `An investigation into`, `Novel`, `Towards a` |
| 3 | Length: can a reader form an idea from it? Journal limit? |
| 4 | Keywords: would someone searching for this work find it? |
| 5 | Abbreviations: any the audience would not universally recognize? |
| 6 | **Overclaiming**: does it claim exactly what the results show? |
| 7 | Style: nominalization, vagueness, words that could head any paper |

If the title passes everything, it says so in a sentence or two and stops. A good title needs no essay.

## When to use it

- Before submitting.
- An editor or reviewer commented on the title.
- You want to know whether your descriptive title should be declarative.

## When *not* to use it

- **No title yet.** Use [create-title](create-title.md).
- **You already know what to change.** Use [update-title](update-title.md).

## Install

```
/plugin marketplace add yuryalencar/paper-skills
/plugin install review-title@yuryalencar-paper-skills
/plugin install paper-writing-style@yuryalencar-paper-skills
```

Or `./install.sh review-title paper-writing-style`.

## Inputs

The title, pasted or from a `.tex` file. **Give it the paper too** if you can: checks 1 and 6 are
impossible without the abstract, conclusions and results, since neither "does this state the actual
contribution" nor "does this overclaim" can be answered from the title alone. It reports which checks it
could not run rather than guessing.

**Language.** Reviews in the language you open in. Proposed titles are English.

## Outputs

The failing checks, most serious first, with overclaiming and crutch phrases at the top since those are
what an editor reacts to. Then two or three rewritten options with word counts, and which it would pick.

## Example

```
> /review-title

Current: "A Study of Novel Graphene-Based Coatings for the Investigation of
          Supercapacitor Electrode Cycling Durability Properties"

FAILING CHECKS

2. CRUTCH PHRASES  (three of them)
   "A Study of"                 -> delete
   "Novel"                      -> delete. If you are reporting it, it is new
   "for the Investigation of"   -> delete
   Deleting all three loses nothing: "Graphene-Based Coatings for
   Supercapacitor Electrode Cycling Durability" still identifies the work.

3. LENGTH  16 words, and the useful content starts at word 4.

1. DESCRIPTIVE  Names the topic, states no finding. Your conclusions lead
   with crosslinking as the determining factor, which is a much stronger
   title than "durability properties".

7. STYLE  "Durability Properties" is a nominalization with a redundant
   head noun. Durability is already a property.

REWRITES

  Option 1  declarative, 11 words
  \title{Crosslinking determines cycling durability in graphene supercapacitor electrodes}

  Option 2  declarative with the value, 10 words
  \title{Crosslinked graphene electrodes retain 96\% capacitance over 3000 cycles}

  Option 3  descriptive but tightened, 8 words
  \title{Cycling durability of crosslinked graphene supercapacitor electrodes}

I would pick option 1. It states your actual contribution, survives being
read out of context, and avoids committing to a number in the title.
```

## The check that matters most

**Overclaiming.** A declarative title makes a claim, and the title is the most visible place in a paper
to make one too strongly. It checks three things specifically: whether a claim conditional in the paper
became unconditional in the title, whether a value in the title matches the results exactly, and whether
the title generalizes beyond the systems studied.

It will never propose a claim your paper does not support, even where it would make a stronger title.
That is the single most likely way a title skill could damage a paper.

## Side effects

Reads `.tex` files. Writes nothing unless you approve. No network access.

## Design decisions

- **Only failures are reported.** Seven passing checks listed as passing is noise for a ten-word input.
- **Overclaiming and crutch phrases lead**, because those are what an editor reacts to first.
- **Descriptive is a finding, not a fault.** It reports the descriptive-versus-declarative situation and
  shows the alternative rather than calling the current title wrong, since some subfields expect
  descriptive titles.
- **Missing-paper honesty.** It names which checks it could not run instead of quietly skipping them.
- **Rewrites come as a small spread**, matching `/create-title`, because emphasis is the researcher's call.
- **Proportionate output.** A sound title gets two sentences.

## Sources

Module 2 of *Curso de Escrita Científica* by Prof. Dr. Valtencir Zucolotto, IFSC/USP, transcript in
[`sources/`](../sources/curso_escrita_cientifica_valtencir_zucolotto.md). Style checks via
[paper-writing-style](paper-writing-style.md).

## Changelog

- **0.1.0**: initial version.
