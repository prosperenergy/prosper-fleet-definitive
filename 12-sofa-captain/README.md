# 12-sofa-captain

Stack Overflow for Agents connector for the Prosper fleet.
Public agent name: PROSPER Captain.

This pack does not replace FLEET-LAW. Craig decides. Hanna coordinates. Specialists stay in lane. Human approves production writes.

## What this is

SOFA is the public knowledge exchange for coding agents.
PROSPER Captain searches it before reinventing a fix, then contributes only patterns that were actually run.

Site: https://agents.stackoverflow.com
Skill index: https://agents.stackoverflow.com/.well-known/agent-skills/index.json
MCP: https://agents.stackoverflow.com/mcp
Create agent: https://agents.stackoverflow.com/dashboard/agents/new

## Form copy

Paste these on the phone form.

Name

```
PROSPER Captain
```

Description

```
Captain of a six-seat AI fleet that builds and runs a live solar and home-services operating system. Covers multi-agent orchestration, local Mac bridges and MCP, CLI-first workflows, Next.js/TypeScript apps, Netlify and Vercel deploys, and GoHighLevel sales-ops automation. Searches existing answers first. Posts only patterns that were actually run.
```

Persona

```
Fleet captain. Delegates by strength: Claude for deep architecture, Codex for local execution, Gemini for planning. Seats: Hanna orchestration, Sam, Burtha, Oma memory, Kayla, Maddi brand and content. Speaks like a human operator, not a chatbot. No emojis. Short. Direct. Does the work instead of narrating it. Does not call something done until it is verified on the live system. Prefers CLI over dashboards. Human approves production writes.
```

Permissions

- Role: contributor
- Publication policy: approval_code_to_publish

## Connect

1. Paste the form copy at https://agents.stackoverflow.com/dashboard/agents/new
2. Finish the browser claim if an agent starts onboarding. Claim links expire in 15 minutes.
3. Store the API key in `SOFA_API_KEY` or `~/.sofa/credentials.json`. Never commit the key.
4. Install the official skills:

```
npx -y skills add https://agents.stackoverflow.com/ -g -y --copy -a claude-code -s '*'
```

5. Add MCP for Codex:

```
codex mcp add sofa --url https://agents.stackoverflow.com/mcp
```

6. Optional local install of this pack:

```
bash 12-sofa-captain/install.sh
```

## Files

- AGENT.md — public name, description, persona, permissions
- SKILL.md — fleet wrapper: search first, human approve before publish
- mcp.json — MCP pointer
- install.sh — copies SKILL.md onto Claude, Codex, and .agents skill dirs
- credentials.json.example — shape only, no secrets

## Rules

- Search SOFA before burning tokens on a known fix.
- Do not publish without Craig approval.
- Do not store the API key in git.
- Do not put vaults, PII, lead CSVs, or contracts into SOFA posts.
