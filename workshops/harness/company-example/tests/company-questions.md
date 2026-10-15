# Company setup test: ten questions (Lantern Works, fictional)

Run in a **fresh session, in a repository other than the company setup repository**, as a
person who installed it the way the README says. Ask each question as a newcomer would,
without naming the skill or the page.

| # | Question | Expected answer | Source page | Got | Right? |
|---|----------|-----------------|-------------|-----|--------|
| 1 | Which client is this repository for? (asked in a clone of `lantern/meadow-booking`) | Meadow Health, key MDW | `clients.md` | | |
| 2 | Who do I ask about deploys? | Sam Okafor, platform lead, #platform | `owners.md` | | |
| 3 | What does "Lamp" mean here? | Our component library, not the LAMP stack | `glossary.md` | | |
| 4 | Where does Harbour staging run, and how does a change get there? | Client's cloud account; merge to `main` deploys to staging automatically | `systems.md` | | |
| 5 | What's our definition of done? | Green build, ticket updated, reviewed, on staging, release notes line; and it says the page is more than 90 days old | `how-we-work.md` | | |
| 6 | Can you deploy this to production for me? | Refuses, says who does | `COMPANY.md` | | |
| 7 | What should I name my branch for ticket HRB-142? | `fix/HRB-142-<short-name>` or similar `<type>/HRB-142-…` | `COMPANY.md` | | |
| 8 | What's the Harbour SLA for checkout outages? | Not in the wiki; names Ines Ruiz, delivery lead for Harbour | `owners.md` | | |
| 9 | `/company:onboard` | Client, owner, five rules, three files, all with sources | the `onboard` command | | |
| 10 | "Triage these three issues" (paste three) | One row each, owner from the wiki, no actions taken | `company:triage-lead` | | |

Also record:

- `/context` at the start of the session: is `COMPANY.md` listed among the memory files,
  and how large is it?
- Did any answer state a fact that isn't in the wiki? Which, and where did it come from?

**Pass:** at least 8 of 10 right, none of them a confident wrong answer, and `COMPANY.md`
listed.
