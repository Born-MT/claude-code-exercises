# Context check: <repo>

Date: <date> · By: <name>

Bigger context windows don't remove the budget: models get less reliable as the input
grows, long before the window is full. Don't give Claude more context; give it the right
context. This card goes with the harness workshop, Lab 3.

## Four ways a context goes bad

| Failure | What happens | What it looks like in a session | Counter |
|---------|--------------|---------------------------------|---------|
| **Poisoning** | A wrong fact gets into the context and keeps being referenced | A wrong diagnosis stated early; every later fix works around it | Don't argue it out. `/rewind` to before it, or `/clear` and restate |
| **Distraction** | The history outweighs the task | Late in a long session it retries a fix it already tried | `/clear` between tasks. Plan to a file and start fresh from it |
| **Confusion** | Irrelevant material in the window gets used anyway | A rule for one app applied in another; a file read an hour ago shapes today's answer | Load less: path-scoped rules, only the MCP servers you use |
| **Clash** | Two parts of the context disagree | CLAUDE.md says one thing, the plan file another; requirements drip-fed over ten turns | Each fact in one place. Give the whole spec in one message or one plan file |

Clash is the one people underestimate. When the same task arrived in pieces over several
turns instead of in one message, o3 fell from 98.1 to 64.1 (Microsoft and Salesforce, 2025).

## Four moves that counter them

| Move | Meaning | In Claude Code |
|------|---------|----------------|
| **Write** | Save context outside the window | Plan files, CLAUDE.md, auto memory |
| **Select** | Pull in only what this step needs | The "would Claude get this wrong without it?" test, path-scoped rules, skills that load on demand |
| **Compress** | Keep only the tokens the task needs | `/compact`, narrower reads, short summaries of long output |
| **Isolate** | Give each piece of work a clean window | `/clear`, a fresh session per task, subagents, worktrees |

## Your readings

Run `/context` at the start of a fresh session, before asking anything.

| When | Total used | Largest consumer | Memory files listed |
|------|------------|------------------|---------------------|
| Before Lab 3 | | | |
| After Lab 3 | | | |

**The failure our sessions are most prone to:** <poisoning / distraction / confusion /
clash>, because <what you've seen happen>

**The move we'll use against it:** <write / select / compress / isolate>: <the concrete
habit or file>

Sources: Drew Breunig, "How Long Contexts Fail" (June 2025); LangChain, "Context
Engineering" (July 2025); Chroma, "Context Rot" (July 2025, 18 models); Microsoft and
Salesforce, arXiv 2505.06120 (2025).
