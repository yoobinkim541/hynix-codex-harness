---
name: decision-log
description: "Use whenever a non-trivial choice is made (problem framing, approach, library, data handling, scope cut, assumption, trade-off) to append one entry to DECISIONS.md with options, choice, rationale, evidence and how it was verified. Use for submission-document traceability."
---

# Decision Log

Append to `DECISIONS.md` (template in `templates/DECISIONS.md`). One entry per decision, newest last:

```
## D<n> <short title>  (<HH:MM>, refs R<x>)
- 상황/문제: ...
- 대안: A) ... B) ...
- 선택: ...
- 근거: data/source/measurement (file:line, command output, doc)
- 검증: how it was checked + result (or "미검증" + plan)
- 리스크/한계: ...
```

Rules:
- Write the entry at the moment of deciding, not at the end. 2-6 lines max.
- Evidence must be concrete: a path, a number, a command and its output. No "seems better".
- Scope cuts and assumptions are decisions too.
- REPORT.md summarizes the top decisions by linking D-numbers.
