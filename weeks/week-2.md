# Week 2 — The Agentic Loop & Verification

## Labs

**Do Lab B first.** The test-first loop only works if a test can fail for the right reason.
Find out whether yours can before you spend 75 minutes discovering it doesn't.

**A. The test-first loop (75 min)**

Find a genuine bug in your repo. Then:

1. Claude writes a failing test that reproduces it. Verify it fails for the right reason.
2. `/clear`.
3. Fresh session: point at the failing test, ask for a fix, forbid touching the test.
4. Review the diff at both altitudes.

Note how much smaller the context needed for step 3 was. The test carried the spec.

**B. Signal audit (45 min)**

For your primary repo, write down honestly:

- Does the type checker catch real errors, or is it `any` all the way down?
- Can you run the full test suite in under two minutes? (If not, the agent's loop is slow too.)
- If Claude broke a core invariant, which check would catch it? Is there one?

Pick the weakest link and fix it this week. You're not doing test hygiene as a chore —
you're raising the agent's ceiling.

**C. Deliberate rewind (30 min)**

Waiting for a session to go wrong means this lab rarely happens, so schedule it. Take the
bug from Lab A, whose cause you now know, and check out Lab A's test commit (before the fix)
so the test fails again. Open a fresh session with a plausible **wrong** diagnosis stated as
fact. Watch it anchor. Let it run two correction rounds and time them; then `/rewind` to
before the wrong diagnosis, reframe with the real failure output, and time that. Most people are surprised by the gap. ([Exercise 2.1](#exercise-21--wrong-diagnosis-on-purpose-then-rewind) below has the steps.)

---

## Exercises

### Core labs

| Lab | What | Time | Acceptance check |
|-----|------|------|------------------|
| B (first) | Signal audit | 45 min | Table filled; weakest link named; one concrete fix started this week |
| A | Test-first, two sessions | 75 min | Test commit fails before, passes after; fix commit doesn't touch the test file; both passes of review done |
| C | Deliberate rewind | 30 min | Replaced by Exercise 2.1 so it can be scheduled |

### Additional exercises

### Exercise 2.1 — Wrong diagnosis on purpose, then rewind

| | |
|---|---|
| **Goal** | Experience anchoring on a wrong theory and the recovery move, on a schedule instead of by accident. |
| **Targets** | Week 2 §5; anti-pattern 1 (confident wrong diagnosis); checkpoint item on `/rewind`. |
| **Prereq** | Lab A done (you need a bug you understand). |
| **Time** | 30 min |
| **Real-task shape** | A bug whose real cause you already know from Lab A, or any small reproducible bug. |
| **Track relevance** | Track 9 (Skeptic) — this is a reproduction of a real failure mode; log it. |

**Steps**

1. Check out Lab A's test commit, before the fix, so the test fails again. Fresh session.
   Paste the failing output, then state a *plausible but wrong* cause as
   fact: "This is caused by the connection pool. Fix it."
2. Let it run two correction rounds. Time them. Note how elaborate the workaround gets.
3. `/rewind` to before your first message (or `/clear`). `/rewind` restores files Claude
   changed with its edit tools, not ones a shell command changed; `git checkout .` clears the
   rest. Now: paste the same output, give
   your theory *labelled as a theory*, and ask it to check before assuming.
4. Time to a correct fix. Record both times.

**Acceptance check**

Two timings in the journal and one sentence on what the agent did with the wrong theory.
If the wrong theory happened to be right, pick a wronger one and repeat.

**Journal entry**

`friction-log.md` → dated entry, tagged `rewind`.

**Common failure**

Correcting it mid-way because it's painful to watch. Let round two finish; the point is to
see that round three rarely converges.

### Exercise 2.2 — The agent as first reviewer

| | |
|---|---|
| **Goal** | Calibrate what the built-in review catches and what it misses, so you use it as a first pass and never the only one. |
| **Targets** | Week 2 §3 (reviewing at the right altitude). |
| **Prereq** | Lab A diff on a branch. |
| **Time** | 20 min |
| **Real-task shape** | Any agent-produced diff you have already reviewed by hand. |
| **Track relevance** | Track 3 (Test Whisperer) — this is a preview of the reviewer-agent comparison in Week 4. |

**Steps**

1. Do your own two-pass review first and write down your findings. Don't skip this order.
2. Run `/code-review` on the branch.
3. Three columns: found by both, found only by you, found only by it.
4. For each "only by you": is it something a prompt could catch (Week 3/4 material), or
   judgment?

**Acceptance check**

The three-column table in the journal. "Only by you" is non-empty, or you say honestly
that it wasn't and why.

**Journal entry**

`review-ratio.md` → Reviewer comparison table.

**Common failure**

Running `/code-review` first and then "reviewing", which is reading its output. The order
is the exercise.

---

## Track beat this week

| Track | Beat | Counts as |
|-------|------|-----------|
| 1 Onboarder | Add the shared-utilities map to CLAUDE.md (failure mode: reinvented utility). | — |
| 2 Gatekeeper | Approval log continues. First draft of the allowlist from it. | — |
| 3 Test Whisperer | Lab B *is* your beat. Publish the signal table to the cohort. Start delegating the test-infra fix. | Lab B |
| 4 Archaeologist | Test-first (Lab A) on a bug *in your subsystem*. What did Claude get confidently wrong? | Lab A |
| 5 Interface | Turn the ten review comments into ten checkable rules. | — |
| 6 Integrator | Write the acceptance criteria for "ticket in, PR description out" now. Week 5 builds it. | — |
| 7 Automator | Pick the one target. Write down why, with the measurement. | — |
| 8 Parallelizer | Still single-stream; time reviews. Exercise 2.2 gives you a reviewer-vs-you data point. | Exercise 2.2 |
| 9 Skeptic | Exercise 2.1 is a reproduction. Log it properly. | Exercise 2.1 |

---

## Exit gate (checkpoint with evidence)

| Checkpoint item | Evidence |
|-----------------|----------|
| Shipped a change with the test-first, two-session loop | Two commits; fix commit touches no test file |
| CLAUDE.md has the "never modify tests to make them pass" rule | CLAUDE.md diff |
| You do the `--stat` shape pass before reading any agent diff | Friction log entries mention the shape pass at least twice |
| You've used `/rewind` to abandon a bad trajectory | Exercise 2.1 timings |
| You can name the weakest signal and what you did | Signal table; a commit or ticket for the fix |
| *(hard gate)* A strong signal exists and runs in minutes | Suite timing in the signal table |

---

## If stuck

| Symptom | Move |
|---------|------|
| No tests, no type check, nothing | Stop the labs. This week is a smoke test plus strict type checking on one module. That *is* the finding; tell the facilitator |
| Suite takes 20 minutes | Find the subset that covers Lab A's module and give Claude that command. Fixing suite speed may be Track 3's job |
| Claude modified the test anyway | The rule wasn't in CLAUDE.md yet, or it was vague. Add it, then consider a hook in Week 3 that blocks edits to `*.test.*` during fix sessions |
| Can't find a bug for Lab A | Your issue tracker, oldest open bug. Or the flaky test from Week 0 |
| `/code-review` finds nothing and neither did you | Pick a bigger diff, or one you didn't write. The exercise needs findings to compare |
