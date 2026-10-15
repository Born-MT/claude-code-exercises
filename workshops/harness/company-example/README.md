# Example: Lantern Works' Claude Code setup

A complete, filled-in example of the company setup the [company workshop](../COMPANY-WORKSHOP.md)
builds, for a **fictional** 25-person software agency. Every name, client, person and system
here is made up. Use it to:

- see what a finished core, wiki, role card and schedule look like before filling in your
  own from [`../company/`](../company/);
- practise the [situations](SITUATIONS.md): realistic things people ask or run into, what
  should answer each one, and what failure looks like;
- run the whole workshop when the room can't use real company data, for example in an
  open training.

Same layout as the template:

| Layer | Where |
|-------|-------|
| Core, always loaded | [`core/COMPANY.md`](core/COMPANY.md) |
| Wiki, on demand | [`plugins/company/skills/company-wiki/`](plugins/company/skills/company-wiki/) |
| Onboarding command | [`plugins/company/skills/onboard/`](plugins/company/skills/onboard/) |
| Role card and agent | [`roles/triage-lead.md`](roles/triage-lead.md), [`plugins/company/agents/triage-lead.md`](plugins/company/agents/triage-lead.md) |
| Schedule | [`schedule/SCHEDULE.md`](schedule/SCHEDULE.md) |
| Test sheet | [`tests/company-questions.md`](tests/company-questions.md) |
| Situations | [`SITUATIONS.md`](SITUATIONS.md) |

## Try it

You don't need a company repository. Copy this folder somewhere, then:

1. Add `@<path to this folder>/core/COMPANY.md` to `~/.claude/CLAUDE.md`, or for a
   one-off try, start Claude Code in a scratch folder whose `CLAUDE.md` imports it (Claude
   Code asks once to approve the external import).
2. Load the plugin for one session: `claude --plugin-dir <path to this folder>/plugins/company`.
3. Work through [`SITUATIONS.md`](SITUATIONS.md) in fresh sessions.

Remove the import line from `~/.claude/CLAUDE.md` afterwards, or every session you start
will believe it works at Lantern Works.
