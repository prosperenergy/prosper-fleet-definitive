# Find a document after Desktop filing

Owner: Craig Stratton. Filing lane: Oma.
Authorized: 2026-09-03. Empty-Desktop contract: Craig 2026-09-11.
Scope: this Mac's Desktop only.
Schedule: `hourly-desktop-filing-to-t9`, ACTIVE, every hour.
Visible Desktop notes: `/Users/craigstratton/Desktop/FIND-MY-FILES.md` only
(hard-drive map). Codex reset map `/Volumes/T9/04_Fleet-Ops/codex-reset-pack-2026-09-17/memory-map/CODEX-RESET-MAP.md`
(pack `/Volumes/T9/04_Fleet-Ops/codex-reset-pack-2026-09-17/`).
Token-saver paste `/Volumes/T9/04_Fleet-Ops/TOKEN-SAVER-CODEX-PASTE.md`
(canonical `/Users/craigstratton/PROSPER-HANNA-SAM-SHARED/PROMPTS/TOKEN-EFFICIENT-FLEET-CODEX-PASTE.md`).
Leads `/Volumes/MACBOOK AI/LEADS-AND-INSTALLS`. Lending `/Volumes/MACBOOK AI/CRAIG-REVIEW-LENDING-AND-STATEMENTS`.
AI connector map: `/Volumes/T9/_MAP/AI-DESKTOP-CONNECTORS.json`
(local copy: `/Users/craigstratton/.local/share/prosper-desktop-filing/ai-desktop-connectors.json`).

Craig 2026-09-11: Desktop stays empty except that note. Canonical files live on T9.
Do not recreate Desktop shortcuts, aliases, or compatibility links. Look up old
Desktop names in the registry instead of assuming a missing Desktop path means
the document is gone.

## Live connectors AIs used from Desktop

If an old chat, skill, or launcher still points at `~/Desktop`, look up the name
with `prosper-find-document`. The live ones from 2026-09-13:

- Prosper Platform app: `/Volumes/T9/01_Active/Prosper-Desktop-Workspace/Prosper Platform`
- Launcher: `/Volumes/T9/01_Active/Prosper-Desktop-Workspace/Open Prosper Platform.command`
- Local URL: `http://127.0.0.1:8132/` (company login)
- Powur export the app reads: `/Volumes/T9/01_Active/Prosper-Desktop-Workspace/Powur-Full-Export-2026-09-11`
- Other 2026-09-13 Desktop drop: `/Volumes/T9/00_INBOX/Desktop-Filing/2026-09-13/`
- All leads and install lists (one place): `/Volumes/MACBOOK AI/LEADS-AND-INSTALLS`
  (no lending, loans, or Craig bank statements)
- Craig review pile for lending/loans/statements:
  `/Volumes/MACBOOK AI/CRAIG-REVIEW-LENDING-AND-STATEMENTS`
- Mac HD bulky offload 2026-09-20:
  `/Volumes/T9/07_Archives/MacHD-2026-09-20/`

## Find a file

Use either a full old path or part of a filename:

```sh
/Users/craigstratton/bin/prosper-find-document 'BATTERY-UPGRADE'
/Users/craigstratton/bin/prosper-find-document '/Users/craigstratton/Desktop/old-folder/document.pdf'
```

- Human-readable filing map: `/Volumes/T9/_MAP/DESKTOP-FILING.md`
- Canonical location registry: `/Volumes/T9/_MAP/desktop-file-locations.json`
- Local registry mirror, available while T9 is disconnected:
  `/Users/craigstratton/.local/share/prosper-desktop-filing/desktop-file-locations.json`
- Drive categories and older archives:
  `/Users/craigstratton/PROSPER-HANNA-SAM-SHARED/T9-FLEET-FINDER.md`
- General drive navigation: `/Volumes/T9/_MAP/NAVIGATION.md`
- Empty-Desktop run manifest:
  `/Users/craigstratton/.local/share/prosper-desktop-filing/runs/20260911-empty-desktop/`

The registry maps the old Desktop path to its T9 location and keeps the relative
path inside each folder. Files held by an app, recently changed files, hidden
runtime folders, and this note stay on Desktop until they are eligible; the
sweep report records why. Repositories and credential-named files from this
pass were moved onto T9 because Craig required an empty Desktop.

T9 must be mounted and reachable to open filed contents. A local index is a locator,
not a backup of document contents. If a cloud chat or virtual machine cannot access
the Mac or T9, it must use its authorized local-file retrieval connection or ask for
the particular document to be attached. Knowing a path does not prove access.

## Hourly filing contract

The hourly helper files quiet Desktop artifacts onto T9. Do not add another
scheduler or run an older cleaner alongside it.

```sh
/Users/craigstratton/bin/prosper-desktop-file sweep
/Users/craigstratton/bin/prosper-desktop-file sweep --apply
/Users/craigstratton/bin/prosper-desktop-file verify
```

The first command previews eligibility. The second performs the authorized moves.
The helper verifies the actual external volume identity, capacity, inactivity,
open handles, source stability, and destination hashes. It records the move
before cutover and preserves restore information. It never overwrites a
collision or treats a plain `/Volumes/T9` directory as a mounted drive.

Config `leave_compatibility_links` is false. After a verified move, the Desktop
source is removed. `FIND-MY-FILES.md` is protected. Do not put shortcuts back.

Preserve whole project/document trees. Route known material to the existing T9
categories; retain uncertain material together in dated `00_INBOX` intake.
Secret-like names go to `/Volumes/T9/PROTECT/secrets-hold/`. Do not move
Library, Messages, or live Mac system data. A candidate must be inactive for
at least 30 minutes. Never delete a sole copy. A verified redundant source may
be removed only after the T9 copy passes verification and the source is still
unchanged and closed.

Before restoring a move, inspect the helper's `rollback --help`, the exact
registry entry, and its journal. Restore only that entry; do not bulk-delete
T9 data. If the Desktop shortcut is already gone, copy the T9 destination back
to Desktop only for that one entry.

## Shared discovery

This page is linked from the shared desk and fleet startup instructions. Redis
stores pointer keys only: `prosper:policy:desktop-filing` and each seat's
`prosper:agent:<seat>:document-locator`. No document bodies, private chat text, or
credentials belong in those notices. Each chat should look up its own requested
document and verify access before claiming it has read it.

Scope does not include relocating chat history or app databases. Existing task
instructions, customer communication rules, and file access restrictions still apply.
