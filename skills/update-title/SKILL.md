---
name: update-title
description: Update an existing paper title when the paper's principal finding has changed, when reviewers or an editor asked for a different title, or when a provisional working title needs replacing now that the paper is finished. Use when a title already exists and needs to change.
allowed-tools: Read, Grep, Glob
---

# /update-title

Titles go stale more often than researchers notice, because the working title gets written first and the
paper's centre of gravity moves during writing and revision. This skill catches that.

## Before anything else

1. **Load the style rules.** Invoke `paper-writing-style`. If absent, use the condensed rules in
   `create-title`.
2. **Lock the language.** Language of the user's first message, whole run. Titles are English.
3. **Read the paper.** Abstract, conclusions, results. All three modes need them.

## Pick the mode

State the mode before starting.

| Mode | Signal | What it does |
| :--- | :--- | :--- |
| **A. Reconcile** | The paper changed, or the title was provisional | Check the title still matches what the paper now claims |
| **B. Apply suggestions** | Editor or reviewer asked for a change, or `/review-title` output supplied | Incorporate the request |
| **C. Finalize** | The title is a working placeholder and the paper is now finished | Replace it properly |

Modes A and C often coincide, and that is the normal case: the course puts the title last precisely
because it should be revisited at the end.

## Mode A: reconcile with the paper

Check each, in order of severity:

1. **The title names a finding the paper no longer supports.** Most serious, and the most visible place
   in the paper to be wrong. Quote the title's claim and the current result. If the claim needs
   rethinking rather than a numerical fix, ask the researcher.
2. **A value in the title no longer matches the results.**
3. **The principal finding changed.** New or revised data promoted a different result, so a title built
   on the old one now emphasizes the wrong thing. Say which finding now looks principal.
4. **The title no longer matches the abstract's purpose or the conclusions' contribution.** All three
   should point the same way.
5. **The scope drifted.** Systems, materials or conditions named in the title that the paper no longer
   covers, or that it now covers and the title omits.
6. **The title overclaims relative to the current evidence**, which happens when results weaken during
   revision but the title does not follow.

## Mode B: apply suggested updates

Editors ask about titles more than about any other single element, and their requests are recognizable:

| Request | Usually means |
| :--- | :--- |
| "The title is too long" | Which qualifiers to drop. Propose options at different lengths |
| "The title should reflect the main finding" | Descriptive to declarative. You have the finding in the paper |
| "The title overstates the results" | Pull the claim back to what the data supports. The researcher sets the level |
| "Make it accessible to a broader readership" | The venue is general, so field-specific jargon has to go without losing the finding |
| "Avoid the question format" | Some journals prohibit it outright |

Enumerate each request, classify it as *direct*, *interpretive*, *conflicting* or *out of scope*, apply
or propose, and account for every one. Where two requests pull against each other, for example shorter
and more explicit, say so and offer options at each end.

Where a request conflicts with the house style, apply it and note the tension. The editor outranks the
style guide, and on titles the editor usually wins outright.

## Mode C: finalize a working title

1. **Say plainly that the current title is provisional**, and what it was built on.
2. **Extract from the finished paper**: the principal result with its value, the contribution from the
   conclusions, the field, and the system or material studied.
3. **Produce three to five options**, labelled by strategy, as `/create-title` does: declarative,
   declarative with a value, mechanism-forward, and descriptive if the venue expects it.
4. **Compare each against the working title**, saying what it gains.

## Produce the revision

Emit the options as LaTeX, each labelled and annotated:

```latex
% CURRENT  (provisional, written before the shear results)
\title{Layer-by-layer graphene coatings for supercapacitor electrodes}

% OPTION 1  declarative, states the finding your conclusions now lead with
\title{Crosslinking determines cycling durability in layer-by-layer supercapacitor electrodes}
% 11 words. Names the mechanism, drops the value. Strongest if the mechanism is the contribution.

% OPTION 2  declarative with the value
\title{Crosslinked layer-by-layer electrodes retain 96\% capacitance over 3000 cycles}
% 10 words. Concrete and searchable. Commits to a number, so it must match Table~2 exactly.
```

Say which you would pick and why, then let the researcher decide. Never present a single option in this
skill: a title is a judgement call and a spread is what makes the judgement possible.

Finish by checking whether the abstract and conclusions still agree with the chosen direction, and
suggest `/update-abstract` or `/update-conclusions` if not.

## Offer to write it out

Only after the researcher picks one.

## Hard rules

- **Never invent or round a value** in a title.
- **Never propose a claim the paper does not support**, even where it would make a stronger title.
- **Never emit an em dash (`---`).** `--` is correct in compound names and numeric ranges.
- **Never silently drop** an editor's or reviewer's request.
- If the title still fits the paper and nothing was asked for, say so and change nothing.
