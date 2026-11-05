# Mattermost → AI Crew Bridge — Architecture Options

**Filed by:** Claude Opus 4.6 (research) + Claude Fable (filing)  
**Date:** 2026-11-05  
**Status:** RESEARCH — three options evaluated, Option 3 recommended  
**Goal:** AIs communicate with each other through Mattermost without David relaying

---

## The Problem

Right now David is the relay. He copies prompts between AI sessions, pastes results back, coordinates who does what. The crew dispatch prompt from today (five tasks, five AIs) had to be hand-delivered to each one. If the AIs could post and read in Mattermost directly, assignments go out once, results come back as posts, and the channel history IS the audit trail.

## Option 1: Mattermost Agents Plugin (official, zero code)

Mattermost's own plugin — formerly "AI Copilot," now called "Agents." Supports Anthropic, OpenAI, Azure, Ollama, vLLM, and any OpenAI-compatible API. Install from System Console → Plugin Marketplace.

- David's instance is v12.0.0 (exceeds v10.0+ requirement)
- Needs pgvector on PostgreSQL for semantic search
- Each AI gets its own agent identity in the sidebar
- Built-in thread summarization, meeting notes, semantic search

**Upside:** No code. Each AI gets its own agent identity.  
**Downside:** It's an interactive copilot, not a headless task dispatcher. Can't programmatically say "send this to Kimi, get the response, route to Codex." Human-facing, not crew API.

## Option 2: mattermost-mcp-host (open source, close to what we need)

Python bot by jagan-shanmugam on GitHub (34 stars, MIT). Connects to Mattermost via WebSocket, listens for messages prefixed with `#`, routes to a LangGraph agent that can call MCP tools, posts response back in same thread. Supports Azure OpenAI, OpenAI, Anthropic Claude, and Gemini.

- GitHub: https://github.com/jagan-shanmugam/mattermost-mcp-host
- Already does the listen→route→respond loop
- MCP tool support means each AI agent could have its own tools
- Thread context preserved

**Upside:** The plumbing exists.  
**Downside:** Single-agent design. Needs fork + multi-agent routing (registry mapping channel/@mention to provider + workspace + standing instructions).

## Option 3: Custom bridge using aiomatter + Forge (RECOMMENDED)

`aiomatter` is a Python async library (MIT, Python 3.11+) for Mattermost bots. Subclass a Plugin, decorate handlers with `@listen(EventType.POSTED)`, connects via WebSocket.

Architecture:

```
Mattermost WebSocket → aiomatter listener
    → parse: who is this addressed to? (@kimi, @codex, @opus, etc.)
    → look up agent registry (provider, API key, workspace, standing prompt)
    → call Forge (or direct API) with the assignment
    → post response back to the same Mattermost thread
    → save receipt as file attachment
```

- Plugs into Forge (Rust_AI_API), which David is already building
- Each existing bot account (codex-5-3, kimi-ai, opus-4-6, etc.) becomes a routable agent
- The Mattermost channel history IS the audit trail
- aiomatter handles Mattermost connection, Forge handles AI calls
- Glue in between is ~200 lines of routing logic

**Upside:** You own every line. Each bot account is a real crew member.  
**Downside:** You build it. But the pieces are small.

## Recommended Path

**Option 3, built on Option 2's scaffolding.** Fork mattermost-mcp-host for the WebSocket plumbing, rip out LangGraph, replace with Forge dispatcher. Each of the 8 existing bot accounts becomes routable. A message to `#AI · Kimi` or @mentioning `@kimi-ai` gets routed to Kimi's API with Kimi's standing instructions and workspace. Response comes back as that bot's post.

## What This Unlocks

- Post crew dispatch prompt ONCE to a channel → each AI picks up their task
- AIs can respond to each other's results in threads
- David reads the thread when he's ready, rules on disputes
- Channel history = complete audit trail with timestamps
- Receipts auto-filed as attachments

## Prerequisites

- David's Mattermost at 192.168.1.177 (v12.0.0) ✓
- Bot accounts already exist (codex-5-3, kimi-ai, opus-4-6, etc.) ✓
- Forge (Rust_AI_API) in progress
- Python 3.11+ on NAS or local machine
- API keys for each provider (Anthropic, OpenAI, Kimi, Gemini)

## Sources

- mattermost-mcp-host: https://github.com/jagan-shanmugam/mattermost-mcp-host
- Mattermost Agents Plugin: https://docs.mattermost.com/agents/README.html
- aiomatter: https://pypi.org/project/aiomatter/0.1.7/
