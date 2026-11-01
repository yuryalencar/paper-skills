# /update-results-discussion

> Integrates new or revised data, applies reviewer suggestions, or resumes a stalled draft, without
> touching your interpretations.

**Status:** alpha · **Version:** 0.1.0 · **Invocation:** `/update-results-discussion` ·
**Auto-loads:** yes
**Companion skills:** [paper-writing-style](paper-writing-style.md),
[create-results-discussion](create-results-discussion.md),
[review-results-discussion](review-results-discussion.md)

## What it does

This is the most frequently updated section in any manuscript: reviewers ask for extra experiments,
data gets reanalysed, and drafts stall partway through the figure list. Three modes:

| Mode | When |
| :--- | :--- |
| **A. Integrate data** | New figures, changed values, a reanalysis |
| **B. Apply suggestions** | Reviewer comments, co-author notes, `/review-results-discussion` output |
| **C. Resume** | The draft stops partway through the figure list |

It states the mode before starting, and runs B, then C, then A where several apply.

Mode A differs from reconcile in the other update skills: this section *is* the paper's evidence, so
what it reconciles against is the data itself.

## When to use it

- You reran an experiment and the numbers changed.
- Reviewers asked for a new figure or a comparison against a specific paper.
- A reviewer called the discussion superficial.
- You wrote blocks for the first three figures and stopped.

## When *not* to use it

- **You want the new interpretation written.** When new data contradicts an old interpretation it
  flags it and asks you. It will not rewrite the science.
- **No section exists.** Use [create-results-discussion](create-results-discussion.md).
- **You want a diagnosis.** Use [review-results-discussion](review-results-discussion.md).

## Install

```
/plugin marketplace add yuryalencar/paper-skills
/plugin install update-results-discussion@yuryalencar-paper-skills
/plugin install paper-writing-style@yuryalencar-paper-skills
```

Or `./install.sh update-results-discussion paper-writing-style`.

## Inputs

| Input | Selects mode |
| :--- | :--- |
| New or changed figures, tables or data files | A, integrate |
| Reviewer comments or co-author notes | B, apply |
| `/review-results-discussion` output | B, apply |
| A section that stops mid-figure-list | C, resume |

It reads the figures and data files directly rather than relying on your summary, since the point of
mode A is to catch what you may not have noticed changed.

**Language.** Follows the language you open in. Output LaTeX is English.

## Outputs

The detected mode, then the consequences in severity order (A), a numbered account of every suggestion
(B), or a figure-list inventory showing where the draft stopped (C). Then **only the blocks that
changed** as LaTeX fragments, and a list of which *other* sections are now stale.

## Example, mode A

```
> /update-results-discussion  (after rerunning the cycling test)

Mode A: integrating revised data. Fig. 4 and Table 2 differ from what the
section describes.

CONSEQUENCES

1. INTERPRETATION CONTRADICTED  (¶7)
   You wrote: "attributed to the hierarchical structure, which
   accommodates volume change during cycling"
   Old data: GMP retained 95%, the best of the three
   New data: GMP retained 71%, now the worst  (Fig. 4b)

   Your interpretation was built on GMP performing best. It no longer
   does. I am not going to write you a new mechanism. What does the
   reversal mean?

2. COMPARISON NO LONGER HOLDS  (¶7)
   "exceed the 75 to 85% reported for comparable composites" is now
   false for GMP at 71%. The claim needs narrowing to GM and GMC, or
   restating.

3. VALUE MISMATCH  (¶6)  93% -> 91%, per Table 2.

NOW STALE ELSEWHERE

- Abstract states 95% retention. Run /update-abstract.
- Conclusions claim GMP is the preferred electrode. Run
  /update-conclusions after you have settled point 1.
```

That last block matters: changed results almost always invalidate the abstract and conclusions, and
this skill tells you what to fix rather than silently editing sections outside its remit.

## Reviewer comment patterns

| Comment | Usually means |
| :--- | :--- |
| "The discussion is superficial" | Interpretation and comparison classes are thin |
| "How does this compare to X?" | A missing comparison. It asks for the values, never invents them |
| "The mechanism is not supported" | The interpretation overclaims. You decide how to soften it |
| "Figure N is unclear" | Usually the caption, not the figure |
| "Too long" | Which blocks compress. Background sentences are the usual candidate |
| "Statistics needed" | Out of scope for wording. Flagged and left |

Every suggestion is accounted for, including the ones not applied and why.

## Side effects

Reads `.tex`, `.bib`, figures, captions, tables and data files. Writes nothing unless you approve. Never
edits the abstract, introduction or conclusions even when it reports them as stale. No network access.

## Design decisions

- **Interpretations are preserved verbatim** unless the data breaks them, in which case they are
  flagged and handed back. This is the strictest preservation rule in the family, because an
  interpretation is a scientific claim with the researcher's name on it.
- **Mode A reconciles against the data, not the manuscript**, since this section is the evidence rather
  than a summary of it.
- **Reads the figures and data files directly**, because mode A exists to catch changes the researcher
  may not have tracked.
- **Reports downstream staleness without editing downstream.** Changed results invalidate the abstract
  and conclusions; naming them and pointing at the right skill respects section boundaries and keeps
  each change reviewable.
- **Only changed blocks are emitted.** The section is long, and showing the whole thing every round
  makes it impossible to see what moved.
- **Resume mode inventories the figure list first**, since a stalled draft stops mid-list rather than
  mid-sentence, and it checks whether the figure order still tells a story.

## Sources

Module 4 of *Curso de Escrita Científica* by Prof. Dr. Valtencir Zucolotto, IFSC/USP, transcript in
[`sources/`](../sources/curso_escrita_cientifica_valtencir_zucolotto.md). The revision and response
process is from Module 8.

## Changelog

- **0.1.0**: initial version, with the three-mode design from the start.
