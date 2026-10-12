# Signal audit: <repo>

Date: <date> · By: <name>

The Stop hook can only run a check that exists. Before installing it, list every
verification signal the repo has and decide which one it runs.

| Signal | Command | Runs in | Catches a broken core invariant? | Trusted? |
|--------|---------|---------|----------------------------------|----------|
| Type check | `<command>` | <time> | <yes / no / partly: which one> | <yes / no: why> |
| Unit tests | `<command>` | <time> | | |
| Integration tests | `<command>` | <time> | | |
| Lint | `<command>` | <time> | | |
| Build | `<command>` | <time> | | |

**Core invariant tested:** <the one thing that must never break, and the check that
would catch it>

**Decision:** <a strong signal exists and runs in minutes: the Stop hook runs `<command>`>
or <no strong signal: this week we build `<what>` first>
