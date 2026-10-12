# Exercise tracks

One track per attending developer. Assigned in **Week 0**, worked incrementally across the
curriculum, shipped in Week 6.

## Why tracks instead of everyone doing the same lab

Three reasons, in order of importance:

1. **The capstone ships.** In the original design the capstone is scoped in Week 6 and
   therefore mostly doesn't happen. A track selected in Week 0 and advanced weekly arrives
   at Week 6 already three-quarters built.
2. **The cohort covers more ground than any individual.** Eight people doing the same lab
   produce one insight eight times. Eight tracks produce eight artifacts the team keeps.
3. **The share-back becomes worth attending.** Nobody wants to hear seven versions of the
   same CLAUDE.md.

The module labs still happen — tracks run *alongside* them, using the same real repo. The
lab teaches the mechanism; the track applies it to something only you own.

## Assigning them

Match to what the person already owns, not to what would stretch them. The stretch comes
from the tooling being new, not from the domain being unfamiliar — someone learning both at
once learns neither.

Rules:

- **Always assign Track 9 (The Skeptic)**, to the most critical person in the room. This is
  the highest-value track and the one facilitators are most tempted to skip.
- **Tracks 2, 4 and 8 interlock with others.** If you run a cohort of four, pick tracks that
  interlock so the share-backs have something to push against.
- Nobody picks their own track in the first cohort. You assign. People self-select toward
  what they're already good at, which defeats the point.

---

## Track 1 — The Onboarder

**Suits:** the senior-most person, or whoever answers the most questions in chat.

**Artifact:** the repo's `CLAUDE.md`, plus an `explain-subsystem` skill that orients someone
who has never seen the codebase.

**Beats**
- *Weeks 1–2:* Write the CLAUDE.md against the "would Claude plausibly get this wrong?"
  test. Delete half of what `/init` gave you.
- *Weeks 3–4:* Turn the explanation you give new joiners into a skill. Use `paths` so it
  activates in the subsystems it covers.
- *Week 5:* Connect it to the ticket tracker if that's where the context actually lives.
- *Ships Week 6:* Opened as a PR. The discussion is the deliverable.

**Done when:** a developer from another team — or an actual new joiner — uses it to answer
three questions about your codebase without asking a human.

**Share-back:** the three questions, and where the pack failed.

---

## Track 2 — The Gatekeeper

**Suits:** platform, DevOps, SRE, or whoever gets paged.

**Artifact:** the repo's enforcement layer — permission rules, a guard hook for your real
risk surface, format-on-edit.

**Beats**
- *Weeks 1–2:* Run in normal permission mode. Log every prompt you approve reflexively.
  That log is your allowlist.
- *Weeks 3–4:* Build the deny rules and the guard hook. Choose deliberately between
  `PreToolUse` and `Stop`, and be able to defend the choice.
- *Week 5:* Extend to unattended runs — automation should be *more* restricted, not less.
- *Ships Week 6:* Committed `settings.json` with a named justification per rule.

**Done when:** Track 9 has tried to breach it and you've closed what they found.

**Interlocks with:** Track 9, adversarially. Hand them your config in Week 4.

**Share-back:** what got through on the first attempt. Something will — the matcher-gap
lesson lands far harder when it's your own guard that leaked.

---

## Track 3 — The Test Whisperer

**Suits:** QA-minded engineers, or the backend dev who complains about the test suite.

**Artifact:** a `test-auditor` subagent with read-only tools, plus a written test-quality
standard for the repo.

**Beats**
- *Weeks 1–2:* Audit the repo's verification signals honestly. Which check would catch a
  broken core invariant? Is there one?
- *Weeks 3–4:* Build the auditor. Restrict its tools so it *cannot* modify what it reviews.
- *Week 5:* Point it at historical PRs in CI, advisory only.
- *Ships Week 6:* The standard, the agent, and the honest comparison.

**Done when:** you've run it against five PRs a human already reviewed and published where
the agent lost.

**Share-back:** the losses, not the wins. Where it missed something a human caught is the
useful data.

> This track is also the answer to Week 2's uncomfortable finding — that weak tests cap the
> agent's ceiling. The obvious move is to delegate the test-infrastructure work itself.
> Do that, and report how it went.

---

## Track 4 — The Archaeologist

**Suits:** whoever owns the system nobody else understands. Usually reluctantly.

**Artifact:** a comprehension pack for the least-understood subsystem — architecture notes,
a map of the landmines, and a subdirectory `CLAUDE.md` that loads when working in it.

**Beats**
- *Weeks 1–2:* Plan mode only. Have Claude explore and explain the subsystem back to you.
  Correct it. The corrections are the content.
- *Weeks 3–4:* Encode the landmines — the things that look wrong and are load-bearing.
- *Week 5:* Cross-reference against incident history if you have it.
- *Ships Week 6:* The pack, plus one change made safely in that subsystem by someone else.

