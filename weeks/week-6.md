# Week 6 — Team Leverage & Capstone

## Capstone

**Your capstone is your track.** You picked it in Week 0 and have advanced it every week, so
nothing new starts now. This week is for finishing, measuring and sharing back. The options
below are the shapes a finished track takes:

| Option | Tracks that ship it |
|--------|---------------------|
| A — Repo configuration | 1 Onboarder, 2 Gatekeeper, 4 Archaeologist, 5 Interface, 6 Integrator |
| B — Team automation | 7 Automator |
| C — Specialist agent suite | 3 Test Whisperer |
| D — Onboarding path | The facilitator's own capstone |
| — | 8 Parallelizer ships a measured parallel workflow; 9 Skeptic ships the findings report |

Solo and never assigned a track? Pick the option closest to your Week 0 repetition list and
treat this as its first week, not its last.

**Option A — Repo configuration**

Fully configure your team's primary repository: CLAUDE.md, three or more slash commands,
one skill, format-on-edit plus one guard hook, permissions, MCP where it earns its place.
Open it as a PR with a description explaining each choice. The PR discussion *is* the
deliverable — that's where the team's standards get set.

**Option B — Team automation**

Build and ship one automation that runs without you: PR review, issue triage, release notes,
test triage. Must run on real traffic, must be cost-bounded, must have an owner who isn't
necessarily you. Document how to turn it off.

**Option C — Specialist agent suite**

Build two or three subagents encoding your team's genuine expertise — the security review
your staff engineer does, the performance review nobody has time for, the accessibility pass
that keeps getting skipped. Validate each against work a human already reviewed, and publish
the comparison honestly, including where the agent lost.

**Option D — Onboarding path**

Turn this curriculum into your team's version: your repos, your conventions, your risk
surface, your examples. Run one colleague through it and fix what breaks. This is the
highest-leverage option if you're leading, and the hardest to do well.

### Capstone standard

Whatever you pick, it should be: used by someone other than you within two weeks, reviewed
by a colleague, and documented well enough to hand off. Anything that only works when you're
driving it isn't team leverage — it's a personal tool with extra steps.

### The share-back

Five minutes each in the session, against the same four questions, so the cohort can
compare:

| Question | Strong answer | Weak answer |
|----------|---------------|-------------|
| Who uses it, and what did they say? | A named colleague, a quote, a change they asked for | "It's ready for people to use" |
| What does it replace, measured? | Before/after on a Week 0 number, method unchanged | "It feels faster" |
| Where did it fail or make things worse? | A specific case, and what you changed | Nothing went wrong |
| What happens when you're away? | Owner named, docs link, how to turn it off | "Ping me" |

A weak answer on the third row is the one to push on. The Skeptic (Track 9) goes last and
gets the most time.

---

## Exercises

### Core labs

| Item | What | Time | Acceptance check |
|------|------|------|------------------|
| Capstone (= track) | Finish and share | 90 min | Meets the capstone standard: used by someone else within two weeks, reviewed by a colleague, documented to hand off |
| Final self-assessment | Six dimensions + two that matter most | 15 min | Evidence column filled |

### Additional exercises

### Exercise 6.1 — Re-measure the baseline

| | |
|---|---|
| **Goal** | Produce the before/after delta the whole programme was supposed to be judged on. |
| **Targets** | Week 6 §2; anti-pattern 11; Week 0 Exercise 0.2. |
| **Prereq** | Week 0 baseline and quantitative numbers. |
| **Time** | 30 min |
| **Real-task shape** | The last ten merged PRs and last five bugs, same method as Week 0. |
| **Track relevance** | Track 8 (review numbers), Track 7 (time-wasted number). |

**Steps**

1. Re-answer Q1–Q4 without looking at the Week 0 answers. Then compare.
2. Re-pull the four numbers with the *same* method. If the method changed, say so.
3. One line per metric: moved / didn't / can't tell, and why.
4. One line: which metric got worse. There is usually one.

