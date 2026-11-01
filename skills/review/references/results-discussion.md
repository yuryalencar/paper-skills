# Results and discussion: review

Diagnose the section the course calls the heart of the paper. The most common failures here are
structural rather than stylistic: results described but never interpreted, results interpreted but
never compared to prior work, and paragraphs that run on because nobody decided where they should
end.

This reviews the writing, not the science. You do not judge whether the results are good, only
whether the text delivers them.

## Context to read

**Get the material.** The section, the figures and captions, the `.bib`, and the introduction if available, since the two must connect.

## Pass 1: information classes, per result block

Split the section into result blocks, one per figure, table or distinct finding. For each, mark
which of the four classes is present:

| Class | Present? |
| :--- | :--- |
| Background, why this analysis matters | |
| Description, what the result shows, with values | |
| Interpretation, the explanation offered | |
| Comparison, how it relates to prior work, with citations | |

Present this as a matrix: result blocks down the side, the four classes across the top. The gaps
are immediately visible, and the pattern of gaps is the finding.

Then report, most serious first:

1. **Missing description with values.** A block that says a property "improved" or was "excellent"
   without numbers. This is the most serious defect available in this section.
2. **Missing interpretation.** Description with no explanation is a data dump. Name each block.
3. **Missing comparison.** No relation to prior work means the reader cannot tell whether the
   result is good. Very common, and cheap to fix.
4. **Missing background** where a reader would not know why the analysis was run.
5. **Results with no corresponding figure, table or text location**, or figures never discussed in
   the text. Both directions are defects.

## Pass 2: topic sentences and paragraph boundaries

For each paragraph:

- **Identify the topic sentence.** Does the first sentence carry a topic (keyword) and a message
  (a claim about it)? Report paragraphs that open with something else, for example a bare methods
  statement or a figure reference with no claim.
- **Check every following sentence relates** to that topic or that message. Report strays.
- **Check the boundary.** A paragraph that changes topic or message halfway should have been split.
  This is the commonest paragraph defect in this section: a single paragraph covering three figures.
- **Propose the missing topic sentence** where one is absent, and propose the split point where a
  paragraph runs on.

## Pass 3: figure captions

For each caption:

- **Is it self-contained?** Could someone in the field understand why the result matters from the
  figure and caption alone, without the body text? This is what good journals expect.
- **Does it merely name the axes?** "Capacitance versus cycle number" is not a caption.
- **Does it duplicate the body text?** Overlap wastes space. Report what should live in which.
- **Are panels labelled and explained**, if the figure has them?

## Pass 4: style

Report each hit with the sentence and a rewrite:

- **Em dashes.** Any `---`, or `--` outside a numeric range.
- **Vague result language.** `good`, `excellent`, `improved`, `significant` without a value or a
  test. Flag every instance; this is the section where it matters most.
- **Stacked passive voice.** Accumulates here more than anywhere else. Quote and rewrite.
- **Hedge stacking.** `it may be possible that this could suggest`. Choose one hedge. Do not push
  towards overclaiming: keep the hedge the evidence supports.
- **Nominalization.** `an increase in capacitance was observed` for `capacitance increased`.
- **Specificity.** Any sentence that could appear unchanged in another paper.
- **Sentence length.** Any sentence whose opening is forgotten by its end.
- **Monotonous openers.** Long runs of subject-then-verb. Propose adverb, prepositional phrase,
  dependent clause or infinitive alternatives.
- **Redundancy**, and anything the editor already assumes: that results were analysed, that samples
  were prepared carefully, that measurements succeeded.
- **Words to use sparingly.** `careful`, `successfully`, `novel`, `preliminary`.
- **`increase` / `enhance` / `improve` used interchangeably.** They differ: `increase` is greater in
  number or degree, `enhance` adds value to something already good, `improve` raises something from
  not good to good.
- **Ambiguity.** `as` or `since` where `because` is meant; pronouns with two possible referents,
  which are rife here because of the density of nouns.
- **Abbreviations** defined at first use, and not stacked several to a short sentence.
- **Numbers and units.** Thin space between quantity and unit, `\%` escaped, `Figure~\ref{}` with a
  non-breaking space, ranges as `--` not `-`.

Do **not** flag `however`, `moreover`, `in contrast`, `nevertheless`, `in summary`, or single
deliberate hedges such as `may`, `suggests` and `is consistent with`. Those are correct register.

## Pass 5: connection to the introduction

Only if the introduction is available:

- **Is every gap answered here?** A gap promised and not addressed is the commonest structural
  fault in a manuscript.
- **Is every result here motivated there?** A result the introduction never set up leaves the reader
  unprepared.
- **Do the state-of-the-art papers cited in the introduction reappear** in the comparison sentences?
  They usually should.

## Deliver

1. The information-class matrix.
2. Structural verdict, most serious first.
3. Topic sentence and paragraph boundary findings, with proposed sentences and split points.
4. Caption findings.
5. Style hits with rewrites.
6. Connection mismatches.
7. **A rewritten version of the two or three weakest blocks**, not the whole section: results and
   discussion sections are long, and rewriting all of it buries the diagnosis. Say which blocks you
   chose and why.

Then ask whether to apply. Never edit their files unasked.

## Hard rules

- **Never invent a value** to fill a missing description. Report that the value is missing.
- **Never supply a missing interpretation.** Report that interpretation is absent and ask the
  researcher for the explanation. Proposing a mechanism they did not propose is inventing science,
  and it is the single most dangerous thing this skill could do.
- **Never invent a comparison citation.**
- **Never emit an em dash.**
- Separate the writing verdict from scientific merit. If a result looks scientifically weak, say so
  in one line and move on.
- If the section is already good, say so and keep the review short.
