#!/usr/bin/env bash
# Stop hook: Claude can't finish while the checks fail.
# Exit 2 blocks the stop, and Claude gets stderr as the reason to keep going.

CHECK_COMMAND="<check command>"   # e.g. pnpm typecheck && pnpm test

input=$(cat)

# Already continuing because of this hook: let it stop, so a check that can't pass
# doesn't loop. Claude has had one more pass to fix it and must report the failure.
if [ "$(printf '%s' "$input" | jq -r '.stop_hook_active')" = "true" ]; then
  exit 0
fi

cd "${CLAUDE_PROJECT_DIR:-.}" || exit 0

# Nothing changed in the working tree: nothing to verify.
if [ -z "$(git status --porcelain 2>/dev/null)" ]; then
  exit 0
fi

if ! output=$(bash -c "$CHECK_COMMAND" 2>&1); then
  {
    echo "The checks failed. Fix the code, not the tests, then finish."
    echo "If you can't make them pass, stop and say what's failing."
    echo
    printf '%s\n' "$output" | tail -n 40
  } >&2
  exit 2
fi

exit 0
