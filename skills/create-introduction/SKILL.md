---
name: create-introduction
description: Write a scientific paper introduction in LaTeX following the four-movement model (contextualization, gap, state of the art, purpose) from Zucolotto's course, with the general-to-specific funnel and the three classes of citation. Interviews the researcher for the literature and the gap, drafts, then refines. Use when asked to write, draft or produce an introduction for a paper, article or manuscript.
allowed-tools: Read, Grep, Glob
---

# /create-introduction

Produce a publication-quality introduction as a LaTeX fragment. The section has one job: leave
a reader, expert or not, comfortable enough to understand everything that follows.

## Before anything else

1. **Load the style rules.** Invoke `paper-writing-style` and read `references/human-voice.md`
   and `references/latex-conventions.md`. If it is not installed, use the condensed rules at the
   bottom of this file.
2. **Lock the language.** Detect the language of the user's first message and keep it for the
   whole run. Never switch mid-run. **Output LaTeX is always English.**
3. **Read the context.** Find `.tex` files, the `.bib` file, and the results and discussion
   section if it exists. Read the `.bib` keys: they are the literature you have to work with.
   Detect the citation style. Do not ask for anything you can find yourself.

## Write this section third, not first

The course puts the introduction **third** in the writing order, after results and discussion and
after conclusions, for one reason: writing it once you know what the results say produces an
introduction aimed directly at them, so the connection between the gap you state and the gap you
answer is never lost. If the results section does not exist yet, say so and offer to continue
anyway, but note that the introduction will probably need revising later.

The full order is in `paper-writing-style`, and `/write-paper` walks it.

## The four movements

| Movement | Carries | Typical position |
| :--- | :--- | :--- |
| Contextualization | The broad field, its importance, and the terms, jargon and methods the reader needs | First paragraph or two |
| Gap | What is unresolved, unexplained, contested, too costly, or not well understood | Following paragraphs |
| State of the art | Where the knowledge frontier is now, through the most recent relevant work | Middle to late |
| Purpose | What this paper does about it | Last paragraph, almost always |

The state of the art is the movement most often missing. Without it the reader cannot judge
whether the paper advances anything, because they do not know where the frontier was.

## The three dimensions

Every introduction has to work on all three at once. Check each before delivering.

**1. Information.** The four movements above, each actually present.

**2. Flow: general to specific.** The section funnels. It opens on the broad field and narrows
continuously to the purpose, which is the most specific thing in it. This works inside
paragraphs too, not just across them. A worked example of narrowing within one paragraph:

> While the vast majority of layer-by-layer systems exhibit linear growth, certain
> polyelectrolyte combinations grow exponentially. Recently, a modified version of the
> technique was introduced by our group. **A substantially smaller and more recent subset** of
> the layer-by-layer literature describes \ldots

Each sentence closes the aperture. Never widen back out until the conclusions section.

**3. Citation and referencing.** Three classes of source belong in an introduction, and knowing
which is which is how you choose from hundreds of candidates:

| Class | Where it goes | Why |
| :--- | :--- | :--- |
| Seminal papers, the work that founded the field or technique | Contextualization, sometimes gap | Establishes the lineage |
| The most recent relevant work, published weeks or months ago | State of the art, and gap | Shows where the frontier is, and that you are current |
| High-impact work between those poles | Relevance, motivation, importance | Shows the field matters |

If the `.bib` file has no recent entries, say so. An introduction whose newest citation is four
years old reads as out of touch, and reviewers notice.

## Workflow

### 1. Gather what exists

Accept a short description, paths to the manuscript or results section, a `.bib` file, a list of
key papers, or nothing. Read everything given before asking a question.

### 2. Interview

Batches of at most four questions, using `AskUserQuestion` where answers are selectable.
Continue until all four movements can be written without inventing anything. Cover:

- **Target journal**, which sets how much contextualization is needed. A specialist venue's
  audience already knows why the field matters; a broad one such as *Nature* does not and the
  introduction has to establish it.
