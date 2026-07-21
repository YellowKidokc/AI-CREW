# Project Registry

tags: #registry #repos #coordination #status

This registry tells agents what projects exist, where the source of truth lives, and how fresh the known status is.

`Last Verified` means the date an agent or David actually inspected the path or status. Do not mark anything current unless it was actually checked.

| Project | Repo Path / URL | Purpose | Source Of Truth | Current State | Last Verified | Verification Level | Notes |
|---|---|---|---|---|---|---|---|
| AI-CREW | `D:\GitHub\ai-crew` | Coordination memory for agents, sessions, rulings, and handoffs | `99-README.md`, `00-CODEX-START-HERE.md`, `PROJECTS/_registry.md` | active | 2026-07-21 | repo inspected | Shortcut on `\\192.168.2.50\h_hp\Desktop` targets this path |
| David-OS | `D:\GitHub\David-OS` | Monorepo for FIS, bridge, agents, and supporting systems | `INFRASTRUCTURE.md` says this path is canonical | path exists, contents unverified | 2026-07-21 | path verified only | Inspect before making claims about current state |
| File Intelligence System | `D:\GitHub\David-OS` | File analysis, truth detector, reading-level router, media linker, Paper Intelligence pipeline | `PROJECTS/file-intelligence/STATUS.md` | status recorded, code unverified | 2026-07-21 | status file inspected | Code lives inside David-OS according to status |
| Faith Through Physics Site | `D:\GitHub\faiththruphysics-site`, `D:\GitHub\faiththruphysics-site-live`, `D:\GitHub\faiththruphysics-site-v2`, `D:\GitHub\faiththruphysics-site-data`, `D:\GitHub\genesis-to-quantum` | Public site and related content/data repos | needs cleanup | source-of-truth ambiguity | 2026-07-21 | paths verified only | `INFRASTRUCTURE.md` says canonical choice needs cleanup; inspect before changing |
| Mattermost AI Bridge | `D:\GitHub\David-OS\bridges\mattermost` | Direct AI-to-Mattermost bridge via listener and adapters | `PROJECTS/mattermost-bridge/STATUS.md`, `INFRASTRUCTURE.md` | status recorded, code unverified | 2026-07-21 | status file inspected | Bridge path comes from infrastructure file |
| Theophysics | `THEOPHYSICS/`, `O:\_Theophysics_v4` | Spine of the research framework, standing problems, breakthroughs, topics | `THEOPHYSICS/` in this repo; vault path when mounted | repo folder present, vault not mounted | 2026-07-21 | local folder visible, vault path unavailable | Treat as spine, not just another project |
| Saved Notes | `\\192.168.2.50\h_hp\Desktop\Saved Notes` | Desktop/NAS-accessible note stash containing Theophysics briefs, derivations, reports, HTML source artifacts, and saved chats | filename inventory only | visible, contents unverified | 2026-07-21 | path and filenames listed only | Do not treat as canonical until files are triaged into project/source-of-truth locations |
| Public Axiom Foundations | `D:\PUB_AXIOM_FOUNDATIONS` | 22 public axioms v2.1 | `INFRASTRUCTURE.md` | not visible in this session | 2026-07-21 | path unavailable | Do not claim contents until mounted |
| Technical Axiom Set | `D:\01_Axioms\_001-188` | 188 technical axioms | `INFRASTRUCTURE.md`, PostgreSQL when available | not visible in this session | 2026-07-21 | path unavailable | Do not claim contents until mounted |

## Registry Rules

- Keep code in source repos; keep coordination here.
- Add new repos here before relying on them.
- Use `path verified only` when the path exists but contents were not inspected.
- Use `unverified` when the path, branch, or status was not checked.
- Update `Last Verified` whenever a project is actually inspected.
