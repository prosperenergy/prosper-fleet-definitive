# Prosper Unified Agent Memory

This is the provider-neutral memory surface for Claude/Hanna, Codex/Sam,
Grok/Oma, Copilot/Burtha, and future agents.

## Source model

1. Craig's newest instruction.
2. Live Redis policy and proof.
3. `current_memory.json` and the canonical shared current-memory source it cites.
4. Historical Claude-Mem observations and summaries.

Historical records are evidence, not permission and not current operating truth.
Records dated 2026-08-08 or earlier are treated as history unless a current
record explicitly promotes them.

## Query

```bash
/Volumes/T9/04_Fleet-Ops/Unified-Agent-Memory/query_memory.py "current approval gates" --scope current
/Volumes/T9/04_Fleet-Ops/Unified-Agent-Memory/query_memory.py "WhatsApp audit" --scope history
/Volumes/T9/04_Fleet-Ops/Unified-Agent-Memory/query_memory.py "SHS training" --scope all
```

`--scope all` is the default. Current records are returned before historical
matches. Natural questions are normalized before FTS search, so punctuation
such as `?` no longer breaks the query.

## Files

- `current_memory.json`: small curated current layer; safe for all agents.
- `unified_memory.sqlite`: generated searchable index of current and historical memory.
- `query_memory.py`: read-only command-line query tool.
- `build_unified_memory.py`: refreshes the unified index from native stores.
- `inventory.json` and `index.html`: generated inventory and local dashboard.

Do not put secrets, private raw transcripts, or unsealed legal narratives in
`current_memory.json`. Raw stores remain private and retain exact provenance.