- **The broad field**, and the terms, jargon and methods a reader needs defined.
- **The gap**, pressed hard. This is the movement that determines whether the paper looks
  necessary. What is unresolved, unexplained, contested, or prohibitively expensive? A gap of
  "more research is needed" is not a gap.
- **The state of the art.** Which recent papers define the current frontier? Ask for keys or
  citations. If the researcher cannot name any from the last year or two, raise it.
- **Seminal work** that founded the field or the technique.
- **The purpose**, and confirmation that it answers the stated gap.
- **Length**, in paragraphs or words, if the journal constrains it.

### 3. Draft

Emit one LaTeX fragment, in English, with movement labels:

```latex
% CONTEXTUALIZATION
Layer-by-layer assembly produces ultrathin polymer films with nanometre control over
thickness and composition \citep{decher1997}, and has become a standard route to
functional coatings for biomedical devices \citep{lee2019}.
% GAP
However, the mechanical stability of these films under physiological shear remains poorly
understood, which limits their use in implantable devices \citep{costa2021}.
% STATE OF THE ART
Recently, significant advances have been reported in crosslinking strategies that improve
film cohesion \citep{park2024,mendes2025}, although these have been characterized only
under static conditions.
% PURPOSE
In this paper, we report the shear stability of crosslinked layer-by-layer films under
physiological flow, measured over 30 days.
```

Show it in chat in a fenced `latex` block. Then state the paragraph count and, in a few lines,
which choices you made: how much context you spent and why, which papers you placed where, and
how the funnel narrows.

### 4. Check and refine

Ask what to change. Expect pushback on the gap and on the choice of state-of-the-art citations;
both are judgement calls only the researcher can settle. Show the full fragment each round.

### 5. Verify against the results

Before finishing, check the introduction against the results and discussion section if it exists.
Every relevance claim, gap and state-of-the-art reference in the introduction should have its
counterpart later in the paper. The two sections must be tightly connected, and an introduction
that promises something the results never address is the most common structural fault in a
manuscript.

### 6. Offer to write it out

Only after approval, offer to write the fragment to a file or patch the manuscript.

## Hard rules

- **Never invent a citation key or a reference.** If a claim needs a source you do not have,
  emit `% TODO: cite <what is needed>`. Never attach the nearest plausible key from the `.bib`.
- **Never invent the state of the art.** If you do not know what was published recently in the
  field, say so and ask. Fabricating a frontier is worse than leaving a gap.
- **Never emit an em dash (`---`).** `--` only in numeric ranges.
- **Never copy text from a cited source.** Read the idea, state it in your own words, cite the
  author. Citation says where the idea came from, never where the text came from. The only
  exception is a direct quotation in quotation marks, which is rare in this genre.
- The funnel never widens. Check the draft narrows monotonically.
- Past tense for what was done, present for what is currently known.
- Cut `it is important to note that`, `plays a key role`, `novel`, and any sentence that would
  fit unchanged in a different paper.

## Condensed style rules, if `paper-writing-style` is not installed

Clarity and concision govern. One idea per sentence, short enough that the reader reaches the
full stop with the opening in mind. Be specific: a sentence that could appear in any paper in the
field says nothing. Put the action in the verb. Cut redundancy and anything the editor already
assumes. Prefer plain words: `use` over `utilization`, `to` over `in order to`, `most` over `the
majority of`, `because` over `due to the fact that`. Avoid `delve`, `harness`, `leverage`,
`underscore`, `pave the way`, `crucial role`. Keep `however`, `moreover`, `in contrast`, `in this
paper`, `here we report`: correct scientific register, not filler. Never stack passive voice.
Vary sentence openers between subject-verb, adverb, prepositional phrase, dependent clause and
infinitive phrase. Every `it` and `this` needs one possible referent. Thin space between quantity
and unit (`10\,nm`), escape `\%`.