**Done when:** another cohort member makes a small change in your subsystem using only the
pack, and you'd merge it.

**Interlocks with:** whoever you hand it to. Arrange that in Week 4.

**Share-back:** what Claude got confidently wrong about the subsystem on first read. That's
your documentation gap, precisely located.

---

## Track 5 — The Interface Specialist

**Suits:** frontend or mobile.

**Artifact:** a skill encoding your component and design-system conventions — the ones that
are currently tribal knowledge enforced in review.

**Beats**
- *Weeks 1–2:* Collect the review comments you leave most often. Those are your rules.
- *Weeks 3–4:* Write the skill. Scope it with `paths` to the component directories.
- *Week 5:* Add the accessibility pass that keeps getting skipped.
- *Ships Week 6:* Skill plus a component built through it.

**Done when:** someone outside your area builds a component with it that you'd approve
without style comments.

**Share-back:** the diff between what they built and what you'd have written.

---

## Track 6 — The Integrator

**Suits:** backend or full-stack with an appetite for tooling.

**Artifact:** one MCP connection and one cross-system workflow that eliminates a real
context switch.

**Beats**
- *Weeks 1–2:* Baseline the context switch you're targeting. How many tabs, how long?
- *Weeks 3–4:* A command that consumes the external context and produces something useful.
- *Week 5:* Wire the MCP server. Measure `/context` before and after connecting.
- *Ships Week 6:* The workflow, and a public keep-or-drop call on the server.

**Done when:** ticket in, reviewable PR description out, without leaving the terminal.

**Share-back:** the context cost. If the server didn't earn its place, say so — a negative
result here is more useful to the team than another integration nobody removes.

---

## Track 7 — The Automator

**Suits:** whoever owns CI.

**Artifact:** one automation running on real traffic, with an owner and a kill switch.

**Beats**
- *Weeks 1–2:* Pick the target by measuring what wastes the most team time. Not by what's
  most fun to build.
- *Weeks 3–4:* Write the prompt as a version-controlled artifact, not inline YAML.
- *Week 5:* Ship it advisory-only, cost-bounded.
- *Ships Week 6:* Running, owned, documented — including how to turn it off.

**Done when:** it has run on twenty real inputs and you've scored the output honestly.

**Share-back:** the failure rate, and what you'd need to see before trusting it further.

> Constraint: **one** automation. The instinct is five prototypes. Five prototypes is zero
> automations plus maintenance.

---

## Track 8 — The Parallelizer

**Suits:** a mid-to-senior IC carrying normal delivery load. The person with the least
slack, deliberately.

**Artifact:** a worktree workflow, and the cohort's review-versus-generation ratio.

**Beats**
- *Weeks 1–2:* Work single-stream and time your review pass. That's the baseline.
- *Weeks 3–4:* Two worktrees, two independent streams. Time review again.
- *Week 5:* Find where it breaks — the point at which you start skimming.
- *Ships Week 6:* The documented workflow and the measured ratio.

**Done when:** you can state your own parallel-session limit from data, not instinct.

**Interlocks with:** everyone. Your number is the one the whole cohort needs, because review
bandwidth — not generation speed — is the real throughput ceiling.

**Share-back:** the ratio, and the point where quality started dropping. Be honest about
the second one; it's the finding.

---

## Track 9 — The Skeptic

**Suits:** the most critical person in the room. Assign this deliberately and frame it as
the senior role it is.

**Artifact:** a written, evidence-backed account of where this tooling made things *worse*,
with reproductions.

**Beats**
- *Weeks 1–2:* Work normally, but log every failure, near-miss, and wasted hour with enough
  detail to reproduce.
- *Weeks 3–4:* Try to breach Track 2's guard rails. Get Claude to do the forbidden thing by
  routing around the matcher — via a shell command, via a subagent, via a skill.
- *Week 5:* Attack the automation. Feed Track 7's pipeline adversarial inputs: a ticket
  containing instructions, a PR designed to look benign.
- *Ships Week 6:* The findings, ranked, each with a proposed guardrail.

**Done when:** at least two findings the cohort agrees are real and neither had anticipated.

**Interlocks with:** Tracks 2 and 7, adversarially.

**Share-back:** you go last, and you get the most time.

> This track exists because a cohort that reports uniform success wasn't looking hard
> enough, and because the resident skeptic will otherwise express the same scepticism as
> quiet non-adoption. Given a legitimate mandate to break things, that instinct becomes the
> most valuable output of the programme.

---

## Other roles

Data or analytics engineers: run Track 3 against pipeline correctness, or Track 2 scoped to
query safety and schema changes. Security engineers: Track 9, with Track 2 as a secondary.
Engineering managers attending as participants rather than facilitators: Track 1.

If two people must share a track, split it by system rather than by task — two Gatekeepers
on one config produce an argument, not a config.
