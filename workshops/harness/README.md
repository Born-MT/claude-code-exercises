# Harness starter files

Working Claude Code files for the six parts of the harness: loop, tools, memory,
reliability, permissions and verification. They go with the team deck "The Harness, Not
the Model" and with the programme weeks that teach each part.

The files here are named so that Claude Code doesn't load them while you work in this
repository. Copy each one to the path in **Copy to**, then replace every `<placeholder>`
with your repo's real commands, paths and names. A file with a wrong command in it is
worse than none.

To train a team on them, follow the [training path](TRAINING.md): a kickoff talk and four
3-hour workshops in order. To install them as a team in one 3-hour session, run the [harness workshop](WORKSHOP.md); each
participant records evidence in [`workshop-log.md`](workshop-log.md).

Once the harness holds, the [agent workshop](AGENT-WORKSHOP.md) puts a scheduled agent to
work on it: a job description, a shift skill, dry runs, a routine or GitHub Actions cron,
and two weeks of probation at the lowest autonomy tier.

| Part | File | Copy to | What it does | Taught in |
|------|------|---------|--------------|-----------|
| 1 Loop | [`fix-with-test.SKILL.md`](1-loop/fix-with-test.SKILL.md) | `.claude/skills/fix-with-test/SKILL.md` | The test-first loop as a skill: failing test, fix, full checks, stop after three failed attempts | Week 2 |
| 1 Loop | [`plan-template.md`](1-loop/plan-template.md) | `docs/plans/_template.md` | A plan file where every step ends with the check that proves it | Week 1 Lab C |
| 2 Tools | [`reviewer.agent.md`](2-tools/reviewer.agent.md) | `.claude/agents/reviewer.md` | A reviewer subagent with read and search tools only, so it can't edit what it reviews | Week 4 Lab A |
| 2 Tools | [`mcp.json`](2-tools/mcp.json) | `.mcp.json` | One remote MCP server with a read-only token taken from the environment | Week 5 Lab A |
| 3 Memory | [`CLAUDE.starter.md`](3-memory/CLAUDE.starter.md) | `CLAUDE.md` | A starting CLAUDE.md: commands, boundaries, conventions, never-do rules | Week 1 Lab A |
| 3 Memory | [`context-check.md`](3-memory/context-check.md) | your journal | The four ways a context goes bad, the four moves that counter them, and your `/context` readings | Week 1 Lab B |
| 3 Memory | [`rule.area.md`](3-memory/rule.area.md) | `.claude/rules/<area>.md` | Rules that load only for files matching a glob | Week 1, Exercise 1.2 |
| 4 Reliability | [`run-unattended.sh`](4-reliability/run-unattended.sh) | `scripts/claude-unattended.sh` | A headless run that is locked down, turn-capped, budget-capped and advisory only | Week 5 Lab B |
| 5 Permissions | [`settings.json`](5-permissions/settings.json) | `.claude/settings.json` | Deny rules for secrets, pushes and deploys; ask before migrations; registers the Stop hook | Week 0 |
| 6 Verification | [`verify-before-stop.sh`](6-verification/verify-before-stop.sh) | `.claude/hooks/verify-before-stop.sh` | Stop hook: Claude can't finish while the checks fail | Week 3 Lab C |
| 6 Verification | [`verify-before-stop.ps1`](6-verification/verify-before-stop.ps1) | `.claude/hooks/verify-before-stop.ps1` | The same hook for machines without Git Bash | Week 3 Lab C |
| 6 Verification | [`signal-audit.md`](6-verification/signal-audit.md) | your journal | Which check the Stop hook should run, and whether it's fast and trusted | Week 2 Lab B |
| Commands | [`command-spec.md`](commands/command-spec.md) | your journal | The spec card to fill before writing a command | Commands workshop |
| Commands | [`pr-context.SKILL.md`](commands/pr-context.SKILL.md) | `.claude/skills/pr-context/SKILL.md` | Context command: injects the current PR, files and checks, then reviews | Commands workshop |
| Commands | [`release-notes/`](commands/release-notes/) | `.claude/skills/release-notes/` | Action command only you can start, with a supporting style guide | Commands workshop |
| Commands | [`explore-area.SKILL.md`](commands/explore-area.SKILL.md) | `.claude/skills/explore-area/SKILL.md` | Forked command: explores in a subagent, returns a 25-line map | Commands workshop |
| Commands | [`command-tests.md`](commands/command-tests.md) | your journal | Eight tests to run on every command in fresh sessions | Commands workshop |
| Commands | [`plugin/`](commands/plugin/) | a marketplace repository | `marketplace.json` and `plugin.json` for sharing commands across repositories | Commands workshop |
| 7 Agent | [`JOB.md`](7-agent/JOB.md) | `docs/agents/<name>/JOB.md` | A scheduled agent's standing orders: one job, output, tier, limits, metric, kill switch | Agent workshop |
| 7 Agent | [`daily-shift.SKILL.md`](7-agent/daily-shift.SKILL.md) | `.claude/skills/daily-shift/SKILL.md` | The procedure for one shift; treats everything it reads as data | Agent workshop |
| 7 Agent | [`routine-prompt.md`](7-agent/routine-prompt.md) | a routine at claude.ai/code/routines | The short routine prompt: memory, the shift, delivery to `claude/` branches | Agent workshop |
| 7 Agent | [`claude-agent.yml`](7-agent/claude-agent.yml) | `.github/workflows/<name>.yml` | The same agent, team-owned, on a GitHub Actions cron | Agent workshop |
| 7 Agent | [`performance-review.md`](7-agent/performance-review.md) | your journal | The weekly review that decides the agent's tier | Agent workshop |
| 8 Crew | [`CREW.md`](8-crew/CREW.md) | `docs/crew/CREW.md` | The crew's job, workers, result contracts, per-cycle limits and kill switch | Crew workshop |
| 8 Crew | [`orchestrator.agent.md`](8-crew/orchestrator.agent.md) | `.claude/agents/orchestrator.md` | Dispatches the workers in parallel, checks contracts, writes one report; reads no source itself | Crew workshop |
| 8 Crew | [`tracker-reader.agent.md`](8-crew/tracker-reader.agent.md) | `.claude/agents/tracker-reader.md` | Worker with one MCP server and nothing else | Crew workshop |
| 8 Crew | [`api-reader.agent.md`](8-crew/api-reader.agent.md), [`api-get.sh`](8-crew/api-get.sh) | `.claude/agents/api-reader.md`, `scripts/api-get.sh` | Worker that reaches one REST API through a GET-only wrapper with a token it never sees | Crew workshop |
| 8 Crew | [`repo-analyst.agent.md`](8-crew/repo-analyst.agent.md) | `.claude/agents/repo-analyst.md` | Worker that reads the repo's history and code, changes nothing | Crew workshop |
| 8 Crew | [`run-cycle.SKILL.md`](8-crew/run-cycle.SKILL.md) | `.claude/skills/run-cycle/SKILL.md` | One cycle, invocable by `/loop`, a routine or a workflow | Crew workshop |
| 8 Crew | [`crew.settings.json`](8-crew/crew.settings.json) | merge into `.claude/settings.json` | No nesting below the workers; allow rules for the workers' tools | Crew workshop |
| 8 Crew | [`crew-workflow.yml`](8-crew/crew-workflow.yml) | `.github/workflows/<crew>.yml` | The crew on a GitHub Actions cron, Claude on a read-only token | Crew workshop |
| Company | [`company/`](company/) | a private `<company>-claude` repository | The company setup as a repository: a short core (`core/COMPANY.md`), a wiki skill with five pages, the `/company:onboard` command, role cards and agents, the schedule, and a ten-question test. It's a plugin marketplace, so people install it with two commands | Company workshop |
| Company | [`company-example/`](company-example/) | nowhere: read it, or load it for a session | The same setup filled in for a fictional agency, with twelve [situations](company-example/SITUATIONS.md) to practise on | Company workshop |

