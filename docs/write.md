# /write

> Writes or updates one section of a scientific paper in LaTeX. Name the section; it applies the model for
> that section, interviews you for what it does not know, and refines the draft with you.

**Status:** alpha · **Version:** 0.2.0 · **Invocation:** `/write <section>` ·
**Auto-loads:** yes
**Companion skills:** [review](review.md), [organize](organize.md), [ask-paper](ask-paper.md),
[paper-writing-style](paper-writing-style.md)

Replaces the seven `create-*` and seven `update-*` skills.

## What it does

One command for every section. `/write abstract`, `/write introduction`, `/write results-discussion`,
`/write conclusions`, `/write title`, `/write cover-letter`, `/write response-to-reviewers`. Each section has
its own model from Zucolotto's course, its own interview and its own checks, loaded only when you pick it.

It decides what to do from what already exists:

- **No draft.** It interviews you until every mandatory part can be written from real information, drafts
  once, then refines with you until you are satisfied.
- **A draft exists.** It says what it found and asks: **update it** (reconcile it with the current paper,
  apply specific suggestions such as a co-author's or reviewer's, or resume a stalled draft) or **rewrite
  it** from scratch. If you already said "update" or "fix", it skips the question.

Output is an English LaTeX fragment, shown in chat first. Nothing is written to your files until you approve.

## Choosing the section

- Give it as the argument: `/write abstract`. Loose names work: `results`, `discussion`, `conclusion`,
  `rebuttal` and `cover letter` all resolve.
- Or give a file path: `/write src/introduction.tex`.
- With nothing, it infers from the open file or the next step in `paper-out/STATE.md`, says what it
  inferred, and lets you correct it. If it cannot tell, it asks, and never guesses and starts writing.

## Sections

| Section | Model | Writes |
| :--- | :--- | :--- |
| Abstract | Six parts: contextualization, gap, purpose, methods, results, conclusions | A labelled LaTeX fragment, 200 to 300 words unless the journal says otherwise |
| Introduction | Four movements: contextualization, gap, state of the art, purpose | A funnel from the broad field to your purpose |
| Results and discussion | Four information classes per result: background, description, interpretation, comparison | One block per figure, captions included |
| Conclusions | The inverse funnel: your result, its interpretation, the contribution | Opens on your result and widens to what the field gains |
| Title | Titles that state the finding, not only the topic | A spread of options |
| Cover letter | The novelty, and why this journal | The submission letter |
| Response to reviewers | Each comment paired with a response and the exact manuscript location | A point-by-point letter, round by round |

**Methods is not offered.** The course proposes no model for it, so none was invented. See
[`todo/methods-family.md`](../todo/methods-family.md).

## When to use it

- Starting a section from a description of finished work.
- A section is stale because the paper changed, or you have suggestions to fold in.
- You stopped mid-draft and want to resume without re-explaining.
- Retargeting a cover letter after a rejection, or writing round two of a response.

## When *not* to use it

- **The work is not finished.** The course is explicit that most sections are written after the results.
  [ask-paper](ask-paper.md) says what order to work in.
- **You only want a critique of what you have.** Use [review](review.md), which preserves your wording.
- **You want methods written.** There is no model for it yet.

## Install

```
/plugin marketplace add yuryalencar/paper-skills
/plugin install write@yuryalencar-paper-skills
/plugin install paper-writing-style@yuryalencar-paper-skills
```

Or `./install.sh write paper-writing-style` / `.\install.ps1 write paper-writing-style`.

Install `paper-writing-style` alongside it. Each section's rules carry a condensed fallback, but the full
rulebook is what makes the prose hold up.

## Inputs

| Input | Effect |
| :--- | :--- |
| The section name | Selects the model and checks |
| A short description of the work | The normal starting point. Expect several questions after it |
| Path to a manuscript or section file | Read first, so it asks only what the paper does not answer |
| Nothing else | It starts from the interview |

It also reads your working directory to find `.tex` files, `.bib` keys, the `\input` list and the citation
style, and `paper-out/` to avoid re-asking answered questions.

