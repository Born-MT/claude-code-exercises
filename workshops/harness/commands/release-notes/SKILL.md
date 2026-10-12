---
description: Writes release notes for a commit range into docs/release-notes/. Run it yourself with /release-notes <from> <to>.
argument-hint: <from-ref> <to-ref>
arguments: [from, to]
disable-model-invocation: true
allowed-tools: Bash(git log *) Bash(git diff *) Edit(docs/release-notes/**)
---

Write release notes for the commits between `$from` and `$to`.

1. If either argument is missing, stop and say: "Usage: /release-notes <from-ref> <to-ref>".
2. Run `git log --no-merges --format="%h %s (%an)" $from..$to`. If it fails or prints
   nothing, stop and say which ref looks wrong.
3. Group the commits by theme and write them in the house style in [style.md](style.md).
   Every line keeps its short hash. Leave out commits the style guide says to skip.
4. Write the notes to `docs/release-notes/$to.md`. Don't edit any other file.
5. End with the file path and the number of commits included and skipped.
