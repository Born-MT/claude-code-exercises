# Command spec: /<name>

Fill this in before writing the command. If a field is hard to fill, the command isn't
ready.

| Field | Answer |
|-------|--------|
| **The repetition it replaces** | <the prompt you've typed three times; quote it> |
| **Invoked by** | <you only (`disable-model-invocation: true`), Claude too (default), or Claude only (`user-invocable: false`)> and why |
| **Arguments** | <named, in order, e.g. `[from, to]`; what each means; what happens with none> |
| **Context injected before Claude sees it** | <each `` !`command` ``, and what it does when it fails> |
| **Tools pre-approved** | <each `allowed-tools` entry; every injected command must be here> |
| **Runs where** | <main conversation, or `context: fork` with which agent> |
| **Output** | <what the user gets: a file path, a summary shape, a comment> |
| **Never does** | <the side effect it must not have> |
| **Done check** | <how you'd know a run worked, without reading its reasoning> |
| **Owner** | <name> |
