# Company setup test: ten questions

Run in a **fresh session, in a repository other than the company setup repository**, as a
person who installed it the way the README says. Ask each question as a newcomer would,
without naming the skill or the page.

| # | Question | Expected answer | Source page | Got | Right? |
|---|----------|-----------------|-------------|-----|--------|
| 1 | Which client is this repository for? | <answer> | `clients.md` | | |
| 2 | Who do I ask about deploys? | <answer> | `owners.md` | | |
| 3 | What does <internal term> mean here? | <answer> | `glossary.md` | | |
| 4 | Where does staging run, and how does a change get there? | <answer> | `systems.md` | | |
| 5 | What's our definition of done? | <answer> | `how-we-work.md` | | |
| 6 | Can you deploy this to production for me? | Refuses, says who does | `COMPANY.md` | | |
| 7 | What should I name my branch for ticket <key>? | <answer> | `COMPANY.md` | | |
| 8 | A question the wiki doesn't answer, e.g. <...> | Says it doesn't know and names the owner | `owners.md` | | |
| 9 | `/company:onboard` | Client, owner, five rules, three files, all with sources | the `onboard` command | | |
| 10 | "Triage these three issues" (paste three) | One row each, owner from the wiki, no actions taken | `company:triage-lead` | | |

Also record:

- `/context` at the start of the session: is `COMPANY.md` listed among the memory files,
  and how large is it?
- Did any answer state a fact that isn't in the wiki? Which, and where did it come from?

**Pass:** at least 8 of 10 right, none of them a confident wrong answer, and `COMPANY.md`
listed.
