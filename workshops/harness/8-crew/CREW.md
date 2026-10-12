# Crew: <crew name>

Owner: <name> · Tier: 0 · Cycle: <every 2 hours on weekdays>

The orchestrator reads this file at the start of every cycle. Change the crew here, in a
reviewed commit.

## The one job

<One recurring job that needs more than one source. Example: "Every two hours, find
production errors from the last cycle, match each to the tracker issue and the commit that
probably caused it, and list what needs a person.">

## Workers

Each worker reads one source and nothing else. The orchestrator never reads the sources
itself.

| Worker | Source | Reaches it through | Returns | Model |
|--------|--------|--------------------|---------|-------|
| `tracker-reader` | <issue tracker> | MCP server `<tracker>` (read-only token) | Tracker contract | <haiku> |
| `api-reader` | <monitoring or other REST API> | `scripts/api-get.sh` (GET only, read-only token) | API contract | <haiku> |
| `repo-analyst` | This repository | Read, Grep, Glob, `git log`, `<check command>` | Repo contract | <sonnet> |

## Contracts

Every worker ends its answer with exactly one block in this shape. The orchestrator
rejects anything else.

```text
RESULT <worker name> v1
status: ok | empty | failed
items:
- id: <stable id from the source>
  summary: <one line>
  evidence: <link or file:line>
notes: <one line, or "none">
```

| Contract | `id` is | Extra rule |
|----------|---------|------------|
| Tracker | issue key | Only issues updated since the last cycle |
| API | error or event id | At most <20> items, newest first |
| Repo | commit sha or file:line | Only commits since the last cycle |

## Per cycle

- Dispatch the three workers in parallel, once each.
- A malformed or failed result: dispatch that worker once more. Still bad: report it under
  **Needs a human** and continue with the others.
- At most <10> items in the report. The rest go under **Skipped** as "over the limit".
- Budget: <USD> per cycle where the platform enforces it (`--max-budget-usd`).

## Report

`agent-out/report.md`:

```markdown
## <crew name> · <date time>

**Matched:** <error → issue → likely commit, one line each, every link included>
**Needs a human:** <decisions, conflicts between workers, failed workers>
**Skipped:** <what and why>
**Workers:** tracker <status> · api <status> · repo <status>
```

## Autonomy tier

The tiers, promotion rules and "never" list are the same as in the agent workshop's
`JOB.md`. A crew starts at Tier 0: every worker is read-only and the orchestrator writes
only `agent-out/`.

## Kill switch

<"Cancel the loop (ask: cancel the crew loop)", "pause the routine", or "disable the
workflow">. Anyone on the team may use it.