**Language.** It interviews you in the language you open in and stays in it for the whole run. The LaTeX it
produces is always English, because the source course is emphatic that papers are written in English and
warns against carrying Portuguese sentence structure into English words.

## Outputs

An English LaTeX fragment in a fenced block, plus a short note on the choices made. Nothing is written to
disk until you approve it, and then only where you say. Fragments are class-agnostic: they drop into
`elsarticle`, `IEEEtran`, `revtex`, `achemso`, `acmart` or plain `article`.

Afterwards it logs decisions and interview answers to `paper-out/`, names the files it wrote, and flags
which other sections the change may have made stale.

## Example

```
> /write abstract silver nanoparticle cytotoxicity in wound dressings
```

It reads the directory, finds `main.tex` and `references.bib` with `natbib`, then asks about the
target journal, the gap, the principal result with values, and the contribution. Then:

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

> 214 words. Contextualization kept to one sentence because ACS Nano's audience already has
> the field. The gap is framed as a durability question so the purpose answers it directly.

Then it asks what to change. Expect to push back on the gap; that is the part only you can
settle.

## Structure labels and TODO markers

Structure comments such as `% CONTEXTUALIZATION` are ordinary LaTeX comments naming the model part. Strip
them when you are done, or keep them as a map. Where the project defines `\todo{}` it uses that, since it
renders in the PDF, and falls back to `% TODO:` otherwise. Every marker names exactly what is missing: it
will not produce a plausible number, because a fabricated result is worse than a visible gap.

## Side effects

Reads files in your working directory. Writes nothing unless you approve it and say where, apart from the
`paper-out/` notes, which it names. No network access.

## Design decisions

From the authoring interviews, recorded so the next revision does not relitigate them.

**Merging the skills**

- **One command per verb, section as an argument.** Twenty-one near-duplicate commands became `/write` and
  `/review`, so a researcher learns two names instead of twenty-one.
- **Update folded into write.** With an existing draft, `/write` detects it and confirms the mode instead
  of making you pick a different command. No draft means draft mode.
- **A router plus one reference per section.** Each section's procedure lives in `references/<section>.md`
  and loads only when picked, so the body stays short and the other six sections cost nothing.
- **Infer, else ask.** A section named in the argument or a file path is used; otherwise the open file or
  session state suggests one, and the researcher confirms. Never guess and start writing.
- **The course keeps driving every section.** The models and checks are unchanged by the merge.

**Per section.** The decisions below were recorded when each section was first built, and still apply.
"Writing" covers the draft mode; "Updating" covers the update mode.

### Abstract

**Writing**

From the authoring interview, recorded so the next revision does not relitigate them:

- **Interview before drafting, always.** Drafting from a one-line description and asking
  afterwards was rejected: the gap and the principal result are exactly what a short
  description omits, and they are what the abstract lives on.
- **Interview language follows the user and locks for the run**, output is always English.
- **Journal is asked, not assumed.** Module 1 establishes that audience changes the writing:
  a specialist venue needs little field justification, a broad one needs the whole field
  motivated. Word limit and structured-abstract format follow from it too.
- **Fragments, not full documents**, so output pastes into an existing manuscript.
- **Citation style detected, not assumed**, by reading `.bib` files and grepping for
  `natbib`/`biblatex` and existing `\cite` calls.
- **Chat first, files only on approval**, to keep the draft-check-refine loop fast and never
  touch a manuscript unasked.
- **Never invent numbers or citation keys.** This is the one rule with no exception.
- **No em dashes**, on the researcher's instruction, since they read as generated text. `--`
  survives in numeric ranges only, where it is correct typography.

**Updating**

- **Separate skill from `/write abstract`**, on the researcher's instruction. Creating and
  updating are different operations: creating starts from nothing, updating starts from
  something that was right once and must preserve it.
- **Three modes rather than one.** The first version only reconciled against a changed
  manuscript, which made `update` look useful merely for sections *derived* from the paper. The
  researcher pointed out the two commoner cases, incorporating suggested changes and resuming
  after a pause, which apply to every section. That is why `update` now exists across the whole
  family rather than only for abstract, introduction, conclusions and title.
