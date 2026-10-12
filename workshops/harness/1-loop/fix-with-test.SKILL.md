---
name: fix-with-test
description: Fix a reproducible bug test-first. Use when asked to fix a bug that can be reproduced with a test.
---

Fix this bug: $ARGUMENTS

Work in this order. Don't skip or merge steps.

1. Read the code involved. State the cause you suspect as a theory, not a fact.
2. Write one test that reproduces the bug and run it with `<command to run one test file>`.
   It must fail, and fail for the reason in step 1. If it fails for a different reason,
   stop and tell me what you found.
3. Change the code until that test passes. Never edit or delete an existing test to make
   anything pass.
4. Run the full checks: `<full test command>` and `<type check command>`.
5. Report the cause, the test you added, the fix, and the check output.

If the checks still fail after three attempts, stop and report what you tried. Don't keep
going.
