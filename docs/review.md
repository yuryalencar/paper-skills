# /review

> Critiques one section of a scientific paper against the model for that section, and reports what is
> missing, weak or inconsistent. Name the section; it does the rest.

**Status:** alpha · **Version:** 0.2.0 · **Invocation:** `/review <section>` ·
**Auto-loads:** yes
**Companion skills:** [write](write.md), [ask-paper](ask-paper.md),
[paper-writing-style](paper-writing-style.md)

Replaces the seven `review-*` skills.

## What it does

One command for critiquing every section. `/review abstract`, `/review introduction`,
`/review results-discussion`, `/review conclusions`, `/review title`, `/review cover-letter`,
`/review response-to-reviewers`. It labels what your text does against that section's model, then reports
gaps, weak parts and inconsistencies with the rest of the paper.

It **reports first and rewrites only the weak parts, only when you ask**, so your wording survives. If the
section is good it says so and keeps the review short instead of manufacturing findings.

## Choosing the section

Same as [write](write.md): the argument, a file path, or inference from the open file and session state,
with a question when it cannot tell. It never guesses and starts reviewing.

## What each section is checked against

| Section | Checks |
| :--- | :--- |
| Abstract | Categorization against the six parts, structural verdict, the gap and the results, a style pass, consistency with the paper |
| Introduction | The four movements, the general-to-specific flow, citations by class and by year, a style pass, connection to the rest of the paper |
| Results and discussion | Information classes per result block, topic sentences, figure captions, style, connection to the introduction |
| Conclusions | The three movements, the funnel in reverse, restatement versus repetition, consistency across the paper, style |
| Title | Seven checks from crutch phrases to overclaiming, then two or three rewrites |
| Cover letter | The two things that make a letter work, plus the declarations your journal mandates |
| Response to reviewers | Coverage, whether each claimed change actually exists, honesty of classification, tone, structure |

## When to use it

- After drafting a section, to see its structure against the model.
- As a sweep before submission, section by section.
- A section was rejected as unclear and you want to know where it fails.

## When *not* to use it

- **There is no draft.** It stops and points at `/write <section>`. It will not review an outline or invent
  a draft to criticise.
- **You want the text rewritten.** Use [write](write.md), which picks up the suggestions in its update mode.
- **You want a judgement of the science.** It judges the writing, not scientific merit.

## Install

```
/plugin marketplace add yuryalencar/paper-skills
/plugin install review@yuryalencar-paper-skills
/plugin install paper-writing-style@yuryalencar-paper-skills
```

Or `./install.sh review paper-writing-style` / `.\install.ps1 review paper-writing-style`.

## Inputs

| Input | Effect |
| :--- | :--- |
| The section name | Selects the checks |
| A file path | Which text to review |
| Other sections of the manuscript | Compared against, since most checks need another section |
| `paper-out/` | Earlier decisions, so it does not contradict or re-ask them |

**Language.** It follows the language you open in. Any rewritten text is English.

## Outputs

A report in chat, organised by the section's checks, with the weak parts quoted. It logs which review ran
and what you accepted or declined by updating `paper-out/` (the section's row in `STATE.md`, the decision log,
open questions), creating it if absent and naming the files. It then offers to apply the fixes through
`/write <section>`.

## Side effects

Reads files in your working directory. Writes nothing to your manuscript. No network access.

## Design decisions

- **One command, section as an argument**, mirroring [write](write.md). Seven `review-*` skills became
  one router plus a reference per section.
- **Needs a draft, and says so.** Reviewing a section that does not exist is refused, with a pointer to
  `/write`.
- **Report first, rewrite on request.** Preserves the researcher's wording and keeps the review honest.
- **The course keeps driving every check.** The merge changed the entry point, not the checks.

**Per section**, recorded when each review was first built:

### Abstract

- **Categorization first, verdict second.** Showing you the structure of your own text before
  criticizing it is what makes the criticism land, and it is how the course teaches the skill.
- **The gap and the results get their own step.** They are where abstracts actually fail, and
  burying them in a general style list understates them.
- **An explicit protected vocabulary list.** Without it, a style pass strips the connectors
  the course teaches and makes the abstract worse. This was the main risk identified when the
  skill was designed.
- **Writing verdict separated from scientific merit**, so the skill stays in its lane and its
  output stays trustworthy.
- **Honest empty result.** If the abstract is good, it says so and keeps the review short
  rather than manufacturing findings to look useful.
- **Review article guard.** It checks what kind of document it is before reporting missing
  parts, since review articles legitimately consist mostly of context and gap.

### Introduction

- **The funnel gets its own pass with an explicit trace.** Widening is invisible when reading
  linearly and obvious in a paragraph-altitude table.
