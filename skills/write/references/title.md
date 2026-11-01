# Title

## Create mode

The title is the most-read and least-worked-on part of a paper. Write it **last**, after everything
else, which is where the course's writing order puts it. Provisional titles along the way are fine;
what matters is revisiting it at the end when you know what the paper actually says.

### Context to read

**Read the paper.** You need the principal result and the field. Read the abstract, the conclusions and the results section. A title written from a topic description will describe the topic, which is exactly what to avoid.

### What a good title does

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

### What to cut

**Scientific crutches**, phrases that add nothing:

`Report of a case of`, `A study of`, `An investigation into`, `On the`, `Some observations on`,
`Towards a`, `Preliminary results on`, `Novel`, `A note on`, `Aspects of`, `Contribution to the study
of`.

Test each phrase by deleting it. If the title still identifies the work, the phrase was a crutch.

Also cut: undefined abbreviations, questions unless the journal likes them, and any word the target
audience would not search for.

### Workflow

#### 1. Extract from the paper

Pull out the principal result with its value, the broad field, the material or system studied, the
technique if it is distinctive, and the contribution as stated in the conclusions.

#### 2. Interview, briefly

This is a short skill; do not over-question. Ask only:

- **Target journal**, which sets the length limit and whether declarative titles fit the venue's style.
  Check a few titles in that journal if the researcher can name it.
- **Which finding is the headline**, if the paper has several.
- **Whether the field's convention permits a declarative title.** Some subfields still expect
  descriptive ones, and a title that clashes with venue norms is a liability regardless of how good it
  is.

#### 3. Produce three to five options, deliberately different

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

#### 4. Check each option

Before presenting, verify every option:

- Contains no crutch phrase.
- Has no undefined abbreviation.
- Is under the journal's limit, if known.
- Would be found by someone searching for this work.
- Claims exactly what the paper shows, no more. **A title is the easiest place to overclaim and the
  most visible.**

#### 5. Refine

Expect the researcher to combine parts of different options. That is the point of producing a spread.

### Hard rules

- **Never invent or round a value** that appears in a title. It must match the results exactly.
- **Never overclaim.** A declarative title asserts a finding, so the assertion must be exactly what the
  data supports. If the result is conditional, the title says so or omits the claim.
- **Never emit an em dash (`---`).** `--` is correct in compound names and numeric ranges.
- Write it last. If the paper is not written, say so and offer a provisional title, flagged as such.
- Cut `novel`, `preliminary`, and every crutch phrase above.

## Update mode

Titles go stale more often than researchers notice, because the working title gets written first and the
paper's centre of gravity moves during writing and revision. This mode catches that.

### Context to read

**Read the paper.** Abstract, conclusions, results. All three modes need them.

### Pick the mode

State the mode before starting.

| Mode | Signal | What it does |
| :--- | :--- | :--- |
| **A. Reconcile** | The paper changed, or the title was provisional | Check the title still matches what the paper now claims |
| **B. Apply suggestions** | Editor or reviewer asked for a change, or `/review title` output supplied | Incorporate the request |
| **C. Finalize** | The title is a working placeholder and the paper is now finished | Replace it properly |

Modes A and C often coincide, and that is the normal case: the course puts the title last precisely
because it should be revisited at the end.

### Mode A: reconcile with the paper

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

### Mode B: apply suggested updates

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

### Mode C: finalize a working title

1. **Say plainly that the current title is provisional**, and what it was built on.
2. **Extract from the finished paper**: the principal result with its value, the contribution from the
   conclusions, the field, and the system or material studied.
3. **Produce three to five options**, labelled by strategy, as `/write title` does: declarative,
   declarative with a value, mechanism-forward, and descriptive if the venue expects it.
4. **Compare each against the working title**, saying what it gains.

### Produce the revision

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
suggest `/write abstract` or `/write conclusions` if not.

### Offer to write it out

Only after the researcher picks one.

### Hard rules

- **Never invent or round a value** in a title.
- **Never propose a claim the paper does not support**, even where it would make a stronger title.
- **Never emit an em dash (`---`).** `--` is correct in compound names and numeric ranges.
- **Never silently drop** an editor's or reviewer's request.
- If the title still fits the paper and nothing was asked for, say so and change nothing.

## Condensed style rules

Fallback when `paper-writing-style` is not installed.

Clarity and concision govern. Be specific: a title that could head any paper in the field says nothing.
Prefer plain words. Put the action in the verb: `crosslinking determines durability` beats `an
investigation of the determination of durability by crosslinking`. Avoid `novel`, `delve`, `harness`,
`leverage`, `paves the way`. Escape `\%` and use `$_2$` for subscripts in chemical formulae.
