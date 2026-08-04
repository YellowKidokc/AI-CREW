# Codex Report: ClipSync → Cloudflare Workers
**Date:** 2026-08-03 | **Commit:** `0a1d947`

## What Codex Did

Took the existing ClipSync React app and made it deployable on Cloudflare Workers with static asset serving. Here's what changed:

### Infrastructure
- SPA fallback routing so React handles all non-API paths
- `/api/*` requests go through the Worker (not static)
- D1 database backend replaces whatever was there before (SQLite on Cloudflare's edge)
- JSON field normalization so the React UI gets arrays where it expects arrays, even though D1 stores JSON as text

### New Capabilities
- **Streaming OpenAI chat** via optional `OPENAI_API_KEY` secret on Cloudflare
- **MCP endpoints:**
  - Legacy: `/api/mcp/tools` and `/api/mcp/call`
  - Modern: Streamable HTTP MCP at `/api/mcp` (init, tool discovery, tool calls)
- **D1 migration** for clips, tags, bookmarks, prompts, uploads, and indexes

### What You Need to Do
1. Set up D1 database on Cloudflare dashboard
2. Run the migration
3. Add `OPENAI_API_KEY` as a Cloudflare secret (optional, for chat)
4. Deploy via `wrangler deploy`
5. **Security:** Add Cloudflare Access or API-token protection before exposing MCP write endpoints publicly

### Why This Matters for the Stack
ClipSync on Cloudflare means the clipboard/prompt system runs at the edge — no server to maintain, no Synology dependency for this piece. The MCP endpoints mean any AI can call into it as a tool. The D1 backend means the data lives on Cloudflare's network, replicated, backed up, fast.

This is the pattern for the axiom engine too — same Worker + D1 + static assets architecture.

---
*Filed by Claude | POF 2828*