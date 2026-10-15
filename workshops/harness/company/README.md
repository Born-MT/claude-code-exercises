# <company>-claude: our Claude Code setup

This repository is <Company>'s shared Claude Code setup: the company context every session
starts with, the wiki Claude reads when it needs to, the roles our agents play, and the
schedule of work they do. **Keep it private.** It describes clients, systems and people.

Built from the starter files in the company workshop. Owner: <name> · Reviewed monthly.

## What's in it

| Layer | Where | Loads | Delivered by |
|-------|-------|-------|--------------|
| **Core**: who we are, the non-negotiables, where to look | [`core/COMPANY.md`](core/COMPANY.md) | Every session, always | An `@` import in each person's `~/.claude/CLAUDE.md`, or IT's managed `CLAUDE.md` |
| **Wiki**: clients, systems, owners, glossary, how we work | [`plugins/company/skills/company-wiki/`](plugins/company/skills/company-wiki/) | Only the page a task needs | The `company` plugin |
| **Commands** | [`plugins/company/skills/`](plugins/company/skills/) | When run, e.g. `/company:onboard` | The `company` plugin |
| **Roles**: the jobs our agents do, and their limits | [`roles/`](roles/) cards; [`plugins/company/agents/`](plugins/company/agents/) | When delegated to | The `company` plugin |
| **Schedule**: every recurring task, its role, owner and kill switch | [`schedule/SCHEDULE.md`](schedule/SCHEDULE.md) | Read by people | This repo; each task runs where its row says |

## Install it (each person, once)

1. Clone this repository to `~/company-claude`.
2. Add one line to `~/.claude/CLAUDE.md` (create the file if it doesn't exist):

   ```text
   @~/company-claude/core/COMPANY.md
   ```

3. Add the marketplace and install the plugin:

   ```bash
   claude plugin marketplace add <org>/<company>-claude
   claude plugin install company@<company>-marketplace
   ```

4. Start a fresh session in any repository and run `/context`. `COMPANY.md` should be
   listed among the memory files. Then run `/company:onboard`.

To update: `git pull` in `~/company-claude` (core), and update the plugin from `/plugin`.

## Scheduled and cloud runs

Cloud sessions, routines and CI don't read your `~/.claude/` files or the plugins you
installed. For those, either commit a copy of `core/COMPANY.md` into the repository and
import it from that repo's `CLAUDE.md`, or have the cloud environment's setup script write
it to `~/.claude/CLAUDE.md`. In GitHub Actions, the Claude Code action installs plugins with
its `plugin_marketplaces` and `plugins` inputs.

## Rules for this repo

- Nothing secret: no credentials, tokens, personal data or client data. Claude reads every
  page it loads, and so does anyone with access here.
- Every wiki page has an owner and a "Last reviewed" date. A page nobody owns gets deleted.
- `core/COMPANY.md` stays under 50 lines. It costs context in every session for everyone.
- Changes go through a pull request, reviewed by the owner of the page or role.
