# 2026-07-24 - Codex HTML/API Orientation

tags: #signoff #codex #site #html #api #orientation

## Session Focus
David pointed Codex at `\\192.168.2.50\h_hp\Desktop\ai-crew` and asked to look at structure, API calls, and how to do this for HTML.

## Verified
- Read `_READ_ME_FIRST.md`, `00-CODEX-START-HERE.md`, core charter files, `INFRASTRUCTURE.md`, `GLOBAL-RULINGS/RULINGS.md`, `CODERS/README.md`, `CODERS/codex-local.md`, and the 2026-07-24 canonical handoff.
- Verified these paths exist locally: `D:\GitHub\faiththruphysics-site`, `D:\GitHub\faiththruphysics-site-live`, `D:\GitHub\faiththruphysics-site-v2`, `D:\GitHub\faiththruphysics-site-data`, `D:\GitHub\genesis-to-quantum`, `D:\GitHub\David-OS`.
- Inspected `D:\GitHub\faiththruphysics-site-live` as the richest HTML/Cloudflare Pages candidate.
- Confirmed root `wrangler.toml` uses Cloudflare Pages with `pages_build_output_dir = "."`.
- Confirmed nested OpenIntel app at `D:\GitHub\faiththruphysics-site-live\subdomains\rigor\openintel-platform\source-app` is Vite/React + tRPC/Hono + Drizzle/D1.
- Confirmed OpenIntel Worker mounts tRPC at `/api/trpc/*` and returns 404 for other `/api/*` paths.
- Confirmed MTL Worker offers plain JSON endpoints: `GET /health`, `GET /api/translate?latex=...&mode=...`, `POST /api/batch`.

## Did Not Change
- No source code, HTML, API route, DB schema, or deployment config changed.
- Did not choose a canonical site repo; source-of-truth ambiguity remains recorded in project registry.

## Important Findings
- `D:\GitHub\faiththruphysics-site-live` is a git repo on branch `HTML` with many untracked `.fisnote` files.
- `D:\GitHub\faiththruphysics-site` is not a git repo from this session's shell.
- `D:\GitHub\faiththruphysics-site-v2` produced `fatal: unable to read tree`, suggesting repo corruption or missing object state.
- `D:\GitHub\genesis-to-quantum` is a git repo on `main` but has many deleted tracked files and many untracked files.

## Next Agent Should
- Treat `faiththruphysics-site-live` as the best inspected candidate for HTML/API work, but do not declare it canonical without David's ruling.
- For simple static HTML API calls, prefer the MTL Worker shape first because it is plain REST/JSON with CORS.
- For OpenIntel data calls, either use the existing React/tRPC client or add explicit REST endpoints in `api/boot.ts` if plain HTML pages need direct fetch calls.
- Before edits, inspect current dirty files and avoid overwriting unrelated work.
