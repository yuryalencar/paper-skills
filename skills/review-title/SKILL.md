---
name: review-title
description: Review a scientific paper title, checking whether it states the principal contribution or merely describes the topic, whether it carries scientific crutch phrases, whether it is concise and keyword-rich, and whether it claims exactly what the paper shows. Use when asked to review, critique, check or improve a paper title.
allowed-tools: Read, Grep, Glob
metadata:
  tags: [research]
---

# /review-title

A short skill for a short piece of text that gets read more than anything else in the paper. Keep the
review proportionate: findings, rewrites, done.

## Before anything else

1. **Load the style rules.** Invoke `paper-writing-style`. If absent, work from the condensed rules in
   `create-title`.
2. **Lock the language.** Language of the user's first message. Proposed titles are English.
3. **Read the paper if available.** The abstract, conclusions and results. Two of the checks below are
   impossible without them: whether the title states the actual contribution, and whether it overclaims.

## Checks

Run all seven and report only what fails.

**1. Descriptive or declarative?** Does the title state the principal contribution, or does it name the
topic and stop? Descriptive is not wrong, but the trend in high impact journals is declarative, and the
genre has no room for suspense. If the title is descriptive, show what the declarative version would
look like using the paper's actual finding, and let the researcher choose.

**2. Crutch phrases.** Flag each: `Report of a case of`, `A study of`, `An investigation into`, `On the`,
`Some observations on`, `Towards a`, `Preliminary results on`, `Novel`, `A note on`, `Aspects of`,
`Contribution to the study of`. Test by deletion: if the title still identifies the work, the phrase was
a crutch.

**3. Length.** Count the words. Report a title long enough that a reader cannot form an idea from it,
and say which qualifiers to drop. Check the journal's limit if the researcher named a target.

**4. Keywords.** Would someone searching for this work find it? Name any missing term the audience would
search for, and any word occupying space without aiding discovery.

**5. Abbreviations.** Flag any that the target audience would not universally recognize. A title is read
out of context, so an abbreviation defined in the abstract is still undefined here.

**6. Overclaiming.** Compare the title's assertion against what the results actually show. A declarative
title makes a claim, and it is the most visible place in the paper to make one too strongly. Check
specifically:
   - Is the claim conditional in the paper but unconditional in the title?
   - Does a value in the title match the results exactly?
   - Does the title generalize beyond the systems studied?

**7. Style.** Nominalization (`an investigation of the determination of durability` for `crosslinking
determines durability`), vagueness, and any word that could head any paper in the field.

## Deliver

1. The failing checks, most serious first. Overclaiming and crutch phrases first; they are the ones an
   editor reacts to.
2. **Two or three rewritten options**, labelled by strategy, with word counts and one line each on what
   they emphasize and give up.
3. Which you would pick and why.

If the title passes every check, say so in a sentence or two and stop. A good title needs no essay.

## Hard rules

- **Never invent or round a value** in a proposed title.
- **Never propose a claim the paper does not support**, even when it would make a stronger title. This is
  the single most likely way this skill could damage a paper.
- **Never emit an em dash (`---`).** `--` is correct in compound names such as `graphene--MnO$_2$` and in
  numeric ranges.
- If the paper is unavailable, say which checks you could not run rather than guessing at them.
