# Prosper connector playbook

status: CURRENT
updated: 2026-08-25 08:07 America/New_York
owner: Craig Stratton
applies_to: Hanna, Sam, Burtha, Oma, Kayla, Maddi, Grok TUI, Grok Bot, Claude, and Codex

This is the stable routing contract for Prosper connectors. Read it before any connector-dependent
task. Pair it with `CONNECTOR-STATUS.md`, which is the volatile live snapshot. Never infer access
from a config entry, plugin card, saved OAuth name, or another bot's claim; prove a harmless read
against the intended account or object.

## Runtime boundary

- **Grok TUI named seats:** use the local MCP names in this file. All six seats inherit the same
  user-scoped MCP configuration.
- **Claude and Codex on this Mac:** use their registered local MCPs. `make-prosper` is registered in
  both. Claude also has `ghl-prosper-main`; Codex should use the local MCP route instead of its
  legacy HighLevel app search until that app receives its missing `companies.readonly` scope.
- **Grok Bot named seats:** hosted plugins run in Grok's cloud; Mac stdio MCPs do not. Use a healthy
  hosted connector when one exists. For `make-prosper`, `ghl-prosper-main`, `prosper_1password`,
  Redis helpers, GAM, or other Mac rails, select **On your computer** and run the existing Mac
  helper/launcher. Do not install a Mac binary inside the Bot's isolated plugin computer.
- **Composio:** fallback discovery/link rail only. Prefer an existing dedicated Prosper connector.
  Do not create a duplicate OAuth connection when the dedicated connector already works.
- **Browser:** use only for an unavoidable first-use OAuth/account approval or a product surface
  with no supported API/MCP. A successful callback still needs a downstream read.

## Selection ladder

1. Reuse the healthy, dedicated Prosper connector named below.
2. If the current runtime cannot host it, use **On your computer** and the listed local helper.
3. Use Composio only when no dedicated rail exists and the requested toolkit is actually linked.
4. Use the browser for an account approval or unsupported surface, then return to the API/MCP for
   proof.

If two routes disagree, Craig's newest instruction and a same-turn downstream read win. Stop before
a write if the account, location, organization, team, repository owner, or customer differs from
the expected identity below.

## GoHighLevel / LeadConnector

**Canonical route:** MCP `ghl-prosper-main`.

**Canonical Mac/Bot read helper:** `/Users/craigstratton/bin/ghl-prosper`.

**Expected tenant proof:** location `hU3tflAFRrVsoETFstfk`, name `Prosper Shield`, website
`https://prospershield.io`.

**Health check:**

```bash
grok mcp doctor ghl-prosper-main
/Users/craigstratton/bin/ghl-prosper status
/Users/craigstratton/bin/ghl-prosper read-tools
/Users/craigstratton/bin/ghl-prosper pipelines
```

Expected: handshake succeeds and 36 tools are discovered. Then perform the smallest relevant read.
Useful read tools include:

- `locations_get-location`
- `opportunities_get-pipelines`
- `contacts_get-contact` or `contacts_get-contacts`
- `opportunities_search-opportunity`
- `conversations_get-messages`

The read helper also supports `contacts`, `contact`, `opportunities`, and `messages` when the
current task calls for those records. It exposes no mutation or send command.

Default to reads. Do not create/update a contact, move an opportunity, add a tag, or mutate a
conversation merely to test access. `conversations_send-a-new-message` is an external customer
send: use it only when Craig's current task authorizes that exact send and the recipient/content
have been verified. Customer SMS/Telnyx remains frozen unless Craig explicitly changes that rule.

The Codex HighLevel app's search endpoint currently lacks `companies.readonly`; that is not absence
of GHL access. Use `ghl-prosper-main`, which has a live tenant read, until the app OAuth scope is
fixed.

## Make.com

**Canonical local MCP:** `make-prosper`.

**Canonical local helper:** `/Users/craigstratton/bin/make-prosper`.

**Expected account proof:** API zone `us2.make.com`; organization `5514778` (`My Organization`);
team `1495551` (`My Team`). The helper obtains the API credential through `prosper-op` at runtime
and never prints it or places it in a process argument.

Health and inventory reads:

```bash
grok mcp doctor make-prosper
/Users/craigstratton/bin/make-prosper status
/Users/craigstratton/bin/make-prosper scenarios
/Users/craigstratton/bin/make-prosper scenario 5136889
/Users/craigstratton/bin/make-prosper connections
/Users/craigstratton/bin/make-prosper hooks
/Users/craigstratton/bin/make-prosper test-connections
```

