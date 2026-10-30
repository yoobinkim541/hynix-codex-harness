---
name: korean-report-polish
description: "Use when writing or polishing Korean documents (REPORT.md, 보고서, 기획서, 제출 문서) to apply Korean report style and remove AI-sounding tone and 번역투, without changing content, numbers, or claims."
---

# Korean Report Polish (보고서체 + AI 티 제거)

Change style only. Never add, remove, or alter facts, numbers, or D#/R# references.

## 보고서 규약
- 제목은 명사형으로 짧게: "검증 결과", "남은 한계".
- 본문은 개조식(~함, ~임, ~했음) 또는 평서문(~했다) 중 하나로 문서 전체 통일.
- 한 문장 한 정보. 50자 넘으면 나눔. 대신 문장 사이 연결(따라서, 이에, 다만)을 살려 뚝뚝 끊기지 않게 함.
- 숫자는 단위와 함께, 근거 위치 병기: "정확도 92.4% (scripts/check_acc.py)".
- 용어는 처음 나올 때 한 번 정의하고 이후 같은 말로 통일.

## AI 티 제거
- 빼기: "~하는 것이 중요합니다", "다양한", "효과적으로", "혁신적인", "종합적으로", "~를 통해", "결론적으로", 과한 강조·이모지·느낌표.
- 번역투 고치기: "~에 있어서" -> "~에서", "~를 가지다" -> "~가 있다", "~되어지다" -> "~되다", "~하는 것은 ~이다" 구조 줄이기, 불필요한 피동 줄이기.
- 3개씩 나열하는 습관, 매 문단 요약문, 빈 수식어 제거.
- 주어를 분명히: "본 팀은", "이 시스템은".

## 절차
1. 원문의 사실 목록(숫자, 고유명사, 참조)을 먼저 뽑음.
2. 문체 수정.
3. 수정본에서 사실 목록이 그대로인지 대조. 다르면 되돌림.
