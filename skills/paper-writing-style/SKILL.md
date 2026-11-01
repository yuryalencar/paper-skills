---
name: paper-writing-style
description: House style rules for scientific paper writing in English, distilled from Valtencir Zucolotto's scientific writing course. Load whenever drafting, revising, or reviewing any part of a scientific manuscript (abstract, introduction, results, discussion, conclusions, cover letter) so the prose reads as clear, concise, specific, human-written academic English rather than generated text. Also load when asked to humanize, tighten, or de-jargon scientific prose.
user-invocable: false
---

# Scientific writing house style

Rules for producing English scientific prose that an editor of a high impact journal
would accept. Apply them when writing or reviewing any manuscript section.

Two words govern everything: **clarity** and **concision**. Clarity is the message
reaching the reader's mind as fast as possible. Concision is doing that with the fewest
words. Every sentence must carry one idea to the reader.

## Project layout and conventions

Four things to establish before writing a single line, all covered in
`references/latex-conventions.md`:

1. **The project's own `CLAUDE.md` outranks these defaults.** A working paper repository documents its
   layout, section files, label convention, page limit and data provenance rules. Read it first and follow
   it. Never restructure a project to match a default.
2. **Sections live one per file in `src/`**, with `main.tex` holding the preamble, title block and `\input`
   order. **Read the `\input` list to learn what the project calls things** rather than assuming:
   `conclusion.tex` and `conclusions.tex` both occur, results and discussion may be one file or two, and
   methods may be `study-design.tex`.
3. **Read `src/macros.tex`.** Recurring values and terminology are defined there so they stay consistent.
   Write `\nparticipants participants`, not `54 participants`. Write `\RQ{1}`, not `\textbf{RQ1}`. When a
   value changes, change the macro, not the prose. When a value recurs and has no macro, propose one.
   If `\newif\ifblind` is present the paper is double blind, so never insert author names, affiliations, or
   self-identifying phrasing.
4. **Mark gaps with the project's `\todo{}` macro** where one exists, since it renders in the PDF, and fall
   back to a `% TODO:` comment only when there is none. A comment is invisible in the PDF and survives to
   submission.

Where the project states a **page limit**, treat it as a constraint on every draft: say what a section
costs, and name what should give way rather than overrunning. An over-length paper is desk rejected without
being read.

## Session state: check `paper-out/` first

A paper spans weeks or months, so **before asking the researcher anything, check whether
`paper-out/STATE.md` exists in the working directory.** If it does, read it plus `decisions.md` and any
relevant `interviews/*.md`, then say in two or three lines what you already know so they can correct
anything stale. Never re-ask a question whose answer is already recorded.

`paper-out/` stores only what cannot be re-derived from the manuscript: the target journal, which result
is principal and why, what was deliberately deferred, interview answers, open questions, and declined
reviewer points with their reasons. It never stores prose, values, figure numbers or section structure,
because a duplicate goes stale and then lies. **If stored state and the manuscript disagree, the
manuscript wins.**

Write to it after any decision the researcher makes, and say which files you created or changed. Never
block on it: if it is missing or unreadable, carry on without it and say so.

Full protocol, including the file layout and the `STATE.md` format, is in `references/session-state.md`.
Read it before creating or updating any state.

## The writing order

Sections are not written in the order they are read. The course recommends this sequence, and every
skill in the family assumes it:

| # | Section | Why here |
| :-- | :--- | :--- |
| 0 | **Select and order the figures** | Precondition, not a section. The figures tell the story; the text supports them |
| 1 | **Results and discussion** | The hardest section, and the one every other section is shaped by |
| 2 | **Conclusions** | Written while the findings are fresh, and derived directly from them |
| 3 | **Introduction** | Written knowing what the results say, so the gap it states is the gap the paper answers |
| 4 | **Methods, or experimental** | One of the simplest sections. Mechanical once the work is done |
| 5 | **Abstract** | Cannot summarize what does not exist yet |
| 6 | **Title** | Revisited last, once the paper's actual contribution is known |

