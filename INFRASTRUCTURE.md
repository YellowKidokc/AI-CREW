# INFRASTRUCTURE

tags: #infrastructure #reference #ports #servers

---

## Global Conventions

- **Never delete. Archive.** Move dead files to `999_archive/` (or `ZZZ_archive/`) at the end of whatever project folder you're in. Nothing is lost. Nothing is destroyed.
- **Tag at write time.** Every file gets its tags when it's written. Tag forward, search backward.
- **Date format:** YYYY-MM-DD everywhere. No exceptions.
- **File naming:** lowercase, hyphens, no spaces. `master-equation.md` not `Master Equation.md`.

## Servers

| System | Address | Purpose |
|--------|---------|---------|
| NAS | 192.168.1.177 | Primary storage, n8n, Odoo, PostgreSQL |
| PostgreSQL | 192.168.1.177:2665 | 188 technical axioms, canonical nodes, falsification ledger |
| Postgres Tunnel | [PORT TBD] | Remote access tunnel — update when established |

## Mattermost

| Item | Value |
|------|-------|
| Local URL | http://192.168.1.93:8065 |
| Tunnel | https://comms.dlowehomelab.com (CF Access required) |
| Teams | AI Crew, FaiththruPhysics |
| Bridge daemon | D:\GitHub\David-OS\bridges\mattermost\bridge.py |
| Control panel | http://127.0.0.1:10777 (when bridge is running) |
| Config | D:\GitHub\David-OS\bridges\mattermost\targets.yaml |

**Channels (AI Crew team):** claude, codex, gemini, fabel, kimi, bridge-alerts, codex-lab, session-logs, gather-pipeline

**Bot accounts:** fabel, codex, gemini, kimi, system-bot (listener), plus opus-47, opus-48, gpt-54, gpt-55, hakui-45, sonnet-5, anti-gravity, ai-kimi, codex-cli, fabel-cli, kimi-cli

**To start the bridge:** `cd D:\GitHub\David-OS\bridges\mattermost && python bridge.py`
**Autostart:** `schtasks /Create /TN "mm-ai-bridge" /TR "pythonw D:\GitHub\David-OS\bridges\mattermost\bridge.py" /SC ONLOGON /RL LIMITED /F`

## Domains

| Domain | Platform | Purpose |
|--------|----------|---------|
| faiththruphysics.com | Cloudflare Workers + R2 | Main public site |
| theophysics.pro | Cloudflare | Framework portal |
| theophysics-dashboard.pages.dev | Cloudflare Pages | Dashboard |
| comms.faiththruphysics.com | [rebuild pending] | AI communications hub |

## Local Paths

| Path | Contents |
|------|----------|
| D:\GitHub\ai-crew | AI-CREW repo (this folder) |
| D:\GitHub\David-OS | David-OS monorepo (FIS, bridge, agents) |
| O:\_Theophysics_v4 | Obsidian vault (ReFS, 120GB drive) |
| D:\PUB_AXIOM_FOUNDATIONS\ | 22 public axioms (v2.1) |
| D:\01_Axioms\_001-188\ | 188 technical axioms |

## Known Copies & Duplicates

**RULE: When you make a copy of a repo or folder, log it here immediately. Do not create silent copies.**

| Project | Copies | Notes |
|---------|--------|-------|
| ai-crew | D:\GitHub\ai-crew, github.com/YellowKidokc/AI-CREW, \\192.168.2.50\h_hp\Desktop\ai-crew | 3 copies, all canonical |
| faiththruphysics-site | D:\GitHub\faiththruphysics-site, D:\GitHub\faiththruphysics-site-v2, D:\GitHub\faiththruphysics-site-live, D:\GitHub\faiththruphysics-site-data, D:\GitHub\genesis-to-quantum | NEEDS CLEANUP — which is canonical? faiththruphysics-site-live is production branch HTML |
| David-OS | D:\GitHub\David-OS, D:\GitHub\theophysics-os, D:\GitHub\Theophysics-OS- | NEEDS CLEANUP — David-OS is canonical |

*If you copy a folder, add a row. If you're not sure which copy is canonical, mark it NEEDS CLEANUP and ask David.*

## Vault Structure (O:\_Theophysics_v4)

- `00_SYSTEM/` — Orientation, engine, templates, dashboards
- `00_AXIOMS/` — Framework axioms
- `00_Canonical/` — Canonical documents
- `David/` — Personal workspace, session logs, prompts, history
- `Templates/` — All templates (7Q, axiom, paper, evaluation)
- `__DATA/` — JSON, CSV, Excel exports (mirrors Postgres)
- `_INFRASTRUCTURE/` — Architecture docs, build logs

## Backend / Automation

- **999.ignore programs** — Obsidian-side backend (definitions, link management, Ollama, scripts)
- **RECON** — Browser automation (Playwright/BrowserOS) + enrichment (SBERT + DeBERTa NLI + Neo4j)
- **BrowserOS** — Agentic browser for acquisition, form filling, scheduled workflows
- **Ollama** — Local reasoning model for pre-flight checks
- **Exa.ai** — Neural search API (semantic queries)

## Axiom Systems

- 22 public axioms (v2.1) → D:\PUB_AXIOM_FOUNDATIONS\
- 188 technical axioms → D:\01_Axioms\_001-188\ and PostgreSQL
- Map: PUBLIC_TO_TECHNICAL_MAP.md

---

*Update this file when infrastructure changes. This is the single source of truth for "where is it and how do I reach it."*
