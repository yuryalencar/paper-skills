# paper-writing-style

> The house style rulebook every paper-writing skill leans on. Claude loads it automatically;
> you never invoke it directly.

**Status:** alpha · **Version:** 0.1.0 · **Invocation:** none, Claude-only ·
**Auto-loads:** yes
**Used by:** [write](write.md), [review](review.md) and [organize](organize.md), and every paper skill added later

## What it does

Holds the style and language rules distilled from Modules 5 to 8 of Zucolotto's course, plus
the anti-generated-text rules and the LaTeX conventions. It is a **knowledge skill**: it
changes how Claude writes scientific prose whenever it is relevant, rather than performing an
action.

It is marked `user-invocable: false`, so it does not appear in your `/` menu. There is no
meaningful action for you to trigger; the skill exists so that Claude has the rules in hand
when writing or reviewing a manuscript. Claude loads it on its own, and the other paper skills
ask for it explicitly.

## Why it is a separate skill

The style rules are needed by every writing skill. Duplicating them into each one would mean
several copies drifting apart, and fixing a rule would mean editing each one. Keeping them
here means one file to correct.

Each section's rules in `/write` carry only a condensed set of non-negotiables, so it
still works if you install it alone. Installing this skill alongside gives the full rulebook.
Install both.

## What is in it

`SKILL.md` carries the rules that apply constantly:

| Area | Covers |
| :--- | :--- |
| Non-negotiables | No em dashes, never invent data, no suspense, be specific, one idea per sentence |
| Tense, voice, person | Past for what was done, present for conclusions, active preferred, third person default, first person plural sparingly |
| Specificity | The three-step ladder from generic to publishable, and emphasis by word choice |
| Construction | Keeping complementary information adjacent, topic sentences, varying sentence openers |
| Connectors | The four movement classes: continuing, explaining, reversing, closing |
| Redundancy | The redundancy list, and putting the action in the verb instead of nominalizing |
| Ambiguity | `as`/`since`, dangling pronouns, abbreviation discipline |
| Sparing words | `preliminary`, `careful`, `novel`, `successfully`, and replacing `fact` and `case` |

Three reference files hold the long material, loaded only when needed:

- **`references/human-voice.md`**: the banned-construction list and, more importantly, the
  **protected vocabulary** that must not be stripped. Read before drafting.
- **`references/plain-english.md`**: substitution tables for inflated words and phrases, the
  confusable-word list, and the four-step worked example of turning Portuguese-structured
  English into publishable English.
- **`references/latex-conventions.md`**: class-agnostic fragments, dashes and ranges, units,
  escaping, citation detection, and the annotation comment format.

## The rule that needed the most care

An anti-AI-text pass and a scientific-writing style guide pull in opposite directions on one
specific point. The course teaches `however`, `moreover`, `in contrast`, `in this paper`,
`here we report` and `in summary` as correct register: `However` opening the second sentence of
an abstract is the standard way to introduce the gap.

A naive humanization pass strips exactly those words and makes the paper worse. So
`human-voice.md` is written as two explicit lists, a deny list and a **protected** list, rather
than as general guidance. The distinction it draws:

| Banned filler | Protected equivalent |
| :--- | :--- |
| `In recent years, there has been growing interest in X` | `Recently, significant advances have been made in X \cite{}` |
| `It is important to note that the results show` | `The results show` |
| `X plays a crucial role in Y` | `X is essential to Y`, or name the function |

The difference is whether the sentence makes a specific claim or merely announces that a topic
exists.

## Em dashes

On the researcher's instruction, `---` is never emitted, in any position. Commas, colons,
semicolons, parentheses and full stops do the work instead.

`--` survives in one place only: numeric and page ranges, where `10--20\,nm` and `pp.~13--17`
are correct typography that an editor would expect. Suppressing it there would look wrong.

## Install

```
/plugin marketplace add yuryalencar/paper-skills
/plugin install paper-writing-style@yuryalencar-paper-skills
```

Or `./install.sh paper-writing-style`. Install it alongside any paper skill.

## Inputs and outputs

Neither. It is background knowledge, not a command. Its effect appears in the output of the
skills that use it.

## Side effects

None. It contains no instructions to read, write or run anything.

## Design decisions

- **Knowledge skill, not a command**, because there is no action for a user to trigger.
  `user-invocable: false` keeps it out of the `/` menu while leaving Claude free to load it.
- **Separate from the skills that use it**, so one rule lives in one file.
- **Condensed non-negotiables embedded in each consumer skill**, so a standalone install
  degrades gracefully instead of losing the rules entirely.
- **Deny list and protected list, both explicit.** General guidance was rejected: the failure
  mode is stripping correct academic register, and only a named protected list prevents it.
- **Long material in `references/`**, since a skill body stays in context for the whole session
  once loaded, while reference files cost nothing until read.

## Sources

Modules 5 to 8 of *Curso de Escrita Científica: Produção de Artigos de Alto Impacto* by
Prof. Dr. Valtencir Zucolotto, IFSC/USP, transcript in
[`sources/`](../sources/curso_escrita_cientifica_valtencir_zucolotto.md).

The course itself draws on Michael Alley's *The Craft of Scientific Writing* (the redundancy
list and the sentence-opener classes), *Essentials of Writing Biomedical Research Papers* (topic
sentences), and the ACS Style Guide (numerals and units).

## Changelog

- **0.1.0**: initial version. Abstract vertical slice, phase 1.
