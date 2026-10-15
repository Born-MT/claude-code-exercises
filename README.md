# Claude Code exercises

Hands-on exercises for senior engineers learning to use [Claude Code](https://code.claude.com/docs)
on real work: seven weeks of labs and exercises, nine exercise tracks, journal templates,
and five workshops that build a working harness, custom commands, a scheduled agent, an
agent crew and the company's shared setup.

There's no code to run here. Every exercise is done **in a repository you already work
in**, and this repository is the instructions, templates and starter files you copy from.

## What's here

| Folder or file | What it is |
|----------------|------------|
| [`weeks/`](weeks/) | One file per week (0–6): the labs, extra exercises, your track's step for the week, the exit gate and an "If stuck" table |
| [`tracks.md`](tracks.md) | Nine exercise tracks. Each participant takes one in Week 0, advances it every week and ships it in Week 6 |
| [`journal/`](journal/) | The journal templates the exercises write to: baseline, friction log, context audit, delegation log, review ratio, failure log |
| [`competency-matrix.md`](competency-matrix.md) | Six dimensions, four levels. Rate yourself in Week 0 and again in Week 6 |
| [`exercise-template.md`](exercise-template.md) | The format for adding an exercise |
| [`workshops/harness/`](workshops/harness/) | Five 3-hour workshops, the training path that orders them, and their starter files (see below) |

### The weeks

| Week | Topic | Core labs |
|------|-------|-----------|
| [0](weeks/week-0.md) | Setup and baseline | First real task · Baseline measurement |
| [1](weeks/week-1.md) | Context engineering | Rewrite CLAUDE.md · Context budget audit · Plan-to-file |
| [2](weeks/week-2.md) | The agentic loop and verification | Signal audit · Test-first, two sessions · Deliberate rewind |
| [3](weeks/week-3.md) | Extending the harness | Three skills or commands · Auto-activation · Two hooks |
| [4](weeks/week-4.md) | Delegation and parallelism | Reviewer subagent · Parallel worktrees · Delegation post-mortem |
| [5](weeks/week-5.md) | Integration and automation | One MCP server · One automation · Tier the decision |
| [6](weeks/week-6.md) | Team leverage and capstone | Capstone (your track) · Final self-assessment |

### The workshops

Each is a single 3-hour session with its own starter files. Run them in order; each one's
exit gate is the next one's entry gate. The [training path](workshops/harness/TRAINING.md)
lays them out over six weeks, with a kickoff talk, the homework between sessions and a
facilitator checklist.

| Workshop | You leave with |
|----------|----------------|
| [Harness workshop](workshops/harness/WORKSHOP.md) | Permissions, a Stop hook that won't let Claude finish while your checks fail, CLAUDE.md, a test-first skill and a read-only reviewer, all in your repo and tested |
| [Commands workshop](workshops/harness/COMMANDS-WORKSHOP.md) | Three custom commands in your repo (one that loads context, one only you can start, one that explores in a separate context), each tested in fresh sessions and shared with the team |
| [Agent workshop](workshops/harness/AGENT-WORKSHOP.md) | One scheduled agent with a job description, dry runs on past days, a routine or GitHub Actions schedule, and two weeks of probation at the lowest autonomy tier |
| [Crew workshop](workshops/harness/CREW-WORKSHOP.md) (advanced) | An orchestrator agent that dispatches worker subagents, each with one MCP or API connection, checks their results against contracts, and runs in a loop and on a schedule |
| [Company workshop](workshops/harness/COMPANY-WORKSHOP.md) (as a team) | The company's shared setup in one private repository: a short core every session loads, a wiki Claude reads on demand, agent roles with written limits, and one schedule of every recurring task, installed on everyone's machine and tested |

The [starter files](workshops/harness/README.md) list where each file goes in your repo.

## How to use it

1. **Pick the repository you'll work in.** A real one you know, with tests. Toy examples
   teach the tool and nothing else.
2. **Work on a branch.** Every exercise that changes code or config does it on a branch,
   and the evidence is the branch or the PR.
3. **Set up your journal.** In your repo:

   ```bash
   mkdir -p .claude/journal
   echo ".claude/journal/" >> .gitignore
   ```

   Copy the files from [`journal/`](journal/) into it. The exercises name the file they
   write to.
4. **Take a track.** Read [`tracks.md`](tracks.md) and pick one (in a cohort, the
   facilitator assigns them). Write one sentence at the top of your friction log: the
   artifact, who will use it, and what "done" means.
5. **Each week:** do the core labs, then the extra exercises if there's time, then your
   track's step for the week. Close with the exit gate: every item needs evidence a
   colleague could check.

**Time.** Times are for doing the work on a real repository. If you have one day of about
three hours a week, do the core labs first and treat the extra exercises as optional; the
exit gate tells you what matters.

**Ground rules**

- Read every diff Claude produces before you commit it.
- Keep a friction log: one line per session on what was slow, surprising or repeated.
- Prompts and examples use `<placeholders>`. Replace them with your real task, command or
  path; never run a file that still has one in it.
- Use read-only credentials for anything Claude connects to, and keep real secrets out of
  the working tree.

## Notes

- References such as "Week 1 §2" or "anti-pattern 7" in an exercise's **Targets** row
  point to the course material covered in the sessions. Each exercise can be done without
  it.
- Claims about Claude Code features were checked against
  [code.claude.com/docs](https://code.claude.com/docs) in October 2026. The tool changes
  quickly; where an exercise and the docs disagree, the docs win.
- To add an exercise, follow [`exercise-template.md`](exercise-template.md): every
  exercise needs an acceptance check a colleague could verify, preferably by running
  something.
