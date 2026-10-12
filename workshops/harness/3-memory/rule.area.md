---
paths: "<apps/web/**>"
---

# Rules for <area>

These load only when Claude works on files matching the glob above, so they cost nothing
in sessions elsewhere in the repo.

- <A rule Claude gets wrong in this area, e.g. "apps/web reads the CMS only over REST,
  through src/lib/cms.ts. Never import the CMS package here.">
- <Another area-specific rule>
