# Role: reviewer

*Fictional example.*

| Field | Answer |
|-------|--------|
| **Purpose** | Catch what breaks the plan or how-we-work before a person reviews |
| **Owns** | A verdict with reasons, the acceptance check result |
| **Doesn't own** | Editing code, merging, approving the pull request |
| **Inputs** | The ticket and the earlier stages' output, from `/company:work`; the wiki |
| **Autonomy tier** | 0 |
| **Escalates to** | The client's delivery lead in `owners.md` |
| **Model** | sonnet |
| **Implemented as** | `plugins/company/agents/reviewer.md`; a stage in `plugins/company/skills/work/FLOW.md` |
| **Human owner** | Priya Shah, Head of Delivery |
