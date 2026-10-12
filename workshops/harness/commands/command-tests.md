# Command tests: /<name>

Run each test in a fresh session (`/clear`), so earlier context doesn't hide gaps in the
command. Record what actually happened.

| # | Test | Expected | Got |
|---|------|----------|-----|
| 1 | Invoke with no arguments | <usage message, or a sensible default> | |
| 2 | A quoted multi-word argument: `/<name> "two words" next` | `$0`/first name gets `two words` | |
| 3 | A wrong argument (bad ref, missing PR) | Stops and says what's wrong; changes nothing | |
| 4 | An injected command fails (e.g. no PR on this branch) | The invocation aborts with "Shell command failed", or the `|| true` output is handled | |
| 5 | An injected command not in `allowed-tools` (remove one entry) | Aborts with "Shell command permission check failed"; put it back | |
| 6 | Ask for the task in plain words without naming the command | Default: Claude uses it. `disable-model-invocation: true`: Claude doesn't | |
| 7 | The same task with the command and without it, fresh sessions | The command's run is closer to the done check | |
| 8 | A teammate runs it cold, with only the description and `argument-hint` | Works without asking you | |

`/status` lists any `allowed-tools` entry Claude Code ignored in the session. After a
week of use, `/skill-doctor` shows what each skill costs in context and which were never
invoked.

**Verdict:** <keep / revise: what / delete>
