# Paper type and structure

The structure of a paper depends on what kind of paper it is. A systematic mapping study, a tool paper, an
industry paper, an empirical study, an experimental physical-sciences article and a short communication each
organise their sections differently, and the differences are conventions of a field and a venue, not rules
you can recite.

The course models the **sections** (abstract, introduction, results and discussion, conclusions, title,
cover letter, response to reviewers). It does not model **paper types**. So this skill never supplies a
type's structure itself: it finds out what the researcher is writing, then grounds the structure in
something they provide.

## 1. Ask about the paper

Check `paper-out/interviews/paper-type.md` first and reuse an earlier answer, saying what you already know.
Otherwise ask in one batch, at most four questions, with concrete options and room for free text:

- **What kind of paper is it?** Offer common types as prompts, not a closed list: systematic mapping or
  review, tool or artifact, industry or experience report, empirical study, experimental or laboratory
  study, short communication, theory. Take their word if it is none of these.
- **What is it about?** The topic, the problem, and what the researcher did or built.
- **Who is it for?** The venue, and the audience that venue implies.
- **Is there a venue profile?** Read it from `paper-out/STATE.md` if `/organize` wrote one, or ask for the
  URL of the author guidelines.

Then talk it through if the answers leave the type unclear. The goal is to understand what the paper is
actually trying to claim, since that decides which sections carry weight.

## 2. Ground the structure

Look for the structure in these places, **in this order**, and stop at the first that settles it:

1. **The venue's author guidelines or template.** Many venues, and tracks within venues (tool, industry,
   registered report), prescribe sections. Read them, and quote the passage you rely on.
2. **The project's own structure.** The `\input` list in `main.tex` and the files in `src/` show what the
   researcher or `/organize` already settled.
3. **The exemplars folder:** previously accepted papers from the same venue and track. This is the most
   valuable source after the guidelines, because it shows what that venue actually accepts. See below.
4. **Other example papers the researcher supplies**, of the same type, handled the same way.
5. **The researcher's own outline**, even a rough one.

If none of these exists, **do not fall back on what such papers usually look like**. Say the structure is
not yet grounded, draft only the sections that do not depend on it (an abstract and a conclusions section
follow their own models whatever the paper type), and put a TODO in the skeleton asking for one of the
sources, naming which would help most. The exemplars folder is usually the best one to suggest.

## The exemplars folder

Look for `exemplars/` in the project root (or the folder `CLAUDE.md` or `STATE.md` names). It holds papers
the researcher downloaded from the **venue and track they are targeting**: previous accepted papers, or the
papers a systematic mapping of that track turned up. Organise them as `exemplars/<venue-or-track>/`.

`/organize` creates it in every project, with a `.gitkeep`. **If it is missing** (an older project), suggest
creating it; **if it is empty**, say so and ask the researcher to fill it before you derive a structure. Say
why it is worth the time: a draft structured on what the venue has accepted beats one structured on a
guess. Tell the researcher:

- Put the PDFs there, ideally 5 to 10 of the **same paper type** from the **same venue or track**.
  Fewer works but grounds the structure more weakly, and you will say so.
- **Keep it out of version control and out of Overleaf.** The papers are other people's copyrighted work
  and the folder can be large. Check that `.gitignore` ignores its contents but keeps `.gitkeep` (`exemplars/*` and `!exemplars/.gitkeep`), and
  offer to fix it.

**How to use it.** Apply the categorization method: label each paper's sections, their order, their rough
weight and what each contains, then keep **only what recurs across them** and say how many papers each
element appears in. Note what varies, so the researcher can choose. The pattern becomes the structure you
propose in step 3.

**What you take and what you do not.** You take structure: which sections exist, in what order, how long,
and what each does. You do **not** take sentences, results or claims, and you do not paraphrase them
closely. Facts from these papers are evidence to cite, under the rules in `references/sources.md`.
Record which exemplars you used in `paper-out/interviews/paper-type.md`.

## 3. Show the structure before using it

Present the structure as a short list of sections, each with the source it came from ("venue guidelines,
section 3", "your outline", "recurs in all three of your examples"). Mark anything inferred rather than
sourced, and let the researcher correct it before you draft against it.

## 4. Record it

Write the answers, the structure's source and the exemplars used to `paper-out/interviews/paper-type.md`, so the next session
inherits them and the structure is not renegotiated. If the researcher supplied example papers, record
which ones, so the same grounding can be reused.

## How the type shapes a draft

Within a section the course's model still holds. What the type changes is **which sections exist, how much
weight each carries, and what a section must contain beyond the model**. For example, if the grounded
structure for a tool paper has a section describing the tool's architecture, that section's content comes
from the researcher's material and the grounded source, and a part the material cannot fill becomes a TODO.
Do not carry a structure learned in one paper type into another.
