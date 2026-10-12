# Week 0 — Setup & Baseline

## Lab: Your first real task

Pick a genuinely annoying, genuinely real task in a repo you own. Good candidates:

- A flaky test you've been ignoring for a month
- A dependency upgrade with a migration guide
- A refactor you sketched out and never did
- Documentation for a module only you understand

Bad candidates: anything you could do in five minutes, anything touching production data,
anything where you can't tell whether the result is correct.

```bash
git checkout -b claude/week-0
claude
```

Then, in session:

Press `Shift+Tab` until the indicator shows plan mode (or start with
`claude --permission-mode plan`), then:

```
> Read the failing test in tests/integration/checkout.test.ts and the code it exercises.
> Explain why it's flaky. Don't fix it yet — I want to understand the cause first.
```

(`/plan <prompt>` does the same for a single prompt.)

Note what happened: it explored, it read files you didn't name, it formed a theory. That
exploration *is* the product in plan mode. Read its reasoning before you approve anything.

---

## Lab: Baseline measurement

You cannot tell whether this curriculum worked without a before. Spend fifteen minutes:

```bash
mkdir -p .claude/journal
echo ".claude/journal/" >> .gitignore   # it's personal; keep it out of commits
```

(Or keep it outside the repo at `~/.claude/journal/<repo>/`.) Copy the templates from
[`journal/`](../journal/): the friction log, context audit, delegation
log, review ratio and failure log all live here, and Weeks 3 and 6 read them back.

Write `.claude/journal/week-0-baseline.md` answering:

1. What kinds of task do I currently *not* delegate, and why?
2. How long does my typical "understand unfamiliar code" loop take?
3. What in my workflow is pure repetition — same shape, different inputs — every week?
4. On a scale of 1–5, how much do I trust an agent-produced diff without reading it?
   (Correct answer is 1. Write down your honest answer anyway.)

Question 3 is the one that pays. Keep adding to it all six weeks; Week 3 turns those
entries into slash commands and Week 6 turns them into team tooling.

