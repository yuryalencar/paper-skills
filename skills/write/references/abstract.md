# Abstract

## Create mode

Produce a publication-quality abstract as a LaTeX fragment, built on the six-part model and
the house style rules. The researcher is expected to adapt the result; your job is to hand
them text that would already pass an editor.

### Context to read

**Read the context.** Look for `.tex` files, a `.bib` file, and any existing abstract in the working directory. Detect the citation style as described in the LaTeX conventions. Do not ask the user for anything you can find yourself.

### The six-part model

| Part | Carries | Typical length |
| :--- | :--- | :--- |
| Contextualization | The broad field and why it matters | 1--2 sentences |
| Gap | What is unresolved, unclear, or controversial. Usually opens with `however` | 1--2 sentences |
| Purpose | What this paper reports, tied directly to the gap | 1 sentence |
| Methods | How it was done, in general terms | 1--2 sentences |
| Results | The principal findings, with real numbers | 2--3 sentences |
| Conclusions | How these results advance the broad field | 1--2 sentences |

**Purpose, results and conclusions are mandatory.** Without them the text is not an
abstract. Contextualization and gap are strongly recommended, and may be dropped or merged
under a tight word limit or a specialist audience. Two parts can share one sentence when
space is short.

Total is normally 200--300 words unless the journal says otherwise.

### Workflow

#### 1. Gather what exists

Accept any of: a short description of the work, paths to a manuscript or a results section,
a figure list, or nothing at all. Read whatever is given before asking a single question.

#### 2. Interview

Ask in batches of at most four questions, using `AskUserQuestion` where the answers are
selectable. Keep going until you can write **every mandatory part** without inventing
anything. Cover:

- **Target journal.** This governs everything downstream: word limit, whether the journal
  wants a structured abstract with labelled sections, and how much contextualization to
  spend. A specialist journal needs little field justification because the audience already
  has it; a broad journal such as *Nature* or *Science* needs the importance of the whole
  field established. If the researcher does not know yet, use 200--300 words, the full
  six-part model, and a specialist audience.
- **The broad field**, in the terms the target audience uses.
- **The gap.** Press on this. A weak gap is the most common reason an abstract reads as
  unremarkable. What is unresolved, unexplained, contested, or too expensive in the current
  state of the art? The purpose must answer this specific gap.
- **The purpose**, and how it addresses that gap.
- **Methods**, at the level of technique names rather than parameters.
- **The principal result, with actual numbers.** Not all results, the ones that matter. Ask
  for the values; never estimate them.
- **The contribution**: what a reader in the field can now do, or now knows, that they
  could not before.

Do not draft before the mandatory parts are covered. If a number or citation is genuinely
unavailable, that becomes a `% TODO:`, not a guess.

#### 3. Draft

Emit one LaTeX fragment, in English, labelled with structure comments so the researcher can
see the model being followed:

```latex
% CONTEXTUALIZATION
Silver nanoparticles are widely used as antimicrobial agents in wound dressings
\citep{silva2024}.
% GAP
However, their long-term cytotoxicity towards human keratinocytes remains poorly understood.
% PURPOSE
In this paper, we report the cytotoxicity of citrate-capped silver nanoparticles towards
HaCaT keratinocytes over 72\,h.
% METHODS
Cell viability was assessed by MTT assay and membrane integrity by lactate dehydrogenase
release.
% RESULTS
Viability fell to 62\% at 25\,\textmu g\,mL$^{-1}$ and to 18\% at 100\,\textmu g\,mL$^{-1}$,
while lactate dehydrogenase release increased threefold over the same range.
% CONCLUSIONS
These results indicate a concentration threshold below which silver dressings remain
compatible with keratinocyte monolayers, which is directly relevant to the design of
antimicrobial wound care materials.
```

Show it in chat in a fenced `latex` block. Then state the word count and, in two or three
lines, which choices you made and why, so the researcher can argue with them.

#### 4. Check and refine

Ask what to change. Expect pushback on the gap and on which result leads; those are
judgement calls only the researcher can settle. Iterate as many rounds as they want, showing
the full fragment each time rather than a diff, since the abstract is short and reads as a
whole.

