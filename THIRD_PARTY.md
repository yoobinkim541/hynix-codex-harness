# Third-party skills

Vendored skills are unmodified copies (only the folder `openai/pdf` was renamed to `openai-pdf`). Each keeps its upstream license file.

| Path | Upstream | Commit | License |
|---|---|---|---|
| `skills/vendor/superpowers/*` (all 15 skills) | https://github.com/obra/superpowers | 2ce8aa15d05bd57213e6f746f953aafb7ded7a8b | MIT, Copyright (c) 2025 Jesse Vincent (`skills/vendor/superpowers/LICENSE`) |
| `skills/vendor/openai/{define-goal,openai-pdf,jupyter-notebook,security-best-practices,security-threat-model}` | https://github.com/openai/skills (`skills/.curated`) | 49f948faa9258a0c61caceaf225e179651397431 | Apache-2.0 (`LICENSE.txt` in each folder) |
| `skills/vendor/anthropic/frontend-design` | https://github.com/anthropics/skills | ca45fc496a3436251f191354091d557da31c15b5 | Apache-2.0 (`LICENSE.txt`) |

## Not redistributed (fetched at install time by opt-in flags)
- `anthropics/skills` docx / pdf / pptx / xlsx: source-available, "All rights reserved" license that does not allow redistribution. `install.sh --with-anthropic-docs` clones them from upstream and installs as `anthropic-*`. Check that their license terms fit your use.
- `openai/plugins` (build-web-apps, data-analytics skills): no license file upstream. `install.sh --with-openai-plugins` clones them from upstream.

## Deliberately excluded
- Browser/screen automation (`playwright`, `playwright-interactive`, `screenshot`, `webapp-testing`): computer use and browser automation are not allowed in the target environment.
- Deploy / external-service skills (vercel, netlify, cloudflare, render, sentry, linear, notion, figma, gh-*): need network accounts or send data outside.
- API-key skills (imagegen, speech, transcribe), Claude-specific skills (claude-api, academy-guide), and skills already bundled with Codex (skill-creator, skill-installer, openai-docs, plugin-creator).