The important step is 3. Writing the introduction after the results keeps the two sections
connected, which matters because a gap promised in the introduction and never answered in the
results is the commonest structural fault in a manuscript.

Provisional titles along the way are fine. What matters is rewriting the title at the end.

Deviating from this order is a judgement call, not an error. Say so when a section is being written
out of sequence, and note what may need revising later.

## Non-negotiables

These are the rules that get violated most and cost the most. Never break them.

1. **Never emit an em dash (`---`).** Use a comma, colon, semicolon, parentheses, or a
   full stop. An en dash (`--`) is allowed *only* in numeric and page ranges:
   `10--20\,nm`, `pp.~13--17`. Never as a connector or aside.
2. **Never invent results, numbers, citations, or method details.** If a value or source
   is unknown, emit a visible `% TODO:` marker naming exactly what is missing. A
   plausible fabrication is the worst possible output.
3. **No suspense.** State the main finding as early as the section allows. Scientific
   writing has no room for building up to a reveal.
4. **Be specific.** A sentence that could appear in any paper in the field says nothing.
   See "Specificity" below.
5. **One idea per sentence, and keep sentences short enough to finish.** The reader's
   mind forms the idea at the full stop. If a sentence is so long that its opening is
   forgotten by its end, it transmitted nothing.
6. **Read every draft as if aloud.** Redundancy, stacked passives, and monotonous
   rhythm are audible before they are visible.

For the full list of banned constructions and the protected vocabulary that must *not*
be stripped, read `references/human-voice.md`. Read it before drafting, not after.

## Tense, voice, person

- **Past tense** for the completed study and for what was done: `this study investigated`,
  `measurements were carried out`, `the films were deposited`.
- **Present tense** fits the Conclusions, where the implications for the field are stated:
  `these results indicate`, `this approach offers`.
- **Active and passive are both valid.** Active is more direct and uses fewer words, so
  prefer it. Never *stack* passives: `a new methodology for protein purification is
  discussed and isolation techniques are described and results are compared` must be
  rewritten.
- **Third person dominates** high impact papers and reads faster. Prefer
  `analyses revealed that the virus incorporated into the cells` over `in our analyses we
  observed that`.
- **First person plural, used sparingly, is a legitimate emphasis device**: `we report`,
  `we synthesized`, `our group has investigated`. Sprinkle it where emphasis is wanted;
  do not build the whole text on it.
- Scientific papers are highly formal. `nowadays` becomes `currently` or `recently`.
  `on the contrary` becomes `in contrast`.

## Specificity

A generic sentence is the thing to eliminate. Compare:

- Weak: `Novel strategies have been proposed to overcome the limitations related to
  disease diagnosis.` Which strategies, which limitations, which diseases? It says nothing.
- Better: `The use of carbon nanotube based biosensors has been proposed to overcome the
  poor selectivity exhibited by conventional systems used for cancer detection.`
- Best: `Carbon nanotube based biosensors exhibit high selectivity for cancer detection.`

Every sentence must survive the question "could this appear unchanged in a different
paper?" If yes, it needs detail or deletion.

**Emphasis by word choice.** The same fact can be aimed at different targets. Decide what
the reader should carry away, then write for that:

- Levels are the point: `Unexpectedly high levels of a protein were found in blood samples
  from patients with haemorrhagic infections.`
- The protein is the point: `High levels of a specific S100 family protein were found in
  blood samples from these patients.`
- The relationship is the point: `High levels of this protein are found in blood samples
  from infected patients, which may be the cause of the infection.`

## Sentence and paragraph construction

**Keep complementary information adjacent.** If a sentence opens `the level of protein
found in blood samples`, the reader immediately asks *what level*. Answer it in the same
breath: `the level of protein found in blood samples was 1\,mg per decilitre, which is
similar to that observed by Harvard's group.` Any further detail follows in a new sentence.

**Topic sentences.** The first sentence of a paragraph carries the **topic** (as a keyword)
and the **message** (what is claimed about it). Every following sentence must relate to one
or the other. When either changes, the paragraph ends. This is also how paragraph length is
decided, and it is the cleanest way to open a paragraph that describes a figure.

