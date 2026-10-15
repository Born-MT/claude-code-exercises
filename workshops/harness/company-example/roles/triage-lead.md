# Role: triage lead

*Fictional example.*

| Field | Answer |
|-------|--------|
| **Purpose** | Turn each morning's new issues into a routed, labelled queue, so delivery leads start the day deciding instead of sorting |
| **Owns** | A recommended client, area, owner, label and priority per new issue; likely duplicates |
| **Doesn't own** | Priorities (delivery leads decide), closing issues, replying to clients, anything that changes code |
| **Inputs** | New issues from the tracker through the `tracker` MCP server (read-only); the wiki's `clients.md`, `systems.md`, `owners.md` |
| **Outputs** | One table per run as a comment on the pinned "Triage" issue in `lantern/ops` |
| **Tools** | `Read, Grep, Glob, Skill`, plus `mcp__tracker__*` read tools when the session has the server |
| **Autonomy tier** | 0: recommends only |
| **Escalates to** | The delivery lead of the client in `owners.md`; Head of Delivery when the client is unclear |
| **Model** | haiku |
| **Success measure** | Labels and owners kept unchanged by the delivery lead: target 9 in 10, checked every Friday |
| **Implemented as** | `plugins/company/agents/triage-lead.md`, preloading `company:company-wiki`; scheduled task row 1 in `SCHEDULE.md` |
| **Human owner** | Priya Shah, Head of Delivery |
