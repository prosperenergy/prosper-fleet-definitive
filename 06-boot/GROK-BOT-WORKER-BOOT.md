# Prosper Grok Bot worker boot

status: CURRENT
updated: 2026-09-22 America/New_York
owner: Craig Stratton
applies_to: Grok Bot named seats Hanna, Sam, Burtha, Oma, Kayla, and Maddi

This is a short starting point, not a second rulebook.

Token policy: `/Users/craigstratton/.grok/skills/prosper-token-saver/SKILL.md`.
Compact in-chat standard: `/Users/craigstratton/.grok/skills/caveman/SKILL.md` (full by default).
Default Grok 4.6 / medium. Bounded inspection uses `fleet_quick` (Grok 4.5 / low, read-only).
Define the smallest deliverable before reading. Do not dump whole repos, transcripts, or logs.

Exact files. Read them. Never `find /Users/craigstratton` or walk `$HOME`.

- Job law: `/Users/craigstratton/PROSPER-HANNA-SAM-SHARED/PERSONAS/FLEET-LANES.md`
- Hanna: `/Users/craigstratton/PROSPER-HANNA-SAM-SHARED/PERSONAS/HANNA.md` and `AGENT-MEMORY/HANNA.md`
- Sam: `/Users/craigstratton/PROSPER-HANNA-SAM-SHARED/PERSONAS/SAM.md` and `AGENT-MEMORY/SAM.md`
- Burtha: `/Users/craigstratton/PROSPER-HANNA-SAM-SHARED/PERSONAS/BURTHA.md` and `AGENT-MEMORY/BURTHA.md`
- Oma: `/Users/craigstratton/PROSPER-HANNA-SAM-SHARED/PERSONAS/OMA.md` and `AGENT-MEMORY/OMA.md`
- Kayla: `/Users/craigstratton/PROSPER-HANNA-SAM-SHARED/PERSONAS/KAYLA.md` and `AGENT-MEMORY/KAYLA.md`
- Maddi: `/Users/craigstratton/PROSPER-HANNA-SAM-SHARED/PERSONAS/MADDI.md` and `AGENT-MEMORY/MADDI.md`
- Now: `/Users/craigstratton/PROSPER-HANNA-SAM-SHARED/NOW.md`
- Current memory: `/Users/craigstratton/PROSPER-HANNA-SAM-SHARED/CURRENT-MEMORY.md`

Desktop document lookup:
`/Users/craigstratton/PROSPER-HANNA-SAM-SHARED/FILE-LOCATIONS.md`.
Hourly filing preserves old Desktop paths and records T9 destinations. Look up a
document there before recreating it or declaring an old chat link broken.

## Start every task

1. Read `/Users/craigstratton/PROSPER-HANNA-SAM-SHARED/PERSONAS/FLEET-LANES.md`.
   It is the current job law.
2. Identify the actual seat. Read exactly one matching `PERSONAS/<SEAT>.md` and one matching
   `AGENT-MEMORY/<SEAT>.md`. If either file is missing, warn once and continue (do not hard-fail).
   Job lanes in FLEET-LANES.md are unchanged.
3. Read `CURRENT-MEMORY.md`, `NOW.md`, and Craig's newest instruction.
4. Read connector files only when the task needs a connector:
   `CONNECTIONS.md`, `CONNECTOR-PLAYBOOK.md`, and `CONNECTOR-STATUS.md`.
5. Do the task in that seat's lane. Verify the real result before reporting completion.

Apply caveman to in-chat output. Use normal clear prose for security warnings, irreversible actions,
ambiguity-sensitive sequences, persisted documents, and third-party messages. Apply Humanizer only
to prose outside compact in-chat output: `/Users/craigstratton/.agents/skills/humanizer/SKILL.md`.

Do not boot legacy Codex instructions, archived packets, old role maps, or stale bootpacks.

For the shared desk entrypoint, read
`/Users/craigstratton/PROSPER-HANNA-SAM-SHARED/OPEN-ME-FIRST.md`.
