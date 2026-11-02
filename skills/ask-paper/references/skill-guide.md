# Skill guide

What each skill in this package does, why it exists, and when to use it. Answer from this when the
researcher asks which skill to use or what one does. Keep it in writing order.

All the models below come from Valtencir Zucolotto's scientific writing course, in `sources/` of the
repository. None was invented, which is also why some things are missing (see Not covered).

## The seven pieces

| Piece | Invoked | Job |
| :--- | :--- | :--- |
| `/organize` | by you, manual only | Builds the LaTeX project from the venue's format |
| `/draft <section \| paper>` | by you, or auto | First version from your material, with red TODOs for gaps |
| `/write <section>` | by you, or auto | Interviews you and writes a section, or updates an existing one |
| `/review <section>` | by you, or auto | Critiques a section against its model |
| `/evaluate` | by you, manual only | Scores the whole paper, section by section, against the venue's criteria |
| `/ask-paper` | by you, or auto | Explains the skills, says where you stand, remembers across sessions |
| `paper-writing-style` | Claude only | The shared rulebook the others load |

## Previous papers: the `exemplars/` folder

**What.** A folder in your project, created by `/organize` with a `.gitkeep`, for **previous papers from the
venue and track you are targeting**. Download accepted papers from the same conference or journal into
`exemplars/<venue-or-track>/`, ideally 5 to 10 of the kind of paper you are writing (a tool paper, an
industry paper, a systematic mapping). A systematic mapping of the track is a good way to collect them.

**Why.** A previous paper from the same venue is one of the most useful things you can have when writing a
new one. It shows what that venue actually accepts: which sections exist, in what order, how long, what each
one does. `/draft` reads them and bases your paper's structure on what recurs across them, instead of on a
guess about what, say, a tool paper looks like. The structure of a paper type is a convention of a field and
a venue, and the only honest source for it is real papers from that venue.

**How it is used.** `/draft` labels each paper's sections and keeps only what recurs, saying how many papers
each element appears in. It takes **structure** only: never sentences, results or claims. Facts from these
papers can be cited as evidence, like any other paper.

**Local only.** `.gitignore` ignores everything in `exemplars/` except the `.gitkeep`, so the papers never
reach git or Overleaf. They are other people's copyrighted work, and the folder can be large. Do not commit
them.

**When.** Fill it right after `/organize`, before `/draft`. If it is empty when you reach `/draft`, you will be
asked to fill it. Not needed for `/write` or `/review`, which work from your own text.

## /organize

**Does.** Takes the venue and the URL of its author guidelines, reads them into a venue profile (class,
page limit, review mode, citation style, required sections), fetches the official template, and scaffolds a
project that compiles: `main.tex`, one file per section in `src/`, `macros.tex`, a build script and a project
`CLAUDE.md`. Optionally publishes to GitHub and connects Overleaf.

**Why.** A paper started from the wrong template, or from a layout that mixes prose into `main.tex`, costs
more to fix than to set up right. Venues change requirements yearly, so it reads the current page instead of
trusting memory.

It always creates a local, gitignored `exemplars/` folder (with a `.gitkeep`) for previous papers from your target venue, which `/draft` uses. See "Previous papers" above.

**When.** Once, before any writing, on a new project. **Not** for a project that already has `.tex` files:
it stops rather than scaffold over them.

## /draft

**Does.** Takes whatever material you have (notes, local files or a whole project, links, other papers) and
produces a first version of one section, or a skeleton of the whole paper. Every part the material supports
is drafted; every part it does not gets a red TODO saying what to supply and why. It first asks what kind of
paper this is (systematic mapping, tool, industry, empirical study), because the type decides the structure,
and takes that structure from you (venue guidelines, an `exemplars/` folder of accepted papers from your target venue and track, your outline), never from memory. Other
papers are cited as evidence, never reused.

**Why.** A blank page is the hard part. A draft full of precise, red gaps is something to react to, and the
TODO list is the agenda for `/write`.

**When.** You have material but no text, or want a whole-paper skeleton. **Not** when the section already has
text (it stops and points at `/write` or `/review`), and not for methods, which has no model.

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

When a section is reviewed and an evaluation exists, `/review` also re-scores that section in `paper-out/evaluation.md`.

## /evaluate

**Does.** Scores a complete draft from 1 to 10, section by section and overall, against the venue's review
criteria and against the structure that recurs in the papers in `exemplars/`. For each section it gives the
score, the reason, quotes from your text, the exemplar comparison (counts such as "in 6 of 8"), and the one
change that would raise it most. It writes `paper-out/evaluation.md`. It does not predict accept or reject.

**Why.** To see where the paper is weakest against what the venue says it wants, before a reviewer does.

**Needs.** The venue's review criteria, call for papers or reviewer guidelines, **pasted once**. It saves the
text to `paper-out/venue-criteria.md` and never asks again unless you say the text changed. It refuses
without it. `exemplars/` is optional: if empty, the criteria that depend on it are left unscored and it says so.

**When.** Once every section exists. **Not** on an outline: it stops and points at `/draft` or `/write`. It
only scores, so the fixes are `/review <section>` then `/write <section>`.

## /ask-paper

**Does.** Explains the skills (this guide), surveys the manuscript and reports where it stands, names the
single next step and checks its precondition, tracks the ripple when one section changes, runs the
pre-submission sweep, and keeps `paper-out/` accurate.

**Why.** A paper takes weeks, sessions stop and resume, and the writing order is not the reading order.

**When.** At the start of a session, whenever you are unsure which skill to use, or after a long gap.

## paper-writing-style

Claude-only, loaded by `/write`, `/review`, `/draft`, `/evaluate` and `/organize`. It holds the house style (clarity, concision,
the human-voice rules), the LaTeX conventions, and the session-state protocol. You never invoke it. Install it
alongside whichever skills you use.

## The usual path

1. `/organize`: the project.
2. Select and order your figures yourself. No skill does this.
3. Put previous papers from your target venue in `exemplars/`. Then, optional: `/draft paper` for a skeleton, or `/draft <section>` for a first version from your material.
4. `/write results-discussion`, then `conclusions`, then `introduction`.
5. Write methods yourself.
6. `/write abstract`, then `title`.
7. `/review` each section, then the cross-section sweep via `/ask-paper`.
8. `/evaluate`: paste the venue text once, get the scores, then `/review` the weakest sections.
9. `/write cover-letter`, submit.
10. After reviews: `/write response-to-reviewers`, and `/review response-to-reviewers` before sending.

## Not covered

- **Methods.** The course proposes no model, so none was invented. See `todo/methods-family.md`.
- **Selecting and ordering figures.** That is research judgment.
