# Company workshop: build the company's Claude Code setup

Session 5 of the [training path](TRAINING.md) · **Starter files:** [company/](company/) ·
**Budget:** one 3-hour session, as a team · **Entry gate:** the [agent workshop](AGENT-WORKSHOP.md)
exit gate for at least two people in the room

The earlier workshops set up one repository and one person's agents. This one sets up the
company: what every session should know about us, the wiki Claude reads when it needs to,
the roles our agents play and their limits, and the schedule of work they do. The room
builds one shared repository together, `<company>-claude`, and leaves with it installed on
everyone's machine and tested by someone who didn't build it.

Unlike the other workshops, this is team work. Split the room into three groups for Labs 2
to 4, then come back together.

**Keep the result private.** The starter files are public; your filled-in company
repository describes clients, systems and people, and belongs in a private repository in
your organization.

---

## How company context reaches a session

Three layers, from always-loaded to loaded-when-needed. The design rule: the more often
something loads, the shorter it has to be.

| Layer | What goes in | Loads | Delivered by | Size |
|-------|--------------|-------|--------------|------|
| **Core** (`core/COMPANY.md`) | Who we are, the never-rules, how we work, where to look | Every session | An `@~/company-claude/core/COMPANY.md` line in each person's `~/.claude/CLAUDE.md`; or IT deploys it as the managed `CLAUDE.md` | Under 50 lines |
| **Wiki** (`company:company-wiki` skill) | Clients, systems, owners, glossary, how we work | Only the page a task needs | The `company` plugin | A page each, kept current |
| **Live sources** | Everything else in the real wiki or tracker | When asked, through a read-only MCP server | The person's MCP setup | Not copied |

Plus two things that aren't context:

- **Roles** (`roles/*.md` cards and `plugins/company/agents/*.md`): the jobs agents do,
  with the limits a new hire would have.
- **Schedule** (`schedule/SCHEDULE.md`): every recurring task, its role, platform, owner,
  tier and kill switch.

Facts the design relies on (Claude Code docs, checked 2026-10-15, and the plugin checked
with `claude plugin validate` and a live session):

- CLAUDE.md files can import others with `@path`, up to four levels deep. Imports in your
  own `~/.claude/CLAUDE.md` load without an approval prompt; an import in a project's
  CLAUDE.md that points outside the repository asks once per project.
- Imported files load at launch, so an import doesn't make a file cheaper. Keep each
  CLAUDE.md under 200 lines; the core here aims for 50.
- An organization can deploy a managed `CLAUDE.md` (Windows: `C:\Program Files\ClaudeCode\CLAUDE.md`;
  macOS: `/Library/Application Support/ClaudeCode/CLAUDE.md`; Linux: `/etc/claude-code/CLAUDE.md`).
  It applies to every user on the machine and can't be excluded.
- A plugin's skills and agents are named with the plugin's name in front:
  `company:company-wiki`, `/company:onboard`, `company:triage-lead`. An agent that preloads a
  plugin skill names it that way in its `skills:` list.
- A subagent shipped in a plugin ignores `mcpServers`, `hooks` and `permissionMode`. It uses
  the session's MCP servers through its `tools` line, and the session's permission rules.
- Cloud sessions, routines and CI don't read `~/.claude/` or your installed plugins. Scheduled
  tasks get the core from a copy committed to their repository, or from the cloud
  environment's setup script, and plugins from the GitHub Action's `plugins` input.

---

## Entry gate

- [ ] At least two people in the room have passed the agent workshop, so someone can wire
  up a scheduled task in Lab 4.
- [ ] Someone who can create a private repository in the organization.
- [ ] Each group brings its raw material: Lab 2 the current wiki or onboarding doc; Lab 3
  the three jobs people most want agents for; Lab 4 the agents already running (from the
  agent and crew workshops) and their owners.
- [ ] Facilitator: run Lab 5 yourself on a filled-in copy before the day, including the
  install steps on a machine that has never had it.

---

## Run of show

| # | Block | Time | Output (evidence) | Starter files |
|---|-------|------|-------------------|---------------|
| 1 | **Opening.** The three layers; what goes where; why the core stays short. Create the private repository and copy `company/` into it. | 15 min | Private repo `<company>-claude` | `company/` |
| 2 | **Lab 1** — the core, all together. | 25 min | `core/COMPANY.md`, under 50 lines | `company/core/COMPANY.md` |
| 3 | **Labs 2–4, in parallel.** Group A: the wiki. Group B: the roles. Group C: the schedule. | 40 min | Five wiki pages; three role cards and agent files; `SCHEDULE.md` with one task scheduled | `company/plugins/company/`, `company/roles/`, `company/schedule/` |
| 4 | Break. | 10 min | — | — |
| 5 | **Lab 5** — install and test, swapped. | 45 min | Installed on every machine; ten-question test passed by someone who didn't build the part | `company/README.md`, `company/tests/company-questions.md` |
| 6 | **Lab 6** — merge and the review loop. | 30 min | One PR with all three groups' work, merged; owners and review dates everywhere | — |
| 7 | **Close.** What we'll prune in a month. | 15 min | One line per person | — |
| | **Total** | **180 min** | | |

