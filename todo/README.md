# todo

Skills that are planned but deliberately **not built yet**, because the source material in
`sources/` does not ground them well enough to write rules that would be worth following.

A skill lands here rather than in `skills/` when the honest answer is "I would be inventing
the structure." Building it anyway produces a skill that sounds authoritative and quietly
teaches the wrong conventions, which is worse than not shipping it.

## How an item leaves this folder

Each file here names what is missing. In almost every case it is **exemplar sections from
real papers**, because that is how the models in `paper-writing-style` were derived in the
first place.

The method comes from the source course itself, where it is called *categorização*:

1. The researcher supplies 5 to 10 sections of the relevant kind, from papers they consider
   good, in their own field and preferably from their target journals.
2. Go through each one sentence by sentence and label what that sentence is doing.
3. Look for the pattern that recurs across all of them. That pattern, and only that pattern,
   becomes the model in the skill.
4. Note what varies between fields or journals, so the skill can ask instead of assuming.
5. Then follow the normal five-step workflow in `CLAUDE.md`, starting from the interview.

A model derived this way can be defended to the researcher, and it can be checked. A model
invented from general knowledge cannot.

## Current items

| Item | Blocked on | Notes |
| :--- | :--- | :--- |
| [methods-family.md](methods-family.md) | Exemplar sections per candidate skill | `/create-methods` was dropped as too broad. Replaced by a set of narrower, well-defined section skills |

## Deferred within the built skills

Not everything here is a whole skill. `/create-graphical-abstract` was raised and set aside:
the output is a figure specification rather than prose, so it does not fit the create, review
and update pattern the writing skills share, and it needs its own thinking about what the
deliverable even is.
