# Git and Overleaf

Optional final step of `/organize`. Offer it; never start it unasked.

## The order matters, and it is not obvious

Overleaf **cannot link an Overleaf project to a GitHub repository that already exists**. You get one of two
directions, chosen once at creation. **Ask which one applies before doing anything**, because it determines
the whole sequence:

**Direction A, starting from nothing.** Template into a local repo, push to GitHub, then create the Overleaf
project **from** that repository.

**Direction B, starting from Overleaf.** The researcher already has an Overleaf project, usually created by
importing the venue template through Overleaf's own template gallery. Then the GitHub repository is created
**from** the Overleaf project, cloned locally, and restructured into `src/` from there. This is common and
perfectly fine; the first commit ends up being the Overleaf import.

What does not work in either direction is attaching an existing repository to an existing Overleaf project.
If the researcher has both already, one has to be recreated from the other, so establish this first rather
than discovering it later.

For direction B, skip repository creation below: clone what Overleaf produced, then apply the scaffold to it
as a restructuring commit.

## What Overleaf sync does and does not do

State these honestly up front. Several of them surprise people.

| Fact | Consequence |
| :--- | :--- |
| GitHub sync is **premium only**: Overleaf Commons, a group subscription, or an individual subscription | Many universities provide it through Commons. If the researcher has no premium access, use the fallback below |
| Sync is **manual**, triggered from the project menu | Nothing happens automatically. Push before you edit locally, pull before you edit on Overleaf |
| **No branching** in Overleaf's git integration | Branch locally if you want, but Overleaf only ever sees the default branch |
| Simultaneous edits on both sides **cannot auto-merge** | Overleaf pushes a branch with its version and you resolve it on GitHub or locally |
| **Track changes and comments can be lost** on pull | Co-authors commenting in Overleaf should be warned before a pull |
| **github.com only**, not GitHub Enterprise | An institutional GHE host will not work |
| Recommended limits: under 100 files per commit, under 100 MB total | Keep raw data out of the repo |
| No Git LFS, no submodules; symlinks become regular files | Do not plan around them |

**Fallback without premium.** Keep the repository as the source of truth, work locally, and use Overleaf
only when a co-author needs to edit in a browser, moving files by upload and download. Say plainly that
this is manual and error-prone, and that a repository alone is a perfectly good way to write a paper.


## Create the GitHub repository and push

Use `gh` if available. Confirm name and visibility first, then initialise, commit the scaffold, create the
repository, and push. Report the URL.

If `gh` is not installed or not authenticated, say so and give the researcher the two commands to run
themselves rather than guessing at credentials.

## Connect Overleaf

This step happens in the Overleaf web interface and cannot be automated from here. For **direction A**, give
the researcher the exact steps and wait. For **direction B** the project already exists on Overleaf and the
repository came from it, so the connection is already in place: confirm it still pushes and pulls, and skip
to step 6.

Direction A:

1. On Overleaf, choose **New Project**, then **Import from GitHub**.
2. Authorise Overleaf's GitHub access if prompted.
3. Pick the repository just created.
4. Confirm the project compiles. If it does not, the template is usually missing a class or bibliography
   style file, so check those were committed.
5. Paste the Overleaf project link back, and add it to `README.md`.

Remind them that from here on, sync is manual in both directions, and that pulling into Overleaf can drop
comments and track changes a co-author has left.

