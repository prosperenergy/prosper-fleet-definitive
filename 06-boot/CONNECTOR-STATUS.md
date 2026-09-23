# Prosper connector status

status: CURRENT SNAPSHOT
verified: 2026-08-25 08:51 America/New_York
stable instructions: `/Users/craigstratton/.grok/fleet/CONNECTOR-PLAYBOOK.md`

This is a volatile proof snapshot, not a credential store. Recheck the connector needed for the
current task.

## Live green

| Connector | Same-turn proof |
|---|---|
| GoHighLevel | `ghl-prosper-main` started, completed MCP handshake, exposed 36 tools, and read location `hU3tflAFRrVsoETFstfk` as `Prosper Shield` / `https://prospershield.io`; the Mac/Bot helper identified 22 read-only tools and read 13 pipelines |
| Make.com | `make-prosper` started, completed MCP handshake, and exposed 7 tools; API read succeeded in zone `us2.make.com` for organization `5514778` and team `1495551` |
| Make inventory | 12 scenarios (2 active), 14 saved connections, and 13 enabled hooks read successfully |
| Make GHL connections | Both `GoHighlevel Company OAuth 2.0` and location OAuth `Prosper Main` passed connection verification |
| GitHub direct | `gh` and the direct GitHub connector read the shared `prosperenergy` identity, id `219470490`, email `support@prosper.energy` |
| 1Password automation | `prosper-op` retrieved the Make API credential at runtime without disclosure; local `prosper_1password` was already healthy |
| Composio CLI | CLI `0.4.0` authenticated as `stratton@prosper.energy` in `stratton_workspace`; search works |

Primary Make proof scenario: `5136889`, `Prosper Quote Intake - Internal Proof`, currently inactive.
Active Make scenarios at this snapshot:

- `5301130` — Add new setter GHL
- `5594865` — Delete Setter

No scenario was run, activated, deactivated, edited, or deleted during connector verification.

## Exceptions and approval gates

- **FAILED, isolated:** Make connection `8993049`, `Prosper GitHub - prosperenergy`, returned HTTP
  424 / `SC424` while testing its saved OAuth dependency. The direct fleet GitHub connector remains
  GREEN on `prosperenergy`. Reconnect this one connection in the Make UI only if a scenario depends
  on it; it was not overwritten, revoked, or replaced.
- **CONFIGURED fallback:** Composio has zero connected toolkits after the clean CLI login. Use it to
  search/link a missing integration only when no dedicated Prosper rail exists.
- **AUTH GATE:** the legacy Codex HighLevel app search lacks OAuth scope `companies.readonly`.
  `ghl-prosper-main` is the working route.
- **RUNTIME BOUNDARY:** Grok Bot cloud cannot spawn Mac stdio MCPs. Its six seats must use hosted
  account connectors when healthy and **On your computer** for `make-prosper`,
  `ghl-prosper-main`, `prosper_1password`, GAM, and local helpers.
- **VERIFY PER TASK:** Supabase, Notion, Vercel, Calendar, Drive, and several plugin HTTP MCPs can
  have first-use OAuth state that differs by runtime. Inspect live state before promising access.
- **INTENTIONALLY OFF:** customer SMS/Telnyx, WhatsApp send, Higgsfield, and sealed legal tooling.

## Registration proof

- Grok TUI user MCP: `make-prosper` healthy, 7 tools.
- Claude user MCP: `make-prosper` connected; `ghl-prosper-main` connected.
- Codex user MCP: `make-prosper` enabled. Prefer it over the OAuth-gated legacy HighLevel app.
- All six named Grok TUI agents inherit the user MCP configuration.

Use `/Users/craigstratton/bin/make-prosper status`, `grok mcp doctor make-prosper`, and
`grok mcp doctor ghl-prosper-main` for the next live check.

## Grok Bot training proof — 6 of 6

Verified visibly in the six-seat Grok Bot group on 2026-08-25 between 08:24 and 08:39 EDT. Every
seat named the canonical GHL, Make, and GitHub routes and performed a harmless Mac-host read:

| Seat | Live proof returned |
|---|---|
| Oma | GHL HTTP 200; Prosper Shield location `hU3tflAFRrVsoETFstfk` / prospershield.io |
| Sam | Make `us2.make.com`; organization `5514778`; team `1495551`; 12 scenarios / 2 active; explicitly no scenario run |
| Kayla | GHL HTTP 200; Prosper Shield location `hU3tflAFRrVsoETFstfk` / prospershield.io |
| Maddi | Make `us2.make.com`; organization `5514778`; team `1495551`; 12 scenarios / 2 active; explicitly no scenario run |
| Burtha | GHL HTTP 200; Prosper Shield location; GitHub login `prosperenergy` |
| Hanna | GHL HTTP 200; Prosper Shield location `hU3tflAFRrVsoETFstfk` / prospershield.io |

All six used `ghl-prosper-main` via `~/bin/ghl-prosper`, `make-prosper` via
`~/bin/make-prosper`, and `user-github-prosperenergy` / `prosperenergy` as their named routes.

## Scheduled reliability proof

- `io.prosper.fleet-autocheck` completed through launchd with exit `0`, status GREEN, errors `[]`,
  and warnings `[]`. It verified prompt-free 1Password, GitHub `prosperenergy`, Grok Bot process and
  heartbeat, Redis backup, disk, automations, and the AI gateway.
- The monitor now uses the gateway result already present in Fleet Status and retries only a
  non-green first result. A recovered transient is advisory instead of a false hard failure.
- Full `prosper-fleet-status --json` read back GREEN with zero issues, Redis healthy, gateway GREEN
  with 34 models, and all seven scheduled services recognized.
- Memory mirror run `memory-mirror-1787662241` completed `ok`: three Supabase records read back,
  four private-GitHub files read back with matching content SHAs, and the generated current boot
  sheet recorded `fleet_status: green`.
