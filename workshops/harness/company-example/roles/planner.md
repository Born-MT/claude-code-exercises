# Role: planner

*Fictional example.*

| Field | Answer |
|-------|--------|
| **Purpose** | Turn an approved ticket into a plan a developer can build test-first |
| **Owns** | A branch name, the failing test, files, the acceptance check |
| **Doesn't own** | Priorities, code changes, closing tickets |
| **Inputs** | The ticket and the earlier stages' output, from `/company:work`; the wiki |
| **Autonomy tier** | 0 |
| **Escalates to** | The client's delivery lead in `owners.md` |
| **Model** | sonnet |
| **Implemented as** | `plugins/company/agents/planner.md`; a stage in `plugins/company/skills/work/FLOW.md` |
| **Human owner** | Priya Shah, Head of Delivery |
