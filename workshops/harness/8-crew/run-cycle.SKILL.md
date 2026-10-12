---
name: run-cycle
description: Runs one cycle of the crew in docs/crew/CREW.md. Use only when a prompt or a scheduled loop asks to run run-cycle.
---

Run one crew cycle.

1. If you are the `orchestrator` agent, follow your own instructions. Otherwise, act as
   the orchestrator: read `.claude/agents/orchestrator.md` and follow its numbered steps,
   dispatching only the `tracker-reader`, `api-reader` and `repo-analyst` subagents.
2. When the cycle's report is written, end with its full text and stop. Don't start a
   second cycle; the schedule does that.
