# paper-skills

A distributable collection of Claude Code skills for writing academic papers. Skills are
authored here, documented here, and installed on any machine through the plugin marketplace
or the install scripts.

Repo: `yuryalencar/paper-skills` · License: MIT · Language: **English** for all skills, docs,
and README (source material may be in any language).

**This repo's only job is producing skills.** Every task here is either creating a skill,
revising a skill, or maintaining the distribution machinery around them.

## Layout

```
skills/<name>/SKILL.md            the skill itself (this is what gets installed)
skills/<name>/references/         optional deep material, loaded on demand
docs/<name>.md                    human-facing documentation for that skill
docs/TEMPLATE.md                  scaffold for docs/<name>.md
sources/                          raw material a skill was distilled from (never installed)
todo/                             skills deliberately not built yet, and what unblocks them
.claude-plugin/marketplace.json   plugin catalog, one entry per skill
install.sh / install.ps1          manual installers
README.md                         install instructions, usage guidelines, skill index
```

`skills/` is **flat**. `<name>` is kebab-case and identical across `skills/`, `docs/`, and
the marketplace entry. It is also the invocation name, so make it short and typeable:
`scientific-writing`, not `scientific-writing-assistant-helper`.

## Layout rule: flat, no grouping

Every skill here is for writing a paper, so there are no tags, categories, or group folders.
Keep `skills/` flat: Claude Code discovers skills exactly one level deep
(`~/.claude/skills/<group>/<name>/SKILL.md` is never found, verified by testing), and a flat
layout matches the installed layout, so nothing is rearranged at install time.

## The skill creation workflow

Five steps, in order. **Never write `SKILL.md` before step 2 is confirmed by the user.**
Jumping straight to a draft is the main failure mode in this repo.

### 1. Define the goal

Write one sentence: *"This skill helps <who> do <what> so that <outcome>."* Show it to the
user and get agreement before interviewing. If the request is vague, this sentence is the
first thing to pin down.

Also settle two things:

- Is this genuinely a skill? A skill is a **procedure or a body of expertise** that gets
  reused. A single fact belongs in CLAUDE.md; a one-off task is just a task.

### 1b. Refuse to guess a model

If the goal requires a structure the source material does not actually contain, **do not
invent one**. A skill that sounds authoritative while teaching made-up conventions is worse
than no skill. Write the item into `todo/` instead, naming exactly what would unblock it, and
say so plainly.

The way out is almost always **exemplar sections**, using the *categorização* method from the
source course: the researcher supplies 5 to 10 examples of the thing from papers they consider
good in their own field, you label each one sentence by sentence, and the pattern that recurs
across all of them becomes the model. A model derived this way can be defended and checked. An
invented one cannot.

This is also the signal that a skill is scoped too broadly. `/create-methods` was dropped for
exactly this reason: "methods" varies so much between fields that no single model fits, so it
was replaced by narrower sections such as `/create-threats-to-validity`, which do have
conventional structures worth encoding. Prefer the narrow, well-grounded skill over the broad,
vague one.

### 2. Interview

Gather everything needed to write the skill without inventing anything. Use
`AskUserQuestion` in batches of **at most 4 questions**, with concrete options plus room
for free text. Keep going in rounds until every item below is answered.

Cover, at minimum:

- **Trigger**: what phrases or situations should activate it? Should Claude load it
  automatically, or only the user via `/name`? (see `disable-model-invocation`)
- **Inputs**: what does it operate on? Files, a URL, pasted text, a whole repo, nothing?
- **Outputs**: exactly what artifact comes out, and where does it land?
- **Procedure**: the ordered steps a competent human would follow. Push for real detail
  here; vague steps produce a useless skill.
- **Domain rules**: the non-obvious expertise: conventions, thresholds, house style, the
  things the user corrects people on.
- **Edge cases**: what should it refuse, skip, or ask about? What are the known failure
  modes?
- **Success criteria**: how do we tell a good run from a bad one?
- **Source material**: any transcript, paper, book, or doc to distill? If so it goes in
  `sources/` and is cited in the docs.

