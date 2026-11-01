# Introduction

## Create mode

Produce a publication-quality introduction as a LaTeX fragment. The section has one job: leave
a reader, expert or not, comfortable enough to understand everything that follows.

### Context to read

**Read the context.** Find `.tex` files, the `.bib` file, and the results and discussion section if it exists. Read the `.bib` keys: they are the literature you have to work with. Detect the citation style. Do not ask for anything you can find yourself.

### Write this section third, not first

The course puts the introduction **third** in the writing order, after results and discussion and
after conclusions, for one reason: writing it once you know what the results say produces an
introduction aimed directly at them, so the connection between the gap you state and the gap you
answer is never lost. If the results section does not exist yet, say so and offer to continue
anyway, but note that the introduction will probably need revising later.

The full order is in `paper-writing-style`, and `/ask-paper` walks it.

### The four movements

| Movement | Carries | Typical position |
| :--- | :--- | :--- |
| Contextualization | The broad field, its importance, and the terms, jargon and methods the reader needs | First paragraph or two |
| Gap | What is unresolved, unexplained, contested, too costly, or not well understood | Following paragraphs |
| State of the art | Where the knowledge frontier is now, through the most recent relevant work | Middle to late |
| Purpose | What this paper does about it | Last paragraph, almost always |

The state of the art is the movement most often missing. Without it the reader cannot judge
whether the paper advances anything, because they do not know where the frontier was.

### The three dimensions

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

### Workflow

#### 1. Gather what exists

Accept a short description, paths to the manuscript or results section, a `.bib` file, a list of
key papers, or nothing. Read everything given before asking a question.

#### 2. Interview

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

#### 3. Draft

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

#### 4. Check and refine

Ask what to change. Expect pushback on the gap and on the choice of state-of-the-art citations;
both are judgement calls only the researcher can settle. Show the full fragment each round.

#### 5. Verify against the results

Before finishing, check the introduction against the results and discussion section if it exists.
Every relevance claim, gap and state-of-the-art reference in the introduction should have its
counterpart later in the paper. The two sections must be tightly connected, and an introduction
that promises something the results never address is the most common structural fault in a
manuscript.

#### 6. Offer to write it out

Only after approval, offer to write the fragment to a file or patch the manuscript.

### Hard rules

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

## Update mode

An introduction already exists and needs to change. Create mode starts from nothing,
`/review introduction` diagnoses without rewriting, and this mode evolves what is there.

Assume the text was correct once. This is a **revision, not a rewrite**: what still holds stays
exactly as the researcher wrote it.

### Context to read

**Read the context.** The introduction, the rest of the manuscript, the `.bib` file and its keys, and the citation style.

### Pick the mode

State which mode you are in before starting, so the researcher can correct you.

| Mode | Signal | What it does |
| :--- | :--- | :--- |
| **A. Reconcile** | The paper changed, no explicit feedback given | Diff the introduction against the manuscript and fix the drift |
| **B. Apply suggestions** | Reviewer comments, co-author notes or `/review introduction` output supplied | Incorporate each suggested change deliberately |
| **C. Resume** | The introduction is visibly incomplete | Continue from where it stopped |

Where several apply, run B, then C, then A, so reconciliation runs last over the finished text.

If there is no introduction at all, point at `/write introduction`.

### Mode A: reconcile with the paper

Introductions drift in specific, predictable ways. Check each:

1. **The gap is no longer answered.** Results were added or dropped, so the paper now addresses a
   different gap than the introduction states. This is the most serious case: it is exactly what
   reviewers catch, and it makes the paper read as incoherent.
2. **The purpose no longer matches.** Compare the final paragraph against the abstract's purpose
   and the conclusions. All three must agree.
3. **A promise is unkept.** The introduction raises something the results never address.
4. **A result is unmotivated.** The results section now covers something the introduction never
   set up, so the reader meets it with no preparation. Usually the introduction needs a gap
   sentence added.
5. **The state of the art has aged.** Check the newest citation's year against today. Work
   published since the introduction was written may now define the frontier, which changes what
   counts as novel.
6. **Obsolete method or material names** that the paper no longer uses.
7. **Broken citation keys** no longer present in the `.bib`.

Present as a table: what the introduction says, what the paper says, where, and severity.

**Never assume the paper wins.** Either the introduction is stale, or the body changed by mistake
and the introduction was right. Where the answer is obvious, state your assumption and let the
researcher correct it. Ask only where it changes the outcome.

### Mode B: apply suggested updates

Reviewer comments on introductions cluster into recognizable requests. Handle them explicitly:

- *"The contribution is unclear"* usually means the purpose paragraph or the gap, not both. Say
  which you targeted.
- *"The related work is incomplete"* means the state of the art. Ask which papers to add; never
  invent them.
- *"Too long"* means deciding which movement gives way. Contextualization is normally the
  candidate, but say so and let the researcher choose.
- *"The novelty is not clear"* is usually a gap problem, not a purpose problem.

Then:

1. **Enumerate every suggestion** as a numbered item. Split reviewer prose: one paragraph often
   contains three distinct requests.
2. **Classify each**: *direct* (apply it), *interpretive* (propose a fix and flag the
   interpretation), *conflicting* (surface it, do not pick a side), *out of scope* (say so, leave
   it).
3. **Apply, propose, resolve.**
4. **Account for every item**, including any not applied and why. A reviewer request silently
   dropped has consequences.

Where a request conflicts with the house style or the four-movement model, apply it anyway and
note the tension. The reviewer outranks the style guide.

### Mode C: resume after a pause

1. **Categorize what exists**, labelling paragraphs with their movement, as
   `/review introduction` does. This shows where the draft stopped.
2. **Identify which movements are missing.** Contextualization and gap are usually present;
   state of the art and purpose are usually what is missing, in that order.
3. **Recover the thread from the paper.** Read the results and the `.bib` to work out what the
   missing movements should say rather than asking the researcher to repeat what the manuscript
   already contains.
4. **Check the funnel still holds** across the join. A resumed introduction commonly widens back
   out at the point where writing restarted, because the writer lost the thread. This is the
   defect to watch for.
5. **Ask only for what is genuinely absent**, in batches of at most four.
6. **Match the existing voice**: register, tense pattern, level of detail, citation density.

Do not restyle the parts already written. If they have defects, mention it and suggest
`/review introduction` afterwards rather than mixing a resume with a critique.

### Produce the revision

Emit the updated introduction as a LaTeX fragment with movement labels, and:

- **Preserve the researcher's wording wherever it still holds.**
- Mark each changed block: `% UPDATED: gap now covers the shear result added in Sec.~3.4`,
  `% ADDED: state of the art was missing`, `% UPDATED: reviewer 1 asked for Park 2024 here`.
- Keep any length constraint the introduction already respected. If the update cannot fit, name
  which existing content must give way and let the researcher choose.
- `% TODO:` for any citation or fact you could not verify.

Show the fragment, then summarize the changes.

Finally, verify the four movements survived and the funnel still narrows monotonically. If the
update broke either, say so. Do not run a full style review; suggest `/review introduction`.

### Offer to write it out

Only after approval, offer to patch the manuscript or write the fragment to a file.

### Hard rules

- **Never invent a citation key or recent literature.** If the state of the art needs refreshing,
  ask which papers belong there.
- **Never emit an em dash.** `--` only in numeric ranges.
- **Never silently drop** researcher text or a suggestion. If it goes, say which and why.
- **Never copy text from a source.** Restate in your own words and cite.
- If the introduction and the paper already agree and there is nothing to apply, say so and change
  nothing.

## Condensed style rules

Fallback when `paper-writing-style` is not installed.

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
