# Human voice: banned constructions and protected vocabulary

The goal is prose a researcher would have written, not prose that reads as generated.
This file draws the line, because the two lists below look similar to an untrained eye
and stripping the wrong one damages the paper.

Read this before drafting. Retrofitting it afterwards never works as well.

## Banned: punctuation

| Never | Use instead |
| :--- | :--- |
| `---` (em dash), in any role | comma, colon, semicolon, parentheses, or a full stop |
| `--` (en dash) as a connector or aside | same as above |
| ` - ` (spaced hyphen) as a dash substitute | same as above |
| Em dash pairs for a parenthetical aside | commas or parentheses |

`--` is correct and expected in numeric and page ranges: `10--20\,nm`, `300--400\,°C`,
`pp.~13--17`. That is its only legitimate use here.

A colon is the right tool for introducing a list or an explanation, and a semicolon for
joining two closely related independent clauses. Both are normal in academic prose. Use
them freely; they are what the em dash was standing in for.

## Banned: rhetorical constructions

| Construction | Why it is out |
| :--- | :--- |
| `It is not just X, it is Y` | Rhetorical flourish, carries no information |
| `not only \ldots but also` used for rhythm | Same, unless the contrast is genuinely the point |
| Three-item lists built for cadence rather than content | Reads as generated; keep the items the data supports |
| `It is important to note that`, `it is worth noting that`, `it is relevant to mention here that` | Nine words to say nothing. Delete and state the fact |
| `In today's world`, `In an era of` | Filler opener |
| `In recent years, there has been growing interest in` | Filler. Compare the protected form below |
| Closing a section by restating what it just said | The reader has it. Stop |
| `This underscores the importance of` | Say what follows from it, concretely |
| `plays a crucial role`, `plays a pivotal role`, `plays a key role` | Write `is essential`, or name the actual function |
| Hedge stacking: `may potentially possibly suggest` | Choose one hedge |
| Uniform sentence length across a paragraph | Vary it. See sentence openers in SKILL.md |

## Banned: inflated verbs and nouns

`delve into`, `unlock`, `harness`, `leverage`, `showcase`, `underscore`, `illuminate`,
`shed light on`, `pave the way for`, `usher in`, `a testament to`, `landscape` (figurative),
`realm`, `tapestry`, `intricate`, `myriad`, `plethora`, `robust` (unless statistically
meant), `seamless`, `cutting-edge`, `game-changing`, `revolutionary`.

Some have literal technical uses. `Harness` is fine for energy, `robust` is fine for a
robust estimator, `pave` is fine in materials science. The ban is on the figurative use.

## Protected: do not strip these

Everything in this section is correct scientific register, taught explicitly in the source
course. A humanization pass that removes them makes the paper worse.

**Gap markers.** `however`, `nevertheless`, `in contrast`, `on the other hand`,
`conversely`, `although`, `despite`, `one drawback of`, `key challenges must be addressed`,
`remains poorly understood`, `has been an open problem`, `is not straightforward`,
`are not well suited for`. `However` opening the second sentence of an abstract is the
standard way to introduce the gap.

**Purpose markers.** `in this paper`, `in this study`, `in this investigation`,
`this paper describes`, `this paper reports`, `here we report`, `here we show`,
`in the work reported here`.

**Transitions.** `moreover`, `furthermore`, `in addition`, `for example`, `in other words`,
`in summary`, `in conclusion`.

**State of the art.** `Recently, significant advances have been made in \ldots \cite{}` is
correct and expected. This is not the same as the banned filler `in recent years, there has
been growing interest in`. The difference: the protected form makes a specific claim and
cites it; the banned form announces that a topic exists.

**Passive voice** where it is natural, especially in Methods. Only *stacked* passives are a
defect.

**First person plural**, used sparingly for emphasis: `we report`, `we synthesized`,
`our group has investigated`.

**Hedging**, single and deliberate: `may`, `suggests`, `is consistent with`,
`these results indicate`. Scientific claims are calibrated. Removing all hedges overclaims,
which is a worse fault than hedging.

## The test

Before emitting a sentence, ask which of these it is:

1. It states something specific about this study that could not be said of another paper.
   Keep it.
2. It moves the reader from one idea to the next using a connector above. Keep it.
3. It announces, frames, emphasizes, or summarizes without adding information.
   Delete it and move the real content up.

Category 3 is where generated prose accumulates. It is also the easiest to cut, because
nothing depends on it.
