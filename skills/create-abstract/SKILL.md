---
name: create-abstract
description: Write a scientific paper abstract in LaTeX from a short description, a draft manuscript, or a results section, following the six-part model (contextualization, gap, purpose, methods, results, conclusions) from Zucolotto's scientific writing course. Interviews the researcher for what is missing, drafts, then refines with them. Use when asked to write, draft, or produce an abstract for a paper, article, or manuscript.
allowed-tools: Read, Grep, Glob
---

# /create-abstract

Produce a publication-quality abstract as a LaTeX fragment, built on the six-part model and
the house style rules. The researcher is expected to adapt the result; your job is to hand
them text that would already pass an editor.

## Before anything else

1. **Load the style rules.** Invoke the `paper-writing-style` skill and read its
   `references/human-voice.md` and `references/latex-conventions.md`. If that skill is not
   installed, fall back to the condensed rules at the bottom of this file.
2. **Lock the language.** Detect the language of the user's first message and keep using it
   for every interaction in this run. Never switch mid-run, even if the topic is English
   prose. **The LaTeX output is always English**, whatever the interview language.
3. **Read the context.** Look for `.tex` files, a `.bib` file, and any existing abstract in
   the working directory. Detect the citation style as described in the LaTeX conventions.
   Do not ask the user for anything you can find yourself.

## The six-part model

| Part | Carries | Typical length |
| :--- | :--- | :--- |
| Contextualization | The broad field and why it matters | 1--2 sentences |
| Gap | What is unresolved, unclear, or controversial. Usually opens with `however` | 1--2 sentences |
| Purpose | What this paper reports, tied directly to the gap | 1 sentence |
| Methods | How it was done, in general terms | 1--2 sentences |
| Results | The principal findings, with real numbers | 2--3 sentences |
| Conclusions | How these results advance the broad field | 1--2 sentences |

**Purpose, results and conclusions are mandatory.** Without them the text is not an
abstract. Contextualization and gap are strongly recommended, and may be dropped or merged
under a tight word limit or a specialist audience. Two parts can share one sentence when
space is short.

Total is normally 200--300 words unless the journal says otherwise.

## Workflow

### 1. Gather what exists

Accept any of: a short description of the work, paths to a manuscript or a results section,
a figure list, or nothing at all. Read whatever is given before asking a single question.

### 2. Interview

Ask in batches of at most four questions, using `AskUserQuestion` where the answers are
selectable. Keep going until you can write **every mandatory part** without inventing
anything. Cover:

- **Target journal.** This governs everything downstream: word limit, whether the journal
  wants a structured abstract with labelled sections, and how much contextualization to
  spend. A specialist journal needs little field justification because the audience already
  has it; a broad journal such as *Nature* or *Science* needs the importance of the whole
  field established. If the researcher does not know yet, use 200--300 words, the full
  six-part model, and a specialist audience.
- **The broad field**, in the terms the target audience uses.
- **The gap.** Press on this. A weak gap is the most common reason an abstract reads as
  unremarkable. What is unresolved, unexplained, contested, or too expensive in the current
  state of the art? The purpose must answer this specific gap.
- **The purpose**, and how it addresses that gap.
- **Methods**, at the level of technique names rather than parameters.
- **The principal result, with actual numbers.** Not all results, the ones that matter. Ask
  for the values; never estimate them.
- **The contribution**: what a reader in the field can now do, or now knows, that they
  could not before.

Do not draft before the mandatory parts are covered. If a number or citation is genuinely
unavailable, that becomes a `% TODO:`, not a guess.

### 3. Draft

Emit one LaTeX fragment, in English, labelled with structure comments so the researcher can
see the model being followed:

```latex
% CONTEXTUALIZATION
Silver nanoparticles are widely used as antimicrobial agents in wound dressings
\citep{silva2024}.
% GAP
However, their long-term cytotoxicity towards human keratinocytes remains poorly understood.
% PURPOSE
In this paper, we report the cytotoxicity of citrate-capped silver nanoparticles towards
HaCaT keratinocytes over 72\,h.
% METHODS
Cell viability was assessed by MTT assay and membrane integrity by lactate dehydrogenase
release.
% RESULTS
Viability fell to 62\% at 25\,\textmu g\,mL$^{-1}$ and to 18\% at 100\,\textmu g\,mL$^{-1}$,
while lactate dehydrogenase release increased threefold over the same range.
% CONCLUSIONS
These results indicate a concentration threshold below which silver dressings remain
compatible with keratinocyte monolayers, which is directly relevant to the design of
antimicrobial wound care materials.
```

Show it in chat in a fenced `latex` block. Then state the word count and, in two or three
lines, which choices you made and why, so the researcher can argue with them.

### 4. Check and refine

Ask what to change. Expect pushback on the gap and on which result leads; those are
judgement calls only the researcher can settle. Iterate as many rounds as they want, showing
the full fragment each time rather than a diff, since the abstract is short and reads as a
whole.

### 5. Offer to write it out

Only once the researcher is satisfied, offer to write the fragment to a file or patch it
into the manuscript. Never write to their files before that point.

## Hard rules

- **Never invent a result, a number, a method detail, or a citation key.** Emit
  `% TODO: <exactly what is missing>` instead.
- **Never emit an em dash (`---`).** `--` only in numeric ranges. Use commas, colons,
  semicolons, and full stops.
- Past tense for what was done, present tense for what the results indicate.
- Third person by default. First person plural is fine sparingly, for emphasis.
- The main finding appears as early as the model allows. There is no suspense in a
  scientific abstract.
- Cut `it is important to note that`, `plays a key role`, `novel`, `successfully`,
  `carefully`, and every sentence that would fit unchanged in a different paper.

## Condensed style rules, if `paper-writing-style` is not installed

Clarity and concision govern. One idea per sentence, short enough that the reader reaches
the full stop with the opening still in mind. Be specific: a sentence that could appear in
any paper in the field says nothing. Put the action in the verb (`the condition improved`,
not `an improvement in the condition was observed`). Cut redundancy (`completely
eliminated`, `introduce a new`). Prefer plain words (`use` over `utilization`, `to` over
`in order to`, `most` over `the majority of`, `because` over `due to the fact that`). Avoid
`delve`, `harness`, `leverage`, `underscore`, `pave the way`, `crucial role`. Keep `however`,
`moreover`, `in contrast`, `in this paper`, `here we report`: those are correct scientific
register, not filler. Never stack passive voice. Make sure every `it` and `this` has one
possible referent. Thin space between quantity and unit (`10\,nm`), escape `\%`.
