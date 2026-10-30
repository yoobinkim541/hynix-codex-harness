# hynix-codex-harness

OpenAI Codex CLI용 3시간 실전 빌드 하네스: `AGENTS.md`(작업 규칙) + Codex Skills + 제출 문서 템플릿.
문제 정의 -> 설계 -> 구현 -> 검증 -> 문서화를 시간 안에 끝내고, **판단·근거·검증 결과·남은 한계**가 남도록 설계했다.

## 1분 사용법

```bash
git clone https://github.com/yoobinkim541/hynix-codex-harness && bash hynix-codex-harness/install.sh
```

- 스킬 -> `~/.agents/skills/` 복사, `${CODEX_HOME:-~/.codex}/skills/`에 링크 (신·구 Codex 모두 인식)
- `AGENTS.md`, `templates/` -> 현재 폴더 (다른 폴더면 `--workspace DIR`; 기존 AGENTS.md는 `.bak` 백업)
- 그 다음 Codex 새로 시작 -> `/skills`로 목록 확인
- 첫 프롬프트 예: `AGENTS.md 규칙대로 진행. $requirements-checklist 로 문제를 REQUIREMENTS.md에 고정하고 $timebox 로 PLAN.md 시간표부터 만들어줘.`

옵션: `--no-vendor`(커스텀 7개만), `--with-anthropic-docs`(docx/pdf/pptx/xlsx를 원본에서 받아 설치), `--with-openai-plugins`(openai/plugins 웹앱·데이터 분석 스킬).

## 구성

| 구분 | 스킬 |
|---|---|
| 커스텀 (7) | requirements-checklist, decision-log, verify-claims, timebox, written-answer-prep, korean-report-polish, scaffold |
| obra/superpowers 전체 (15) | brainstorming, writing-plans, executing-plans, verification-before-completion, systematic-debugging, test-driven-development, receiving/requesting-code-review, subagent-driven-development, dispatching-parallel-agents, using-git-worktrees, finishing-a-development-branch, using-superpowers, writing-skills, diagnosing-superpowers |
| openai/skills (5) | define-goal, pdf, jupyter-notebook, security-best-practices, security-threat-model |
| anthropics/skills (1) | frontend-design |

템플릿: `templates/REQUIREMENTS.md`, `DECISIONS.md`, `PLAN.md`, `REPORT.md`.
AGENTS.md가 스킬 우선순위와 토큰 절약 규칙을 정하므로, 스킬이 많아도 필요한 것만 읽는다.

검증: `bash scripts/validate.sh` (모든 SKILL.md의 frontmatter name/description 확인).

라이선스: 이 저장소의 자체 파일은 MIT (`LICENSE`). 외부 스킬은 각 폴더의 원본 라이선스를 따른다. 자세한 내용은 `THIRD_PARTY.md`.