- **The citation audit checks years, not just presence.** A missing state of the art usually shows
  up as an old newest-citation before it shows up as a missing movement.
- **The connection check is listed last but matters most.** A gap the paper never answers is the
  commonest structural fault in a manuscript.
- **An explicit protected-vocabulary list.** Without it, a style pass strips the connectors the
  course teaches and makes the introduction worse.
- **Suspected text reuse is flagged for you to verify, never asserted.** The distinction between
  close paraphrase and reuse needs the source in hand.
- **Honest empty result.** A good introduction gets a short review, not manufactured findings.

### Results and discussion

- **The matrix comes first**, because the *pattern* of gaps is more informative than any individual
  gap. "Zero comparisons across four blocks" is a diagnosis; four separate notes are noise.
- **Missing interpretation is reported, never filled.**
- **Only the weakest blocks are rewritten.** Rewriting a long section wholesale hides the findings and
  produces churn you cannot review.
- **Vague result language is flagged everywhere.** `good`, `excellent`, `improved`, `significant`
  without a value is the defect that most weakens a results section.
- **Stacked passive gets its own check.** It accumulates here more than in any other section.
- **Hedge stacking is flagged, but hedging is not.** The skill will not push you towards overclaiming;
  the hedge your evidence supports stays.
- **`increase` / `enhance` / `improve` checked as distinct words**, since the course flags them as
  commonly confused and they carry different claims.

### Conclusions

- **Missing contribution is reported first**, always. It is the commonest defect and the one that makes
  the section pointless.
- **The funnel is traced in reverse**, sentence by sentence, because a single narrowing sentence is what
  turns conclusions into a results rerun and it is invisible when reading linearly.
- **Restatement is checked by diffing against the results section**, not by judgement. Copied sentences
  are a factual finding, so they are quoted.
- **Grandiosity is a first-class check.** This is the section where overclaiming concentrates and where
  a reviewer's objection to it lands.
- **Past-tense contribution sentences are flagged**, following the course's observation that present
  tense suits conclusions.
- **The contribution is never written for you.**
- **Short review for a good section.** Conclusions are short; a long review of a sound one is noise.

### Title

- **Only failures are reported.** Seven passing checks listed as passing is noise for a ten-word input.
- **Overclaiming and crutch phrases lead**, because those are what an editor reacts to first.
- **Descriptive is a finding, not a fault.** It reports the descriptive-versus-declarative situation and
  shows the alternative rather than calling the current title wrong, since some subfields expect
  descriptive titles.
- **Missing-paper honesty.** It names which checks it could not run instead of quietly skipping them.
- **Rewrites come as a small spread**, matching `/write title`, because emphasis is the researcher's call.
- **Proportionate output.** A sound title gets two sentences.

### Cover letter

- **Novelty and journal fit lead the report**, because they are what makes a letter work or fail. Missing
  declarations are more likely to get the paper rejected administratively, but they are boilerplate to fix,
  so they come third.
- **Generic journal-fit language is quoted back.** Seeing "your esteemed journal" in isolation is more
  persuasive than being told the paragraph is weak.
- **Missing declarations flagged prominently despite being boilerplate**, since an administrative rejection
  wastes a submission cycle for a reason unrelated to the work.
- **Journal facts are never invented**, only asked about.
- **Declarations are never fabricated**, only placeheld.
- **Brief output for a sound letter.** Cover letters are short.

### Response to reviewers

- **Comments are re-enumerated from the reviews, not read off the letter.** A letter that numbered them
  generously may still have merged two, and the merge is invisible if you trust its numbering. The example
  above found 14 where the letter had 11.
- **Verification of claimed changes is a first-class check**, not a style note. It is the only check whose
  failure is a factual misstatement to reviewers.
- **The two failure cases are distinguished**, since a stale line number and a missing change need different
  responses from you.
- **Findings are never softened.**
- **Tone gets its own pass.** Authors are the last people able to see defensiveness in their own writing, and
  tone problems in a response letter cost papers.
- **Hedged concession is flagged as its own defect.** A response classed accepted that actually declines is
  worse than an honest refusal, because reviewers read it as evasion.
- **Only failing responses are rewritten.** Response letters are long and most responses are usually fine.
- **Honest reassurance when it passes**, stating explicitly that claimed changes were verified, since that is
  the thing worth knowing before you send.

## Sources

Distilled from *Curso de Escrita Científica: Produção de Artigos de Alto Impacto* by Prof. Dr. Valtencir
Zucolotto, IFSC/USP, transcript in
[`sources/`](../sources/curso_escrita_cientifica_valtencir_zucolotto.md). The categorization method that
drives every review is from Module 2.

## Changelog

- **0.2.0**: merged the seven `review-*` skills into `/review <section>`.
- **0.1.0**: separate `review-*` skills, one per section.
