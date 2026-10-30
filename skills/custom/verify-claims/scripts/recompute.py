#!/usr/bin/env python3
"""Minimal recompute helper. Usage:
  python3 recompute.py data.csv               # summary: rows, columns, nulls, numeric sum/mean/min/max
  python3 recompute.py data.csv col [groupby] # sum/mean/count of col (optionally grouped)
Standard library only."""
import csv, sys, statistics as st
from collections import defaultdict

def num(v):
    try: return float(str(v).replace(',', ''))
    except ValueError: return None

def main():
    if len(sys.argv) < 2: print(__doc__); return
    with open(sys.argv[1], newline='', encoding='utf-8-sig') as f:
        rows = list(csv.DictReader(f))
    print(f"rows={len(rows)}")
    if not rows: return
    cols = list(rows[0].keys())
    if len(sys.argv) == 2:
        for c in cols:
            vals = [r[c] for r in rows]
            nulls = sum(1 for v in vals if v in ('', None))
            nums = [x for x in map(num, vals) if x is not None]
            line = f"{c}: nulls={nulls}"
            if nums and len(nums) >= 0.8 * (len(vals) - nulls):
                line += f" sum={sum(nums):g} mean={st.mean(nums):g} min={min(nums):g} max={max(nums):g}"
            print(line)
        return
    col = sys.argv[2]; grp = sys.argv[3] if len(sys.argv) > 3 else None
    g = defaultdict(list)
    for r in rows:
        x = num(r[col])
        if x is not None: g[r[grp] if grp else 'ALL'].append(x)
    for k, v in sorted(g.items()):
        print(f"{k}: count={len(v)} sum={sum(v):g} mean={st.mean(v):g}")

if __name__ == '__main__': main()
