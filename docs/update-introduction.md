# /update-introduction

> Moves an existing introduction forward: reconciles it with a changed paper, applies suggested
> changes, or resumes a half-written draft.

**Status:** alpha · **Version:** 0.1.0 · **Invocation:** `/update-introduction` ·
**Auto-loads:** yes · **Tags:** `research`
**Companion skills:** [paper-writing-style](paper-writing-style.md),
[create-introduction](create-introduction.md), [review-introduction](review-introduction.md)

## What it does

Three situations, and every introduction meets all of them eventually:

| Mode | When |
| :--- | :--- |
| **A. Reconcile** | Results changed, so the introduction no longer sets up the paper it belongs to |
| **B. Apply suggestions** | Reviewer comments, co-author notes, or `/review-introduction` output |
| **C. Resume** | The draft stopped partway, usually after the gap |

It states the mode before starting. Where several apply it runs B, then C, then A, so
reconciliation happens last over finished text.

It is a **revision, not a rewrite**. What still holds stays as you wrote it.

## When to use it

- You added or dropped results and the introduction's gap no longer matches.
- Reviewers said the contribution or novelty was unclear.
- A co-author sent notes.
- You wrote the context and gap months ago and never finished.
- Time passed and you suspect the state of the art has aged.

## When *not* to use it

- **No introduction exists.** Use [create-introduction](create-introduction.md).
- **You want a diagnosis, not changes.** Use [review-introduction](review-introduction.md).

## Install

```
/plugin marketplace add yuryalencar/ai-skills
/plugin install update-introduction@yuryalencar-ai-skills
/plugin install paper-writing-style@yuryalencar-ai-skills
```

Or `./install.sh update-introduction paper-writing-style`.

## Inputs

| Input | Selects mode |
| :--- | :--- |
| Nothing, manuscript present | A, reconcile |
| Reviewer comments or co-author notes | B, apply suggestions |
| `/review-introduction` output | B, apply suggestions |
| A visibly incomplete introduction | C, resume |
| Comments *and* a changed manuscript | B then A |

**Language.** Follows the language you open in, for the whole run. Output LaTeX is English.

## Outputs

The detected mode, then a divergence table (A), a numbered account of every suggestion (B), or a
categorization of what exists and what is missing (C). Then the revised introduction as a LaTeX
fragment with `% UPDATED:` and `% ADDED:` comments, and a summary. Nothing written until you
approve.

## The seven ways an introduction drifts

Mode A checks each of these specifically:

1. **The gap is no longer answered.** Most serious. Reviewers catch this and it makes the paper
   read as incoherent.
2. **The purpose no longer matches** the abstract or the conclusions.
3. **A promise is unkept**: the introduction raises something the results never address.
4. **A result is unmotivated**: the results cover something the introduction never set up, so the
   reader meets it unprepared.
5. **The state of the art has aged.** It checks your newest citation's year against today.
6. **Obsolete method or material names.**
7. **Broken citation keys** no longer in the `.bib`.

## Example, mode C

```
> /update-introduction
```

```
Mode C: resuming. The draft has context and gap but stops there.

WHAT EXISTS

  ¶1 CONTEXT   complete
  ¶2 CONTEXT   complete
  ¶3 GAP       complete, ends mid-argument: "...has not been quantified."
  --- draft stops here ---

MISSING: STATE OF THE ART, PURPOSE

I can recover both from the paper rather than asking you to repeat yourself.
Your results section measures shear stability over 30 days, and refs.bib has
Park 2024 and Mendes 2025 as the only entries newer than your ¶3 citations,
both on crosslinking. That gives me the state of the art and a purpose that
answers your existing gap.

One thing I cannot recover: ¶3 says the property "has not been quantified",
but Mendes 2025 quantifies it under static conditions. Is your gap
specifically about *dynamic* conditions? If so ¶3 needs one qualifying word,
or a reviewer will call the gap overstated.
```

Note the funnel check across the join. A resumed introduction commonly widens back out at the
point where writing restarted, because the writer lost the thread. That is the defect this mode
watches for.

## Reviewer comment patterns

Mode B recognizes the recurring requests and says which movement it targeted:

| Comment | Usually means |
| :--- | :--- |
| "The contribution is unclear" | The purpose paragraph, or the gap. Not both |
| "The novelty is not clear" | A gap problem, not a purpose problem |
| "Related work is incomplete" | State of the art. It asks which papers; it will not invent them |
| "Too long" | Which movement gives way. Context is the usual candidate, but you choose |

Every suggestion is accounted for, including the ones not applied and why.

## Side effects

Reads `.tex` and `.bib` files, figures and captions. Writes nothing unless you approve. No network
access.

## Design decisions

- **Three modes**, matching the rest of the family. The researcher pointed out that reconciling
  against a changed paper is the *least* common reason to update a section; incorporating
  suggestions and resuming after a pause are commoner and apply everywhere.
- **The seven drift patterns are enumerated**, because introduction drift is predictable and a
  checklist catches more than a general comparison.
- **The funnel is rechecked across the resume join.** This is the specific failure of mode C.
- **Reviewer outranks the style guide**, with the tension noted.
- **Never invent recent literature**, in any mode. No network access, and a fabricated frontier is
  worse than an acknowledged gap.
- **Resume does not restyle.** Mixing a resume with a critique makes both worse.
- **Never assume the paper wins** in mode A: the body may have changed by mistake.

## Sources

Module 3 (the four movements and three dimensions), Module 4 (the writing order) and Module 8 (the
revision and response process) of *Curso de Escrita Científica* by Prof. Dr. Valtencir Zucolotto,
IFSC/USP, transcript in [`sources/`](../sources/curso_escrita_cientifica_valtencir_zucolotto.md).

## Changelog

- **0.1.0**: initial version, with the three-mode design from the start.
