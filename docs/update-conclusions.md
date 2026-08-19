# /update-conclusions

> Checks each conclusion still follows from the evidence, applies suggested changes, or finishes an
> unfinished section, without rewriting your claims.

**Status:** alpha · **Version:** 0.1.0 · **Invocation:** `/update-conclusions` ·
**Auto-loads:** yes · **Tags:** `research`
**Companion skills:** [paper-writing-style](paper-writing-style.md),
[create-conclusions](create-conclusions.md), [review-conclusions](review-conclusions.md)

## What it does

The conclusions are downstream of everything, so when results change this is the section most likely to
become quietly false. A conclusion is a claim, and claims do not survive changed evidence.

| Mode | When |
| :--- | :--- |
| **A. Reconcile** | Results changed and a claim may no longer follow |
| **B. Apply suggestions** | Reviewer comments, co-author notes, `/review-conclusions` output |
| **C. Resume** | The section is unfinished, almost always missing the contribution |

It states the mode before starting, and runs B, then C, then A where several apply.

## When to use it

- Results were revised, added, or removed.
- Reviewers said the conclusions overstate the findings.
- You were asked to add limitations or future work.
- You wrote the result restatement and never wrote the contribution.

## When *not* to use it

- **You want a replacement claim written.** When revised data breaks a conclusion it flags it and asks
  you. Writing a new claim is inventing science under your name.
- **No conclusions exist.** Use [create-conclusions](create-conclusions.md).
- **You want a diagnosis.** Use [review-conclusions](review-conclusions.md).

## Install

```
/plugin marketplace add yuryalencar/ai-skills
/plugin install update-conclusions@yuryalencar-ai-skills
/plugin install paper-writing-style@yuryalencar-ai-skills
```

Or `./install.sh update-conclusions paper-writing-style`.

## Inputs

| Input | Selects mode |
| :--- | :--- |
| Nothing, with a manuscript present | A, reconcile |
| Reviewer comments or co-author notes | B, apply |
| `/review-conclusions` output | B, apply |
| A section missing its contribution | C, resume |

It needs the conclusions, the results and discussion, the introduction and the abstract. All four are
used.

**Language.** Follows the language you open in. Output LaTeX is English.

## Outputs

The detected mode, then a severity-ordered table of claims against current evidence (A), a numbered
account of every suggestion (B), or movement labels showing what is missing (C). Then the revised
section as a LaTeX fragment with `% UPDATED:`, `% ADDED:` and `% FLAG:` comments.

## The seven ways conclusions go stale

Mode A checks each:

1. **A claim the results no longer support.** Most serious. It stops and asks you rather than rewriting.
2. **A value that no longer matches** the results section.
3. **The principal result is no longer principal**, because new data promoted a different finding.
4. **The contribution no longer answers the introduction's gap**, usually because the gap was rewritten.
5. **A new finding important enough to conclude on** that is missing.
6. **A claim contradicting the abstract's closing sentences.**
7. **Grandiosity that has become untenable**, because a weaker result makes a broad claim look worse.

## Example, mode A

```
> /update-conclusions

Mode A: reconciling against the results.

| Conclusions claim         | Results now show      | Where    | Severity |
|---------------------------|-----------------------|----------|----------|
| "crosslinking determines  | GMP crosslinked, but  | Fig. 4b  | HIGH     |
|  cycling durability"      | retained only 71%     |          |          |
| 96% retention             | 91%                   | Table 2  | MEDIUM   |
| "viable for implantable   | shear data now shows  | Sec. 3.5 | HIGH     |
|  supercapacitors"         | delamination at 30 d  |          |          |

Two of these are claims, not numbers, and I am not going to rewrite them
for you.

Claim 1 rested on all crosslinked films outperforming untreated ones. GMP
is crosslinked and now performs worst. Does crosslinking still determine
durability, with GMP explained by something else, or does the claim need
narrowing to GM and GMC?

Claim 3 is the contribution sentence, and the new shear result works
against it. This is the sentence a reviewer will attack. What does the
delamination finding do to your viability claim?

I have applied the 96% -> 91% correction, since the claim around it is
unaffected. Correct me if that value should have stayed.
```

## Reviewer comment patterns

| Comment | Usually means |
| :--- | :--- |
| "The conclusions overstate the findings" | Grandiosity, or a claim wider than the evidence. You set how far to pull back |
| "The contribution is unclear" | The contribution movement is missing or buried |
| "This just repeats the results" | The funnel does not widen, or text was copied |
| "Add limitations" / "Add future work" | It asks whether your journal wants them here or in the discussion |

Every suggestion is accounted for, including those not applied and why.

## Side effects

Reads `.tex` and `.bib` files. Writes nothing unless you approve. Never edits the abstract even when it
reports divergence; it suggests `/update-abstract` instead. No network access.

## Design decisions

- **Claims are never rewritten, only flagged.** The distinction that drives this whole skill: a value
  correction is mechanical and gets applied with the assumption stated, while a claim is a scientific
  assertion and gets handed back. The example above shows both happening in one run.
- **Seven enumerated staleness patterns**, since conclusions go stale predictably and a checklist beats
  a general comparison.
- **The contribution is asked for in mode C**, never proposed. It is the one thing that cannot be
  recovered from the manuscript, because what the field gains is a judgement.
- **Everything else in mode C is recovered from the paper**, so you are not asked to repeat what the
  results and introduction already say.
- **The funnel is rechecked across the resume join**, where a restarted section commonly drops back into
  experimental detail.
- **Never assume the results win.** The body may have changed by mistake.
- **Reviewer outranks the style guide**, with the tension noted.

## Sources

Module 4 of *Curso de Escrita Científica* by Prof. Dr. Valtencir Zucolotto, IFSC/USP, transcript in
[`sources/`](../sources/curso_escrita_cientifica_valtencir_zucolotto.md). The revision and response
process is from Module 8.

## Changelog

- **0.1.0**: initial version, with the three-mode design from the start.
