# Week 1 — Context Engineering

## Labs

**A. Rewrite your CLAUDE.md (60 min)**

Run `/init` in your main repo. Read the output critically. Then rewrite it against the
"would Claude plausibly get this wrong?" test. Delete at least half of what `/init` gave you.
Add at least five project-specific facts it couldn't know — architectural boundaries,
non-obvious conventions, the one gotcha that bites every new hire. On the Astro + Payload
repo, the seam section in §2 is where most of those five come from.

Then test it. Open a fresh session and ask for a change in an area your new rules cover.
Did it follow them? Where it didn't, the instruction was too vague. Sharpen and retry.

**B. Context budget audit (45 min)**

Take a task you'd normally do in one long session. Run `/context` at the start, at 15
minutes, and at 30. Record the numbers. Identify the single largest consumer, and which of
the four failures it was heading toward. Then do the same task again in a fresh session, but
this time avoid that consumer: narrower file reads, a subagent for exploration whose output
you only need summarised, `/clear` between subtasks. Compare, and name the move (write,
select, compress, isolate) that made the difference.

**C. Plan-to-file (45 min)**

Take a multi-session piece of work. Plan mode, plan written to `docs/plans/`, `/clear`,
then a fresh session that starts from the plan file. Notice how much less context you need
in session two. This is the workflow for anything non-trivial.

---

## Exercises

### Core labs

| Lab | What | Time | Acceptance check |
|-----|------|------|------------------|
| A | Rewrite CLAUDE.md | 60 min | Under 100 lines; at least half of `/init` output deleted; five facts added; one rule demonstrably followed in a fresh session |
| B | Context budget audit | 45 min | Two runs, three `/context` readings each, largest consumer named, second run measurably smaller |
| C | Plan-to-file | 45 min | Plan file exists in `docs/plans/`; the change shipped from a session that started with only the plan file |

### Additional exercises

### Exercise 1.1 — Falsify one CLAUDE.md line

See the worked example in [exercise-template.md](../exercise-template.md#worked-example).
30 min. Journal: `context-audit.md` → CLAUDE.md tests.

### Exercise 1.2 — Prompt-audit and path-scoped rules

| | |
|---|---|
| **Goal** | Use the built-in audit to find stale or contradictory instructions, and move area-specific rules out of the root CLAUDE.md so they load only when relevant. |
| **Targets** | Week 1 §2 (the discipline); anti-pattern 7 (config sprawl); Week 6 quarterly prune. |
| **Prereq** | Lab A. |
| **Time** | 20 min |
| **Real-task shape** | Any CLAUDE.md with a section that only applies to one directory (migrations, a frontend app, a legacy module). |
| **Track relevance** | Track 1 (Onboarder), Track 4 (Archaeologist — the subdirectory pack is exactly this), Track 5 (Interface — component conventions scoped to the component dirs). |

**Steps**

1. Run `/doctor prompt-audit`. Read the findings. Apply the ones you agree with; note the
   ones you don't in the friction log.
2. Find one section of CLAUDE.md that applies only to part of the repo. Move it to
   `.claude/rules/<area>.md` with a `paths:` frontmatter glob (same format as skills'
   `paths`), or to a subdirectory `CLAUDE.md` that loads on demand.
3. Fresh session. Work in that area; confirm the rule is present (`/context` lists loaded
   memory files). Work outside it; confirm it isn't.
4. Record the before/after root line count in `context-audit.md`.

**Acceptance check**

Audit run and findings triaged; root CLAUDE.md shorter than before; one rule that loads
only in its area, verified both ways with `/context`.

**Journal entry**

`context-audit.md` → CLAUDE.md size table (date, root lines, rules files, notes).

**Common failure**

Scoping a rule that actually applies everywhere. The test is: would Claude working
*outside* the glob ever need it? If yes, it stays in the root.

---

## Track beat this week

| Track | Beat (from [tracks.md](../tracks.md), Weeks 1–2) | Counts as |
|-------|------|-----------|
| 1 Onboarder | Lab A *is* your beat. Go further: five facts becomes ten. | Lab A |
| 2 Gatekeeper | Run in `default` mode all week. Log every prompt you approve reflexively in `context-audit.md` → Permission modes. | — |
| 3 Test Whisperer | Start the signal audit early (Week 2 Lab B). Which check catches a broken core invariant? | Week 2 Lab B |
| 4 Archaeologist | Lab C on your subsystem: plan mode only, have Claude explain it back, correct it. The corrections go in a subdirectory CLAUDE.md (Exercise 1.2). | Lab C + 1.2 |
| 5 Interface | Collect the ten review comments you leave most often. That's the rule list. | — |
| 6 Integrator | Baseline the context switch you're targeting: tabs, minutes, per occurrence. | — |
| 7 Automator | Measure the team-time waste candidates (Exercise 0.2 step 3, now for three candidates). | — |
| 8 Parallelizer | Single-stream this week. Time every review pass in `review-ratio.md`. | Lab B timing |
| 9 Skeptic | Failure log: every wasted hour, with reproduction. Lab B's first run is a likely entry. | — |

---

## Exit gate (checkpoint with evidence)

| Checkpoint item | Evidence |
|-----------------|----------|
| CLAUDE.md under 100 lines, every line passes the test | Line count in journal; Exercise 1.1 verdict for at least one line |
| You can read `/context` and name your top two consumers | `context-audit.md` rows from step 2 and Lab B |
| You can name the four ways a context goes bad and the move for each | Lab B conclusion names one failure and one move; the rest said in the friction round |
| You `/clear` between unrelated tasks without thinking | Friction log shows at least three `/clear`s this week with the task boundary noted |
| One change shipped from a written plan file | Plan file in `docs/plans/`; branch/PR |
| You can explain CLAUDE.md vs auto memory vs a hook | Three sentences in the journal, or said in the friction round |
| *(added)* One area-scoped rule loads only in its area | Exercise 1.2 verified both ways |

---

## If stuck

| Symptom | Move |
|---------|------|
| `/init` output is fine and you can't find anything to delete | You're not reading it as a reviewer. Ask: is this line something Claude would get wrong *without* it? Most lines fail |
| Rules are followed in one session and ignored in the next | Rule is vague, or the file is long enough that it isn't salient. Shorten the file before sharpening the rule |
| Lab B second run isn't smaller | You avoided the wrong consumer. Look at tool results, not file reads; run noisy exploration in a subagent so only its summary enters your context |
| Plan file is 300 lines | Too detailed to survive. A plan is steps and decisions, not code |
| No area-specific section exists for Exercise 1.2 | Fine. Run the audit and record "no split warranted". That's a valid result |
