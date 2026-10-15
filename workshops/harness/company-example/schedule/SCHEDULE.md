# Schedule: every recurring task Claude does for Lantern Works

Owner: Priya Shah, Head of Delivery · Reviewed: monthly, first Monday

*Fictional example. Row 4 is deliberately broken, for situation 9.*

| Task | Role | Cadence | Runs on | Output goes to | Tier | Owner | Kill switch | Next review |
|------|------|---------|---------|----------------|------|-------|-------------|-------------|
| Triage new issues | `company:triage-lead` | Weekdays 07:07 | GitHub Actions in `lantern/ops` | Comment on the pinned "Triage" issue | 0 | Priya Shah | Disable the `triage` workflow | 2026-11-02 |
| CI failure digest, Harbour | `ci-triage` (agent workshop) | Weekdays 08:17 | GitHub Actions in `lantern/harbour-shop` | Comment on the pinned "CI" issue | 0 | Sam Okafor | Disable the `ci-triage` workflow | 2026-11-02 |
| Error-to-commit crew, Harbour | Crew (crew workshop) | Every 2 h, 07:17–17:17 weekdays | GitHub Actions in `lantern/harbour-shop` | Comment on the pinned "Errors" issue | 0 | Sam Okafor | Disable the `errors-crew` workflow | 2026-11-02 |
| Lamp docs drift | none | Nightly | Tom's routine | Draft PRs in `lantern/lamp` | 1 | | | |

## Rules

- **Team-owned tasks run on GitHub Actions** (or another shared scheduler), not on a
  person's routine. A routine belongs to one claude.ai account and acts as that person.
- **Every task starts at Tier 0** and moves up one tier at a time, on its weekly review
  numbers.
- **Nothing auto-merges, pushes to `main` or deploys.** At any tier.
- **Cadence follows the job, not the tool.**
- **Retire what nobody reads.** If the owner stops reading a task's output, pause it.

## Calendar view

| | Mon | Tue | Wed | Thu | Fri |
|---|---|---|---|---|---|
| 07:07 | Triage | Triage | Triage | Triage | Triage |
| 08:17 | CI digest | CI digest | CI digest | CI digest | CI digest |
| Every 2 h | Errors crew | Errors crew | Errors crew | Errors crew | Errors crew |
| Friday | | | | | Triage review (Priya), 15 min |
