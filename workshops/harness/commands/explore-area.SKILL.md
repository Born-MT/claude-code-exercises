---
description: Maps one area of the codebase in a separate context and returns a short summary with file references. Use when asked how an area works, where something lives, or before changing an unfamiliar area.
argument-hint: <area or question>
context: fork
agent: Explore
---

Map this part of the repository: $ARGUMENTS

You don't see the conversation that started you, so work only from this request and the
code.

Return at most 25 lines:

- **Entry points:** where a request or call enters this area (file:line).
- **Flow:** the path through it, one line per step, each with file:line.
- **Read first:** the three files a newcomer should open, and why.
- **Landmines:** anything that looks wrong but is load-bearing, or is easy to break.

Every claim needs a file:line. Write "not found" rather than guess.
