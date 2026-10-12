# Release notes style

Loaded by the `release-notes` command when it writes. Replace the examples with your
team's real conventions.

## Sections, in this order

1. **Breaking changes**: anything a user or caller must change. Say what to change.
2. **New**: features, in the reader's words, not the code's.
3. **Fixed**: bugs, described by the symptom the user saw.
4. **Internal**: only if the audience is developers.

## Rules

- One line per change: what changed, for whom, then the short hash in brackets.
- Skip: <commits that only touch CI, formatting, or dependency bumps without a visible
  effect>.
- <Your tone rules, e.g. "present tense", "no marketing words">.

## Example

```markdown
## <version> · <date>

### Fixed
- Search no longer drops results after the 50th page. (a1b2c3d)
```