## Order to install them

1. **Signal audit first.** The Stop hook can only run a check that exists and runs in
   minutes. No such check? Building one is the first job.
2. **Permissions and the Stop hook.** `settings.json` registers the hook, so copy both.
3. **CLAUDE.md**, then path-scoped rules for the areas Claude gets wrong.
4. **The skill and the reviewer subagent**, once the basics hold.
5. **MCP and unattended runs last**, with read-only credentials and a named owner.
6. **Commands** for the prompts you keep retyping; the [commands workshop](COMMANDS-WORKSHOP.md)
   builds three and shares them.
7. **A scheduled agent** only after all of the above, starting at Tier 0.
8. **A crew** (an orchestrator with worker subagents) only after one agent has held its
   tier for two weeks. The [crew workshop](CREW-WORKSHOP.md) builds it.
9. **The company setup** last, as a team: the shared core, wiki, roles and schedule every
   person and agent uses. The [company workshop](COMPANY-WORKSHOP.md) builds it.

## Notes per file

**Stop hook.** It runs `<check command>` whenever Claude tries to finish with uncommitted
changes. If the checks fail, it exits 2, which blocks the stop and hands Claude the last 40
lines of output. When Claude is already continuing because of the hook
(`stop_hook_active`), it lets the stop through, so a check that can't pass doesn't loop.
It skips clean working trees, which is one more reason Claude doesn't commit: you read the
diff and commit yourself. Needs `jq` (bash version). Test it before you rely on it: break a
test, ask for a small change, and confirm Claude is sent back to fix it.

**PowerShell variant.** Where hooks run without Git Bash, register the `.ps1` instead of
the `.sh` in `settings.json`:

```json
{
  "type": "command",
  "command": "powershell.exe",
  "args": ["-NoProfile", "-ExecutionPolicy", "Bypass", "-File", "${CLAUDE_PROJECT_DIR}/.claude/hooks/verify-before-stop.ps1"]
}
```

**Deny rules.** `Read(**/.env.*)` also blocks `.env.example`; drop that line if you need
it readable. A `Read` deny covers Claude's file tools and shell commands that name the
file, such as `cat .env`, but not a script that opens the file itself, or a recursive
grep. Keep real secrets out of the working tree. The rules are written for both the Bash
and PowerShell tools because Windows machines may use either.

**Unattended runs.** `--bare` needs `ANTHROPIC_API_KEY`, because it doesn't use your
subscription login. It also skips the repo's hooks, CLAUDE.md and MCP servers, which is the
point in CI: a pull request can't bring its own. The run can read and run tests but not
edit, so its output is advice a person acts on.

**MCP.** `claude mcp add --transport http <name> --scope project <url>` writes the same
entry. Claude Code asks each person to approve a project-scoped server before first use.
Give it a read-only token.
