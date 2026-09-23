# Prosper connections and data flows

This map explains the documented system roles and the known connection families. It is not a live connectivity certification. No account-wide health audit, credential change, service restart, CRM write, or Make execution was performed for this package.

## The main layers

| Layer | What it does in Prosper | Primary responsibility |
|---|---|---|
| Craig and agent chats | Intent, context, decisions, work conversations | Craig; Hanna coordinates |
| Council room | Shared discussion and cross-lane decisions | All six; Hanna chairs by proposed contract |
| Redis Streams | Routes work, pointers, receipts, and liveness signals | Shared fleet infrastructure; Sam/Burtha diagnose |
| Bridge/shared files | Carry task context, source references, handoff packets, and proof | Owning seat; Hanna coordinates |
| Supabase | Structured application data, identity/access components, designated durable memory | Sam implements; Oma curates approved memory; Craig approves schema changes |
| Make.com | Executes configured event-to-action integrations | Hanna coordinates the process; Sam implements/diagnoses under scope |
| GHL / HighLevel | Customer/recruiting CRM records and workflows | Kayla business context; Hanna coordination; Sam integration |
| Workspace, Monday, Setmore, Zoom | Documents, communication, boards, booking, meetings | Depends on the business object |
| GitHub and hosting/DNS | Code, CI, builds, releases, public routing | Burtha repos/CI; Sam authorized releases/DNS |
| Local/external storage | Originals, working files, archives, recovery material | Oma stewardship; each seat creates its own task outputs |

## Redis: the fleet's message transport