Then four numbers, because Week 6 measures delivery and needs a before
([Exercise 0.2](#exercise-02--quantitative-baseline) below has the method):

- Median time from PR open to first review, last ten merged PRs
- Median time from PR open to merge, same PRs
- Median time from bug reported to PR open, last five bugs
- Hours per week the team spends on the thing you'd most like to automate

If a number can't be got, write down why. "Nobody tracks it" is a finding.

Finally, rate yourself against the [competency matrix](../competency-matrix.md),
one level per dimension. You'll re-rate in Week 6.

---

## Exercises

### Core labs

| Lab | What | Time | Acceptance check |
|-----|------|------|------------------|
| First real task | One non-trivial task, plan mode first, on a branch | 60 min | Commit exists on `claude/week-0`; you can name one file Claude read that you didn't mention |
| Baseline | Four questions answered honestly | 15 min | File exists; Q3 has at least three entries |

### Additional exercises

### Exercise 0.1 — Permission-mode drill

| | |
|---|---|
| **Goal** | Feel the difference between the permission modes on a real edit, so the choice in later weeks is deliberate. |
| **Targets** | Week 0 §2; competency dimension 3 (Harness). |
| **Prereq** | None. |
| **Time** | 20 min |
| **Real-task shape** | A trivial, safe edit repeated three times: rename a local variable, add a log line, fix a typo in a comment. |
| **Track relevance** | Track 2 (Gatekeeper) — this is the start of the reflexive-approval log. |

**Steps**

1. Manual mode (`claude --permission-mode default`). Ask for the trivial edit. Count the
   prompts. Approve them.
2. `Shift+Tab` to `acceptEdits`. Same shape of edit. Note what it *didn't* ask.
3. Plan mode. Ask for the same edit. Confirm nothing is written until you approve.
4. Ask Claude to run `git push` in each mode with a deny rule for `Bash(git push:*)` in
   `settings.local.json`. Confirm the deny holds in all three.
5. Record in `context-audit.md` → "Permission modes" table.

**Acceptance check**

A four-row table in the journal (mode, prompts seen, what it could do unasked, deny held
Y/N). Row 4 says Y three times.

**Journal entry**

`context-audit.md` → Permission modes.

**Common failure**

Skipping step 4 because "obviously it holds." The point is that you saw it hold; Track 9
will later try to prove it doesn't.

### Exercise 0.2 — Quantitative baseline

| | |
|---|---|
| **Goal** | Capture the delivery numbers Week 6 will compare against. Without these, Week 6 has nothing to measure. |
| **Targets** | Week 6 §2 (measuring honestly); anti-pattern 11 (measuring the wrong thing). |
| **Prereq** | None. |
| **Time** | 20 min |
| **Real-task shape** | Your last ten merged PRs and last five bugs. Use your tracker's export or `gh pr list --state merged --limit 10 --json createdAt,mergedAt,reviews`. |
| **Track relevance** | Track 8 (Parallelizer) uses the review numbers; Track 7 (Automator) uses the "time wasted" one. |

**Steps**

1. For the last ten merged PRs: time from open to first review, and open to merge. Median
   of each.
2. For the last five bugs: time from report to PR open. Median.
3. One honest estimate: hours per week the team spends on the thing you'd most like to
   automate (Track 7 candidates).
4. Write all four numbers, with how you got them, into `week-0-baseline.md` under
   "Quantitative baseline."

**Acceptance check**

Four numbers with a method line each. If a number can't be obtained, the entry says why —
that's a finding too (usually: nobody tracks it).

**Journal entry**

`week-0-baseline.md` → Quantitative baseline.

**Common failure**

Measuring coding time instead of end-to-end time. Week 6 measures "bug reported → PR open",
not "started typing → stopped typing."

---

## Track beat this week

Same for every track this week: read your track's beats, then write **one sentence** at the
top of your friction log: *the artifact, who will use it, and what "done" means.* If you
can't write the sentence, the track is under-specified — say so in the session.

| Track | Extra this week |
|-------|-----------------|
| 2 Gatekeeper | Start the reflexive-approval log now (Exercise 0.1 is its first entries) |
| 8 Parallelizer | Exercise 0.2's review numbers are your baseline; keep the raw data |
| 9 Skeptic | Open `failure-log.md` (see [`journal/`](../journal/)). First entry: anything that surprised you in your first real task |

---

## Exit gate (checkpoint with evidence)

| Checkpoint item | Evidence |
|-----------------|----------|
| `claude --version` works; authenticated | You started a session in your repo today |
| You can name the permission modes and when you'd use each | Exercise 0.1 table filled; three sentences in the journal |
| You can explain why a CLAUDE.md rule is weaker than a deny rule | Three sentences in the journal on what a deny rule guarantees that CLAUDE.md doesn't; Exercise 0.1 step 4 |
| One real task completed on a branch, diff read line by line | Commit on `claude/week-0`; a friction-log entry written while reading the diff |
| `week-0-baseline.md` written | File exists, four questions + four numbers + six matrix levels |
| *(added)* Track assigned and "done when" written | First line of friction log |

**This is a hard gate.** Anything unticked gets fixed before Week 1 starts.

---

## If stuck

| Symptom | Move |
|---------|------|
| Auth or proxy fails | Not a curriculum problem. Escalate to the environment owner; don't burn the session |
| "Every task I can think of is too small" | Look at your open bugs list, oldest first. The month-old flaky test is always there |
| Can't tell whether the result is correct | Wrong task. Correctness must be checkable; pick one with a test or a reproducible output |
| Baseline Q3 is empty | Ask: what did I do last Friday that I also did the Friday before? Start there |
| No colleague available for track selection (solo) | Pick Track 1 or Track 3; both work without interlocks. Track 2 needs a Track 9 to test it |
