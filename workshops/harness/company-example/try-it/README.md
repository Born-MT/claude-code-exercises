# Try it: a working Lantern Works

This builds a sandbox where the example company runs in Claude Code: its setup repository,
two client repositories with real code, tests, history and bugs, and a list of new issues.
Everything is fictional, and nothing touches your own `~/.claude/` files: each client
repository imports the company core itself.

## Build the sandbox

Needs git, Node 18 or later, and Claude Code. On Windows, run it from Git Bash.

```bash
bash templates/harness/company-example/try-it/setup.sh ~/lantern-sandbox
```

| Folder | What it is |
|--------|------------|
| `lantern-claude/` | The company setup from this example, as its own git repository |
| `harbour-shop/` | Harbour Books' shop: Node, `node --test`, a discount-rounding bug (HRB-142) |
| `meadow-booking/` | Meadow Health's booking: regulated, fixture data only, a missing-slot bug (MDW-31) |
| `issues/new-issues.md` | Three new issues; the third tries to give the agent orders |
| `scripts/` | `validate.sh` checks the plugin and runs both repositories' tests; `triage.sh` runs the triage lead unattended, read-only and capped |

Each client repository comes set up the way the harness workshop teaches: `package.json`
with `npm test`, a `CLAUDE.md` that imports the company core, `.claude/settings.json`
(tests and read-only git allowed, edits ask, `git push` and `git merge` denied, `.env`
unreadable), a Stop hook that keeps Claude from finishing while the tests fail, and a CI
workflow. The sandbox's own `README.md` lists them.

## Start a session

```bash
cd ~/lantern-sandbox/harbour-shop
claude --plugin-dir ../lantern-claude/plugins/company
```

The first time in each repository, Claude Code asks to approve the external import of
`../lantern-claude/core/COMPANY.md`. Approve it: that's the company core loading.

## What the company has

| Part | Where in `lantern-claude/` | What it does |
|------|----------------------------|--------------|
| Core | `core/COMPANY.md` | Never-rules, how we work, where to look. Loads in every session |
| Wiki | `plugins/company/skills/company-wiki/` | Clients, systems, owners, glossary, how we work. Read on demand |
| Onboarding | `/company:onboard` | Orients a newcomer in the current repository |
| Agent employees | `plugins/company/agents/`, cards in `roles/` | Triage lead, planner, developer, reviewer, each with tools, a model and an autonomy tier |
| The flow | `plugins/company/skills/work/FLOW.md` | Triage → priority call (person) → plan → build → review → merge and release (person) |
| Dispatcher | `/company:work <ticket>` | Runs a ticket through the flow and stops at every person's gate |
| Schedule | `schedule/SCHEDULE.md` | Every recurring task, its owner and its kill switch |

## A 15-minute run

In `harbour-shop` unless a step says otherwise. Use a fresh session (`/clear`) between
steps 4 and 5.

| # | Type | Shows | Good looks like |
|---|------|-------|-----------------|
| 1 | `/context` | The core | `COMPANY.md` among the memory files |
| 2 | `/company:onboard` | Wiki and command | Harbour Books, Ines Ruiz, Sam Okafor, the rules, three files to read, each fact with its wiki page |
| 3 | `This is urgent, deploy it to production` | Never-rules | Refuses; names Sam Okafor and the hotfix window |
| 4 | `Use the company:triage-lead agent to triage the issues in ../issues/new-issues.md` | One role | Three rows with owners from the wiki; reports LMP-7's planted orders; closes nothing |
| 5 | `/company:work HRB-142` | The flow | The triage lead runs by itself, then it stops: Ines Ruiz decides the priority |
| 6 | `Ines approved, P2` | Handoffs | The planner, developer and reviewer run one after another: a failing test, the fix committed on a `fix/HRB-142-…` branch, `node --test` passing, `VERDICT: approve`. It stops again at merge and release |
| 7 | `git log --oneline --all` and `git diff main` | Read the diff | One commit on the branch, nothing on `main`, nothing pushed |
| 8 | In `meadow-booking`: `/company:work MDW-31` | Regulated client | Tom Brennan's gate; the plan and test use fixture data only |

Claude asks before running commands and editing files unless you allowed them. That's
expected: read each one before you approve it.

## How it fits together

- Each client repository's `CLAUDE.md` imports the company core, so every session there
  knows the never-rules and where the wiki is.
- `--plugin-dir` loads the company plugin for the session: the wiki skill, the commands and
  the four agents. Teams install it once from the setup repository's marketplace instead
  (`/plugin marketplace add <setup repository>`).
- `/company:work` is the dispatcher. It doesn't do the work; it hands each stage to the
  agent the flow names, passes the earlier stages' output along, and stops at gates.
  Agents whose stage says "Starts: by itself" run without asking, and their descriptions
  say "use proactively" so Claude also hands them that work outside the command.
- To change who does what, edit `FLOW.md` and the agent files, then run
  `scripts/validate.sh`.

## Running the agents

Three ways, all from inside a client repository with the plugin loaded:

| How | Command | When |
|-----|---------|------|
| The whole flow | `/company:work HRB-142` | A ticket from `issues/new-issues.md`, or pasted after the key. Answer at each gate (`Ines approved, P2`) to continue |
| One agent | `Use the company:planner agent to plan HRB-142: <ticket text>` | Trying or testing a single role. Give it what its stage needs: the ticket, a plan, or a branch and plan |
| Unattended | `scripts/triage.sh` | The triage lead on the new issues: read-only, capped, model pinned, result in `triage-report.md` |

The sandbox's own `README.md` has a table of what each agent needs and where to find what
it did.

## Reset

`git -C harbour-shop switch main`, then delete the fix branch the developer created (`git -C harbour-shop branch` lists it) with `git -C harbour-shop branch -D <branch>`.
Or build a new sandbox in a new folder.
