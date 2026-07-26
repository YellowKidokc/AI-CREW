# Node-Graph System · Worldview Engine · Evidence Pills

tags: #node-graph #worldviews #pills #knockout #atoms

Built 2026-07-25. The interactive layer that makes the framework **inspectable** — every claim a node,
wired by dependency, testable by knockout, colored by role, weighted by evidence. This is the mature
realization of the "axiom node" idea David long reached for (prior art: Lean Blueprint, OMDoc/MMT
theory graphs — for pure math; the novel part is the **cross-domain bridge node** + interpretation guard).

---

## The pieces (all in `\\192.168.2.50\h_hp\Desktop\AXIOM_CLASSIFICATION_CANON_2026-07-25\`, mirror `C:\theophysics\`)

- **`full_axiom_graph.html`** — 188 canon nodes, real dependency web (`depends_on` ∪ note `Assumes`
  links). Views: **Role** (color by claimClass), **Defense** (green = has defeat-conditions +
  objections; red = undefended — 31 undefended flagged), **Generativity** (downstream reach; gold =
  source, red ⊥ = terminus sink). **Knockout:** ✕ any node → cascade collapse. Click → drawer with
  statement, deps/feeds-into chips, defeat conditions, objections, interpretation guard.
- **`comparative_worldviews.html`** — comparative stress-test engine v0. 4 worldviews on ONE shared
  12-node **evidence layer** (`EV-*`), neutral roles, kill conditions, per-worldview scoreboard,
  symmetrical knockout. Theophysics is one candidate, not the only one under the microscope.
- **`worldview_naturalism.html`** — Metaphysical Naturalism spine (51 nodes) with collapse-type
  classifier: pull A1/A4 → worldview collapse; pull a bridge → science stands, metaphysics fails; pull
  a model → local collapse. Demonstrates the fairness — naturalism's vulnerability is its *bridges*,
  not its science.
- **`pills_anchors_POC.html` + `PILL_ANCHOR_SPEC.md`** — evidence pill → **exact sentence** in the
  source. Click a pill, the paper opens and highlights the passage; grade + citation status ride on
  the pill (supporting-not-discriminating hits labeled honestly).

## Node schema (the data contract — framework-agnostic)
`id, role, title, claim, deps, kill/defeat, status, [threatens]`. Roles (drive color + layer):
primitive · presupposition · definition · method · metaphysical · boundary · empirical · model ·
bridge · open · response · conclusion · kill. Reach (generativity) computed from reverse-deps.

## The gate (already designed as the evidence contract + broadcast beacon)
Not a new thing to build — it's the `evidenceContract` (`required` / `discriminatingEvidence` /
`failureConditions`, written BEFORE scanning, version-locked) + the broadcast ("I NEED / I HAVE / I
DIE IF") + the **scan/adjudicate split** (scanner only makes evidence nodes; a separate pass counts
fulfillment). "Leniency" = the fulfillment threshold + grade + independence group. Bridges: grade IS
the dial — default *analogy* (non-propagating); earn *isomorphism* (propagates). See
`C:\theophysics\CANONICAL\_scripts\EVIDENCE_CONTRACT_SPEC.md` + `CODEX_ATOM_BROADCAST_BUILD_ORDER.md`.

## Atoms repo (canonical home)
`D:\GitHub\Faith-through-physics-atoms` (branch OBS-Plugin-Final-Claude). 14-stage pipeline; the CLAIM
(01) is the sun, everything orbits. Each atom carries `statementTechnical` + `statementPlain` (the
everyday-person layer, built in). Node `09_everyday` = the plain-language translation. **State:
scaffolded across ~30 domains, only ~2 real atoms built** — the session's node data is the migration
source. Schema: `_docs/CLAIM_ATOM_NODE_TYPES.md`.

## Multi-AI queue
`_WORLDVIEW_QUEUE/` — `WORLDVIEW_SPINE_SPEC.md` (schema + shared `EV-` registry + fairness rules),
`CLAIMS.md` (claim-a-worldview board so no duplication), `AI_PROMPT.md` (the one reusable prompt),
`KIMI_DESIGN_BRIEF.md` (design owns one template; data separate). Done: TP, NAT, PP (panpsychism).
EN claimed by GPT. ~13 worldviews open. Religious ones later (David's call).

## Design decision
React/JSX for the real site (data + logic are portable from the vanilla HTML; the HTML files are the
component spec). Build inside the existing Axiom-Compressor/Tracker (Vite+React) apps. Vanilla HTML
stays for quick proofs. Kimi owns the visual template. See [[axiom-system]], [[lean4-verification]].
