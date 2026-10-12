# Competency Matrix

Six dimensions, four levels. Use it for self-assessment at the end of each module, for
pair review, or as the basis for a team conversation about where people actually are.

**Levels:** *Novice* → *Working* → *Proficient* → *Multiplier*

Most engineers who "use Claude Code daily" sit at Working across the board. The jump to
Proficient is a change in habits, not knowledge. The jump to Multiplier is about other
people.

---

## 1. Context engineering

| Level | Looks like |
|-------|-----------|
| **Novice** | Ad-hoc prompting. No CLAUDE.md, or the `/init` default untouched. Doesn't know what's in the window. |
| **Working** | Has a CLAUDE.md. Uses `/clear` sometimes. Notices quality degrading but reacts rather than anticipates. |
| **Proficient** | CLAUDE.md is specific and maintained. Reads `/context` routinely. Uses plan mode and writes plans to files. Clears between tasks by reflex. |
| **Multiplier** | Designs context strategy per task shape. Team CLAUDE.md is a genuine asset. Can diagnose someone else's degrading session from a description. |

**Tell for Proficient:** they can say *why* a session went bad, not just that it did.

---

## 2. Verification

| Level | Looks like |
|-------|-----------|
| **Novice** | Reads the summary, not the diff. Accepts "done" as done. |
| **Working** | Reads diffs. Runs tests after. Catches obvious problems. |
| **Proficient** | Designs the check before the task. Test-first with agents. Two-pass review (shape, then content). Knows their repo's weakest signal. |
| **Multiplier** | Improves the repo's verification infrastructure so the whole team's ceiling rises. Sets review standards that survive larger diffs. |

**Tell for Proficient:** they state the passing condition in the request, unprompted.

---

## 3. Harness extension

| Level | Looks like |
|-------|-----------|
| **Novice** | Built-in commands only. Retypes the same prompt weekly. |
| **Working** | A couple of personal slash commands. Has heard of hooks. |
| **Proficient** | Commands, skills, and hooks in use, each for the right reason. Can explain why a given rule is a hook and not a CLAUDE.md line. |
| **Multiplier** | Team config is reviewed, pruned, and adopted. New joiners inherit encoded judgment on clone. |

**Tell for Proficient:** they reach for a hook when the answer to "what if it doesn't?" is bad.

---

## 4. Delegation

| Level | Looks like |
|-------|-----------|
| **Novice** | One session, one task, serial. |
| **Working** | Occasional subagent use, usually the built-ins. |
| **Proficient** | Custom subagents with scoped tools. Worktrees for parallel streams. Knows their own review bandwidth and respects it. |
| **Multiplier** | Team-shared agents encoding real expertise, validated against human review. Helps others find their limit rather than guessing at it. |

**Tell for Proficient:** they decline to parallelize something, for a stated reason.

---

## 5. Integration & automation

| Level | Looks like |
|-------|-----------|
| **Novice** | Interactive only. |
| **Working** | Has tried `claude -p`. Maybe one MCP server. |
| **Proficient** | Automation running on real traffic, cost-bounded. Picks the right tier (call / workflow / agent) deliberately. Treats MCP output as untrusted. |
| **Multiplier** | Team automation with an owner, a kill switch, and documentation. Makes the build-vs-don't-build call well. |

**Tell for Proficient:** they've decided *not* to build an agent for something at least once.

---

## 6. Team leverage

| Level | Looks like |
|-------|-----------|
| **Novice** | Personal use only. |
| **Working** | Shares tips in chat occasionally. |
| **Proficient** | Ships config others use. Reviews teammates' `.claude/` changes. |
| **Multiplier** | Owns the team's practice: standards, onboarding, honest measurement, and naming the failure modes out loud — including the ones caused by their own advocacy. |

**Tell for Multiplier:** they can name where adoption made something worse, specifically.

---

## Using this

**Self-assessment:** rate yourself per dimension at Week 0 and Week 6. Expect to move one
level in most dimensions and two in one or two. Moving one level everywhere is a good
outcome, not a disappointing one.

**Pair review:** swap with a colleague and rate each other from observed behaviour, not
claims. Disagreements are the useful part of the exercise.

**Team view:** aggregate anonymously. A team that's Proficient on context and Novice on
verification has a specific, addressable problem — and it's a more urgent one than the
average suggests.

**Honest caveat:** this matrix describes proficiency with a tool. It says nothing about
engineering judgment, which remains the thing that actually matters and which no amount of
tooling proficiency substitutes for.