---

## Labs

### Lab 1 — The core

| | |
|---|---|
| **Goal** | The 50 lines every session at the company should start with, and nothing else. |
| **Targets** | Memory, at company scale; Week 1's "would Claude get this wrong without it?" test. |
| **Prereq** | The private repository, with `company/` copied in. |
| **Time** | 25 min, whole room |
| **Real-task shape** | Your company. |
| **Track relevance** | Track 1 (Onboarder) leads it. |

**Steps**

1. Open `core/COMPANY.md`. Fill in the one sentence about the company.
2. The **Never** list: each person proposes one rule with an incident or near-miss behind
   it. Keep at most five. A rule without a story goes to the wiki or nowhere.
3. **How we work** and **Words we use**: only what applies in every repository.
4. Read it aloud and cut anything that only matters for one client, system or team. That
   goes in the wiki.
5. Count the lines.

**Acceptance check**

`COMPANY.md` under 50 lines, every **Never** line with its story said out loud, and nothing
in it that applies to only one client or team.

**Common failure**

Pasting the onboarding doc in. Every line loads in every session for every person. If a
line matters only sometimes, it belongs in the wiki, where it loads only when needed.

### Lab 2 — The wiki (group A)

| | |
|---|---|
| **Goal** | Five short pages Claude can read on demand, each owned and dated. |
| **Targets** | Context engineering (select: load only the page a task needs). |
| **Prereq** | Lab 1. |
| **Time** | 40 min, in parallel with Labs 3 and 4 |
| **Real-task shape** | Your current wiki, onboarding doc or the questions new joiners ask. |
| **Track relevance** | Track 1 (Onboarder), Track 4 (Archaeologist). |

**Steps**

1. Fill in the five pages under `plugins/company/skills/company-wiki/`: `clients.md`,
   `systems.md`, `owners.md`, `glossary.md`, `how-we-work.md`. Facts only, one line each
   where possible. Map every active repository to its client in `clients.md`.
2. Put an owner and today's date on every page.
3. Keep the skill's `description` in the words people would actually type. It decides
   when Claude reads the wiki.
4. Leave out anything secret: no credentials, tokens, personal data or client data. Link
   to where it lives instead.
5. Decide what stays in the live wiki. If it's in Confluence, Notion or similar and
   changes weekly, don't copy it; name the read-only MCP server in `COMPANY.md` instead.

**Acceptance check**

Five pages, each with an owner and a date; every active repository appears in
`clients.md`; nothing secret (a second person checks).

**Common failure**

Copying the whole wiki. A copy goes stale the day it's made. Keep the facts Claude gets
wrong without them, and link to the rest.

### Lab 3 — The roles (group B)

| | |
|---|---|
| **Goal** | Three agent roles with the limits a new hire would have, written down before they're built. |
| **Targets** | Delegation and permissions. |
| **Prereq** | Lab 1. |
| **Time** | 40 min, in parallel with Labs 2 and 4 |
| **Real-task shape** | The three jobs people most want agents for. Examples: triage new issues, review PRs against our standards, write the weekly client status draft. |
| **Track relevance** | Track 2 (Gatekeeper), Track 3 (Test Whisperer), Track 7 (Automator). |

**Steps**

1. For each job, copy `roles/ROLE.md` to `roles/<role-name>.md` and fill every field.
   **Doesn't own** and **Escalates to** matter most.
2. Write the agent file in `plugins/company/agents/<role-name>.md`, using
   `triage-lead.md` as the model: a `tools` line that matches the card (read-only at
   Tier 0), `skills: [company:company-wiki]` if it needs company facts, a cheap model if it
   only fetches and summarises.
3. If the role needs an MCP server, add `mcp__<server>__*` to its `tools` line and note in
   the card that each person (or the scheduled task) must have that server configured. A
   plugin agent can't bring its own.
4. Swap cards with group C: is there a scheduled task that needs a role nobody wrote?

**Acceptance check**

Three role cards and three agent files whose `tools` lines match the cards, each with a
human owner and an escalation path.

**Common failure**

A role that "helps with everything". It gets every tool and does nothing reliably. One
role, one job, the same as a person.

### Lab 4 — The schedule (group C)

| | |
|---|---|
| **Goal** | One list of every recurring task Claude does for the company, with an owner and a kill switch each, and one new task running. |
| **Targets** | Reliability; team leverage. |
| **Prereq** | Lab 1; two people who passed the agent workshop. |
| **Time** | 40 min, in parallel with Labs 2 and 3 |
| **Real-task shape** | The agents and crews already running from earlier sessions, plus one new task from group B's roles. |
| **Track relevance** | Track 7 (Automator), Track 8 (Parallelizer). |

**Steps**

1. List every scheduled agent and crew that already runs (the agent and crew rosters from
   earlier sessions) in `schedule/SCHEDULE.md`. Any without an owner: pause it today.
