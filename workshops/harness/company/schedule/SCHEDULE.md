# Schedule: every recurring task Claude does for <Company>

Owner: <name> · Reviewed: monthly, first Monday

One row per recurring task. A task with no row, no owner, or a missed review gets paused
until it has all three.

| Task | Role | Cadence | Runs on | Output goes to | Tier | Owner | Kill switch | Next review |
|------|------|---------|---------|----------------|------|-------|-------------|-------------|
| <e.g. triage new issues> | `company:triage-lead` | <weekdays 07:07> | <GitHub Actions in `<repo>`> | <comment on the pinned triage issue> | 0 | <name> | <disable the workflow> | <date> |
| <e.g. CI failure digest> | <role> | | | | 0 | | | |

## Rules

- **Team-owned tasks run on GitHub Actions** (or another shared scheduler), not on a
  person's routine. A routine belongs to one claude.ai account and acts as that person.
- **Every task starts at Tier 0** and moves up one tier at a time, on its weekly review
  numbers. See the agent workshop's `JOB.md` and `performance-review.md`.
- **Nothing auto-merges, pushes to a default branch or deploys.** At any tier.
- **Cadence follows the job, not the tool.** Daily or weekly unless there's a reason; every
  run costs.
- **Retire what nobody reads.** If the owner stops reading a task's output, pause it.

## Calendar view

| | Mon | Tue | Wed | Thu | Fri |
|---|---|---|---|---|---|
| Morning | <task> | <task> | <task> | <task> | <task> |
| Afternoon | | | | | |
| Weekly | <task, day> | | | | |
