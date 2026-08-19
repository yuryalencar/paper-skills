# Methods family: replace one broad skill with several specific ones

**Status:** deferred, pending exemplar sections
**Decided:** 2026-08-19
**Supersedes:** `/create-methods`, which was removed from the plan before being built

## Why `/create-methods` was dropped

It was too broad to write good rules for, for three separate reasons.

**The source does not support it.** Zucolotto proposes an explicit model for the abstract
(six parts), the introduction (four movements), results and discussion (four information
classes), and conclusions (inverse funnel). For the methods section he proposes **no model at
all**. Module 4 only remarks that it is one of the easiest sections to write, and places it
fourth in the writing order. Everything else the course offers about methods is style-level
and already lives in `paper-writing-style`: past tense, define abbreviations at first use,
ACS Style Guide for units and numerals, and the warning about stacked passive voice, which
matters more here than anywhere else because methods sections are conventionally passive.

**"Methods" is not one thing.** What the section contains varies more between fields than any
other part of a paper. An experimental physics methods section, a clinical trial protocol, a
software engineering empirical study design, and a qualitative interview study share almost
no structure. A single skill covering all of them could only offer generic advice.

**It is the section where drafting is most dangerous.** An abstract can be written from a
short description. A methods section needs real concentrations, instrument models,
temperatures, sample sizes, and statistical tests. Anything the researcher does not supply
and the skill fills in is a fabricated protocol, which is a research integrity problem rather
than a writing problem.

## Candidate replacements

Narrower sections with conventions specific enough to be worth encoding. Not all of these
should necessarily be built; the list is here so the choice can be made against real examples.

| Candidate | Where it applies | Why it is a better unit than "methods" |
| :--- | :--- | :--- |
| `/create-threats-to-validity` | Empirical studies, software engineering, experimental social science | Has a genuinely standard structure: internal, external, construct and conclusion validity, each with the mitigation taken. Highly conventional, so a real model exists to extract |
| `/create-research-questions` | Any empirical study | RQs have recognizable forms and a required relationship to the gap and to the results. Also feeds the introduction |
| `/create-study-design` | Empirical and experimental work | Design type, variables, controls, and the reasoning that links design to research question |
| `/create-participants-and-sample` | Human-subject and survey research | Sampling strategy, inclusion and exclusion criteria, size justification, ethics approval. Conventions here are strict and often mandated |
| `/create-data-collection` | Empirical work | Instruments, procedure, timeline, and what was recorded |
| `/create-data-analysis` | Any study with statistics | Tests chosen, assumptions checked, significance handling, effect sizes |
| `/create-experimental-setup` | Physical sciences and engineering | Apparatus, materials, parameters, and characterization techniques |
| `/create-reproducibility-statement` | Increasingly required across fields | Artifact availability, data and code links, what would be needed to repeat the work |

`/review-*` counterparts are more defensible than the `/create-*` ones in every case, because
reviewing an existing section for structure and style needs no fabricated content. If only
part of this family gets built, build the reviews first.

## What is needed before building any of these

For each candidate to be built, the researcher supplies:

1. **5 to 10 exemplar sections of that specific kind**, from papers they consider good, in
   their own field, preferably from their target journals. Whole sections, not excerpts, so
   the internal ordering is visible.
2. **The field and venue** each example comes from, so field-specific variation can be
   separated from the shared pattern.
3. **One or two examples they consider bad**, if available. Knowing what the researcher
   objects to is often more informative than more good examples.
4. **Any mandated structure** the venue imposes, for example a reporting standard such as
   CONSORT or PRISMA, or a required subsection list.

Then run *categorização* over the examples as described in `todo/README.md`, derive the model
from what actually recurs, and only then write the skill.

## Open questions to settle with the researcher

- Which of the candidates above are relevant to their actual work? The list spans several
  research traditions and most researchers need three or four of them, not all eight.
- Should these carry a shared prefix, so that a `/create-` autocomplete does not fill with
  eight section skills? For example `/paper-threats-to-validity`.
- Do any of them need to know about the others? Research questions, study design and threats
  to validity are strongly coupled: a threat to validity usually refers back to a design
  decision, and a research question constrains both.
- Is `paper-writing-style` sufficient for their style layer, or does empirical research
  writing need its own rules that the source course does not cover?
