# Prosper Fleet - Read Me First

Use this file when an AI needs to understand, join, or communicate with Craig Stratton's Prosper fleet.

Fleet routing was verified locally on July 14, 2026; the skills and connector
inventory was refreshed on July 20, 2026. This file contains stable routing
instructions, not live status. Always refresh the live directive and proof
before making current-state claims.

## 1. Classify Your Access

Choose one:

- **Local trusted:** Running on Craig's authorized Mac with shell access, `/Volumes/T9`, and the installed Prosper wrappers.
- **Local limited:** Running locally but missing one or more approved tools or permissions.
- **Remote or browser-only:** No local shell, no T9, or no approved private-system access.

Never claim you are connected until a live read-back proves it.

## 2. Refresh Current Truth

Every AI can read the public-safe bootstrap:

- `https://inject.prospershield.io/prompt.txt`

Local trusted agents must also read:

1. `/Volumes/T9/START_HERE.md`
2. `/Volumes/T9/_MAP/t9_map.json`
3. `/Volumes/T9/PROSPER-ONE-AGENT-OS/BOOT.md`

Then run:

```bash
prosper redis ping
redis-prosper GET prosper:fleet:current_directive
redis-prosper HGETALL prosper:fleet:current_proof
prosper fleet boot
```

Live authority order:

1. Redis runtime directive and proof
2. Supabase durable proof ledger
3. Authenticated GitHub human-readable mirror
4. T9 stable operating documents
5. Memory, transcripts, handoffs, and archives

Old documents can help locate evidence. They do not override current Redis proof.

## 3. Current Fleet Routing

- **Hanna:** Lead assistant, planning, coordination, review, and communication triage.
- **Sam:** Systems, files, code, browser/API work, fixes, and verification.
- **Grok:** Local trusted builder peer when its live registry and heartbeat are current.
- **Burtha, Maddi, Oma, and Kayla:** On-demand specialists routed through Hanna or Sam.

Always verify roles and availability from the live directive before assigning work.

## 4. Communicate Through Redis Streams

Primary inboxes:

- Hanna: `bridge:to:hanna`
- Sam: `bridge:to:sam`
- Grok: `bridge:to:grok`
- Preferred unique proof reply: `bridge:proof:<task_id>`

Every task must use one stable `task_id` and include a `reply_stream`.

Required task packet:

```text
task_id:
lane:
goal:
context:
local_action_needed:
inputs:
expected_output:
proof_required:
research_checked:
owner:
deadline:
fallback_if_blocked:
```

Local trusted send pattern:

```bash
redis-prosper XADD bridge:to:sam '*' \
  from '<agent>' to 'sam' ts '<UTC-ISO-TIMESTAMP>' kind 'task' \
  body '<single-line task packet>' task_id '<stable-task-id>' \
  reply_stream 'bridge:proof:<stable-task-id>'
```

Use `bridge:to:hanna` and `to 'hanna'` for planning or coordination work.

An ACK proves receipt only. Completion requires the requested proof and a live read-back.

### Authorized Local Seat Registration

Register only a stable, Craig-authorized local seat after checking that the identity does not already exist. Follow the live directive for required fields. The stable key patterns are:

- Registry: `agent:registry:<agent>`
- Inbox: `bridge:to:<agent>`
- Heartbeat: `heartbeat:<agent>` with a 120-second TTL

A registry row or heartbeat does not prove a worker completed a task.

## 5. Remote AI Procedure

If you cannot access T9 or Redis:

1. Read `https://inject.prospershield.io/prompt.txt`.
2. State that you are remote or limited.
3. Do not request passwords, tokens, keys, or copied vault contents.
4. Prepare the exact task packet above for Hanna or Sam.
5. Ask for non-secret proof: stream ID, task ID, file path, API read-back, or service status.

The hosted prompt is bootstrap guidance. It is not authorization to private systems.

## 6. Safety Gates

Do not send email, SMS, iMessage, customer communications, social posts, CRM writes, billing changes, deletes, permission changes, credential changes, production cutovers, or workflow activations without Craig's exact approval for that action.

Never expose secrets. Never rotate or replace credentials automatically. Use approved local wrappers and secret sources without printing values.

Gemini remains disabled unless the live directive explicitly changes that rule.

## 7. Proof Standard

- Redis: key, stream ID, task ID, or read-back
- File work: absolute path plus post-write read-back
- Browser work: URL plus visible state
- API work: GET/read-back after the write
- Code work: files changed plus test result
- Fleet work: current heartbeat, bridge ID, queue state, or service result

Do not report `done` from memory, an ACK, or an unchecked command.

## 8. Key Locations

- T9 front door: `/Volumes/T9/START_HERE.md`
- Machine map: `/Volumes/T9/_MAP/t9_map.json`
- Fleet boot: `/Volumes/T9/PROSPER-ONE-AGENT-OS/BOOT.md`
- Portable copy/paste prompt: `/Volumes/T9/04_Fleet-Ops/Portable-Agent-Bootstrap/COPY_PASTE_TO_ANY_AI.txt`
- Machine-readable fleet locations: `/Volumes/T9/04_Fleet-Ops/Portable-Agent-Bootstrap/fleet_locations.json`
- Portable skill library: `/Volumes/T9/04_Fleet-Ops/Portable-Agent-Bootstrap/skills/`
- Current skill reconciliation and activation record: `/Volumes/T9/04_Fleet-Ops/Portable-Agent-Bootstrap/FLEET_SKILLS_RECONCILIATION_2026-07-14.md`
- Current verified skills and connector inventory: `/Volumes/T9/04_Fleet-Ops/Portable-Agent-Bootstrap/VERIFIED_SKILLS_AND_CONNECTORS_2026-07-20.md`
- Preserved cross-fleet source catalog: `/Volumes/T9/04_Fleet-Ops/Portable-Agent-Bootstrap/reference/PROSPER_FLEET_SKILLS_CATALOG_AND_LOAD_GUIDE_2026-07-14_SOURCE.md`
- Authenticated GitHub skill source registry: `/Volumes/T9/04_Fleet-Ops/GitHub-Skill-Sources/README.md`
- GAM Workspace skill: `/Volumes/T9/04_Fleet-Ops/Portable-Agent-Bootstrap/skills/gam/SKILL.md`
- gog Workspace skill: `/Volumes/T9/04_Fleet-Ops/Portable-Agent-Bootstrap/skills/gog/SKILL.md`
- Craig operations index: `/Volumes/T9/01_Active/Prosper-Operations/README.md`

If any path or role disagrees with Redis, follow Redis for live work and record the mismatch for reconciliation.