**Vary sentence openers.** A paragraph where every sentence opens subject then verb reads
flat, even to a reader who cannot name the problem. Rotate among:

| Opener | Example |
| :--- | :--- |
| Subject + verb | `The results show that \ldots` |
| Adverb | `Recently, DNA sensors have been \ldots` |
| Prepositional phrase | `In the following months, the systems will \ldots` |
| Dependent clause | `Although cancer diagnosis is not straightforward, \ldots` |
| Infinitive phrase | `To optimize the systems, \ldots` |

**Connectors, by the direction the ideas move.** These are correct scientific register and
must not be treated as filler:

| Movement | Connectors |
| :--- | :--- |
| Continuing | `moreover`, `furthermore`, `in addition` |
| Explaining, restating | `for example`, `in other words` |
| Reversing | `however`, `in contrast`, `on the other hand`, `conversely`, `nevertheless` |
| Closing | `in summary`, `in conclusion` |

The reversing connectors are the standard way to open a gap statement in an abstract or
introduction. `However` at the start of the second sentence of an abstract is a feature.

## Redundancy and action in the verb

**Cut redundancy.** `completely eliminated` (either it is eliminated or it is not),
`introduce a new methodology` (introducing implies new; write `introduce a methodology` or
`report a new methodology`), `during the data collection phase of the study`, `in a period
of time of three months`. Also cut what the editor already assumes: that results were
analysed, that errors were removed, that samples were prepared carefully.

**Put the action in the verb.** Nominalization drains sentences:

| Instead of | Write |
| :--- | :--- |
| `a continuous improvement in patient condition was observed` | `the patient's condition improved` |
| `administration of dopamine produced a decrease in the frequency of convulsions` | `dopamine decreased the convulsion frequency` |
| `made the arrangement for` | `arranged` |
| `made the decision` | `decided` |
| `made the measurement of` | `measured` |
| `performed the development of` | `developed` |

## Ambiguity

- `as` and `since` can read as either *because* or *while*. When cause is meant, write
  `because`. `Tissue temperature increased because the particles released the drug.`
- Every `it`, `they`, `them`, `this`, `these`, `there` must have one unmistakable referent.
  `Since the platform has a support system connected to the equipment, it was mounted
  inside the lab` leaves `it` pointing at two candidates. Name the thing.
- Define an abbreviation at first use, then use only the short form. Do not stack several
  abbreviations into one short sentence, even when all are defined.

## Words to use sparingly

`preliminary`, `careful` / `carefully`, `novel`, `successfully`. A paper reporting
preliminary conclusions invites the question of why it was submitted. That samples were
carefully prepared and results successfully obtained is the minimum the editor assumes.
Each of these words is acceptable once, when it carries real information.

Prefer precision over the vague noun. Replace `fact` and `case` with what they stand for:
`this effect`, `this observation`, `this phenomenon`, `this value`.

For introducing purpose, prefer `in this paper`, `in this study`, `in this investigation`,
or `here we report` over `in this work`. Calling the document in the reader's hands "this
work" is imprecise, though `in the work reported here` is fine.

## Further reference

- `references/plain-english.md`: substitution tables for inflated words and phrases,
  plus the confusable-word list (`analysis`/`analyses`, `through`/`thorough`/`though`,
  `increase`/`enhance`/`improve`, `administer`/`administrate`, `reproducible`).
- `references/human-voice.md`: banned constructions, protected vocabulary, and how to
  tell an AI tell from correct academic register. **Read before drafting.**
- `references/latex-conventions.md`: what LaTeX to emit, units, ranges, citation
  detection, and annotation comments.

## Source

Distilled from *Curso de Escrita Científica: Produção de Artigos de Alto Impacto* by
Prof. Dr. Valtencir Zucolotto (Instituto de Física de São Carlos, USP), which in turn
draws on Michael Alley's *The Craft of Scientific Writing*, *Essentials of Writing
Biomedical Research Papers*, and the ACS Style Guide.
