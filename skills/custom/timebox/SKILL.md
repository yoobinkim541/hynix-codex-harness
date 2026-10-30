---
name: timebox
description: "Use at task start to set phase deadlines for a 180-minute build (이해 20 / 설계 20 / 구현 100 / 검증·문서 40) and at every phase boundary or when behind schedule to decide scope cuts. Not for estimating long projects."
---

# Timebox (180 min)

At start, run `date` and write absolute deadlines at the top of PLAN.md:

| Phase | Min | Exit criteria |
|---|---|---|
| 1 이해 | 0-20 | REQUIREMENTS.md locked, data/files inspected |
| 2 설계 | 20-40 | PLAN.md with MVP + stretch, D1-D3 in DECISIONS.md |
| 3 구현 | 40-140 | MVP runs end-to-end first, then stretch items |
| 4 검증·문서 | 140-180 | tests/checks run, REPORT.md complete, deliverables in place |

Rules:
- Check `date` at each phase boundary and after every major step.
- **Hard stop for new features at minute 140.** After that only fixes, verification, documentation.
- **Scope cut rule**: if a phase overruns by >10 min, or a single bug eats >15 min, cut the lowest-priority stretch item, log it in DECISIONS.md, list it under 남은 한계.
- Always keep a working, submittable state; commit locally (`git commit`) after each working milestone (no push).
- Minute 170: freeze. Final requirement tick-off and file check only.
