# Lantern Works

Lantern Works is a 25-person software agency that builds and runs web platforms for three
clients. Claude: this file loads in every session, so it holds only what applies
everywhere. Details are in the company wiki skill.

*Fictional example company for the company workshop. Every name, client and system here is
made up.*

## Never

- Never put client data, credentials or personal data in prompts, code comments, commits
  or files outside the systems built for them.
- Never push to `main`, deploy, or change production. People do that.
- Never mention one client's name, code or data in another client's repository. (Incident
  2025-11: a commit message named the wrong client.)
- Never edit generated files (`*.generated.ts`, `schema.lock`); change their source and
  regenerate.

## How we work

- Every change is on a branch and goes through a pull request with one reviewer.
- Branches: `<type>/<ticket>-<short-name>`, e.g. `fix/HRB-142-cart-total`.
- PR titles start with the ticket key: `HRB-142: fix cart total rounding`.

## Where to look

- Clients, products, systems, owners, internal terms, release process: the
  `company:company-wiki` skill. Read the page you need; don't guess.
- Who to ask: `owners.md` in the wiki, by area.
- The live wiki for anything else: the `docs` MCP server, read-only.

## Words we use

- **Lamp**: our internal component library. Not the LAMP stack.
- **Hotfix window**: Tuesday and Thursday 14:00–16:00, the only times production changes go
  out outside a release.
- **Green build**: all checks pass on the PR, including the visual tests.
