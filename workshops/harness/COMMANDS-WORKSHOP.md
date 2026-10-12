# Commands workshop: build, test and share custom commands

**Starter files:** [commands/](commands/) · **Budget:** one 3-hour session · **Entry gate:**
the [harness workshop](WORKSHOP.md) exit gate, and three prompts you've typed more than
once

Every attendee leaves with three working commands in their repo, each built for a
different job, each tested like code, and one way to share them with the team. Run it after
the harness workshop and before the agent workshop: the scheduled agent's shift is itself a
command.

**Commands and skills are the same thing now.** A file at `.claude/commands/deploy.md`
and a folder at `.claude/skills/deploy/SKILL.md` both create `/deploy`. The skill folder is
the current format: it can hold supporting files and a `paths` scope. This workshop builds
skill folders; the older command files still work.

---

## The decisions a command makes

| Decision | Frontmatter | Choose it when |
|----------|-------------|----------------|
| Who can start it | default: you and Claude · `disable-model-invocation: true`: only you · `user-invocable: false`: only Claude | Only you, for anything with side effects or where timing matters (writes, deploys, posts). Claude too, for read-only help it should reach for unprompted |
| What it takes | `arguments: [from, to]` → `$from`, `$to`; `argument-hint` for autocomplete | Always name arguments. `$0` is the first one, which trips everyone once |
| What it knows before Claude reads it | `` !`command` `` lines and ` ```! ` blocks run first; their output replaces them | Facts Claude would otherwise spend turns fetching: the PR, the branch, the failing check |
| What it may do without asking | `allowed-tools`, for the turn that runs it | Every injected command must be listed, or the command aborts. It pre-approves; it doesn't restrict |
| Where it runs | default: your conversation · `context: fork` + `agent`: a separate subagent | Fork exploration and research, so only the summary enters your context |
| What it loads only when needed | Supporting files linked from `SKILL.md`; scripts at `${CLAUDE_SKILL_DIR}/…` | Style guides, references, deterministic scripts. Keep `SKILL.md` under 500 lines |

Facts the labs rely on (Claude Code docs, checked 2026-10-12):

- An injected command never prompts. If no permission rule or `allowed-tools` entry
  allows it, the whole invocation aborts with `Shell command permission check failed`.
  A command that exits non-zero aborts it with `Shell command failed`. Append `|| true`
  where non-zero is normal.
- Names clash by precedence: enterprise, then personal (`~/.claude/skills/`), then
  project. A personal `/deploy` silently replaces the team's.
- `.claude/commands/db/migrate.md` runs as `/db:migrate`. A plugin's skills run as
  `/plugin-name:skill`.
- Edits to an existing skill folder are picked up live. A new top-level skills folder needs
  `/reload-skills`.

---

## Run of show

| # | Block | Time | Output (evidence) | Starter files |
|---|-------|------|-------------------|---------------|
| 1 | **Opening.** Commands are skills; the six decisions; the three shapes you'll build. | 15 min | — | — |
| 2 | **Lab 1** — specify three commands. | 20 min | Three spec cards | `commands/command-spec.md` |
| 3 | **Lab 2** — a context command. | 35 min | `/pr-context` working on a real PR; tests 1–5 | `commands/pr-context.SKILL.md` |
| 4 | **Lab 3** — an action command only you can start. | 30 min | `/release-notes` writing one file; tests 1–3 and 6 | `commands/release-notes/` |
| 5 | Break. | 10 min | — | — |
| 6 | **Lab 4** — a forked command. | 20 min | `/explore-area`; `/context` before and after | `commands/explore-area.SKILL.md` |
| 7 | **Lab 5** — test like code. | 25 min | A test sheet per command; one revision each | `commands/command-tests.md` |
| 8 | **Lab 6** — share them. | 15 min | Committed to the repo, or a validated plugin | `commands/plugin/` |
| 9 | **Close.** A teammate runs one cold. | 10 min | Their three lines | — |
| | **Total** | **180 min** | | |

Adapt the three starter commands to your own repetitions where they fit better. Keep one of
each shape: context, action, forked.

---

## Labs

### Lab 1 — Specify three commands

| | |
|---|---|
| **Goal** | Decide what each command does, who starts it and how you'll know it worked, before writing it. |
| **Targets** | Week 3 §2 (skills and commands are the same surface); competency dimension 3. |
| **Prereq** | Three repeated prompts: your friction log's `again` entries or Week 0 baseline Q3. |
| **Time** | 20 min |
| **Real-task shape** | Prompts you've typed at least three times. Examples: "review this PR against our rules", "write release notes since the last tag", "how does the billing module work?". |
| **Track relevance** | Track 1 (Onboarder), Track 5 (Interface), Track 7 (Automator), Track 8 (Parallelizer). |

**Steps**

1. Pick three repeated prompts: one that needs facts fetched first, one that changes
   something, one that explores.
2. Fill a copy of `commands/command-spec.md` for each.
3. Swap with a partner. They check two fields: is **Invoked by** "only you" for anything
   with a side effect, and is the **Done check** something they could verify?

**Acceptance check**

Three spec cards; every command that writes, posts or deploys is "only you"; every done
check is observable.

**Common failure**

A command that does three jobs. It ends up with a long argument list and a vague done
check. Split it.

### Lab 2 — A context command

| | |
|---|---|
| **Goal** | A command that injects live facts before Claude reads it, so Claude starts with the PR in hand instead of fetching it. |
| **Targets** | Context engineering (select: the right facts, up front). |
| **Prereq** | Lab 1; `gh` installed and signed in; a branch with an open PR. |
| **Time** | 35 min |
| **Real-task shape** | Reviewing the PR for your current branch. |
| **Track relevance** | Track 3 (Test Whisperer), Track 8 (Parallelizer). |

**Steps**

1. Copy `commands/pr-context.SKILL.md` to `.claude/skills/pr-context/SKILL.md`.
2. Run `/pr-context` on a branch with an open PR, then `/pr-context "error handling"`.
   Check the review mentions the PR's real title and files.
3. Run it on a branch with no PR. Read the error: an injected command failed, so the
   whole invocation stopped. Decide whether that's right for this command, or whether
   that line needs `|| true` and a sentence telling Claude what to do with no PR.
4. Remove `Bash(gh pr checks *)` from `allowed-tools` and run it again. It aborts with
   a permission-check failure. Put it back.
5. Record tests 1–5 from `commands/command-tests.md`.

**Acceptance check**

A review that names the real PR's files; tests 1–5 recorded with what happened.

**Common failure**

Injecting everything: the full diff, the full log. Injected output enters the context
every time. Inject the list of files and let Claude read the ones it needs.

### Lab 3 — An action command only you can start

| | |
|---|---|
| **Goal** | A command with a side effect, bounded to one place, that Claude can't start on its own. |
| **Targets** | Permissions; enforcement versus context. |
| **Prereq** | Lab 1. |
| **Time** | 30 min |
| **Real-task shape** | Release notes for your last two tags, or another write-one-file job from your spec. |
| **Track relevance** | Track 2 (Gatekeeper), Track 7 (Automator). |

**Steps**

1. Copy the `commands/release-notes/` folder to `.claude/skills/release-notes/`. Rewrite
   `style.md` with your team's real conventions.
2. Run `/release-notes <older tag> <newer tag>`. Check the file appeared in
   `docs/release-notes/` and nothing else changed (`git status`).
3. Run it with one argument, then with a ref that doesn't exist. It should stop with the
   usage line or name the bad ref.
4. Ask in plain words: "write release notes for the last release". Claude shouldn't
   start the command; `disable-model-invocation: true` hides it from Claude.
5. Record tests 1–3 and 6.

**Acceptance check**

One notes file, `git status` showing only that file, and Claude not starting the command
unprompted.

**Common failure**

Reading `allowed-tools` as a limit. It only pre-approves. The bound on where this writes
is the instruction plus your permission rules; check `git status` after every run.

### Lab 4 — A forked command

| | |
|---|---|
| **Goal** | Exploration that runs in a separate context and hands back only a summary. |
| **Targets** | Context engineering (isolate); delegation. |
| **Prereq** | Lab 1. |
| **Time** | 20 min |
| **Real-task shape** | An area of your repo you'd have to explain to a new joiner. |
| **Track relevance** | Track 1 (Onboarder), Track 4 (Archaeologist). |

**Steps**

1. Copy `commands/explore-area.SKILL.md` to `.claude/skills/explore-area/SKILL.md`.
2. Run `/context` and note the conversation total. Run `/explore-area <area>`. The fork
   runs in the background; keep working until its summary arrives. Run `/context` again.
3. Check three of its file:line references by opening them.
4. Ask the same question without the command, in a fresh session, and compare the context
   used.

**Acceptance check**

Two `/context` readings showing the forked run added only its summary; three references
checked.

**Common failure**

Writing a forked command that relies on the conversation. The fork can't see it. Every
fact it needs must be in the command or its arguments.

### Lab 5 — Test like code

| | |
|---|---|
| **Goal** | Know each command works for someone who isn't you, in a session that isn't this one. |
| **Targets** | Verification. |
| **Prereq** | Labs 2–4. |
| **Time** | 25 min |
| **Real-task shape** | Your three commands. |
| **Track relevance** | Track 9 (Skeptic) tests someone else's. |

**Steps**

1. For each command, run the untested rows of `commands/command-tests.md` in fresh
   sessions. Test 7 (with and without the command) is the one that tells you whether it
   earns its place.
2. Run `/status` and check no `allowed-tools` entry was ignored.
3. Make one revision per command from what the tests showed. The first version is always
   too vague.

**Acceptance check**

Three filled test sheets, each with a verdict and one revision committed.

**Common failure**

Testing in the session you wrote the command in. The conversation already holds what the
command was meant to supply, so it looks better than it is.

### Lab 6 — Share them

| | |
|---|---|
| **Goal** | The team gets the commands without copying files around. |
| **Targets** | Team leverage. |
| **Prereq** | Lab 5. |
| **Time** | 15 min |
| **Real-task shape** | Your three commands. |
| **Track relevance** | All. |

Pick the smallest way that reaches everyone who needs them:

| Who needs them | Do this |
|----------------|---------|
| Everyone in this repository | Commit `.claude/skills/` on a branch and open a PR. Done |
| You, in every repository | Move them to `~/.claude/skills/`. Remember a personal skill replaces a project one with the same name |
| The team, in many repositories | A plugin in a marketplace repo, as below |

**Steps for a plugin**

1. In a marketplace repository, create `.claude-plugin/marketplace.json` from
   `commands/plugin/marketplace.json`, and `plugins/team-commands/` with
   `.claude-plugin/plugin.json` from `commands/plugin/team-commands/`. Copy your skill
   folders into `plugins/team-commands/skills/`.
2. Validate both: `claude plugin validate ./plugins/team-commands` and
   `claude plugin validate .`. Both should end with "Validation passed".
3. Try it before sharing: `claude --plugin-dir ./plugins/team-commands`, then run
   `/team-commands:pr-context`.
4. After pushing, teammates run `claude plugin marketplace add <owner>/<repo>` and
   `claude plugin install team-commands@<marketplace name>`.

**Acceptance check**

A PR with `.claude/skills/`, or a plugin that passes `claude plugin validate` and runs under
`--plugin-dir`.

**Common failure**

Different names in `marketplace.json` and `plugin.json`. Installs then fail with "not
found in marketplace". Keep the entry name and the manifest name the same.

---

## Exit gate (checkpoint with evidence)

| Checkpoint item | Evidence |
|-----------------|----------|
| Three commands, one of each shape | Three skill folders on a branch, with spec cards |
| Every injected command pre-approved, failures handled | Lab 2 tests 4 and 5 |
| Side-effect commands can only be started by you | Lab 3 test 6 |
| Exploration runs forked and returns a summary | Lab 4 `/context` readings |
| Each command tested in fresh sessions and revised once | Three test sheets; three revisions |
| Shared with the team | PR link, or a validated plugin |
| Someone else ran one cold | Their three lines: worked / didn't / what they'd change |

---

## If stuck

| Symptom | Move |
|---------|------|
| `/name` doesn't appear | Folder must be `.claude/skills/<name>/SKILL.md`, frontmatter must start on line 1 with `---`. A new top-level skills folder needs `/reload-skills` |
| "Shell command permission check failed" | The injected command isn't covered by `allowed-tools` or a permission rule. Add it in the same form, e.g. `Bash(gh pr view *)` |
| "Shell command failed" | An injected command exited non-zero. Fix it, or append `\|\| true` and tell Claude what an empty result means |
| `!` line printed literally | The `!` must be at the start of a line or after a space, with the command in backticks |
| `$from` shows up literally | The name isn't in `arguments`, or it's spelled differently |
| Claude starts the command unprompted | Add `disable-model-invocation: true` |
| Claude never uses a command it should | Its `description` doesn't say when to use it. Put the trigger in the words you'd type, first |
| A teammate's run differs from yours | They have a personal skill with the same name, which takes precedence |
| Injected commands fail for Windows teammates | Set `shell: powershell` and write the commands for PowerShell, or make Git Bash a team prerequisite |
