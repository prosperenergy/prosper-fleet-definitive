# NAVIGATION — Rules for Any Agent Working This Drive

This is the operating contract. If you are an AI touching `/Volumes/T9/`, follow it exactly.

## 1. Boot sequence (do this on every session)
1. Read `/Volumes/T9/START_HERE.md`.
2. Load `/Volumes/T9/_MAP/t9_map.json` to know every zone, its category, and its allowed action.
3. Respect the locked zones list before any move/rename/delete.

## 2. Where new files go (decision tree)
- Brand / logo / design / video / image / audio → `02_Design-System/`
- Sales script / training / pitch → `03_Sales-Process/`
- Person / rep / team record → `05_People/`
- Fleet / agent ops doc → `04_Fleet-Ops/`
- Portable AI/fleet onboarding → `04_Fleet-Ops/Portable-Agent-Bootstrap/README.md`
- Current Prosper operations index → `01_Active/Prosper-Operations/README.md`
- Active project work → `01_Active/<project>/`
- Dev repo → `Developer/<repo>/`
- QA / test artifact → `06_QA-Tests/`
- Backup snapshot → `00_BACKUPS/`
- Old/finished, keep for record → `07_Archives/<topic>/`
- **Not sure?** → `00_INBOX/` and log it. **Never** the drive root. **Never** the Desktop.

## 3. Naming convention
- Use lowercase-kebab or Title_Snake; date-stamp snapshots as `NAME_YYYY-MM-DD`.
- One canonical copy. If you must keep a variant, suffix `-v2`, never ` (1)`.
- Don't create a new top-level zone — extend an existing one (YOLO rule #4: build into existing).

## 4. Locked zones — never move, rename, or delete
`.ai/` · `ClaudeCodexBridge/` · `HANNASMSOUL/` · `Hannas BRAIN/` · `AGENT_LIBRARY_LOCKED_*` · `PROSPER_CLI_AGENTS/` · `oma/` · `Prosper-Vault/` · `.obsidian/` · `PROTECT/` · `Macintosh-HD-Offload/`
Plus root boot files: `BOOT_CLAUDE.md`, `AGENTS.md`, `GEMINI.md`, `INDEX.md`, `PINNED.md`, `PLAN.md`, `START_HERE.md`, `PROTECT.CRAIGS`.

## 5. Dedupe policy (reversible-first)
- Detect by content hash, not name.
- Keep the copy in the most-canonical zone; move the others to `_MAP/_QUARANTINE_<date>/` preserving relative paths.
- Write a `manifest.json` (original path → quarantine path) so any move can be undone with `restore.sh`.
- **Hard-delete only after explicit Craig GO.** Build caches (`prosper-build/`, `.venv/`, `.pnpm-store/`) are the exception class: regenerable, may be purged, but still log what you purged.

## 6. The hard stops (from craigmode + Craig's standing rules)
- Desktop must stay empty.
- Never restore `~/Library`/runtime from T9 to the Mac.
- No local daemons/cron/launchd for fleet work — transport is cloud-only (Redis + GCP Pub/Sub).
- No SMS infra actions without explicit Craig GO (standing freeze).
- No credential rotation, no spending, no deleting data/repos/numbers without GO.

## 7. Keeping the map fresh
Run `_MAP/refresh_map.sh` after any structural change. It re-scans the drive and rewrites `t9_map.json` + the dedupe report. The map is only useful if it stays true — regenerate, don't hand-edit the JSON.
