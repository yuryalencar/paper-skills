---
name: update-introduction
description: Move an existing paper introduction forward, in any of three situations: the paper changed and the introduction has drifted, there are suggested changes to incorporate from reviewers or a co-author, or it was left half-written and needs resuming. Preserves the researcher's wording where it still holds. Use when an introduction already exists and needs to change rather than be written from scratch.
allowed-tools: Read, Grep, Glob
---

# /update-introduction

An introduction already exists and needs to change. `/create-introduction` starts from nothing,
`/review-introduction` diagnoses without rewriting, and this skill evolves what is there.

Assume the text was correct once. This is a **revision, not a rewrite**: what still holds stays
exactly as the researcher wrote it.

## Before anything else

1. **Load the style rules.** Invoke `paper-writing-style`. If absent, use the condensed rules in
   `create-introduction`.
2. **Lock the language.** Language of the user's first message, for the whole run. Output LaTeX is
   always English.
3. **Read the context.** The introduction, the rest of the manuscript, the `.bib` file and its
   keys, and the citation style.

## Pick the mode

State which mode you are in before starting, so the researcher can correct you.

| Mode | Signal | What it does |
| :--- | :--- | :--- |
| **A. Reconcile** | The paper changed, no explicit feedback given | Diff the introduction against the manuscript and fix the drift |
| **B. Apply suggestions** | Reviewer comments, co-author notes or `/review-introduction` output supplied | Incorporate each suggested change deliberately |
| **C. Resume** | The introduction is visibly incomplete | Continue from where it stopped |

Where several apply, run B, then C, then A, so reconciliation runs last over the finished text.

If there is no introduction at all, point at `/create-introduction`.

## Mode A: reconcile with the paper

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

## Mode B: apply suggested updates

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

## Mode C: resume after a pause

1. **Categorize what exists**, labelling paragraphs with their movement, as
   `/review-introduction` does. This shows where the draft stopped.
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
`/review-introduction` afterwards rather than mixing a resume with a critique.

## Produce the revision

Emit the updated introduction as a LaTeX fragment with movement labels, and:

- **Preserve the researcher's wording wherever it still holds.**
- Mark each changed block: `% UPDATED: gap now covers the shear result added in Sec.~3.4`,
  `% ADDED: state of the art was missing`, `% UPDATED: reviewer 1 asked for Park 2024 here`.
- Keep any length constraint the introduction already respected. If the update cannot fit, name
  which existing content must give way and let the researcher choose.
- `% TODO:` for any citation or fact you could not verify.

Show the fragment, then summarize the changes.

Finally, verify the four movements survived and the funnel still narrows monotonically. If the
update broke either, say so. Do not run a full style review; suggest `/review-introduction`.

## Offer to write it out

Only after approval, offer to patch the manuscript or write the fragment to a file.

## Hard rules

- **Never invent a citation key or recent literature.** If the state of the art needs refreshing,
  ask which papers belong there.
- **Never emit an em dash.** `--` only in numeric ranges.
- **Never silently drop** researcher text or a suggestion. If it goes, say which and why.
- **Never copy text from a source.** Restate in your own words and cite.
- If the introduction and the paper already agree and there is nothing to apply, say so and change
  nothing.
