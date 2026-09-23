# /fleet - Prosper Grok Bot quick start

Use one seat and one task at a time.

Token policy: `/Users/craigstratton/.grok/skills/prosper-token-saver/SKILL.md`.
Compact in-chat standard: `/Users/craigstratton/.grok/skills/caveman/SKILL.md` (full by default;
normal prose for safety warnings, irreversible actions, ambiguity-sensitive sequences, persisted
documents, and third-party messages).
Default Grok 4.6 / medium. Bounded reads use `fleet_quick` (Grok 4.5 / low).
Do not walk `$HOME` or T9 to discover files.

To find a document a chat created on the Desktop, read
`/Users/craigstratton/PROSPER-HANNA-SAM-SHARED/FILE-LOCATIONS.md`
or run `/Users/craigstratton/bin/prosper-find-document 'NAME'`.
Connector map: `/Volumes/T9/_MAP/AI-DESKTOP-CONNECTORS.json`.
Live Prosper Platform: `/Volumes/T9/01_Active/Prosper-Desktop-Workspace/`.

1. Read the current job law:
   `/Users/craigstratton/PROSPER-HANNA-SAM-SHARED/PERSONAS/FLEET-LANES.md`.
2. Identify the actual seat, then read its one `PERSONAS/<SEAT>.md` file and one
   `AGENT-MEMORY/<SEAT>.md` file.
3. Read Craig's newest instruction, `CURRENT-MEMORY.md`, and `NOW.md`.
4. Use `CONNECTOR-PLAYBOOK.md` only when a connector is needed.
5. Do the task, verify the downstream result, and report the proof.

The full worker boot is
`/Users/craigstratton/.grok/fleet/GROK-BOT-WORKER-BOOT.md`.

Do not boot Codex instructions, old role maps, archived packets, or stale bootpacks.
