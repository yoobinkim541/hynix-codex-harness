# AGENTS.md — 180-min build harness (Codex)

You are pairing with a human on a timed task (180 min). The deliverable is judged on **판단(decisions), 근거(evidence), 검증 결과(verification), 남은 한계(limits)**. AI usage volume may also be evaluated: be precise and token-efficient.

## 0. Hard rules
- Use only tools available in this environment. No browser automation / computer use. Do not send data to external services. Do not `git push`.
- Never fabricate data, numbers, test results, or sources. Unknown -> say so and mark as 가정.
- Respond in Korean unless asked otherwise. Keep replies short.

## 1. Coding guidelines (Karpathy-style)
1. **Think before coding.** State assumptions; if the brief is ambiguous, list interpretations and ask or pick one and log it. Push back if a simpler approach exists.
2. **Simplicity first.** Minimum code that solves the stated problem. No speculative features, abstractions, config, or error handling for impossible cases. If 200 lines could be 50, rewrite.
3. **Surgical changes.** Touch only what the task needs. Match existing style. Remove only the dead code your change created. Every changed line traces to a requirement (R#).
4. **Goal-driven execution.** Turn each step into a verifiable check ("done when X command prints Y"). Loop until the check passes. Weak criteria ("make it work") are not allowed.

## 2. Workflow (files at workspace root; templates in `templates/`)
1. **Requirements lock** -> `REQUIREMENTS.md` (skill: `requirements-checklist`). No code before this.
2. **Plan** -> `PLAN.md`: MVP steps, each with a verify check; stretch items ranked (skill: `writing-plans` only if the plan is non-trivial).
3. **Implement** MVP end-to-end first, then stretch. Log choices in `DECISIONS.md` (skill: `decision-log`) as you go.
4. **Verify** -> run real commands/tests; recompute every number from source (skill: `verify-claims`, `verification-before-completion`).
5. **Document** -> `REPORT.md` (skill: `korean-report-polish`), then `WHY_SUMMARY.md` for the human (skill: `written-answer-prep`).

## 3. Timebox (skill: `timebox`)
이해 20 / 설계 20 / 구현 100 / 검증·문서 40 (minutes). Run `date` at each boundary.
- **Scope cut rule:** phase overrun >10 min or one bug >15 min -> drop the lowest-ranked stretch item, log it (D#), list it in 남은 한계. Always keep a runnable, submittable state; local `git commit` after each milestone.
- Minute 140: feature freeze. Minute 170: final check only.

## 4. Token economy
- Load **only** the skills needed for the current step. Do not read every SKILL.md up front.
- Read files with targeted ranges (`sed -n`, `head`, `rg`), not whole large files. Summarize big data with scripts (`verify-claims/scripts/recompute.py`) instead of pasting it.
- Do not repeat file contents back; reference `path:line`.
- Batch related edits into one change. No re-explaining unchanged code.
- Prefer one good question over several speculative attempts.
- Short answers: result + evidence + next step.

## 5. Skill priority (use in this order; others only when clearly needed)
1. `requirements-checklist` — start of task
2. `timebox` — start + phase boundaries
3. `decision-log` — every non-trivial choice
4. `verify-claims` / `verification-before-completion` — before any claim of done or any number
5. `systematic-debugging` — any bug or failing check
6. `scaffold` — if a runnable app is needed
7. `korean-report-polish` — REPORT.md
8. `written-answer-prep` — minute ~165
Situational: `writing-plans`, `executing-plans`, `brainstorming` (only for open-ended problem framing, keep it to 1-2 rounds), `test-driven-development` (core logic), `define-goal`, `pdf`, `jupyter-notebook`, `frontend-design`, `security-best-practices`.
Superpowers skills that assume subagents/worktrees/PR flow (`subagent-driven-development`, `dispatching-parallel-agents`, `using-git-worktrees`, `finishing-a-development-branch`, `requesting-code-review`) are optional; skip them under time pressure. Ignore `using-superpowers`' instruction to invoke a skill before every reply: this file's priority list wins.

## 6. Definition of done
Every R# ticked with evidence, app/script runs with the documented command, REPORT.md has 판단·근거·검증 결과·남은 한계, deliverables at the exact required paths.