When the interview is complete, present a **brief** back to the user as a short checklist
covering the eight points above, and ask for explicit confirmation or corrections. Only
after they confirm do you write files. Carry the brief forward into the
"Design decisions" section of `docs/<name>.md` so the reasoning is not lost.

If the user supplies source material, read it **before** the interview so your questions
are specific rather than generic.

### 3. Build the skill

Create `skills/<name>/SKILL.md` following the conventions below, plus
`skills/<name>/references/*.md` for anything long.

Then register it in `.claude-plugin/marketplace.json`: append an entry to `plugins`:

```json
{
  "name": "<name>",
  "source": "./skills/<name>",
  "description": "<one line, same as the skill description's first sentence>",
  "version": "0.1.0"
}
```

Relative sources must start with `./` and resolve from the repo root. A skill folder with
`SKILL.md` at its root and no nested `skills/` directory is a valid single-skill plugin, so
no `plugin.json` is needed per skill.

### 4. Document the skill

Create `docs/<name>.md` from `docs/TEMPLATE.md`. The docs are for a **human deciding
whether to install it**, so they must include: what it does, when to use it and when not
to, install command, a worked example of invocation and output, the inputs it
expects, configuration or arguments, design decisions from the interview, and source
attribution.

Docs explain and persuade; `SKILL.md` instructs. Do not just copy one into the other.

### 5. Update the README index

Add the skill to the index table in `README.md`: name, one-line purpose, link to
`docs/<name>.md`. Keep the table alphabetical.

## SKILL.md conventions

```markdown
---
name: <name>
description: <what it does AND when to use it, trigger-focused, key use case first>
---

# /<name>

<One-paragraph statement of what this does.>

## Usage
...
## Workflow / Instructions
...
```

Rules:

- **`description` is the single most important line in the file.** It is the only part
  Claude sees before deciding to load the skill. State what it does *and* when to use it,
  key use case first, including concrete trigger words. `description` plus `when_to_use`
  is truncated at 1,536 characters in the skill listing.
- **Keep the body tight and under 500 lines.** Once loaded, a skill's body stays in
  context for the rest of the session, so every line is a recurring cost. State what to
  do, not why it's nice. Push long material into `references/` and link to it, so it costs
  nothing until needed, this is progressive disclosure and it's the main reason to use a
  skill directory rather than one big file.
- **Write imperative instructions to Claude**, not prose about the topic. "Ask the user
  for X, then produce Y", not "it is important that documents be clear."
- **Portability:** prefer the fields that work everywhere, `name`, `description`,
  `license`, `compatibility`, `metadata`, `allowed-tools`. Claude Code additionally accepts
  `when_to_use`, `disable-model-invocation`, `user-invocable`, `argument-hint`,
  `arguments`, `allowed-tools`, `disallowed-tools`, `model`, `effort`, `context`, `agent`,
  `paths`, `hooks`, and more. Using those is fine, but say so in the docs, because the
  skill then won't behave identically if uploaded to claude.ai.
- `name` may be omitted (it defaults to the directory name); set it anyway so the file is
  self-describing.
- Set `disable-model-invocation: true` for anything with side effects the user should
  time themselves.
- No secrets, no absolute paths from this machine, no `C:\Users\Yury\...`: skills must
  run on a stranger's computer.
- Cross-platform: if a skill shells out, either keep to portable commands or provide both
  a POSIX and a PowerShell form.

## Definition of done

A skill is not finished until all five hold:

1. `skills/<name>/SKILL.md` exists and follows the conventions above.
2. An entry for it exists in `.claude-plugin/marketplace.json`.
3. `docs/<name>.md` exists and is complete.
4. The README index lists it.
5. `./install.sh --list` shows it, and the marketplace JSON parses.

Report which of the five are done when handing work back.

## Maintenance notes

- Bump the skill's `version` in the marketplace entry when you change its behaviour, and
  note the change in `docs/<name>.md`.
- Renaming or removing a skill: add the old name to the marketplace `renames` map so
  existing installs migrate instead of breaking.
- `sources/` is reference material only. It is never installed and should not be edited to
  suit a skill, distill from it, don't rewrite it.
