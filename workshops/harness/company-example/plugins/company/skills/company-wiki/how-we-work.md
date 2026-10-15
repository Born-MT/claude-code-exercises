# How we work

Last reviewed: 2026-05-20 · Owner: Head of Delivery

*Fictional example. This page is deliberately more than 90 days old, for situation 7.*

## Branches and pull requests

- Branch from `main`: `<type>/<ticket>-<short-name>`. One reviewer from the same client
  team; the author merges after approval.

## Releases

- Harbour: any time a green build is on `main`, by the platform lead; production fixes only
  in the hotfix window.
- Meadow: the release train, every second Wednesday; the client signs off in staging first.
- Lamp: tagged by the frontend lead; a breaking change is a major version and a note in
  both clients' channels.

## Definition of done

- Green build; the ticket updated with what changed; reviewed; on staging; release notes
  line written.

## Using Claude Code here

- Read every diff before committing. Claude never merges, pushes to `main` or deploys.
- Agents and scheduled tasks are listed in `schedule/SCHEDULE.md` in the company setup
  repository, each with an owner and a kill switch.
