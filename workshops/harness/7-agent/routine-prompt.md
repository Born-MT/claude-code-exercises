# Routine prompt: <agent name>

Paste the block below into the routine's **Instructions** box at
claude.ai/code/routines, or give it to `/schedule` in the CLI. The job itself lives in
the repo (`docs/agents/<agent name>/JOB.md` and the `daily-shift` skill), so this prompt
only handles memory and delivery and should rarely change.

**Merge first.** A routine clones the repository's default branch, and the session loads
the harness (`CLAUDE.md`, `.claude/settings.json` hooks and deny rules, skills) from that
clone when it starts. Deploy the routine only after the harness and the agent files are
merged to the default branch through a reviewed PR. Until then, test on a branch with the
GitHub Actions version or the local locked-down run.

Routine settings to choose alongside it:

| Setting | Choose |
|---------|--------|
| Repository | One repository only, so its `.claude/settings.json` hooks, deny rules and `.mcp.json` load |
| Environment | Default (Trusted network). Add only the domains the job needs |
| Connectors | Remove every connector the job doesn't use. Included connectors can write without asking |
| Trigger | Schedule: weekdays at a few minutes past the hour, e.g. 07:07, not 07:00 |
| Model | The one you tested the dry runs with |

There is no turn cap on a routine. The per-shift item limit in JOB.md and the skill's
stop rules are what bound a shift, so keep them tight.

```text
You are running one scheduled shift for <agent name>. Do these steps in order.

1. Memory. Run: git fetch origin claude/<agent name>-journal
   If that branch exists, write the last 200 lines of JOURNAL.md from it to
   agent-out/previous.md (git show origin/claude/<agent name>-journal:JOURNAL.md).
   If it doesn't exist, start without memory.

2. Run the daily-shift skill and follow it exactly.

3. Delivery, in this order.
   a. If you are at Tier 1 and changed code: commit it on claude/<agent name>/<date>,
      push that branch, and open a draft pull request whose body is agent-out/report.md.
   b. Check out claude/<agent name>-journal (create it from the default branch if it
      doesn't exist), append agent-out/journal-entry.md and agent-out/report.md to
      JOURNAL.md under a heading with today's date, commit, and push that branch.
   Push only to branches that start with claude/. Never merge anything.

4. End with the full text of agent-out/report.md as your final message.
```
