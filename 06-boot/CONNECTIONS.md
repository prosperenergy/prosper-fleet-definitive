# Fleet connections for Grok agents

Live verification updated 2026-08-25 08:07 EDT. No secrets in this file. Legal remains sealed.
Customer SMS/Telnyx stays frozen. Do not copy API keys into Grok config.

Stable connector routing: `/Users/craigstratton/.grok/fleet/CONNECTOR-PLAYBOOK.md`.
Volatile connector proof: `/Users/craigstratton/.grok/fleet/CONNECTOR-STATUS.md`.

Named seats: Hanna, Sam, Burtha, Oma, Kayla, Maddi (K = Kayla). Subagents inherit
every parent-connected MCP server (`mcpInheritance: all`).

## Skills

Canonical: `/Users/craigstratton/.agents/skills`.
Also scanned (deduped by name):

- `~/.claude/skills`
- `~/.codex/skills`
- `/Volumes/T9/.agents/skills`
- Codex plugin skill caches (cowork, openai-curated, bundled, i-have-adhd, superpowers, composio)

Grok inspect reports **600+** skills after pulling Codex plugin skill caches
on top of the canonical `.agents` set (Codex desktop showed ~205). Lazy-load.
Do not load `litigation-legal-*` or the legal vault as current work.
Telnyx MCP is disabled. Customer SMS stays frozen.

## Redis (live status)

CLI: `/Users/craigstratton/bin/redis-prosper` — `PING` returns PONG.
MCP: `redis-prosper` tools `redis_ping`, `redis_get`, `redis_keys`
(pointer keys only: `prosper:agent:`, `prosper:policy:`, `heartbeat:`, `bridge:to:`).

Personas are files on the shared desk. Redis holds **pointers**, not long-form memory.

```text
redis-prosper GET prosper:agent:hanna:bootpack
redis-prosper GET prosper:agent:kayla:soul
```

## Supabase (durable)

Official MCP: `supabase` at mcp.supabase.com for project `tgsaceudgboexxydmzot`.
**Enabled 2026-08-23.** Handshake still needs Craig's browser sign-in
(`/mcps` then `i` on supabase). Until that click, use the desk files; Redis
is not a substitute. Redis = live status. Supabase = durable store.

## Cloudflare (account-owned tokens)

Docs: https://developers.cloudflare.com/fundamentals/api/get-started/account-owned-tokens/
These are `cfat_` **account** tokens (service principal), not user tokens. They stay valid if a person leaves.

Account: `Stratton@prosper.energy's Account` id `2ff14c5d5fc9133fdcabd719140731ef`.
Live fleet token name **Prosper-fleet-workers-2026-08-23** in `~/.config/prosper/cloudflare.secret.env` (also prosper.env).
Env: `CLOUDFLARE_API_TOKEN` / `CF_API_TOKEN` / `CLOUDFLARE_ACCOUNT_ID`. Never print the token.

Proven 2026-08-23:
- `accounts/.../tokens/verify` → active
- `wrangler whoami` → that account
- Workers scripts list → 200
- R2 list → 403 until R2 is enabled in the dashboard (token is fine)
- Zones on this account: **0** (prospershield.io DNS may still be on a different Cloudflare account)
- Original dashboard token **PROSPER** is Account API Tokens Write only (kept as mint key, not the daily token)

Verify: `bash ~/.grok/fleet/launchers/cloudflare-verify.sh`
Wrangler: `npx wrangler whoami`

## GitHub

CLI: `gh` as `prosperenergy`.
MCP launcher: `~/.grok/fleet/launchers/github-mcp.sh` (token from `~/.config/prosper/prosper.env`, never printed).
Grok Bot connector: `user-github-prosperenergy`, 26 tools. Same-turn viewer proof is login
`prosperenergy`, id `219470490`, API email `support@prosper.energy`. The Bot cloud browser is signed
out; do not use it to switch, authenticate, or infer the GitHub identity.

## MCP wired into `~/.grok/config.toml`

