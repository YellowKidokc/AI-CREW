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
| D:\GitHub\David-OS | This repo — living folder protocol |
| O:\_Theophysics_v4 | Obsidian vault (ReFS, 120GB drive) |
| D:\PUB_AXIOM_FOUNDATIONS\ | 22 public axioms (v2.1) |
| D:\01_Axioms\_001-188\ | 188 technical axioms |

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
