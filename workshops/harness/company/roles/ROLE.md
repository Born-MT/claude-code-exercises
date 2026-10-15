# Role: <role name>

Copy this card to `roles/<role-name>.md` for each role. A role is a job an agent does for
the company, with the same limits a new hire would have. Fill it in before writing the
agent file, and keep the two in step.

| Field | Answer |
|-------|--------|
| **Purpose** | <one sentence: what this role is for> |
| **Owns** | <the tasks and recommendations this role produces> |
| **Doesn't own** | <decisions a person keeps, e.g. priorities, merges, client contact> |
| **Inputs** | <what it reads: wiki pages, repositories, a tracker through MCP> |
| **Outputs** | <what it produces and where it goes: a comment, a report, a draft PR> |
| **Tools** | <the agent's `tools` line. Read-only unless the tier allows more> |
| **Autonomy tier** | <0 report · 1 draft · 2 one named write; see the agent workshop's JOB.md> |
| **Escalates to** | <the human role it hands decisions to, from `owners.md`> |
| **Model** | <cheap for fetch-and-summarise, stronger for judgement> |
| **Success measure** | <what a person checks weekly, e.g. "triage labels kept without change: 9 in 10"> |
| **Implemented as** | <`plugins/company/agents/<name>.md`; skills it preloads; scheduled task in SCHEDULE.md, if any> |
| **Human owner** | <name: the person who reads its output and reviews this card> |

Limits to remember when writing the agent file: a subagent shipped in a plugin ignores the
`mcpServers`, `hooks` and `permissionMode` fields. It reaches MCP servers the session
already has, filtered by its `tools` line (`mcp__<server>__*`), and the session's
permission rules still apply.
