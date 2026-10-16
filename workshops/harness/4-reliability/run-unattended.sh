#!/usr/bin/env bash
# Unattended Claude Code run: locked down, capped, and advisory only.
# Usage: run-unattended.sh <prompt-file>
#
# --bare             loads no hooks, MCP servers, CLAUDE.md or plugins from the checkout,
#                    so a pull request can't bring its own. Needs ANTHROPIC_API_KEY.
# dontAsk            denies anything not pre-approved below instead of waiting for a person.
# --allowedTools     read files and run the tests; no edits, so the output is advice.
# --max-turns        stops a run that spins.
# --max-budget-usd   spend cap; a client-side estimate, so it can overshoot. Leave headroom.
set -euo pipefail

PROMPT_FILE="${1:?usage: run-unattended.sh <prompt-file>}"
TEST_COMMAND="<test command>"   # e.g. pnpm test
MAX_TURNS=10
MAX_BUDGET_USD=2

claude --bare -p "$(cat "$PROMPT_FILE")" \
  --permission-mode dontAsk \
  --allowedTools "Read,Bash(${TEST_COMMAND} *)" \
  --max-turns "$MAX_TURNS" \
  --max-budget-usd "$MAX_BUDGET_USD" \
  --output-format json > claude-result.json

# The CLI writes either one result object or an array of messages ending in it.
RESULT='if type=="array" then (map(select(.type=="result")) | last) else . end'
jq -r "$RESULT | .result // empty" claude-result.json
jq -r "$RESULT | \"Estimated cost: \(.total_cost_usd) USD; \(.subtype)\"" claude-result.json >&2
