# Exercise Template

Copy the block below into the **Additional exercises** section of a `weeks/week-N.md`
file. Every field is required. If you can't fill in *Acceptance check*, the exercise isn't
ready — that field is the whole point.

Numbering: core labs keep the module's letters (A, B, C). Additional exercises are
`N.1`, `N.2`, ... where N is the week, so `3.2` is the second added exercise in Week 3.

---

```markdown
### Exercise N.x — <short imperative name>

| | |
|---|---|
| **Goal** | One sentence. What the learner can do afterwards that they couldn't before. |
| **Targets** | The module section, competency-matrix dimension, or anti-pattern this addresses. |
| **Prereq** | Which lab or earlier exercise must be done first. "None" is fine. |
| **Time** | Realistic, on a real repo. Round up. |
| **Real-task shape** | What kind of task in the learner's own repo suits this. Give two examples. |
| **Track relevance** | Which tracks can count this as their weekly beat, if any. |

**Steps**

1. Concrete action, with the exact command or prompt where one exists.
2. ...
3. The last step is always: record the result in the journal (name the file).

**Acceptance check**

What must be true, stated so a peer could verify it without you present. Prefer
machine-checkable: a file exists, a command exits 0, a hook fires when tripped, a number is
in the journal. "I understand X" is not an acceptance check.

**Journal entry**

Which template in `templates/journal/`, and what the one-line entry looks like.

**Common failure**

The single most likely way this goes wrong, and the move when it does.
```

---

## Worked example

### Exercise 1.1 — Falsify one CLAUDE.md line

| | |
|---|---|
| **Goal** | Prove that a specific CLAUDE.md rule changes Claude's behaviour, rather than assuming it does. |
| **Targets** | Week 1 §2; competency dimension 1 (Context). Anti-pattern 7 (config sprawl) by removing lines that do nothing. |
| **Prereq** | Week 1 Lab A (CLAUDE.md rewritten). |
| **Time** | 30 min |
| **Real-task shape** | A small change in an area one rule governs. Examples: add a DB query where the rule says "all DB access goes through repositories"; add an API error where the rule names the error class. |
| **Track relevance** | Track 1 (Onboarder), Track 4 (Archaeologist). |

**Steps**

1. Pick one rule from your CLAUDE.md that you *think* matters. Write down what Claude would
   do without it.
2. Comment the rule out. Fresh session (`/clear`). Ask for the change. Read the diff.
3. Restore the rule. Fresh session. Same request, same wording. Read the diff.
4. Record both outcomes in `templates/journal/context-audit.md` under "CLAUDE.md tests".

**Acceptance check**

Two diffs, and a one-line verdict: *the rule changed the outcome* (keep it), or *it didn't*
(delete it, or make it specific enough that it would). One or the other, in the journal.

**Journal entry**

`context-audit.md` → CLAUDE.md tests table: date, rule, without, with, verdict.

**Common failure**

The task doesn't actually exercise the rule, so both diffs look the same and you conclude the
rule is useless. Pick a task where the rule *should* bite before running the test.
