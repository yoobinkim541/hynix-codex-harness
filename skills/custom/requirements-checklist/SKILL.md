---
name: requirements-checklist
description: "Use at the very start of a task, right after reading the problem statement, to lock requirements into REQUIREMENTS.md (must-haves, constraints, deliverables, file names, evaluation criteria, open questions). Also use when scope or the brief changes. Not for planning implementation steps."
---

# Requirements Checklist

Goal: never lose points by missing a stated condition.

1. Read the full problem statement and every provided file list once. Do not start coding.
2. Copy `templates/REQUIREMENTS.md` (or create it) at the workspace root and fill it:
   - **Must (필수)**: each explicit requirement as one checkbox, quoted or paraphrased with its source location (file/section/line).
   - **Constraints (제약)**: time, tools, forbidden actions, formats, file names, language, data limits.
   - **Deliverables (제출물)**: exact paths/names/formats the grader expects.
   - **Evaluation criteria (평가 기준)**: what the grader rewards (판단·근거·검증·한계).
   - **Assumptions (가정)**: anything ambiguous, with the interpretation chosen and why. Log the choice in DECISIONS.md.
   - **Out of scope (범위 밖)**.
3. Number items R1, R2, ... so plans, tests, and the report can reference them.
4. Before submitting, re-open REQUIREMENTS.md and tick each item with evidence (file, command, test). Unticked items go to "남은 한계" in REPORT.md.

Keep it short: one line per item. No prose.
