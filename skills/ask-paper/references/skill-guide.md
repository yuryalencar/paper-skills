# Skill guide

What each skill in this package does, why it exists, and when to use it. Answer from this when the
researcher asks which skill to use or what one does. Keep it in writing order.

All the models below come from Valtencir Zucolotto's scientific writing course, in `sources/` of the
repository. None was invented, which is also why some things are missing (see Not covered).

## The five pieces

| Piece | Invoked | Job |
| :--- | :--- | :--- |
| `/organize` | by you, manual only | Builds the LaTeX project from the venue's format |
| `/write <section>` | by you, or auto | Drafts a section, or updates an existing one |
| `/review <section>` | by you, or auto | Critiques a section against its model |
| `/ask-paper` | by you, or auto | Explains the skills, says where you stand, remembers across sessions |
| `paper-writing-style` | Claude only | The shared rulebook the others load |

## /organize

**Does.** Takes the venue and the URL of its author guidelines, reads them into a venue profile (class,
page limit, review mode, citation style, required sections), fetches the official template, and scaffolds a
project that compiles: `main.tex`, one file per section in `src/`, `macros.tex`, a build script and a project
`CLAUDE.md`. Optionally publishes to GitHub and connects Overleaf.

**Why.** A paper started from the wrong template, or from a layout that mixes prose into `main.tex`, costs
more to fix than to set up right. Venues change requirements yearly, so it reads the current page instead of
trusting memory.

**When.** Once, before any writing, on a new project. **Not** for a project that already has `.tex` files:
it stops rather than scaffold over them.

## /write

One command for every section. Name the section; with no draft it interviews and drafts, with an existing
draft it offers to update (reconcile with the paper, apply your suggestions, or resume) or rewrite.

| Section | Model it applies | Why it matters |
| :--- | :--- | :--- |
| `results-discussion` | One block per figure from four information classes: background, description, interpretation, comparison | Written first, because the figures tell the story |
| `conclusions` | The inverse funnel: your result, what it means, what the field gains | Restates the result without repeating it |
| `introduction` | Four movements (contextualization, gap, state of the art, purpose) funnelling from the broad field | Written after the results, so its gap is one the results answer |
| `abstract` | Six parts: context, gap, purpose, methods, results, conclusions | Last to write, since it summarises everything |
| `title` | A spread of options that state the finding, not just the topic | Last, since it must name the principal finding |
| `cover-letter` | The novelty, and why this journal | The editor's first impression |
| `response-to-reviewers` | Each comment paired with a response and the exact manuscript location | Round two is checked against what you said in round one |

**When.** Whenever you need text drafted or revised. **Not** for methods, which has no model yet.

## /review

Same sections, same names. It labels what the text does against the section's model and reports what is
missing, weak or inconsistent with the rest of the paper. It reports first and offers rewrites only for the
weak parts.

**Why.** Reviewing against an explicit model catches structural faults (a gap the results never answer, an
abstract with no numbers) that a read-through misses.

**When.** After drafting a section, and again as a sweep before submission. **Not** before a draft exists:
it refuses and points at `/write`.

## /ask-paper

**Does.** Explains the skills (this guide), surveys the manuscript and reports where it stands, names the
single next step and checks its precondition, tracks the ripple when one section changes, runs the
pre-submission sweep, and keeps `paper-out/` accurate.

**Why.** A paper takes weeks, sessions stop and resume, and the writing order is not the reading order.

**When.** At the start of a session, whenever you are unsure which skill to use, or after a long gap.

## paper-writing-style

Claude-only, loaded by `/write`, `/review` and `/organize`. It holds the house style (clarity, concision,
the human-voice rules), the LaTeX conventions, and the session-state protocol. You never invoke it. Install it
alongside whichever skills you use.

## The usual path

1. `/organize`: the project.
2. Select and order your figures yourself. No skill does this.
3. `/write results-discussion`, then `conclusions`, then `introduction`.
4. Write methods yourself.
5. `/write abstract`, then `title`.
6. `/review` each section, then the cross-section sweep via `/ask-paper`.
7. `/write cover-letter`, submit.
8. After reviews: `/write response-to-reviewers`, and `/review response-to-reviewers` before sending.

## Not covered

- **Methods.** The course proposes no model, so none was invented. See `todo/methods-family.md`.
- **Selecting and ordering figures.** That is research judgment.
