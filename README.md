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
| `/organize` | Reads a venue's author guidelines and builds a LaTeX project in that format, with optional GitHub and Overleaf. Manual only | [docs](docs/organize.md) |
| `/ask-paper` | The helper: explains every skill and when to use it, says where your manuscript stands and what to write next | [docs](docs/ask-paper.md) |
| `/write <section>` | Writes or updates a section: abstract, introduction, results-discussion, conclusions, title, cover-letter, response-to-reviewers | [docs](docs/write.md) |
| `/review <section>` | Critiques a section against its model and reports what is missing or weak, without rewriting it | [docs](docs/review.md) |
| `paper-writing-style` | The style rulebook the others lean on. Claude-only, no `/` command | [docs](docs/paper-writing-style.md) |

### How it fits together

Four commands, and you name the section as an argument:

```
/organize ICSE 2027 <author-guidelines URL>     # the project, in the venue's format
/write results-discussion                       # draft a section, or update an existing one
/review introduction                            # critique a section
/ask-paper                                      # which skill? where am I? what next?
```

`/write` and `/review` cover the same seven sections. Each has its own model from the course, loaded only
when you pick it. Leave the section out and they infer it from the open file or your session state, then
ask if they cannot tell. When a draft already exists, `/write` asks whether to update it or rewrite it.

| Section | Model |
| :--- | :--- |
| Abstract | Six parts: context, gap, purpose, methods, results, conclusions |
| Introduction | Four movements: contextualization, gap, state of the art, purpose |
| Results and discussion | Four information classes per result: background, description, interpretation, comparison |
| Conclusions | The inverse funnel, from your result out to the field |
| Title | A spread of options that state the finding, not just the topic |
| Cover letter | The novelty, and why this journal |
| Response to reviewers | Each comment paired with a response and the exact manuscript location |

`/write` and `/review` share the `paper-writing-style` rulebook, so install that alongside them.

```
./install.sh --all     # everything, including the style rulebook
```

#### The writing order

Sections are not written in the order they are read. The course recommends this sequence, and the whole
package assumes it. [`/ask-paper`](docs/ask-paper.md) walks it, tells you where your manuscript
currently stands, and hands off to the right command for the next step.

| # | Step | Command |
| :-- | :--- | :--- |
| -1 | Set up the project from the venue's format | [`/organize`](docs/organize.md) |
| 0 | Select and order the figures | yours, no skill can do this |
| 1 | Results and discussion | [`/write results-discussion`](docs/write.md) |
| 2 | Conclusions | [`/write conclusions`](docs/write.md) |
| 3 | **Introduction** | [`/write introduction`](docs/write.md) |
| 4 | Methods or experimental | none yet, see [`todo/`](todo/methods-family.md) |
| 5 | Abstract | [`/write abstract`](docs/write.md) |
| 6 | Title | [`/write title`](docs/write.md) |
| 7 | Cover letter | [`/write cover-letter`](docs/write.md) |
| 8 | Revise after review | [`/write response-to-reviewers`](docs/write.md) |

**Step 3 is the one that earns the sequence.** Writing the introduction after the results means the gap
you state is the gap your paper actually answers. Write it first and you state a gap before knowing what
you found, which is how manuscripts end up promising something the results never address. That mismatch
is the commonest structural fault in a paper.

Results and discussion comes first because it is the hardest section and everything else is shaped by
it. The abstract comes fifth because you cannot summarize what does not exist. The title comes last
because it should name your contribution, and you only know the contribution when the paper is done.
Provisional titles along the way are fine.

Deviating is a judgement call, not an error. `/ask-paper` says what it costs and let you decide.

#### Resuming across sessions

A paper is not written in one sitting. The package keeps a `paper-out/` folder beside your manuscript so
work resumes where it stopped instead of restarting. Every skill reads it;
[`/ask-paper`](docs/ask-paper.md) owns it.

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

#### Write and review

The two verbs divide the work cleanly:

- **`/write`** starts a section from nothing, interviewing you for what it needs. With an existing draft it
  moves it forward: reconciling it when the paper changed underneath it, applying suggested changes from
  reviewers, a co-author or a `/review` run, or picking up a half-written draft after a pause. Or it
  rewrites from scratch, if you say so.
- **`/review`** diagnoses an existing section and reports, without rewriting it. It needs a draft, and
  points you at `/write` if there is none.

Sections that need more analysis before they can be built honestly are recorded in
[`todo/`](todo/) rather than guessed at. The methods section is there now: the source course
proposes no model for it, so it is being replaced by narrower sections such as
`threats-to-validity`, derived from real exemplar sections.

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

**Upgrading from 0.1.** The 24 per-section skills (`create-*`, `review-*`, `update-*`,
`write-paper`, `setup-paper-project`) are replaced by `/write`, `/review`, `/ask-paper` and
`/organize`. Install those, and uninstall the old ones: `/plugin uninstall <old-name>@yuryalencar-paper-skills`
or `rm -rf ~/.claude/skills/<old-name>`.

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