#### 5. Offer to write it out

Only once the researcher is satisfied, offer to write the fragment to a file or patch it
into the manuscript. Never write to their files before that point.

### Hard rules

- **Never invent a result, a number, a method detail, or a citation key.** Emit
  `% TODO: <exactly what is missing>` instead.
- **Never emit an em dash (`---`).** `--` only in numeric ranges. Use commas, colons,
  semicolons, and full stops.
- Past tense for what was done, present tense for what the results indicate.
- Third person by default. First person plural is fine sparingly, for emphasis.
- The main finding appears as early as the model allows. There is no suspense in a
  scientific abstract.
- Cut `it is important to note that`, `plays a key role`, `novel`, `successfully`,
  `carefully`, and every sentence that would fit unchanged in a different paper.

## Update mode

An abstract already exists and needs to change. This mode evolves it, in contrast to
Create mode, which starts from nothing, and `/review abstract`, which diagnoses without
rewriting.

The starting assumption is always that the current text was correct once. So this is a
**revision, not a rewrite**: sentences that still hold are left exactly as the researcher
wrote them.

### Context to read

**Read the context.** Find the abstract, the manuscript body, the `.bib` keys and the citation style in the working directory. Read figures, tables and captions too: a result that exists only as a figure is still a result the abstract may need.

### Pick the mode

Determine which of three situations this is. Say which one you are in before you start, so the
researcher can correct you.

| Mode | Signal | What it does |
| :--- | :--- | :--- |
| **A. Reconcile** | The paper changed. No explicit feedback given | Diff the abstract against the manuscript and fix the drift |
| **B. Apply suggestions** | Reviewer comments, co-author notes, or `/review abstract` output was supplied | Incorporate each suggested change, deliberately |
| **C. Resume** | The abstract is incomplete or clearly unfinished | Continue from where it stopped |

More than one can apply at once, most often B and A together after a revision round. Run them
in the order B, then C, then A, so that a reconciliation pass runs last over the finished text.

If none applies because there is no abstract yet, stop and point at `/write abstract`. If
there is an abstract but no manuscript and no feedback, there is nothing to update against;
suggest `/review abstract` instead.

### Mode A: reconcile with the paper

Build two pictures and diff them.

From the **current abstract**, extract what it claims part by part: field, gap, purpose,
methods, each numerical result, conclusion.

From the **current manuscript**, extract the same six as the paper now supports: purpose from
the last paragraph of the introduction, methods from the methods section, every principal
result with its values, the conclusion the conclusions section now draws, and the gap the
introduction now develops.

Report divergences in this order, which is the order of severity:

1. **Contradicted numbers.** The abstract states a value the paper no longer supports. Quote
   both, with locations.
2. **Unsupported claims.** The abstract asserts something the paper does not show.
3. **Missing principal results.** A finding important enough for the abstract that the abstract
   omits. Say why you judge it principal.
4. **Drifted purpose.** The introduction's final paragraph now states a different objective.
5. **Drifted conclusions.** The conclusions section now claims more, less, or something else.
6. **Stale gap.** The introduction's gap was rewritten, so the purpose no longer answers the
   gap the abstract states.
7. **Obsolete detail.** Methods or materials named in the abstract that the paper no longer uses.

Present it as a table: what the abstract says, what the paper says, where in the paper, and
severity. Where the two agree, say so briefly rather than listing every match.

**Never assume the paper wins.** A divergence has two resolutions and only the researcher knows
which: the abstract is stale and should follow the paper, or the paper changed by mistake and
the abstract was right. Where the answer is obvious, such as a value the results section clearly
revised, state your assumption and let them correct it. Reserve explicit questions for the ones
that change the outcome.

### Mode B: apply suggested updates

The suggestions may arrive as reviewer comments, a co-author's notes, tracked changes, an email,
or the output of `/review abstract`.

1. **Enumerate them.** List each suggestion as a separate item, numbered. If they arrived as
   prose, split them; a single reviewer paragraph often contains three distinct requests.
