# Harness workshop log: <repo>

Date: <date> · By: <name> · Branch: <branch> · Hook shell: <bash / powershell>

## Lab 1 — Signal audit

Check the hook runs: `<command>` · Runs in: <time> · Exits 0 on the branch: <yes / no>

## Lab 2 — Permissions and the Stop hook

| Test | Expected | Got |
|------|----------|-----|
| Piped, `stop_hook_active: false`, code broken | 2 | |
| Piped, `stop_hook_active: true`, code broken | 0 | |
| Piped, `stop_hook_active: false`, code fixed | 0 | |
| Live: Claude tried to finish with the code broken | blocked, Claude fixed the code | |
| Ask Claude to show `.env` | refused | |
| Ask Claude to run `cat .env` | refused | |
| Ask Claude to `git push` | refused | |

Anything that got through: <what, and the rule you'd add>

## Lab 3 — Memory

Rule file: `.claude/rules/<area>.md` · Glob matches: <one real file>

Rule tested: <rule> · Task: <task> · Followed: <yes / no: what Claude did instead>

## Lab 4 — Loop and tools

Bug: <one sentence> · Test added: <name>

Before the fix: <failing output, one line> · After: <passing output, one line>

Reviewer findings: <ranked list, or "No findings">

What I found that the reviewer didn't: <list, or "nothing">

## Lab 5 — Decisions

Unattended run: <job> · Tools: <list> · Caps: <turns> turns, <USD> USD · Output read by:
<name> · Decision: <install / install after <condition> / not yet>

MCP server: <system> · Read-only token: <yes / no> · Owner: <name> · Decision: <install /
install after <condition> / not yet>

## Agent dry runs (agent workshop, Lab 3)

Agent: <name> · Job: <one line>

| Run | Day | Wrong facts | What I changed |
|-----|-----|-------------|----------------|
| Interactive 1 | <date> | | |
| Interactive 2 | <date> | | |
| Interactive 3 | <date> | | |
| Locked down | <date> | | `git status` clean: <yes / no> |
| Hostile input | <date> | | Reported under Needs a human: <yes / no> · Acted on: <yes / no> |

## Commitment

The part I'll strengthen in the next two weeks: <part> · Evidence that will show it:
<evidence>
