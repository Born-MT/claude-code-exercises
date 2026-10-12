# Week 4 — Delegation & Parallelism

## Before you start: choosing a delegation shape

Given a task, pick deliberately:

```
Is it self-contained, and do I only need the conclusion?
  → Subagent

Is it a genuinely separate stream of work on a different branch?
  → Worktree + second session

Does it need my current conversation's nuance?
  → Keep it in the main session

Is it long-running and blocking?
  → Background it, and pick up something else meanwhile

Am I delegating because I don't understand the problem?
  → Stop. Understand it first. Delegation amplifies clarity; it does not create it.
```

That last branch is the one to internalize. Delegation is a multiplier on how well-specified
the work is. Multiply a vague spec and you get vague output, faster.

---

## Labs

**A. Build a reviewer subagent (60 min)**

Write a `code-reviewer` or `test-auditor` agent for your codebase, with read-only tools and
your team's actual standards in the prompt. Run it against a PR you already reviewed by
hand. Compare findings. Where it missed something you caught, that gap is a missing line in
the agent prompt — add it. Iterate twice.

**B. Parallel worktrees (90 min)**

Two independent tasks, two worktrees, two sessions. Work both for an hour. Then review both
diffs properly, end to end, and note how long review took relative to generation. That
ratio is your real throughput limit, and knowing it changes how you plan work.

**C. Delegation post-mortem (30 min)**

Over the week, log every delegation in `.claude/journal/delegation-log.md` (template in
[`journal/`](../journal/)): task, shape chosen, whether it was the right call.
By Friday you'll have a personal heuristic more useful than any general advice here.

---

## Exercises

### Core labs

| Lab | What | Time | Acceptance check |
|-----|------|------|------------------|
| A | Reviewer subagent | 60 min | Agent has no `Edit`/`Write` in `tools`; run against a hand-reviewed PR; two iterations logged with what each added |
| B | Parallel worktrees | 90 min | Two branches with real commits; both diffs reviewed fully; ratio recorded; limit stated |
| C | Delegation post-mortem | 30 min | At least five entries by Friday, each with "right call?" answered |

### Additional exercises

### Exercise 4.1 — Shape drill

| | |
|---|---|
| **Goal** | Classify work by delegation shape *before* starting it, so the shape is a decision rather than a reflex. |
| **Targets** | Week 4 §4; competency dimension 4 tell ("declines to parallelize something, for a stated reason"). |
| **Prereq** | Read "Choosing a delegation shape" above. |
| **Time** | 15 min |
| **Real-task shape** | The next five items on your own backlog, whatever they are. |
| **Track relevance** | Track 8 (Parallelizer) — this is how you pick Lab B's two streams. |

**Steps**

1. List five upcoming tasks.
2. For each, walk the decision list in "Choosing a delegation shape" and write the shape: subagent / worktree + session /
   main session / background / "stop, I don't understand it yet".
3. For each, one clause of reason.
4. At least one must be "main session" or "stop". If none is, you're rationalising.

**Acceptance check**

Five rows in `delegation-log.md` with shape and reason, filled *before* any of the five is
started. Revisit on Friday and mark which shapes were right.

**Journal entry**

`delegation-log.md` → planned shapes table.

**Common failure**

Classifying everything as parallelisable because the tooling makes it possible. The
constraint is review bandwidth, not tooling.

### Exercise 4.2 — Hand one thing off

| | |
|---|---|
| **Goal** | Practise the interlock mechanics before Week 6 demands them: give someone an artifact and let them use it without you narrating. |
| **Targets** | Week 6 capstone standard ("used by someone other than you"); Track interlocks. |
| **Prereq** | Any artifact from Weeks 1–4: a skill, a hook, an agent, a subdirectory CLAUDE.md. |
| **Time** | 15 min for you; 15 min for them. |
| **Real-task shape** | Track 2 → Track 9: the settings and hooks. Track 4 → partner: the comprehension pack. Everyone else: your best Week 3 skill to a cohort peer. |
| **Track relevance** | Tracks 2, 4, 9 (required); all others (recommended). |

**Steps**

1. Pick the artifact. Write the one-paragraph "how to use it" you'd put in a PR description.
2. Give it to the partner. Say nothing else.
3. They use it on a real task and send you three lines: worked / didn't / what they'd change.
4. Log what you learned in the friction log.

**Acceptance check**

Three lines from the partner exist. If they couldn't use it without asking you, that's the
finding and it goes in the log verbatim.

**Journal entry**

`friction-log.md` → dated entry tagged `handoff`.

**Common failure**

Sitting next to them. The test is whether the artifact carries itself.

---

## Track beat this week

| Track | Beat (Weeks 3–4) | Counts as |
|-------|------|-----------|
| 1 Onboarder | Give the `explain-subsystem` skill to a peer (Exercise 4.2). | 4.2 |
| 2 Gatekeeper | **Hand your config to Track 9.** Decide `PreToolUse` vs `Stop` and defend it in the session. | 4.2 |
| 3 Test Whisperer | Lab A *is* your beat: the `test-auditor` with read-only tools. Run on five human-reviewed PRs, start the loss list. | Lab A |
| 4 Archaeologist | **Name your hand-off partner.** Give them the pack; they attempt one small change. | 4.2 |
| 5 Interface | Someone outside your area builds a component with the skill. Diff it against what you'd have written. | 4.2 |
| 6 Integrator | Subagent-per-app pattern if you're on Astro + Payload: one agent per app, the types file as the hand-off. | Lab A |
| 7 Automator | Run the prompt on ten historical inputs, by hand, before automating. Score them. | — |
| 8 Parallelizer | Lab B *is* your beat. Publish the ratio and the skimming point to the cohort. | Lab B |
| 9 Skeptic | **Receive Track 2's config.** Try every bypass on your list. Log what got through, with reproduction. | — |

---

## Exit gate (checkpoint with evidence)

| Checkpoint item | Evidence |
|-----------------|----------|
| One subagent defined, tested against a human review, revised | Agent file; comparison table with two iterations |
| Two worktrees in parallel, both diffs reviewed fully | Two branches; two review timings |
| Your parallel-session limit, from experience | The line in `review-ratio.md` |
| You caught yourself about to delegate something under-specified, and didn't | A "stop" row in Exercise 4.1 or the delegation log |
| *(added)* One artifact handed off and used without you | Partner's three lines |
| *(added)* Worktrees cleaned up | `git worktree list` output |

---

## If stuck

| Symptom | Move |
|---------|------|
| Subagent findings are generic | Real standards, real file paths, real past incidents in the prompt. Generic in, generic out |
| No two independent tasks available | Use "implement X" and "write docs for last week's Y". Docs count |
| Worktree command fails with "Failed to resolve base branch" | Repo has no commits on the base. Commit first |
| Merge conflicts between the two streams | They weren't independent. Note it as the finding; parallelise by boundary next time |
| Review of stream two took twice as long as stream one | Fatigue is the ratio. Record it honestly; that *is* the data point |
| Interlock partner has no time | Facilitator's problem, not yours. Raise it in the session; use a colleague outside the cohort if needed |
