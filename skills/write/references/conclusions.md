# Conclusions

## Create mode

The conclusions section shows what the work did for the field. It is the section researchers give
least attention to and it is structurally the easiest to get right, because good conclusions across
good journals follow a recognizable pattern.

Write it **second**, immediately after results and discussion, while the findings are fresh. That is
the course's writing order.

### Context to read

**Read the context.** You need the results and discussion section above all: the conclusions are built from it. Also read the introduction if it exists, the `.bib`, and detect the citation style.

### The inverse funnel

The introduction narrows from the broad field to your purpose. The conclusions do the exact opposite,
and that symmetry is what closes the hourglass shape of the paper:

| Movement | Carries | Altitude |
| :--- | :--- | :--- |
| Principal result | Your main finding, restated | Most specific |
| Brief interpretation | What it means | Widening |
| Contribution | How this advances the broad field | Most general |

Open at the narrowest point and widen continuously to the end. The final sentences should be the
most general in the section, showing what the field can now do that it could not before.

### Restate, do not repeat

The principal result appears here having already appeared in the results and discussion. It must be
**restated, not copied**. Give it a different framing: results and discussion describes what was
measured, conclusions says what it establishes. Likewise the interpretation here can and usually
should differ in emphasis from the one given earlier.

Reusing your own sentences verbatim across sections is the self-plagiarism the course warns about,
and it reads as padding.

### Workflow

#### 1. Read the results

Extract, from the results and discussion section: every principal finding with its values, the
interpretations given, and the comparisons against prior work. If the section does not exist, say so
and ask for the findings directly; the conclusions cannot be written from a topic description.

#### 2. Interview

Batches of at most four questions:

- **Which single result is principal.** Conclusions that give equal weight to five findings conclude
  nothing. If the researcher names several, ask which one a reader should remember.
- **The contribution.** What can someone in the field now do, or now know, that they could not
  before? This is the sentence the section exists for, and it is the one researchers most often
  leave out.
- **The broad field to widen into**, phrased as the target journal's audience would.
- **Whether limitations or future work belong here.** Many journals expect them at the end of the
  conclusions; some want them in the discussion instead. Ask which the target journal does.
- **Length**, usually one or two paragraphs.

#### 3. Draft

Emit one LaTeX fragment with movement labels:

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

Note the widening: a specific retention figure, then what it establishes, then what the field gains.

Show it in chat and state how the altitude rises across the fragment.

#### 4. Check the tense

Past tense for what was done and found. **Present tense fits the contribution sentences**, because
they state what is now true rather than what happened: `these assemblies are viable`, `this approach
offers`. This is the one place in a paper where present tense is the natural choice throughout the
closing sentences.

#### 5. Check and refine

Ask what to change. Expect the contribution sentence to be corrected; researchers routinely
understate it or overclaim it, and only they can set the right level.

#### 6. Cross-check the paper

Before finishing, verify:

- The principal result here matches the results section, with identical values.
- The contribution answers the gap the introduction stated.
- The abstract's conclusions sentences agree with these. If they diverge, say so and suggest
  `/write abstract`.

#### 7. Offer to write it out

Only after approval.

### Hard rules

- **Never invent or estimate a value.** Every number must match the results section exactly.
  Otherwise `% TODO:`.
- **Never invent the contribution.** If the researcher cannot say what the field gains, that is a
  conversation to have, not a gap to fill with a plausible claim. An invented contribution is an
  overclaim with their name on it.
- **Never copy sentences from the results and discussion.** Restate.
- **Never emit an em dash (`---`).** `--` only in numeric ranges.
- **Do not widen into grandiosity.** The contribution is what this paper enables, not what the field
  might achieve one day. Cut `paves the way for`, `opens new avenues`, `has the potential to
  revolutionize`.
- The funnel never narrows again once it starts widening.
- Cut `it is important to note that`, `in summary` used as filler when the whole section is a
  summary, `novel`, `successfully`, and any sentence that would fit unchanged in another paper.

## Update mode

The conclusions are downstream of everything. When results change, this is the section most likely to
become quietly false, because a conclusion is a claim and claims do not survive changed evidence.

Assume the text was correct once. This is a **revision, not a rewrite**: what still holds stays exactly
as the researcher wrote it.

### Context to read

**Read the context.** The conclusions, the results and discussion, the introduction, the abstract, the `.bib` and the citation style. All four sections are needed.

### Pick the mode

State the mode before starting.

| Mode | Signal | What it does |
| :--- | :--- | :--- |
| **A. Reconcile** | Results changed, no explicit feedback | Check each claim still follows from the evidence |
| **B. Apply suggestions** | Reviewer comments, co-author notes, `/review conclusions` output | Incorporate each change deliberately |
| **C. Resume** | The section is unfinished, usually missing the contribution | Continue from where it stopped |