2. Fill the calendar view. Look for collisions: two tasks reading the same source at the
   same time, or a task whose output lands when nobody reads it.
3. Move any team task that runs on a personal routine to GitHub Actions, or write down who
   will. A routine acts as the person who owns it.
4. Schedule one new task from group B's roles with the agent workshop's
   `7-agent/claude-agent.yml`, adding the plugin with the action's `plugin_marketplaces` and
   `plugins` inputs. Run it once with **Run workflow**.

**Acceptance check**

Every running task in `SCHEDULE.md` with an owner, tier, kill switch and review date; one new
task's first run read in its log.

**Common failure**

Scheduling everything daily because it's easy. Every run costs, and every report needs a
reader. Match the cadence to how often the answer changes.

### Lab 5 — Install and test, swapped

| | |
|---|---|
| **Goal** | Everyone has it installed, and someone who didn't build a part proves it works. |
| **Targets** | Verification of the setup itself. |
| **Prereq** | Labs 1–4 merged into one branch of the private repository. |
| **Time** | 45 min |
| **Real-task shape** | A repository other than the company setup repository. |
| **Track relevance** | Track 9 (Skeptic) runs the hardest questions. |

**Steps**

1. Validate before anyone installs: `claude plugin validate .` and
   `claude plugin validate ./plugins/company`. Both should end "Validation passed".
2. Everyone installs it the way `README.md` says: clone, one `@` line in
   `~/.claude/CLAUDE.md`, add the marketplace, install the plugin.
3. Swap groups: each group tests a part it didn't build. In a fresh session in another
   repository, run `/context` (is `COMPANY.md` listed, and how big?), then the ten
   questions in `tests/company-questions.md`. Fill in the expected answers first, from the
   pages.
4. Every wrong or invented answer becomes a fix: a page, a role card or a core line. Make
   the fix, then re-ask that question in a fresh session.

**Acceptance check**

Installed on every machine; the ten-question sheet passed (8 of 10, no confident wrong
answer) by someone who didn't build the part.

**Common failure**

Testing in the setup repository itself. There Claude can read the files directly, so it
looks better than it is. Test from another repository, as a user would.

### Lab 6 — Merge and the review loop

| | |
|---|---|
| **Goal** | The setup stays true after today. |
| **Targets** | Team leverage. |
| **Prereq** | Lab 5. |
| **Time** | 30 min |
| **Real-task shape** | The repository you just built. |
| **Track relevance** | All. |

**Steps**

1. Merge the three groups' branches into one pull request and resolve conflicts, usually
   in `owners.md` and `SCHEDULE.md`.
2. Check every wiki page, role card and schedule row has an owner and a review date.
3. Add the monthly review to the calendar: each owner re-reads their page or role, and the
   schedule owner prunes tasks nobody reads.
4. Decide who approves changes to `core/COMPANY.md`. It affects every session for everyone,
   so it needs a named reviewer.
5. If the organization can deploy managed files, decide whether IT ships `COMPANY.md` as the
   managed `CLAUDE.md`. It can't be switched off by anyone, which is the point and the risk.
6. Merge the pull request.

**Acceptance check**

The PR merged; owners and dates everywhere; the monthly review in the calendar.

**Common failure**

No owner for the core. It then grows a line every time someone is annoyed, and in three
months it's 200 lines that every session pays for.

---

## Exit gate (checkpoint with evidence)

| Checkpoint item | Evidence |
|-----------------|----------|
| The core is short and loads everywhere | `COMPANY.md` under 50 lines; `/context` lists it in a fresh session in another repo |
| The wiki loads only when needed and is owned | Five pages with owners and dates; the skill isn't loaded until a question needs it |
| Roles have limits written down | Three role cards whose `tools` lines match their agent files |
| Every recurring task is on one list with a kill switch | `SCHEDULE.md`; one new task's first run |
| Someone who didn't build it got the right answers | The ten-question sheet, 8 of 10, no confident wrong answer |
| It stays true | Owners and review dates everywhere; monthly review booked; core reviewer named |

---

## If stuck

| Symptom | Move |
|---------|------|
| `COMPANY.md` isn't in `/context` | The `@` line must be in `~/.claude/CLAUDE.md` with the path where you cloned the repo; start a fresh session |
| `/company:onboard` doesn't exist | The plugin isn't installed or enabled: `claude plugin list`. After an update, `/reload-plugins` or restart |
| The agent doesn't know company facts | Its `skills:` list must say `company:company-wiki`, with the plugin prefix |
| A role agent can't reach the tracker | Plugin agents can't bring MCP servers. Configure the server for the person or the workflow, and add `mcp__<server>__*` to the agent's `tools` |
| Scheduled task doesn't know the company | Cloud and CI runs don't read `~/.claude/`. Commit a copy of the core into that repo, or install the plugin in the workflow |
| Answers are confidently wrong | The page is stale or missing. Fix the page; then check the skill's rule "don't guess, name the owner" is still there |
| Everyone wants their team's rules in the core | Path-scoped rules in that team's repositories, or a page in the wiki. The core is for everyone |
