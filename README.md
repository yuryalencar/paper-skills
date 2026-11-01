# paper-skills

A collection of [Claude Code](https://code.claude.com) skills for writing academic papers,
built to be installed on any machine, mine or yours. Each skill packages a repeatable
procedure or a body of expertise so Claude applies it consistently instead of being
re-explained every session.

Every skill here has a documentation page under [`docs/`](docs/) describing what it does,
when to use it, and when not to.

## Skills

Every skill has its own documentation page with usage, inputs, outputs and worked examples.
The table is an index; the docs are where the detail lives.

| Skill | What it does | Docs |
| :---- | :----------- | :--- |
| `/setup-paper-project` | Step zero: the venue template in a GitHub repo, connected to Overleaf. Manual only | [docs](docs/setup-paper-project.md) |
| `/write-paper` | The map for the family: where your manuscript stands, what to write next, then hands off | [docs](docs/write-paper.md) |
| `/create-abstract` | Writes a paper abstract in LaTeX from the six-part model, interviewing you for what it does not know | [docs](docs/create-abstract.md) |
| `/review-abstract` | Labels every sentence of an abstract with the model part it implements, then reports what is missing or weak | [docs](docs/review-abstract.md) |
| `/update-abstract` | Reconciles an abstract with the current state of the manuscript, preserving your wording | [docs](docs/update-abstract.md) |
| `/create-introduction` | Writes an introduction on the four-movement model, funnelling from the broad field to your purpose | [docs](docs/create-introduction.md) |
| `/review-introduction` | Labels each movement, traces the funnel, audits your citations by class and by year | [docs](docs/review-introduction.md) |
| `/update-introduction` | Reconciles an introduction with a changed paper, applies suggestions, or resumes a draft | [docs](docs/update-introduction.md) |
| `/create-results-discussion` | Writes the results and discussion, one four-class block per figure, captions included | [docs](docs/create-results-discussion.md) |
| `/review-results-discussion` | Matrix of your result blocks against the four information classes, so the gaps are visible at a glance | [docs](docs/review-results-discussion.md) |
| `/update-results-discussion` | Integrates new or revised data, applies suggestions, or resumes a stalled draft | [docs](docs/update-results-discussion.md) |
| `/create-conclusions` | Writes the conclusions on the inverse funnel, opening on your result and widening to what the field gains | [docs](docs/create-conclusions.md) |
| `/review-conclusions` | Checks the three movements, traces the funnel in reverse, catches text copied from the results | [docs](docs/review-conclusions.md) |
| `/update-conclusions` | Checks each conclusion still follows from the evidence, applies suggestions, or finishes a draft | [docs](docs/update-conclusions.md) |
| `/create-title` | Produces a spread of title options, favouring titles that state your finding over ones that name your topic | [docs](docs/create-title.md) |
| `/review-title` | Seven checks from crutch phrases to overclaiming, then two or three rewrites | [docs](docs/review-title.md) |
| `/update-title` | Catches a title that no longer matches the paper, applies an editor's request, or finalizes a working title | [docs](docs/update-title.md) |
| `/create-cover-letter` | Writes the submission cover letter: the novelty, and why this journal | [docs](docs/create-cover-letter.md) |
| `/review-cover-letter` | Checks the two things that make a cover letter work, plus the declarations your journal mandates | [docs](docs/review-cover-letter.md) |
| `/update-cover-letter` | Retargets a letter to a different journal after rejection, stripping every trace of the old one | [docs](docs/update-cover-letter.md) |
| `/create-response-to-reviewers` | Pairs every reviewer comment with a response and the exact manuscript location of the change | [docs](docs/create-response-to-reviewers.md) |
| `/review-response-to-reviewers` | Re-enumerates the comments independently, then verifies every claimed change actually exists | [docs](docs/review-response-to-reviewers.md) |
| `/update-response-to-reviewers` | Writes the second round, checked for contradictions against what you said the first time | [docs](docs/update-response-to-reviewers.md) |
| `paper-writing-style` | The style rulebook the paper skills lean on. Claude-only, no `/` command | [docs](docs/paper-writing-style.md) |

### Scientific paper writing

The skills are built as a family, one paper section at a time. Each section
gets three skills: `create` to draft it, `review` to critique the writing, and `update` to
move it forward. They share the `paper-writing-style` rulebook, so
install that alongside whichever you use.

```
./install.sh --all     # everything below, plus the style rulebook
```

| Section | create | review | update |
| :--- | :--- | :--- | :--- |
| Abstract | ✅ | ✅ | ✅ |
| Introduction | ✅ | ✅ | ✅ |
| Results and Discussion | ✅ | ✅ | ✅ |
| Conclusions | ✅ | ✅ | ✅ |
| Title | ✅ | ✅ | ✅ |
| Cover letter | ✅ | ✅ | ✅ |
| Response to reviewers | ✅ | ✅ | ✅ |

#### The writing order

Sections are not written in the order they are read. The course recommends this sequence, and the whole
family assumes it. [`/write-paper`](docs/write-paper.md) walks it, tells you where your manuscript
currently stands, and hands off to the right skill for the next step.

| # | Step | Skill |
| :-- | :--- | :--- |
| -1 | Set up the project: template, repo, Overleaf | [`/setup-paper-project`](docs/setup-paper-project.md) |
| 0 | Select and order the figures | yours, no skill can do this |
| 1 | Results and discussion | [`/create-results-discussion`](docs/create-results-discussion.md) |
| 2 | Conclusions | [`/create-conclusions`](docs/create-conclusions.md) |
| 3 | **Introduction** | [`/create-introduction`](docs/create-introduction.md) |
| 4 | Methods or experimental | none yet, see [`todo/`](todo/methods-family.md) |
| 5 | Abstract | [`/create-abstract`](docs/create-abstract.md) |
| 6 | Title | [`/create-title`](docs/create-title.md) |
| 7 | Cover letter | [`/create-cover-letter`](docs/create-cover-letter.md) |
| 8 | Revise after review | [`/create-response-to-reviewers`](docs/create-response-to-reviewers.md) |

**Step 3 is the one that earns the sequence.** Writing the introduction after the results means the gap
you state is the gap your paper actually answers. Write it first and you state a gap before knowing what
you found, which is how manuscripts end up promising something the results never address. That mismatch
is the commonest structural fault in a paper.

Results and discussion comes first because it is the hardest section and everything else is shaped by
it. The abstract comes fifth because you cannot summarize what does not exist. The title comes last
because it should name your contribution, and you only know the contribution when the paper is done.
Provisional titles along the way are fine.

Deviating is a judgement call, not an error. The skills say what it costs and let you decide.

#### Resuming across sessions

A paper is not written in one sitting. The family keeps a `paper-out/` folder beside your manuscript so
work resumes where it stopped instead of restarting. Every skill reads it;
[`/write-paper`](docs/write-paper.md) owns it.

```
my-paper/
├── main.tex
├── src/
├── references.bib
└── paper-out/
    ├── STATE.md            position, next step, key decisions
    ├── decisions.md        append-only log, each entry dated
    ├── open-questions.md   unresolved items
    ├── interviews/         answers given, so they are not asked twice
    └── revision/           reviewer rounds and coverage
```

**The manuscript is the only source of truth for content.** `paper-out/` stores only what cannot be
re-derived from it: the target journal, which result is principal and why, what was deliberately
deferred, interview answers, open questions, and declined reviewer points with their reasons. It never
stores your prose, your values, or section structure, because a duplicate goes stale and then lies to
you. If the state and the manuscript disagree, the manuscript wins and the state gets corrected.

It is meant to be **committed alongside your manuscript**: the decision log is project history a
co-author benefits from, and it carries the same sensitivity as the unpublished paper itself. Everything
in it is markdown you can read and edit by hand.

#### The three verbs

The three verbs divide the work cleanly:

- **create** starts a section from nothing, interviewing you for what it needs.
- **review** diagnoses an existing section and reports, without rewriting it.
- **update** moves an existing section forward. It covers three situations, and every
  section runs into all three: the paper changed underneath it and it has drifted, there
  are suggested changes to incorporate (from reviewers, a co-author, or a `/review-*` run),
  or it was left half-written and needs picking up after a pause.

Sections that need more analysis before they can be built honestly are recorded in
[`todo/`](todo/) rather than guessed at. The methods section is there now: the source course
proposes no model for it, so it is being replaced by narrower skills such as
`/create-threats-to-validity`, derived from real exemplar sections.

All of it is distilled from *Curso de Escrita Científica: Produção de Artigos de Alto Impacto*
by Prof. Dr. Valtencir Zucolotto (IFSC/USP), whose transcript is in [`sources/`](sources/).

## Install

You need Claude Code installed. Both methods below work on macOS, Linux, and Windows.

### Option A: plugin marketplace (recommended)

Add the marketplace once, then install any skill by name. Skills installed this way update
with `/plugin marketplace update`.

```
/plugin marketplace add yuryalencar/paper-skills
/plugin install <skill-name>@yuryalencar-paper-skills
```

Browse what's available with `/plugin marketplace` after adding it. If the install summary
says `Run /reload-plugins to activate.`, run that command.

### Option B: install script

Copies a skill into `~/.claude/skills/<name>`, making it available in every project on that
machine.

```bash
git clone https://github.com/yuryalencar/paper-skills.git
cd paper-skills

./install.sh <skill-name>     # one skill
./install.sh --all            # everything
./install.sh --list           # see available skills
```

On Windows (PowerShell):

```powershell
git clone https://github.com/yuryalencar/paper-skills.git
cd paper-skills

.\install.ps1 <skill-name>
.\install.ps1 -All
.\install.ps1 -List
```

Useful flags on both: `--link` / `-Link` symlinks instead of copying, so a `git pull`
updates your installed skills in place (Windows symlinks need Developer Mode or an elevated
shell). `--project` / `-Project` installs into `./.claude/skills` instead of your home
directory. `--force` / `-Force` overwrites without prompting.

### Option C: manual copy

A skill is just a directory. Copy it wherever Claude Code looks for skills:

| Destination | Scope |
| :---------- | :---- |
| `~/.claude/skills/<name>/` | you, in every project |
| `<project>/.claude/skills/<name>/` | everyone working in that project |

```bash
cp -r skills/<skill-name> ~/.claude/skills/
```

Don't nest skills in category folders at the destination. Claude Code discovers skills
exactly one level deep, so `~/.claude/skills/<group>/<name>/SKILL.md` is never found.

### Uninstall

```
/plugin uninstall <skill-name>@yuryalencar-paper-skills   # option A
rm -rf ~/.claude/skills/<skill-name>                   # options B and C
```

## Using a skill

Type `/` in Claude Code to list what's installed, then invoke a skill directly:

```
/<skill-name>
/<skill-name> some argument
```

Plugin-installed skills are namespaced, so if a name collides with something else you have
installed, use `/<plugin-name>:<skill-name>`.

You often don't need to invoke anything. Most skills here also carry trigger conditions in
their description, so Claude loads them on its own when the conversation calls for it.
Ask your actual question and the relevant skill comes along. Skills marked
**manual-only** in the table above are the exception; those only ever run when you type
`/name`, because they have side effects you should time yourself.

## Usage guidelines

Read these before installing anything from this repo.

- **A skill is instructions, not a guarantee.** It steers Claude strongly, but Claude still
  exercises judgment. Review the output of anything that matters.
- **Read the docs page first.** Every skill's `docs/<name>.md` has a "when not to use this"
  section. That section is the important one.
- **Check what it touches.** Skills that write files, run commands, or call external
  services say so in their docs under "Side effects". Nothing here exfiltrates your code or
  phones home; if a skill needs the network, its docs say what for.
- **Install only what you'll use.** Skill descriptions sit in context so Claude knows what's
  available. A handful is free; forty is not.
- **Project skills beat global skills for team conventions.** If a skill encodes how *your
  repo* works, install it into `<project>/.claude/skills/` and commit it so your team gets
  it too. Use `~/.claude/skills/` for things that follow *you* between projects.
- **Skills are not sandboxed.** They can instruct Claude to run commands. Only install
  skills from sources you trust, including this one. Read the `SKILL.md`; it's plain
  markdown and usually a few hundred lines.
- **Pin nothing, expect changes.** Skills here get revised as the underlying practice gets
  refined. Version history per skill is in its docs page.

## Creating a skill

The authoring workflow for this repo is defined in [`CLAUDE.md`](CLAUDE.md): define the
goal, interview until the requirements are pinned down, build the skill, document it, then
index it here. Claude Code follows that file automatically when you work in this repo, ask
it for a new skill and it will run the interview.

Contributions and suggestions are welcome via issues and pull requests. A pull request
adding a skill needs every item in CLAUDE.md's "Definition of done".

## Repo layout

```
skills/<name>/SKILL.md    the skill itself (this is what gets installed)
docs/<name>.md            documentation for that skill
sources/                  raw material a skill was distilled from
.claude-plugin/           plugin marketplace catalog
install.sh, install.ps1   manual installers
```

`skills/` is flat, matching what Claude Code installs.

## License

MIT, see [LICENSE](LICENSE).