- **Mode order B, C, A**, so a reconciliation pass runs last over finished text.
- **Every suggestion accounted for** in mode B, including the rejected ones.
- **Reviewer outranks the style guide.** Where a request conflicts with the house style, it is
  applied and the tension noted.
- **Preserve wording aggressively.** Restyling sentences that were already fine hides what
  actually changed. Churn is a defect here, not a bonus.
- **Never assume the paper wins.** See above.
- **Every value traceable or `% TODO:`.**
- **A clean result is a valid outcome.** If there is nothing to change, it says so rather than
  making cosmetic edits to look busy.
- **Resume does not restyle.** Mixing a resume with a critique makes both worse, so mode C
  matches the existing voice and suggests `/review abstract` separately.

### Introduction

**Writing**

- **All three dimensions checked, not just the movements.** An introduction with all four
  movements present can still fail by widening halfway through or by citing a 1997 paper as the
  state of the art.
- **The gap is pressed hardest in the interview.** It determines whether the paper looks
  necessary, and it is what a one-line description always omits.
- **State of the art is never invented.** The skill has no network access and will not fabricate
  recent literature. If your `.bib` has nothing recent, it asks rather than inventing a frontier.
- **Warns when run before the results exist**, rather than refusing. The course's writing order
  is a strong recommendation, not a rule, and sometimes a draft introduction is genuinely useful.
- **Verifies against the results section** before finishing. An introduction that promises what
  the paper never delivers is the commonest structural fault in a manuscript.
- **Text reuse called out explicitly.** The course is emphatic: citation records where an idea
  came from, never where text came from. The skill restates and cites, never copies.

**Updating**

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

### Results and discussion

**Writing**

- **No single structural model, by design.** Journals arrange these sections four different ways, so
  it asks rather than assuming. What is stable is the four-class block, which is what the course
  actually derives from the literature.
- **Interpretation is never supplied.** The strongest constraint in the whole family.
- **Figure list requested before drafting**, following the course's order: choose the figures, then
  write to them.
- **Captions are in scope.** They are part of this section's job, and the caption-versus-text balance
  cannot be decided by writing only one of them.
- **Topic sentences decide paragraph boundaries.** When the topic or the message changes, the
  paragraph ends. That gives a principled answer to "how long should this paragraph be".
- **Assertive over hedge-stacked**, matching what modern editors prefer, without pushing towards
  overclaiming: the hedge your evidence supports is the hedge that stays.
- **Verifies against the introduction** before finishing, since the two sections must connect.

**Updating**

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

### Conclusions

**Writing**

- **Built from the results section, not from a description.** A conclusion is a claim about evidence, so
  the evidence has to be in hand.
- **The contribution is asked for explicitly and never supplied.** It is the movement researchers most
  often omit and the one an AI has least business guessing.
- **Grandiosity is treated as a defect, not a style preference.** A conclusions section is where a
  reviewer's overclaiming objection lands.
- **Present tense is actively recommended for the contribution**, following the course, rather than
  applying past tense uniformly across the paper.
- **Checked against the results, introduction and abstract** before delivery: values must match, the
  contribution must answer the stated gap, and the abstract must agree.
- **Restatement enforced by comparison.** The draft is diffed against the results section to catch
  copied sentences.

**Updating**

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

### Title

**Writing**

- **A spread, never one title.** A title is a judgement call about emphasis, and the researcher can only
  make it by seeing the alternatives side by side with their tradeoffs named.
- **Declarative is recommended, not imposed.** Some subfields still expect descriptive titles, and a
  title clashing with venue norms is a liability however good it is. So it asks.
- **Written from the paper, not from a description**, since a title built on a topic will name the topic.
- **Overclaiming checked on every option.** A declarative title asserts a finding, and a title is the
  most visible place in a paper to assert one too strongly. Every option is verified against what the
  results actually show.
- **Values must match exactly.** No rounding, ever, in a title.
- **`--` is permitted in compound names.** `graphene--MnO$_2$` is correct typography and one of the en
  dash's legitimate uses, alongside numeric ranges.
