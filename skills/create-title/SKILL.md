---
name: create-title
description: Write scientific paper title options in LaTeX, concise and keyword-rich, favouring the modern trend of stating the paper's principal contribution in the title rather than merely describing the topic. Use when asked to write, draft, propose or produce a title for a paper, article or manuscript.
allowed-tools: Read, Grep, Glob
---

# /create-title

The title is the most-read and least-worked-on part of a paper. Write it **last**, after everything
else, which is where the course's writing order puts it. Provisional titles along the way are fine;
what matters is revisiting it at the end when you know what the paper actually says.

## Before anything else

1. **Load the style rules.** Invoke `paper-writing-style`. If absent, use the condensed rules at the
   bottom.
2. **Lock the language.** Language of the user's first message, whole run. **Output is always English.**
3. **Read the paper.** You need the principal result and the field. Read the abstract, the conclusions
   and the results section. A title written from a topic description will describe the topic, which is
   exactly what to avoid.

## What a good title does

Three properties, in order of how often they are missed:

1. **States the principal contribution**, not just the subject. This is the trend across high impact
   journals and it follows directly from the genre having no room for suspense. Compare:

   | Descriptive, the old default | States the contribution |
   | :--- | :--- |
   | `Expression of the S100-related MRP in human placenta tissue` | `Metal-polymer nanocomplexes induce spontaneous regression of lung tumours` |
   | `A study of graphene oxide coatings for supercapacitors` | `Crosslinked graphene oxide coatings retain 96\% capacitance over 3000 cycles` |

   A reader seeing the second kind knows the finding immediately. That is the whole objective.

2. **Concise.** A title so long that the reader cannot form an idea from it has failed. The course's
   worked example of a bad title is 20 words of nested qualifiers; the reader gives up before the end.

3. **Rich in keywords** that identify the work, since discovery happens through search.

## What to cut

**Scientific crutches**, phrases that add nothing:

`Report of a case of`, `A study of`, `An investigation into`, `On the`, `Some observations on`,
`Towards a`, `Preliminary results on`, `Novel`, `A note on`, `Aspects of`, `Contribution to the study
of`.

Test each phrase by deleting it. If the title still identifies the work, the phrase was a crutch.

Also cut: undefined abbreviations, questions unless the journal likes them, and any word the target
audience would not search for.

## Workflow

### 1. Extract from the paper

Pull out the principal result with its value, the broad field, the material or system studied, the
technique if it is distinctive, and the contribution as stated in the conclusions.

### 2. Interview, briefly

This is a short skill; do not over-question. Ask only:

- **Target journal**, which sets the length limit and whether declarative titles fit the venue's style.
  Check a few titles in that journal if the researcher can name it.
- **Which finding is the headline**, if the paper has several.
- **Whether the field's convention permits a declarative title.** Some subfields still expect
  descriptive ones, and a title that clashes with venue norms is a liability regardless of how good it
  is.

### 3. Produce three to five options, deliberately different

Do not produce one title. Produce a spread, labelled by strategy, so the researcher can choose:

```latex
% OPTION 1  declarative, states the finding
\title{Crosslinking determines cycling durability in layer-by-layer supercapacitor electrodes}

% OPTION 2  declarative with the value, strongest for a specialist venue
\title{Crosslinked layer-by-layer electrodes retain 96\% capacitance over 3000 cycles}

% OPTION 3  mechanism-forward, if the mechanism is the contribution
\title{Hierarchical graphene--MnO$_2$ textiles accommodate volume change during cycling}

% OPTION 4  descriptive, if the venue expects it
\title{Cycling durability of crosslinked layer-by-layer graphene--MnO$_2$ electrodes}
```

For each option, give the word count and one line on what it emphasizes and what it gives up. Say which
you would pick and why, then let the researcher decide.

Note that `--` inside a chemical or compound name is correct LaTeX for an en dash and is one of its
legitimate uses.

### 4. Check each option

Before presenting, verify every option:

- Contains no crutch phrase.
- Has no undefined abbreviation.
- Is under the journal's limit, if known.
- Would be found by someone searching for this work.
- Claims exactly what the paper shows, no more. **A title is the easiest place to overclaim and the
  most visible.**

### 5. Refine

Expect the researcher to combine parts of different options. That is the point of producing a spread.

## Hard rules

- **Never invent or round a value** that appears in a title. It must match the results exactly.
- **Never overclaim.** A declarative title asserts a finding, so the assertion must be exactly what the
  data supports. If the result is conditional, the title says so or omits the claim.
- **Never emit an em dash (`---`).** `--` is correct in compound names and numeric ranges.
- Write it last. If the paper is not written, say so and offer a provisional title, flagged as such.
- Cut `novel`, `preliminary`, and every crutch phrase above.

## Condensed style rules, if `paper-writing-style` is not installed

Clarity and concision govern. Be specific: a title that could head any paper in the field says nothing.
Prefer plain words. Put the action in the verb: `crosslinking determines durability` beats `an
investigation of the determination of durability by crosslinking`. Avoid `novel`, `delve`, `harness`,
`leverage`, `paves the way`. Escape `\%` and use `$_2$` for subscripts in chemical formulae.