**Acceptance check**

A delta table with eight rows (four questions, four numbers), each with a verdict. "Can't
tell, sample too small" is an honest verdict.

**Journal entry**

`week-0-baseline.md` → Week 6 re-measure.

**Common failure**

Comparing coding time to coding time and declaring victory. The end-to-end numbers are the
ones that count, and six weeks is a small sample; say so.

### Exercise 6.2 — Silent hand-off

| | |
|---|---|
| **Goal** | Prove the artifact works without you driving it, which is the capstone standard. |
| **Targets** | Week 6 §4 capstone standard; anti-pattern 9 (mandating your own workflow). |
| **Prereq** | Track artifact finished. |
| **Time** | 30 min (yours), 30 min (theirs). |
| **Real-task shape** | A real task in the partner's own work that the artifact should help with. |
| **Track relevance** | All. Required if nobody else has used the artifact yet. |

**Steps**

1. Give the partner the PR link and nothing else. Leave the room, or mute.
2. They attempt the task using only the artifact and its docs.
3. They send: did it work, what they had to guess, what they'd change.
4. Fix the top "had to guess" item before the session. Log the rest as follow-ups.

**Acceptance check**

Partner's three lines in the journal, and one fix committed as a result.

**Journal entry**

`friction-log.md` → dated entry tagged `handoff`.

**Common failure**

Choosing the partner who already watched you build it. Pick someone who hasn't.

---

## Track share-back this week

| Track | Ships | Share-back is |
|-------|-------|---------------|
| 1 Onboarder | CLAUDE.md + `explain-subsystem` as a PR | The three questions a newcomer answered, and where the pack failed |
| 2 Gatekeeper | `settings.json` with a justification per rule | What Track 9 got through on the first attempt |
| 3 Test Whisperer | The standard, the auditor, the comparison | The losses against human review |
| 4 Archaeologist | The pack, plus one change made safely by someone else | What Claude got confidently wrong on first read |
| 5 Interface | The skill, plus a component built through it by someone else | The diff between theirs and yours |
| 6 Integrator | The workflow and the keep-or-drop call | The context cost |
| 7 Automator | Running, owned, documented, with a kill switch | The failure rate on twenty inputs |
| 8 Parallelizer | The workflow and the measured ratio | The ratio, and where quality dropped |
| 9 Skeptic | Findings, ranked, each with a proposed guardrail | Goes last. Gets the most time. |

---

## Final self-assessment (with evidence)

| Dimension | Claim | Evidence |
|-----------|-------|----------|
| Context | I control the window deliberately and can diagnose degradation | Week 1 `context-audit.md`; peer rating |
| Verification | Every delegated task ends at a machine-checked result | Week 2 signal table; the never-modify-tests rule; two-pass review entries |
| Extension | My repeated judgment is encoded | Week 3 skills and hooks on a reviewed branch |
| Delegation | I pick the right shape and know my review bandwidth | `delegation-log.md`; the limit line in `review-ratio.md` |
| Integration | I can automate a workflow and pick its tier | Week 5 prompt file and scoring; Lab C sentences |
| Team | I've shipped something a colleague uses | Partner's three lines; the PR |
| — | I said "no, do it a different way" to Claude this week, and was right | A friction log entry |
| — | No code in production I shipped and cannot explain | Said out loud in the retro |

---

## If stuck

| Symptom | Move |
|---------|------|
| Artifact isn't finished | Ship the smallest version that meets "used by someone else". Cut scope, not the hand-off |
| Nobody available to use it within two weeks | Name the person and the date in the PR. That's the commitment; the two weeks start now |
| Metrics didn't move | Say so. Six weeks and ten PRs is a small sample. The qualitative delta (Q1–Q4) is still real |
| Everything went great | Ask the Skeptic what they found in *your* track. Something went wrong somewhere |
| Cohort wants to keep going | Run the programme again on your own repos and examples: capstone Option D |
