---
name: onboard
description: Orients someone in the current repository using the company wiki — which client or product it belongs to, who owns it, the rules that apply, and where to start reading. Use when someone is new to a repository or asks where to start.
allowed-tools: Bash(git remote get-url *) Bash(git log *)
---

## This repository

!`git remote get-url origin || true`

## Recent activity

!`git log --oneline -10 || true`

## Your task

Orient a newcomer in this repository. Use the `company:company-wiki` skill for company facts and
the code for everything else.

1. **Whose is it:** find this repository in the wiki's `clients.md`. If it isn't there,
   say so and name who to ask from `owners.md`.
2. **Who owns it:** the owner from `owners.md`, and how to reach them.
3. **Rules that apply:** from `how-we-work.md` and this repository's CLAUDE.md, the five
   a newcomer is most likely to break.
4. **Where to start:** the three files to read first, each with one line on why.
5. **Words to know:** any glossary terms that appear in this repository's code or docs.

Keep it under 40 lines. Every company fact names the wiki page it came from.