Redis is a data service. In this fleet, Redis Streams are used as a durable coordination channel: producers add entries and workers read work through defined streams and consumer groups. Consumer-group reads track delivered-but-unacknowledged entries; consumers acknowledge work with the relevant acknowledgement operation. Different groups can process the same stream independently. [Redis XREADGROUP documentation](https://redis.io/docs/latest/commands/xreadgroup/)

Prosper's remembered convention is deliberately compact: the stream message points to context rather than carrying the entire private task. Typical keys include `bridge:to:hanna`, `bridge:to:sam`, `bridge:to:<seat>`, `bridge:proof:<task_id>`, and `agent:events`. These are documented naming patterns, not a September 23 inventory of currently present keys.

**Example handoff:** Sam writes a scoped repair packet in ClaudeCodexBridge. A bus message identifies Sam, the timestamp, task ID, packet pointer, nonce, destination, and reply route. Hanna's worker can acknowledge receipt. Hanna reviews the packet and accepts/redirects it. The executing seat returns proof. The original task closes only when its requested result is established.

A consumer group separates delivery state for a class of workers. Grok's peer bot uses its own `grok-*-v1` group under Craig's instructions. Separate groups do not merge minds or private chat histories. Multiple workers in one group may divide work; they should not all claim the same job accidentally. A monitoring tool must use read-only observation rather than a consumer read that claims pending work.

`PING`/`PONG` says the Redis server answered. A heartbeat says a process wrote a recent liveness signal. Low lag says something about queue consumption. A receipt says a message arrived. None proves that a model considered the issue or that the business action succeeded.

Redis also supports other data structures and caching uses, but the remembered Prosper Streams bus is coordination. It does not automatically cache LLM responses, avoid prompt transmission, create shared reasoning, or reduce token bills. A prompt cache, semantic cache, or shared-memory retrieval system would be a separately implemented feature with its own evidence.

Useful local entrypoints remembered by the fleet include `~/bin/redis-prosper` and `~/bin/prosper_redis.py`. Use the configured helper so secrets stay protected. Read-only checks should be bounded and appropriate to the exact question. Do not print connection strings or run a worker-consumer command merely to watch traffic.

## Supabase: structured data and designated durable memory

Supabase provides a PostgreSQL database, with related platform services such as authentication, storage, and APIs. Database rows can be protected with row-level security, which controls access based on policies and the caller's context. [Supabase database documentation](https://supabase.com/docs/guides/database/overview) · [Row-level security](https://supabase.com/docs/guides/database/postgres/row-level-security)

For Prosper, think in separate data domains: application/customer records, staff identity and authorization, document references, and designated agent learning/memory. The same vendor can host several distinct projects. A working connection to one project does not authorize or validate another.

The role files associate `tgsaceudgboexxydmzot` with self-learning memory. Another historical GHL webhook incident named project `bohvnirfospuxgcbkxwo`; that destination returned a paused-project error at the time. These references demonstrate why “our Supabase” is too vague for a write. Their current status and project-to-application mapping were not checked here.

Before a write, establish project reference/name, environment, table, intended records, permission scope, and expected before/after state. Read-only inspection can identify tables, policies, logs, and the exact failure. A schema migration changes the structure or access behavior; it is different from updating a single ordinary record. Both need correct scope, and schema/RLS changes require the explicit review process supplied by Craig.

**Recommended memory design:** store a concise claim with its source, owner, timestamps, sensitivity, and supersession information; keep the underlying sensitive record in its original system. This is a portable contract, not a claim about the current database schema. Oma curates the quality of memory; Sam implements authorized storage behavior; Hanna ensures it fits the fleet's coordination needs.

An LLM does not remember a Supabase row merely because the row exists. A tool or retrieval layer must select the row, enforce access, and load appropriate context into the current turn. Likewise, a saved conversation is not automatically searchable by every other seat.

For application data, prove identity and access separately from UI rendering. An authenticated staff token, active staff membership, correct row scope, and private storage controls can each matter. Do not infer secure deployment from a login screen alone.

## Make.com: configured automation between systems

Make runs scenarios made of triggers, processing steps, and actions. Webhooks can receive events from other applications and trigger a scenario, while scheduled/polling triggers check for data periodically. Webhook events can queue before processing; a successful acceptance response may only establish receipt. [Make webhook documentation](https://help.make.com/webhooks)

In Prosper's remembered audit, the workspace was `us2.make.com` with 12 scenarios, 2 active scenarios, 14 saved connections, and 13 enabled hooks. Those are historical counts, not today's inventory. The two recorded active names were “Add new setter GHL” and “Delete Setter,” associated with Monday webhook activity. Starts were observed; successful completed runs and target mutations were not established in that record.

The same audit recorded a “Prosper GitHub – prosperenergy” connection verification failure with HTTP 424 and a separate Make sign-in failure with HTTP 401. Those are different layers. They should not be collapsed into “Make is down,” nor should a connection card be called healthy because it is saved.

**Illustrative roster flow:** an authorized roster change in Monday emits an event; Make receives it, validates fields, identifies the intended person, and performs the approved GHL change; the operator reads back the exact target. The historical names support investigating that kind of flow, but the current modules and field mappings were not inspected. In particular, do not assume what “Delete Setter” deletes from its name.

When diagnosing a scenario, identify its workspace, scenario ID, active/schedule state, trigger, connection identities, input event, branch/filter path, error handler, last completed run, and resulting target record. Compare field mappings and object IDs. A contact ID, user ID, board-item ID, and email address are not interchangeable identifiers.

Use an event ID or equivalent deduplication strategy where the existing design supports it. Retrying a webhook can repeat a write or send. Before replaying anything, check whether the prior attempt partially completed and whether the task authorizes another side effect. A scenario activation can also expose queued work; inspect the queue before enabling it.

Hanna owns business coordination and connector triage. Sam owns scoped integration implementation. Kayla supplies recruiting/CRM process requirements. Burtha handles repository/credential work when routed. Make is an automation runner, not the final authority on customer status or permission to send.

## GHL / GoHighLevel / HighLevel / LeadConnector

These names refer to the CRM platform and its related API/branding surfaces. Its official API covers functions including contacts, conversations, calendars, opportunities, and webhooks. [HighLevel developer documentation](https://marketplace.gohighlevel.com/docs/)

Prosper uses GHL in sales/recruiting/customer workflows. Remembered names include Prosper Shield, Prosper Solar, and ProsperSynk-branded login surfaces. The repeatedly recorded location ID is `hU3tflAFRrVsoETFstfk`. Labels can drift, so confirm the intended location and account rather than choosing a familiar name. The remembered API host is `services.leadconnectorhq.com`.

A contact record represents a person or organization. An opportunity represents a pipeline item. A conversation is a communication history. A calendar event represents a scheduled appointment. A workflow reacts to triggers and can perform further actions. Those objects may refer to each other but they prove different facts.

For example, a contact can exist without a booked appointment; an opportunity can say “sold” without establishing the signed contract, installation, funding, or commission. A workflow can be published while its destination webhook fails. A notification email may link to a conversation that the current connector cannot read.

Kayla owns the sales/recruiting interpretation and permitted reads. Hanna owns coordination and customer-calendar preparation. Sam diagnoses/builds the integration. The current package leaves CRM mutation gated; it does not turn read access into authority to edit fields, change stages, enroll contacts in workflows, or send messages.

A historical incident showed a GHL webhook reaching a Supabase project that reported it was paused. The lesson is to trace source event → webhook → destination response → stored result. Later repairs may have changed that route; this historical incident is not a current outage claim.

Different GHL connections can have different access. The local HighLevel MCP previously initialized and exposed tools while a separate Codex HighLevel app connector returned an IAM/auth-class 401. Name the failing route. Do not mistake a permission failure for missing customer data.

When inspecting an authorized record, resolve exact identifiers and cross-check the person before combining data. Record source attribution and assigned representative. For booking workflows, verify the event, contact, source, and assignee together, while keeping customer outreach frozen.

## How the four systems work together

Redis coordinates which agent is responsible. Supabase stores the structured records or memory appropriate to the specific project. Make executes the configured steps linking systems. GHL holds the CRM objects that the sales operation uses. They can interact, but the existence of all four does not prove a complete implemented chain.

**Proposed end-to-end example, not a live run:** Craig requests a review of setter onboarding. Hanna frames the task and routes scoped work over Redis. Kayla defines the real onboarding requirements from approved source records. Sam reads the Make mapping and GHL target behavior. Oma verifies the source and keeps the decision history. Burtha reviews any repository/CI dependency. Maddi supplies clear onboarding presentation if needed. After a decision and any required authorization, the owner changes the exact workflow and proves the target state. A memory record can then capture the reusable result through the permitted update mechanism.

## Connection families around the core

| System or family | What it contributes | Relevant seats | What must be verified |
|---|---|---|---|
| Google Workspace: Gmail, Calendar, Drive, Docs, Sheets, Slides | Communication records, calendar, source documents, trackers, media and training files | Hanna, Kayla, Oma, Maddi; Sam for integration | Exact user/tenant, object, permissions, result |
| GAMADV-XTD3 | Administrative Workspace access/impersonation through approved delegation | Hanna coordination; Sam scoped execution | Domain and target-user delegation; use only task scope |
| Monday.com | Operational/recruiting boards and source events for remembered Make flows | Hanna, Kayla; Sam integration | Board, item, columns, webhook, actual saved state |
| Setmore | Booking source and appointment context | Hanna; Kayla recruiting triage | Correct account, time zone, attendee, booking and downstream mapping |
| Zoom | Meetings, cloud metadata, local recordings, training source media | Hanna, Maddi, Oma; Sam tooling | Cloud vs local file, date, actual playable recording |
| DocuSign / signNow | Agreements, envelope status, signed document retrieval | Hanna/Oma context; Sam authorized archive tooling | Correct account, date filters, envelope, signed status, original file |
| Powur / Enerflo / Aurora / OpenSolar and installer portals | Solar project/proposal/design/install source evidence | Task-dependent; Hanna coordinates | Exact project identity, document version, stage, tool availability |
| Prosper platform / Proposal Studio / private file drawer | Internal front doors over selected CRM/document/backend sources | Sam implementation; Hanna business flow | Correct deployed environment, auth, actual source adapters, permissions |
| Netlify | Hosting, functions, deployments, private application storage where implemented | Sam; Burtha CI support | Exact site/team, revision, target URL, runtime result |
| Cloudflare / GoDaddy | Domain/DNS and related hosting/access services | Sam authorized changes; Hanna dependency coordination | Authoritative provider, zone/record, mail preservation, live result |
| GitHub | Repositories, PRs, issues, CI, source history | Burtha; Sam code work | Correct identity/repo/branch, remote read-back |
| 1Password / protected environment | Authorized secret retrieval and metadata | Burtha key lane; task-specific use | Correct item/account; never reproduce values in packages |
| Tailscale / SSH / remote Mac access | Private machine connectivity and authorized remote execution | Sam/Burtha; Oma storage context | Actual device reachability, identity, permitted path |
| Deskflow | Keyboard/mouse sharing between machines | Sam/Burtha diagnosis | Loaded service and actual connection; not an AI memory bridge |
| launchd / Codex automations | Scheduled local scripts or recurring model tasks | Owner of the recurring job; Sam mechanics | Real registration, active/paused state, last run, output |
| Higgsfield / ElevenLabs / CapCut / image and video tools | Generated and edited visual/audio assets | Maddi | Supported tool, account/credits, finished playable artifact |
| Meta/Instagram/TikTok, Social Planner, AdKit and reporting tools | Social publication, advertising, campaign/reporting surfaces | Maddi under explicit scope | Correct account, content, timing, budget, publication/report proof |
| OnlineJobs; Indeed/LinkedIn tool families | Candidate/job information and recruiting surfaces | Kayla | Correct employer/account, current job, actual application/thread |
| QuickBooks/Intuit, Brex, lender/HFS/Daylit surfaces | Accounting evidence, finance preparation, financing workflows | Craig controls money; Hanna coordinates; Oma evidence | Exact legal entity, account, reporting basis, current offer and approval boundary |
| Fourthwall | Remembered Prosper merchandise/store platform | Maddi presentation; Sam technical work | Actual store/account and authorized change |
| Notion / Brain wiki / local Markdown / SQLite memory | Knowledge and working records | Oma; Hanna continuity | Current source, access, provenance, supersession |

## AI access routes are separate connections

An API is the service's programmatic interface. An MCP server exposes tool operations to an agent. A connector supplies an application's integration path and usually its own authentication context. A CLI runs commands from the local host. A webhook receives events. A browser session is another authenticated surface. Success on one route does not prove the others work.

CPAMC/CLIProxyAPI is a remembered local model gateway at `127.0.0.1:8317`. It routes requests to configured model backends; it is not Redis, the council room, or a customer database. Old council notes used this gateway. Its current models, credentials, and health were not tested here.

AgentBridge is a separate bridge plugin/service. This session reported its `127.0.0.1:4502/healthz` endpoint unreachable. That report does not establish the state of Redis or all Sam↔Hanna communication. No attempt was made to start or update it for this documentation task.

AgentCouch tools are also exposed in this session for rooms/handoffs. Tool availability alone does not show that the Prosper council is hosted there or that all six are members. Do not conflate a product called a room with Craig's actual configured council.

## Available tools versus established business connections

This session exposes tool families for Google Workspace, GitHub, GHL, Supabase, Monday, Netlify, Vercel, GoDaddy, Zoom, DocuSign, signNow, QuickBooks/Intuit, Notion, Higgsfield, HeyGen, AdKit, Fyxer, Indeed, LinkedIn, Hugging Face, Windsor, and other app/tool services. These were discovered from tool metadata; no blanket authentication test was performed. Specialist or experimental families such as HYPD, Hotline, WorkOS, Sites, and provider tools are available capabilities with no confirmed role in this fleet map beyond what a scoped task establishes.

Dropbox, Box, Codex Security, Figma, Linear, Outlook Calendar, Outlook Email, SharePoint, Slack, and Teams were listed in the current prompt as recommended but not installed plugins. Historical references to some of these services can still exist. Neither a recommendation nor an old skill proves an active connection. Make and Setmore appear in historical business records; their current authenticated access was not audited here.

For an actual connection audit, create one row per route with: system, owner, account/project, tool path, authentication result, allowed operations, harmless object-read proof, last verified time, dependency, and failure. That inventory would be a separate live task. This reference gives the operating map without pretending to have run it.

## Additional connector routing recovered from T9 and the local Grok fleet

A saved connector snapshot dated August 25 identifies `ghl-prosper-main` through `~/bin/ghl-prosper`, `make-prosper` through `~/bin/make-prosper`, `monday-prosper-shield`, and GitHub as `prosperenergy`. It records Make zone `us2.make.com`, organization `5514778`, and team `1495551`. The remembered scenario IDs are `5301130` (“Add new setter GHL”), `5594865` (“Delete Setter”), and inactive proof scenario `5136889` (“Prosper Quote Intake - Internal Proof”). Those identifiers are lookup references, not authority to run a scenario.

That snapshot records six-seat training readbacks and three Supabase/four private GitHub memory-mirror record checks. It is stronger historical evidence than mere installed-tool names, but remains an August snapshot. September 23 live tool state must be checked independently. Grok Bot's isolated cloud runtime cannot execute a Mac stdio launcher just because the path appears in its prompt; it needs the supported local-computer route or a hosted connector.

The expanded connection notes also identify Ramp read-only tooling, OpusClip, Firecrawl, Exa, Context7, Composio, Kapture/macOS tools, Airops/Tasks, and optional hosted connectors. Treat Ramp as financial evidence access, OpusClip as media editing, Firecrawl/Exa as research acquisition, Context7 as developer documentation, and Composio as a fallback integration directory where a dedicated route is missing. A saved connected state for any of these is not current authentication proof. Historically disabled SMS/Telnyx, WhatsApp-send, and certain creative routes must not be reactivated from this source inventory.

The May 11 Monday/GHL connection map assigns Monday the operational sales/install/rep-activity boards and GHL its native contact/opportunity/calendar workflows. It recommends native workflow capabilities first and adapters for field translation, deduplication, retries, and unsupported cross-system steps. The board counts and webhook absence in that May map are historical. In particular, a later Make/Monday webhook record can coexist with a May API inventory that showed no registered board webhooks.

GitHub is also a memory/bootstrap mirror in this system: `prosper-brain/agent-bootstrap` carries role/control files; `craigmode-shield/docs/fleet` carries fleet mirrors; Mission Control has its own persona definitions. Repository visibility and a mirror commit do not mean each agent has loaded the change. A dated display labeled “current” remains subject to source age and Craig's latest instruction.
