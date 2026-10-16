# Role: developer

*Fictional example.*

| Field | Answer |
|-------|--------|
| **Purpose** | Build the plan test-first on a branch, so reviewers start from a passing check |
| **Owns** | A failing test, the smallest fix, a commit on the branch |
| **Doesn't own** | Pushing, merging, deploying, anything outside the repository |
| **Inputs** | The ticket and the earlier stages' output, from `/company:work`; the wiki |
| **Autonomy tier** | 1 |
| **Escalates to** | The client's delivery lead in `owners.md` |
| **Model** | sonnet |
| **Implemented as** | `plugins/company/agents/developer.md`; a stage in `plugins/company/skills/work/FLOW.md` |
| **Human owner** | Priya Shah, Head of Delivery |