The MCP exposes seven read-mostly tools:

- `make_status`
- `make_list_scenarios`
- `make_get_scenario`
- `make_recent_logs`
- `make_list_connections`
- `make_test_connection`
- `make_list_hooks`

Inspect first. An inactive scenario is not broken by definition. Do not activate/deactivate, run,
edit, clone, or delete a scenario as a connection test. Do not alter webhooks or OAuth connections
without a task that names the desired change. A scenario invocation can trigger downstream sends,
CRM mutations, spend, or customer-facing work, so the exact scenario and downstream effect must be
inside Craig's current authorization.

Make contains two verified GHL connections: `GoHighlevel Company OAuth 2.0` and `Prosper Main`
location OAuth. An older Make-side GitHub OAuth connection currently fails verification. Do not
overwrite or revoke it automatically; use the healthy direct Prosper GitHub rail below. Reconnect
the Make-side OAuth in the Make UI only when a workflow actually depends on that saved connection.

## GitHub

Use only the shared Prosper identity:

- CLI and local MCP: `prosperenergy`
- Expected user id: `219470490`
- Expected API email: `support@prosper.energy`
- Grok Bot hosted connector: `user-github-prosperenergy`
- Grok TUI MCP name: `github` (ignore the duplicate disabled `github-prosper` entry)

Before a write or merge, prove the viewer and target repository owner. Grok Bot's cloud browser is
signed out and must not be used to infer or switch GitHub identity. A Make.com GitHub connection
failure does not invalidate the healthy direct GitHub connector.

## 1Password and secrets

- Prompt-free automation: `/Users/craigstratton/bin/prosper-op`
- Local MCP: `prosper_1password`
- Official Mac Environments MCP: the 1Password app binary, Mac-local only
- Do not use bare `op` in unattended bot work; it invokes desktop/Touch ID behavior.
- Never paste a secret into a bot prompt, status file, Redis pointer, log, command argument, or
  connector playbook. Fetch it at runtime and pass it only to the connector process that needs it.
- Grok Bot cloud cannot spawn a Mac-local `1password-mcp`; use **On your computer**. Do not add a
  public tunnel to secrets.

## Other Prosper connector routes

| Need | Preferred route | Current handling rule |
|---|---|---|
| Redis live status/pointers | `redis-prosper` MCP or `/Users/craigstratton/bin/redis-prosper` | Pointers and coordination, not long-form memory |
| Supabase durable data | official `supabase` MCP, project `tgsaceudgboexxydmzot` | If OAuth is gated, report the gate; never invent schema |
| Monday | `monday-prosper-shield` | Read before mutation; prove board/item result |
| Ramp | `prosper_ramp_readonly` | Read-only |
| Gmail/Calendar/Drive | GAM first; existing account connector second | Verify exact account; draft by default; sending needs current authorization |
| Notion | existing account connector when authenticated | Verify workspace/page before writing |
| Vercel | existing Vercel connector/CLI | Prove project link, deployment result, and production domain separately |
| Cloudflare | account-owned token launcher/Wrangler; docs via `cloudflare-docs` | Verify account and zone; docs access is not account API access |
| Firecrawl | `firecrawl` MCP/skill | Read/research rail |
| ElevenLabs | `elevenlabs` | Generation may spend credits; keep within the named task |
| OpusClip | `opusclip` | Keep uploads/exports within the named task |
| Browser/computer | `kapture`, `chrome-devtools`, `computer_use`, `macos_mcp` | Use for UI/OAuth; verify resulting system state afterward |
| Composio | authenticated `composio` CLI, fallback only | Search works; use only a toolkit that is actually linked |

## Proof standard

Use these labels exactly in handoffs:

- **GREEN:** same-turn downstream read succeeded against the expected identity/object.
- **CONFIGURED:** route exists but was not re-proven in the current task.
- **AUTH GATE:** connector needs an owner login/OAuth approval.
- **FAILED:** same-turn call failed; quote the non-secret error and identify the layer.
- **DISABLED:** intentionally off; do not turn it on just to improve a status count.

A plugin card, MCP config row, handshake, browser callback, ACK, queue receipt, or process proves only
that layer. For completion, verify the actual account/object/result. Never perform a customer send,
scenario run, production deploy, DNS change, financial action, credential rotation, or destructive
mutation merely as a connection test.