- **Brief interview.** Three questions. A long interrogation for a ten-word output would be absurd.

**Updating**

- **Always a spread, never one title**, matching `/write title`. Emphasis is a judgement the researcher
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

### Cover letter

**Writing**

- **Novelty and journal fit are the two required paragraphs.** Everything else is boilerplate that a template
  can supply; these two are what the editor actually reads.
- **The journal-fit question is pressed, not accepted at face value.** A generic answer produces a generic
  paragraph, and it is worth saying so.
- **Declarations are never fabricated.** Statements about ethics approval, conflicts of interest, funding and
  data availability are legally and professionally consequential. They get a placeholder if unanswered, never
  a plausible guess.
- **Journal facts are never invented.** No network access means the scope, the recent papers and the editor's
  name are unknown, and inventing any of them would be immediately visible to the person reading.
- **Overclaiming treated as a first-class risk.** An editor who finds the letter overselling relative to the
  manuscript starts reading sceptically, and the temptation is greatest here.
- **One page, enforced.** An editor reading fifty submissions will not read two.
- **No flattery, no paper summary.** The abstract is attached. The letter argues for it.

**Updating**

- **Retargeting is treated as a rewrite, not a find-and-replace.** The commonest real-world use of this skill
  is also the one most likely to be done carelessly.
- **Removal of the previous journal is explicitly verified and reported.** Silent success is not enough for an
  error this embarrassing.
- **Previous rejections are never mentioned.**
- **Declarations are never carried over without confirmation**, since they differ by journal and a wrong one
  is worse than a missing one.
- **Redirects to the response-letter skill** when it detects a post-review revision, rather than producing the
  wrong document type.
- **Full letter shown every round**, since it is one page and a diff of a one-page document is harder to read
  than the document.

### Response to reviewers

**Writing**

- **Enumeration is a separate confirmed step.** It is the highest-leverage part of the whole process and the
  easiest place to lose a point.
- **Every response carries a location.** The commonest complaint reviewers make about response letters is
  vague or absent locations.
- **Never claims an unmade change.** The most serious failure available to this skill.
- **Declining is presented as normal**, with the class built into the structure, so the letter does not default
  to conceding everything.
- **The reason for declining is always yours.** It is a scientific argument and cannot be supplied.
- **Tone is actively managed.** Response letters are read by people deciding the paper's fate, and authors are
  usually the last to notice defensiveness in their own writing.
- **It reminds you to highlight changes** in the revised manuscript, since the letter states they are
  highlighted and reviewers rely on it.
- **It stops on comments needing work not yet done** rather than writing a response implying otherwise.

**Updating**

- **The previous letter is a required input, not optional.** Contradicting yourself across rounds is the
  distinctive failure of a second-round response and it is invisible without the history.
- **Follow-ups are distinguished from fresh comments**, because the required response shape differs.
- **A repeated declined point is surfaced as a decision, not resolved.** Conceding or holding is a scientific
  and strategic judgement, and restating the same reason twice is specifically called out as ineffective.
- **Locations are re-verified in mode B rather than trusted.** That is the entire point of the mode: a
  co-author's edits shift line and page numbers silently.
- **Your scientific arguments in declined responses are preserved verbatim.** They are yours.
- **A coverage table closes every run**, matching the create skill, since the failure mode is always an
  unanswered point.
- **Tone caution is heightened for round two**, where patience is thinner on both sides.

## Sources

Distilled from *Curso de Escrita Científica: Produção de Artigos de Alto Impacto* by Prof. Dr. Valtencir
Zucolotto, IFSC/USP, transcript in
[`sources/`](../sources/curso_escrita_cientifica_valtencir_zucolotto.md). The models and the
categorization method are from Modules 2 to 4 and 8.

## Changelog

- **0.2.0**: merged `create-*` and `update-*` into `/write <section>`. Update became a mode of the same
  command.
- **0.1.0**: separate `create-*` and `update-*` skills, one pair per section.
