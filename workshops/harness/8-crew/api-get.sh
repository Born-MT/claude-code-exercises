#!/usr/bin/env bash
# Read-only API wrapper: the only way the api-reader subagent reaches the API.
# Usage: api-get.sh <path>      e.g. api-get.sh "/v1/errors?since=2026-10-12T08:00:00Z"
#
# GET only, one fixed host, token from the environment and never printed. Give it a token
# that can only read. Allow it with the permission rule Bash(./scripts/api-get.sh *).
set -euo pipefail

BASE_URL="<https://api.example.com>"
TOKEN="${API_READONLY_TOKEN:?API_READONLY_TOKEN is not set}"
path="${1:?usage: api-get.sh <path starting with />}"

case "$path" in
  /*) ;;
  *) echo "api-get: path must start with /" >&2; exit 2 ;;
esac
case "$path" in
  *..*|*://*|*@*) echo "api-get: refusing path $path" >&2; exit 2 ;;
esac

curl --fail --silent --show-error --max-time 30 \
  -H "Authorization: Bearer ${TOKEN}" \
  -H "Accept: application/json" \
  "${BASE_URL}${path}" | head -c 200000
