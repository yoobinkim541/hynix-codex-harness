---
name: verify-claims
description: "Use before stating any number, fact, or conclusion in code comments, outputs, or the report, and whenever AI-generated values could be hallucinated. Requires citing the source location and recomputing numbers with a script instead of mental math. Use also to cross-check results against requirements."
---

# Verify Claims

Assume every AI-produced number or fact is wrong until checked.

1. **Cite**: every factual claim gets a source: `file:line`, table/column, or command output. If no source exists, mark it `가정` and log it.
2. **Recompute**: never trust in-head arithmetic. Put calculations in `scripts/check_*.py` (or `.js`) that read the original data and print the result. Use `scripts/recompute.py` in this skill as a starting point.
3. **Compare**: diff the recomputed value with the claimed value. Mismatch -> fix the claim, note it in DECISIONS.md.
4. **Spot-check**: for transformed data, sample 3-5 rows manually against the raw input; check counts, sums, nulls, units, date ranges.
5. **Run it**: for code, run the actual command/test and paste the real output (trimmed) into REPORT.md 검증 결과. "Should work" is not verification.
6. **Record**: add a line to REPORT.md 검증 결과 table: claim | method | result | evidence.

Red flags: round numbers with no source, totals that do not match parts, units mixed, numbers that changed between turns.