| Server | How | Notes |
|---|---|---|
| monday-prosper-shield | prosper launcher | live |
| ghl-prosper-main | prosper launcher | live |
| make-prosper | read-mostly Python MCP; credential fetched through `prosper-op` | live (7 tools); also registered in Claude and Codex |
| prosper_ramp_readonly | python MCP | live |
| opusclip | prosper launcher | live |
| elevenlabs | prosper launcher | key from prosper secret env, not Grok config |
| redis-prosper | GET/KEYS/PING only | live |
| supabase | HTTP OAuth | **enabled**; `/mcps` → `i` still required |
| github | prosper env launcher | live (26 tools) |
| prosper-messages-bridge | uv local | live; SMS freeze still applies |
| prosper_1password | local python launcher | Mac/Grok TUI only; prompt-free vault read; no rotation tools; use guarded Mac host execution from Grok Bot |
| onepassword | `/Applications/1Password.app/Contents/MacOS/1password-mcp` | Mac/Grok TUI only; official Environments MCP. Grok Bot cloud plugin cannot spawn this Mac binary |
| openai_image_bridge | T9 + 1Password wrap | **disabled** — 1Password item missing; use grok_media_bridge |
| grok_media_bridge | T9 venv | configured; media unavailable while T9 is unmounted |
| macos_mcp | `uv tool run macos-mcp` | local macOS |
| kapture | npx kapture-mcp | browser bridge |
| caveman_shrink | npx | **disabled** — wrapper needs an upstream command, not a server |
| computer_use | Codex Computer Use.app | Codex app binary |
| firecrawl | npx if key in prosper env | else use firecrawl **skill** / plugin |
| composio | CLI plus optional HTTP `connect.composio.dev/mcp` | CLI authenticated as Prosper workspace; HTTP MCP disabled; zero linked toolkits, fallback only |
| exa | HTTP `mcp.exa.ai/mcp` | **enabled**; `/mcps` → `i` |
| higgsfield | HTTP `mcp.higgsfield.ai/mcp` | **disabled** (Craig: skip Higgsfield) |
| linear | HTTP `mcp.linear.app/mcp` | **enabled**; `/mcps` → `i` |
| cloudflare-docs | plugin | live (2 tools, no extra login) |
| cloudflare-api / bindings / builds / observability | plugin HTTP | **enabled**; `/mcps` → `i`. Daily Workers path is Wrangler + `cfat_` token |
| figma / vercel (plugin MCP) | plugin HTTP | **enabled**; `/mcps` → `i`. This TUI already has a Vercel **connector** |
| codex | `codex mcp-server` | talk to Codex from Grok |
| telnyx | **disabled** | customer SMS freeze |
| prosper_whatsapp_command | **disabled** | send-capable; leave off |

Also inherited (not duplicated into Grok config):

- `~/.mcp.json` Codex stdio (overridden by Grok `codex` block)
- Claude `~/.claude.json` telnyx/exa/elevenlabs/redis — Grok names win on conflict
- Plugin MCP after trust (agentbridge, etc.)

## App connections already live in this Grok TUI session

These are account-level connectors (not Codex plugin clones). They stay on
this Grok login. Do not paste tokens into chat.

- gmail
- google_calendar
- google_drive
- github
- notion
- vercel
- airops
- tasks
- monday-prosper-shield
- prosper_ramp_readonly
- codex

Codex ChatGPT-app plugins that **cannot** be cloned 1:1 (Grok substitutes):

| Codex plugin | Grok substitute |
|---|---|
| documents / pdf / presentations / spreadsheets | bundled `docx` `pdf` `pptx` skills |
| browser / chrome / node_repl | Grok browser tools + `chrome-devtools` plugin + kapture |
| visualize / sites / template-creator | Grok imagine + bundled skills |
| gmail/calendar/drive/notion (curated) | live Grok connectors above + GAM skill |
| highlevel | `ghl-prosper-main` MCP |
| monday-com | `monday-prosper-shield` MCP |
| supabase curated plugin | `supabase` HTTP MCP |
| quickbooks | `finance-ops` skill (no QB plugin on Grok) |
| heygen / remotion / hostinger | skills where present; no Grok marketplace twin |

## Plugins

Install/enable on Grok (marketplace + local). Do **not** install
`litigation-legal*` or Telnyx plugins.

Expected after install: agentbridge, i-have-adhd, superpowers, plus xAI
twins for vercel/figma/firecrawl/exa/cloudflare/chrome-devtools when trust
succeeds.

## Memory / personas

| Seat | Persona | Role memory |
|------|---------|-------------|
| Hanna | `PERSONAS/HANNA.md` | `AGENT-MEMORY/HANNA.md` |
| Sam | `PERSONAS/SAM.md` | `AGENT-MEMORY/SAM.md` |
| Burtha | `PERSONAS/BURTHA.md` | `AGENT-MEMORY/BURTHA.md` |
| Oma | `PERSONAS/OMA.md` | `AGENT-MEMORY/OMA.md` |
| Kayla (K) | `PERSONAS/KAYLA.md` | `AGENT-MEMORY/KAYLA.md` |
| Maddi | `PERSONAS/MADDI.md` | `AGENT-MEMORY/MADDI.md` |

