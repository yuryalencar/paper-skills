---
name: create-conclusions
description: Write a scientific paper conclusions section in LaTeX using the inverse funnel from Zucolotto's course, opening on the principal result and widening to how it advances the broad field. Use when asked to write, draft or produce a conclusions or conclusion section for a paper, article or manuscript.
allowed-tools: Read, Grep, Glob
---

# /create-conclusions

The conclusions section shows what the work did for the field. It is the section researchers give
least attention to and it is structurally the easiest to get right, because good conclusions across
good journals follow a recognizable pattern.

Write it **second**, immediately after results and discussion, while the findings are fresh. That is
the course's writing order.

## Before anything else

1. **Load the style rules.** Invoke `paper-writing-style` and read `references/human-voice.md` and
   `references/latex-conventions.md`. If absent, use the condensed rules at the bottom.
2. **Lock the language.** Language of the user's first message, whole run, no switching. **Output
   LaTeX is always English.**
3. **Read the context.** You need the results and discussion section above all: the conclusions are
   built from it. Also read the introduction if it exists, the `.bib`, and detect the citation style.

## The inverse funnel

The introduction narrows from the broad field to your purpose. The conclusions do the exact opposite,
and that symmetry is what closes the hourglass shape of the paper:

| Movement | Carries | Altitude |
| :--- | :--- | :--- |
| Principal result | Your main finding, restated | Most specific |
| Brief interpretation | What it means | Widening |
| Contribution | How this advances the broad field | Most general |

Open at the narrowest point and widen continuously to the end. The final sentences should be the
most general in the section, showing what the field can now do that it could not before.

## Restate, do not repeat

The principal result appears here having already appeared in the results and discussion. It must be
**restated, not copied**. Give it a different framing: results and discussion describes what was
measured, conclusions says what it establishes. Likewise the interpretation here can and usually
should differ in emphasis from the one given earlier.

Reusing your own sentences verbatim across sections is the self-plagiarism the course warns about,
and it reads as padding.

## Workflow

### 1. Read the results

Extract, from the results and discussion section: every principal finding with its values, the
interpretations given, and the comparisons against prior work. If the section does not exist, say so
and ask for the findings directly; the conclusions cannot be written from a topic description.

### 2. Interview

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

### 3. Draft

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

### 4. Check the tense

Past tense for what was done and found. **Present tense fits the contribution sentences**, because
they state what is now true rather than what happened: `these assemblies are viable`, `this approach
offers`. This is the one place in a paper where present tense is the natural choice throughout the
closing sentences.

### 5. Check and refine

Ask what to change. Expect the contribution sentence to be corrected; researchers routinely
understate it or overclaim it, and only they can set the right level.

### 6. Cross-check the paper

Before finishing, verify:

- The principal result here matches the results section, with identical values.
- The contribution answers the gap the introduction stated.
- The abstract's conclusions sentences agree with these. If they diverge, say so and suggest
  `/update-abstract`.

### 7. Offer to write it out

Only after approval.

## Hard rules

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

## Condensed style rules, if `paper-writing-style` is not installed

Clarity and concision govern. One idea per sentence. Be specific. Put the action in the verb. Cut
redundancy. Prefer plain words: `use` over `utilization`, `most` over `the majority of`, `because`
over `due to the fact that`. Avoid `delve`, `harness`, `leverage`, `underscore`, `pave the way`,
`crucial role`. Keep `however`, `moreover`, `in contrast`, `in summary`, `in conclusion`: correct
register. Never stack passive voice. Vary sentence openers. Every `it` and `this` needs one referent.
Thin space between quantity and unit (`10\,nm`), escape `\%`.
