# /update-title

> Catches a title that no longer matches the paper, applies an editor's request, or replaces the working
> title now that the paper is finished.

**Status:** alpha · **Version:** 0.1.0 · **Invocation:** `/update-title` ·
**Auto-loads:** yes · **Tags:** `research`
**Companion skills:** [paper-writing-style](paper-writing-style.md),
[create-title](create-title.md), [review-title](review-title.md)

## What it does

Titles go stale more often than researchers notice, because the working title is written first and the
paper's centre of gravity moves during writing and revision.

| Mode | When |
| :--- | :--- |
| **A. Reconcile** | The paper changed, so the title may name a finding it no longer supports |
| **B. Apply suggestions** | An editor or reviewer asked for a change, or `/review-title` output |
| **C. Finalize** | The title is a working placeholder and the paper is now done |

Modes A and C usually coincide, and that is the normal case. The course puts the title last precisely
because it should be revisited at the end.

## When to use it

- Results changed during revision and you have not looked at the title since.
- An editor said the title is too long, overstates the results, or should reflect the main finding.
- You are about to submit and the title is still the one you typed on day one.

## When *not* to use it

- **No title exists.** Use [create-title](create-title.md).
- **You want a diagnosis.** Use [review-title](review-title.md).

## Install

```
/plugin marketplace add yuryalencar/ai-skills
/plugin install update-title@yuryalencar-ai-skills
/plugin install paper-writing-style@yuryalencar-ai-skills
```

Or `./install.sh update-title paper-writing-style`.

## Inputs

| Input | Selects mode |
| :--- | :--- |
| Nothing, with a finished manuscript | A, and usually C as well |
| An editor's or reviewer's comment | B |
| `/review-title` output | B |
| A title you describe as provisional | C |

Needs the abstract, conclusions and results. All three modes use them.

**Language.** Follows the language you open in. Titles are English.

## Outputs

The detected mode, the findings, then **always a spread of options**, never a single title, each labelled
by strategy with a word count and an annotation. Plus which it would pick and why. It finishes by
checking whether the abstract and conclusions still agree with the chosen direction.

## The six ways a title goes stale

Mode A checks each:

1. **It names a finding the paper no longer supports.** Most serious, and the most visible place in a
   paper to be wrong.
2. **A value no longer matches the results.**
3. **The principal finding changed**, so the title emphasizes the wrong result.
4. **It no longer matches the abstract's purpose or the conclusions' contribution.** All three should
   point the same way.
5. **The scope drifted**: systems or conditions named that the paper no longer covers, or now covers and
   the title omits.
6. **It overclaims relative to current evidence**, which happens when results weaken during revision but
   the title does not follow.

## Editor request patterns

| Request | Usually means |
| :--- | :--- |
| "Too long" | Which qualifiers drop. It offers options at several lengths |
| "Should reflect the main finding" | Descriptive to declarative. The finding is in your paper |
| "Overstates the results" | Pull the claim back. You set the level |
| "Make it accessible to a broader readership" | Field jargon out, finding intact |
| "Avoid the question format" | Some journals prohibit it outright |

Where two requests pull against each other, for example shorter *and* more explicit, it says so and
offers options at each end rather than splitting the difference silently.

## Example, modes A and C together

```latex
% CURRENT  (provisional, written before the shear results existed)
\title{Layer-by-layer graphene coatings for supercapacitor electrodes}

% Mode A finding: your conclusions now lead with crosslinking as the
% determining factor. The current title names none of that. It also
% predates Sec. 3.5 entirely.

% OPTION 1  declarative, states the finding your conclusions lead with
\title{Crosslinking determines cycling durability in layer-by-layer supercapacitor electrodes}
% 11 words. Names the mechanism, drops the value.

% OPTION 2  declarative with the value
\title{Crosslinked layer-by-layer electrodes retain 96\% capacitance over 3000 cycles}
% 10 words. Concrete and searchable. Commits to a number, so it must match Table~2.
```

## Side effects

Reads `.tex` files. Writes nothing unless you pick an option. Never edits the abstract or conclusions even
when it reports them as diverging; it suggests `/update-abstract` or `/update-conclusions` instead. No
network access.

## Design decisions

- **Always a spread, never one title**, matching `/create-title`. Emphasis is a judgement the researcher
  makes, and it needs alternatives with their tradeoffs named.
- **Modes A and C treated as normally simultaneous**, since the working title and the stale title are
  usually the same title.
- **Six enumerated staleness patterns**, because title drift is predictable and easy to miss.
- **Editor outranks the style guide**, and on titles the editor usually wins outright. Noted rather than
  argued.
- **Conflicting requests are surfaced with options at each end**, not silently compromised.
- **Never propose an unsupported claim**, even where it would make a stronger title.
- **Values never rounded.**
- **Reports downstream divergence without editing downstream.** Abstract and conclusions belong to their
  own skills.

## Sources

Module 2 (titles) and Module 4 (the writing order that puts the title last) and Module 8 (the editorial
process) of *Curso de Escrita Científica* by Prof. Dr. Valtencir Zucolotto, IFSC/USP, transcript in
[`sources/`](../sources/curso_escrita_cientifica_valtencir_zucolotto.md).

## Changelog

- **0.1.0**: initial version, with the three-mode design from the start.
