# Week 3 — Extending the Harness

## Labs

**A. Three invocable skills (90 min)**

From your Week 0 repetition list. For each, make both decisions explicitly: should Claude
be able to invoke it unprompted, and does it need bundled files? Use named `arguments`
rather than positional. If your team is on Windows, set `shell: powershell`.

Use them for a week, then revise — the first version is always too vague. A good one reads
like a checklist you'd hand a competent new hire, not like a wish.

**B. Auto-activation (60 min)**

Take the area where you most often correct Claude — migrations, API conventions, the
testing approach for one gnarly subsystem. Write the skill. Then give Claude a task in that
area *without* mentioning it, and see whether it triggers.

If it doesn't, you have two levers, in this order: sharpen `description` to say *when* to
use it, in the words you'd actually use — then add `paths` to scope it to the files
involved. `paths` is the more reliable of the two; a glob is not a judgement call.

**C. Two hooks (90 min)**

1. Format-on-edit with `PostToolUse` on `Edit|Write`. Decide how files rewritten by shell
   commands get formatted (also match `Bash|PowerShell`, or a `Stop` hook), and be able to
   say why.
2. One guard rail for your actual risk surface — prod database, deploy scripts, `.env`,
   force-push. On the Astro + Payload repo, the `payload-types.ts` deny plus its `Stop`
   check is a good first one.

Verify the guard by trying to trip it, *and* by asking Claude to do the same thing via a
shell command. An untested guard is decoration; an unbypassed-but-bypassable one is worse.

---

## Exercises

### Core labs

| Lab | What | Time | Acceptance check |
|-----|------|------|------------------|
| A | Three skills/commands | 90 min | Three files; each invoked once on real work; each has named arguments if it takes any; a one-line revision note after first use |
| B | Auto-activation | 60 min | Skill triggers on an unprompted task in its area; you can say whether `description` or `paths` did it |
| C | Two hooks | 90 min | Format hook fires on an edit; guard blocks a tripping command with exit 2 *and* blocks the same action attempted via a shell command, or you've documented the gap |

### Additional exercises

### Exercise 3.1 — Promote one rule to enforcement

| | |
|---|---|
| **Goal** | Make the context-vs-enforcement decision explicitly on a real rule, and record why. |
| **Targets** | Week 3 §1; checkpoint item "why a rule belongs in a hook rather than CLAUDE.md". |
| **Prereq** | Lab C (you know how to write a hook). |
| **Time** | 20 min |
| **Real-task shape** | Any CLAUDE.md line phrased as "never" or "always". On the Astro + Payload stack: "never edit `payload-types.ts`" is the canonical one. |
| **Track relevance** | Track 2 (Gatekeeper) — core beat. Track 4 (Archaeologist) — the landmines. |

**Steps**

1. List every "never"/"always" line in CLAUDE.md.
2. For each: what happens if Claude ignores it once? Rank them.
3. Take the top one. Implement it as a `deny` rule if it's a tool/path pattern, or a
   `PreToolUse` hook if it needs logic. Leave the CLAUDE.md line in place (context still
   helps), but add "(enforced by hook)" to it.
4. Try to violate it three ways: direct edit, shell command, asking Claude to "just this
   once". Record what got through.

**Acceptance check**

One rule enforced; three bypass attempts logged with outcomes; the remaining "never" lines
have a one-word verdict each (enforce / context is fine).

**Journal entry**

`friction-log.md` → dated entry tagged `enforcement`, plus the rule list.

**Common failure**

Enforcing everything. Most "never" lines are recoverable and don't need a hook. The
exercise is the *decision*, not the count of hooks.

### Exercise 3.2 — Argument indexing drill

| | |
|---|---|
| **Goal** | Trip over `$0` vs `$1` and quoted multi-word arguments once, deliberately, so it never happens silently in a real command. |
| **Targets** | Week 3 §2 substitutions; failure mode "arguments come out empty". |
| **Prereq** | None. |
| **Time** | 15 min |
| **Real-task shape** | A throwaway command in `.claude/commands/`. |
| **Track relevance** | None; everyone does it. |

**Steps**

1. Create `.claude/commands/argtest.md` containing: `First: $0 / Second: $1 / All: $ARGUMENTS`.
2. Invoke `/argtest hello world` and `/argtest "hello world" second`. Note the outputs.
3. Rewrite with `arguments: [first, second]` and `$first` / `$second`. Invoke again.
4. Delete the file. Record the one thing that surprised you.

**Acceptance check**

A journal line stating what `$0` expands to and why named arguments are the default from
now on.

**Journal entry**

`friction-log.md` → dated entry tagged `skills`.

**Common failure**

None; the point is to *have* the failure here rather than in a PR-review command.

---

## Track beat this week

| Track | Beat (Weeks 3–4) | Counts as |
|-------|------|-----------|
| 1 Onboarder | The `explain-subsystem` skill, with `paths`. | Lab B |
| 2 Gatekeeper | Deny rules from the approval log; the guard hook; choose `PreToolUse` vs `Stop` and write down why. | Lab C + 3.1 |
| 3 Test Whisperer | A `test-quality` skill encoding the standard, or start the auditor agent early (Week 4). | Lab A |
| 4 Archaeologist | Encode the landmines: subdirectory CLAUDE.md plus one guard on the thing that looks wrong and is load-bearing. | 3.1 |
| 5 Interface | The component-conventions skill, scoped with `paths` to the component dirs. | Lab B |
| 6 Integrator | A command that consumes the external context (paste a ticket for now) and produces the PR description. | Lab A |
| 7 Automator | The automation's prompt as a version-controlled command file, run by hand on three historical inputs. | Lab A |
| 8 Parallelizer | Still single-stream. Build a `/review-diff` command that runs your two-pass checklist; time it. | Lab A |
| 9 Skeptic | Receive Track 2's config next week; this week, list the bypass routes you'll try: shell, subagent, skill, `!` command. | — |

---

## Exit gate (checkpoint with evidence)

| Checkpoint item | Evidence |
|-----------------|----------|
| Three skills/commands in the repo, used and revised once | Files on a branch; revision note in each |
| One Claude invokes without being told | Lab B friction log entry naming the trigger |
| Format-on-edit running, shell-written files covered | `settings.json`; one sentence on how files rewritten by shell commands get formatted |
| One guard hook, tested by tripping and by routing around | Three logged test results from Lab C step |
| You can explain why a rule belongs in a hook | Exercise 3.1 decision |
| You can explain why "command vs skill" is the wrong question | Said in the friction round, or three sentences in the journal |
| *(added)* `.claude/` changes on a branch for review | Branch or PR |

---

## If stuck

| Symptom | Move |
|---------|------|
| Twelve candidates, all seem important | Pick the three with the most "again" entries in the friction log. Usage is the only vote |
| Skill never triggers in Lab B | `description` in the words you'd use, starting "Use when…"; then `paths`. If both fail, invoke it by name and move on; auto-activation is a bonus |
| Hook works for you, not for a Windows teammate | They don't have Git Bash, so the hook ran under PowerShell. Rewrite in PowerShell, or make Git Bash a team prerequisite; decide once |
| `jq` not installed | Parse the JSON with the language your team already has (`node -e`, `python -c`, PowerShell `ConvertFrom-Json`) |
| Guard blocks too much | That's fail-closed working. Narrow the pattern against your real risk surface and re-test |
| Hook makes every edit slow | Wrong event or heavy command. Narrow the matcher, or run it async |