2. **Classify each one.** Say which of these it is:
   - *Direct*: a specific change to make. Apply it.
   - *Interpretive*: a criticism without a prescribed fix, for example "the contribution is
     unclear". Propose the fix and flag that you interpreted it.
   - *Conflicting*: contradicts another suggestion, or contradicts what the paper shows. Do not
     silently pick a side; surface the conflict and ask.
   - *Out of scope*: concerns the science or another section, not the abstract's wording. Say so
     and leave it.
3. **Apply the direct ones**, propose the interpretive ones, resolve the conflicts with the
   researcher.
4. **Account for every item.** Report what happened to each one, including any you did not
   apply and why. A suggestion silently dropped is the main failure mode here, and with
   reviewers it has consequences.

Where a suggestion would break the six-part structure or contradict the house style, apply it
anyway if it is a reviewer's request, and note the tension. The reviewer outranks the style
guide.

### Mode C: resume after a pause

The abstract is unfinished. Work out what state it is in before adding anything.

1. **Categorize what exists.** Label each existing sentence with the part it implements, as
   `/review abstract` does. This shows exactly where the draft stopped.
2. **Identify what is missing**, distinguishing the mandatory parts (purpose, results,
   conclusions) from the recommended ones (context, gap).
3. **Recover the thread.** Read the manuscript to work out what the missing parts should say,
   rather than asking the researcher to repeat information the paper already contains.
4. **Ask only for what is genuinely absent**, in batches of at most four questions.
5. **Match the existing voice.** The finished parts set the register, the tense pattern and the
   level of detail. A resumed abstract that changes voice halfway is obvious to a reader.

Do not restyle the parts that were already written. If they have defects, mention it and
suggest `/review abstract` afterwards, rather than mixing a resume with a critique.

### Produce the revision

Emit the updated abstract as a LaTeX fragment with structure labels, and:

- **Preserve the researcher's wording wherever it still holds.** Unnecessary churn hides what
  actually changed and erodes trust in the update.
- Mark each changed block with a comment saying why:
  `% UPDATED: viability value now 62\% per Table~2`,
  `% UPDATED: reviewer 2 asked for the sample size here`,
  `% ADDED: conclusions part was missing from the draft`.
- Keep within the word limit the abstract already respected. If the update cannot fit, say
  which existing sentence must give way and let the researcher choose.
- Where a value is still unknown, emit `% TODO:` naming it.

Show the fragment in chat, then summarize what changed in a few lines.

Finally, verify the six-part model survived: purpose, results and conclusions present, gap
answered by the purpose. If the update broke the structure, say so. Do not run a full style
review; that is `/review abstract`, and you should suggest it rather than duplicating it.

### Offer to write it out

Only after the researcher approves, offer to patch the manuscript or write the fragment to a
file. Never edit their files before that.

### Hard rules

- **Never invent or estimate a number.** Every value must be traceable to a specific place in
  the manuscript, or be a `% TODO:`.
- **Never emit an em dash.** `--` only in numeric ranges.
- **Never silently drop** something the researcher wrote, or a suggestion someone made. If it
  goes, say which and why.
- If the abstract and the paper already agree and there is nothing to apply, say so and change
  nothing. A clean result is a valid outcome and should not be padded with cosmetic edits.

## Condensed style rules

Fallback when `paper-writing-style` is not installed.

Clarity and concision govern. One idea per sentence, short enough that the reader reaches
the full stop with the opening still in mind. Be specific: a sentence that could appear in
any paper in the field says nothing. Put the action in the verb (`the condition improved`,
not `an improvement in the condition was observed`). Cut redundancy (`completely
eliminated`, `introduce a new`). Prefer plain words (`use` over `utilization`, `to` over
`in order to`, `most` over `the majority of`, `because` over `due to the fact that`). Avoid
`delve`, `harness`, `leverage`, `underscore`, `pave the way`, `crucial role`. Keep `however`,
`moreover`, `in contrast`, `in this paper`, `here we report`: those are correct scientific
register, not filler. Never stack passive voice. Make sure every `it` and `this` has one
possible referent. Thin space between quantity and unit (`10\,nm`), escape `\%`.