Shared: `CURRENT-MEMORY.md`, `NOW.md`, `OPEN-ME-FIRST.md`.
Unified search: `python3 ~/.prosper/unified-agent-memory/query_memory.py "query"`.
Historical Codex memories: `~/.grok/memory/from-codex/` (history only).

Launch a named seat:

```text
grok --agent hanna
grok --agent sam
grok --agent burtha
grok --agent oma
grok --agent kayla
grok --agent maddi
```

`k` is an alias file for Kayla. Same seat.

## Desktop + T9

Desktop operator map: `~/.grok/memory/fleet/DESKTOP-OPERATOR-MAP.md`
T9 **NOT MOUNTED** at the 2026-08-23 17:01 live check. Expected path: `/Volumes/T9`; Desktop
pointer: `~/Desktop/T9`. Re-check both before use.
T9 map: `~/.grok/memory/fleet/T9-OPERATOR-MAP.md`
Do not store disk passwords in this file. Legal vault stays sealed unless
Craig says `unlock legal vault` and names a matter.

## Grok Bot

Named Bots: Hanna, Sam, Burtha, Oma, Kayla, Maddi. Local computer: Always allow with Auto-review on.
Common worker contract: `~/.grok/fleet/GROK-BOT-WORKER-BOOT.md`. Live, no-model presence loop:
`io.prosper.grok-peer-live` → `~/bin/prosper-grok-peer-live`. Redis roster:
`prosper:fleet:artifact:grok_bot_worker_roster:current`.

Grok Bot hosted plugins verified connected: Monday.com, Gmail, Context7, Exa, Cloudflare docs, and
GitHub as `user-github-prosperenergy` (`prosperenergy`, `support@prosper.energy`, 26 tools).
Calendar, Drive, Notion, Linear, Supabase, Vercel, Composio, and Cloudflare service connectors still
need Craig authentication. Mac stdio launchers do not resolve inside the Bot's isolated plugin
computer; use guarded `On your computer` execution or the Grok TUI. Never replace this with an
unauthenticated public quick tunnel. On 2026-08-23 the official 1Password plugin was uninstalled,
clean-reinstalled, and reproduced `spawn 1password-mcp ENOENT`; the official and custom failed
entries were then removed. Host `authenticate` plus `list_environments` succeeded through guarded
Mac execution, and Hanna reloaded with zero 1Password plugin errors.

## Verified live (this machine, 2026-08-23, `grok mcp doctor`)

Healthy: redis-prosper (3), github (26), monday-prosper-shield (92), ghl-prosper-main (36),
make-prosper (7),
firecrawl (27), elevenlabs (27), grok_media_bridge (3), prosper_1password (6), opusclip (20),
computer_use (10), prosper-messages-bridge (5), kapture (31), macos_mcp (12),
prosper_ramp_readonly (13), context7 (2), codex (2), agentbridge (4), cloudflare-docs (2),
chrome-devtools (29). Cloudflare token verify 200/active. Redis bootpacks `current-2026-08-23`.
Named agents on disk: hanna, sam, burtha, oma, kayla, k, maddi.
Launchers: `grok --agent hanna` (and sam/burtha/oma/kayla/maddi) or `~/bin/grok-hanna`.
`grok_media_bridge` can enumerate as healthy while its T9-backed media paths are unavailable; T9
mount read-back is still required before media work.

## First-use OAuth (Craig clicks)

This Grok TUI session already has account connectors: Gmail, Calendar, Drive,
GitHub, Notion, Vercel, Airops, Tasks, Monday, Ramp.

For HTTP servers that still need a browser login, `/mcps` → select → `i`:

1. supabase (required for durable data)
2. exa
3. linear
4. figma
5. vercel plugin MCP (account Vercel connector may already be enough)
6. cloudflare-api (optional; Wrangler + `cfat_` token already works)

Composio CLI is already authenticated as `stratton@prosper.energy` in `stratton_workspace`, but it
has zero linked toolkits. Keep the HTTP MCP disabled until a real missing integration requires it;
do not duplicate a healthy dedicated Prosper OAuth connection.

Do **not** sign in Higgsfield. Press `r` in `/mcps` or start a new Grok session to pick up the new config.
Do not paste keys. Do not rotate credentials.

## SpaceXAI stack (2026-08-23)
- Cursor, Grok, and Grok Bot are one SpaceXAI stack. SuperGrok Heavy is the live plan. Do not split them as separate products or a second bill.