Where several apply, run B, then C, then A.

### Mode A: reconcile with the results

Conclusions fail in one specific way: a claim outliving its evidence. Check each in this order:

1. **A claim the results no longer support.** The most serious case and the reason this mode exists.
   Quote the claim, the value it rested on, and the current value. **Do not rewrite the claim yourself**
   if the change is substantive; ask the researcher what the new evidence concludes. A conclusion is a
   scientific claim with their name on it.
2. **A value that no longer matches** the results section. If it is a plain numerical correction with
   the claim intact, state the assumption and fix it.
3. **The principal result is no longer principal.** New or revised data can promote a different finding.
   Say which finding now looks principal and why, and let the researcher decide.
4. **The contribution no longer answers the introduction's gap**, usually because the gap was rewritten.
5. **A new finding important enough to conclude on** that the section does not mention.
6. **A claim contradicting the abstract's closing sentences.** Report both; the researcher decides
   which is right.
7. **Grandiosity that has become untenable.** A weaker result makes a broad claim look worse than it
   did.

Present as a table: what the conclusions claim, what the results now show, where, and severity.

**Never assume the results win.** Either the conclusions are stale, or the results changed by mistake.

### Mode B: apply suggested updates

Reviewer comments on conclusions cluster tightly:

| Comment | Usually means |
| :--- | :--- |
| "The conclusions overstate the findings" | Grandiosity, or a claim wider than the evidence. The researcher decides how far to pull back |
| "The contribution is unclear" | The contribution movement is missing or buried |
| "This just repeats the results" | The funnel does not widen, or text was copied from the results section |
| "Add limitations" | Ask whether the journal wants them here or in the discussion |
| "Add future work" | Same question |

Then:

1. **Enumerate every suggestion** as a numbered item, splitting reviewer prose.
2. **Classify each**: *direct*, *interpretive*, *conflicting*, *out of scope*.
3. **Apply, propose, resolve.** A request to soften or strengthen a claim is the researcher's call:
   propose the wording and let them set the level.
4. **Account for every item**, including those not applied and why.

Where a request conflicts with the house style, apply it and note the tension. The reviewer outranks
the style guide.

### Mode C: resume after a pause

1. **Label what exists** by movement: principal result, interpretation, contribution.
2. **Identify what is missing.** It is almost always the contribution, which is both the last movement
   and the hardest to write. Say so directly.
3. **Recover what you can from the paper.** The principal result and its values come from the results
   section; the gap the contribution should answer comes from the introduction. Do not ask the
   researcher to repeat what the manuscript already contains.
4. **Ask for the contribution.** This one cannot be recovered from the paper: what the field gains is
   a judgement only the researcher can make. Ask directly rather than proposing something plausible.
5. **Check the funnel widens across the join.** A resumed conclusions section commonly drops back into
   experimental detail at the restart point.
6. **Match the existing voice**, including the tense pattern and the hedging level.

Do not restyle what is already written; suggest `/review conclusions` separately.

### Produce the revision

Emit the updated conclusions as a LaTeX fragment with movement labels, and:

- **Preserve the researcher's wording and claims wherever they still hold.**
- Mark each change: `% UPDATED: retention now 96\% per Table~2`,
  `% ADDED: contribution movement was missing`,
  `% FLAG: this claim may no longer follow from the revised data, see note above`.
- Keep the section's existing length.
- `% TODO:` for anything you could not verify or obtain.

Show the fragment, then summarize. Finish by checking whether the abstract's closing sentences now
diverge, and suggest `/write abstract` if so.

### Offer to write it out

Only after approval.

### Hard rules

- **Never invent or strengthen a claim.** If revised data breaks a conclusion, flag it and ask. Writing
  a replacement claim is inventing science and it carries the researcher's name.
- **Never invent the contribution**, in any mode.
- **Never invent or estimate a value.** Every number must match the results section.
- **Never emit an em dash.** `--` only in numeric ranges.
- **Never silently drop** researcher text, a claim, or a suggestion.
- If the conclusions still follow from the results and there is nothing to apply, say so and change
  nothing.

## Condensed style rules

Fallback when `paper-writing-style` is not installed.

Clarity and concision govern. One idea per sentence. Be specific. Put the action in the verb. Cut
redundancy. Prefer plain words: `use` over `utilization`, `most` over `the majority of`, `because`
over `due to the fact that`. Avoid `delve`, `harness`, `leverage`, `underscore`, `pave the way`,
`crucial role`. Keep `however`, `moreover`, `in contrast`, `in summary`, `in conclusion`: correct
register. Never stack passive voice. Vary sentence openers. Every `it` and `this` needs one referent.
Thin space between quantity and unit (`10\,nm`), escape `\%`.
