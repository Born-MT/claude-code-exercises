# Systems and environments

Last reviewed: 2026-09-12 · Owner: Platform lead

*Fictional example.*

| System | Environments | Where it runs | How changes reach it | Claude may |
|--------|--------------|---------------|----------------------|------------|
| Harbour shop | dev, staging, production | Containers on the client's cloud account | Merge to `main` → staging automatically; production by the platform lead in a release or the hotfix window | read code and staging logs; never deploy |
| Harbour CMS | staging, production | Managed CMS hosting | Content by the client; schema changes by PR | read schema; never change content |
| Meadow booking | staging, production | The client's own hosting, in their region | Release every second Wednesday, client approves | read code only; no access to their logs |
| Lamp | npm package | Private registry | Tagged release by the frontend lead | read and propose changes |

## CI

GitHub Actions in every repository. Main checks: type check, unit tests, visual tests;
about 6 minutes. Owner: Platform lead.
