---
name: scaffold
description: "Use when the deliverable needs a quick runnable web app, API, or CLI and no starter exists. Gives minimal Vite (vanilla/React) and Node (zero-dependency http server) setups, run scripts, and a fallback when npm install is unavailable."
---

# Scaffold (minimal, fast)

Pick the smallest thing that satisfies REQUIREMENTS.md. Log the choice in DECISIONS.md.

## Option A: zero-dependency (works offline)
Copy `assets/node-server/` -> project root. `node server.js` serves `public/` and a JSON API at `/api/*` on port 3000 (`PORT` env to change). No npm install needed.

## Option B: Vite
```
npm create vite@latest app -- --template vanilla   # or react / react-ts
cd app && npm install && npm run dev -- --host 0.0.0.0
npm run build    # verify it builds before submitting
```
If npm registry is blocked, fall back to Option A.

## Option C: Python
`python3 -m http.server 8000` for static; standard library `http.server`/`sqlite3`/`csv` for small backends.

## Must-haves for any scaffold
- `README.md` with exact run command and expected output.
- One smoke check script (`scripts/smoke.sh`) using `curl` against the running server, its output pasted into REPORT.md.
- Keep data files in `data/`, outputs in `out/`.
- Do not use browser automation to drive the exam UI. Preview with the platform's built-in preview only.
