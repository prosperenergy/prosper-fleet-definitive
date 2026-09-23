# START HERE - Craig Stratton / Prosper System Map

You are reading Craig's T9 drive. This file is the root front door.
Read it first, then load `_MAP/t9_map.json` before touching T9, Desktop,
Documents, Downloads, or any file routing surface.

Drive root: `/Volumes/T9/`
Use `/Volumes/T9/` as the canonical live drive path on PROSPERMINI.

Live directive source (refresh before acting): `https://inject.prospershield.io/prompt.txt`
or Redis `prosper:fleet:current_directive`. Pasted copies are bootstrap only.
Vault is the private KB via Fable 5 — enter at `Prosper-Vault/00-Index/MEMORY.md`.

Core map files:
- Machine-readable map: `_MAP/t9_map.json`
- Human map: `_MAP/MAP.md`
- Navigation rules: `_MAP/NAVIGATION.md`
- Restore guardrails: `_MAP/RESTORE_RULES.md`
- Cleanup plan: `_MAP/CLEANUP_PLAN.md`
- Portable AI/fleet bootstrap: `04_Fleet-Ops/Portable-Agent-Bootstrap/README.md`
- Current Prosper operations index: `01_Active/Prosper-Operations/README.md`
- Generated live fleet control plane: `04_Fleet-Ops/Control-Plane/README.md`

Hard rules:
1. Live read-back wins over memory or old folder assumptions.
2. Desktop stays empty; Desktop and Downloads items get a 30-minute hold before routing.
3. Never restore `~/Library` or app runtime state from T9 back to the Mac.
4. Fleet transport is cloud-only through Redis/GCP Pub/Sub; do not create local fleet daemons.
5. Never move, rename, or delete locked zones or root boot files.
6. Dedupe is reversible-first; quarantine with a manifest, never hard-delete without Craig's GO.
7. New files go to the numbered zone scheme, or `00_INBOX/` if unsure.
8. Gemini is disabled — never use Gemini (injector directive 2026-07-11).
9. Refresh the live directive (above) before acting; ack means received, not done.
10. For current fleet files and Desktop routing, use `prosper fleet boot`, `prosper fleet filesystem status`, and `prosper desktop route` rather than broad drive searches.

Closeout format (injector 2026-07-11): Goal / Done / Proof / Blocked / Autonomous next action / Memory improvement recorded: yes/no.

Canonical zones:
- `00_INBOX/` - unsorted intake
- `00_BACKUPS/` - backup snapshots
- `01_Active/` - active work and current projects
- `02_Design-System/` - brand, design, logos, video, audio, images
- `03_Sales-Process/` - sales process, scripts, training, pitches
- `04_Fleet-Ops/` - AI fleet operations docs
- `05_People/` - team, reps, people records
- `06_QA-Tests/` - QA and test artifacts
- `07_Archives/` - dated handoffs and finished records
- `08_Media/` - raw audio/video/zoom exports and recordings (distinct from 02_Design-System's brand/design assets)
- `09_Business/` - legal, leadership, and business-record documents
- `Developer/` - active development repos
- `_MAP/` - drive map system

Locked zones include `.ai/`, `ClaudeCodexBridge/`, `HANNASMSOUL/`,
`Hannas BRAIN/`, `AGENT_LIBRARY_LOCKED_*`, `PROSPER_CLI_AGENTS/`, `oma/`,
`Prosper-Vault/`, `.obsidian/`, `PROTECT/`, and `Macintosh-HD-Offload/`.

Automatic organizer: `.ai/skills/organize/`
Routing helper: `/Users/craigstratton/bin/t9-route`
