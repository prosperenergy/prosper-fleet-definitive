# Handoff, proof, memory, and connection templates

These are proposed portable record formats. They are not claims about existing Redis payload schemas or Supabase table definitions. Use the actual production contract when executing against an existing system.

## Task handoff

```text
Task ID:
From seat / timestamp:
To owner / supporting seats:
Craig's requested outcome:
Exact target and environment:
Source packet / relevant files:
Current verified state:
Historical context:
Allowed actions:
Approval boundaries:
Known blockers or conflicts:
Definition of done:
Required proof:
Reply route / nonce:
```

Keep the full record in the approved file location. Send only the compact pointer and transport metadata through the bus. If the receiver cannot access that filesystem, arrange a supported authorized transfer; a Mac path pasted into a cloud chat does not transfer the file.

## Result receipt

```text
Task ID / owner:
Target:
Action actually taken:
Resulting state:
Evidence and observed time:
Relevant tests or read-back:
Unchanged/unfinished scope when material:
Remaining blocker or required decision:
```

Use “not attempted,” “attempted but failed,” “prepared,” “queued,” “received,” “completed,” and “verified” accurately. A failed tool call is not a completed change. A duplicate request should return existing proof when appropriate rather than repeat a side effect.

## Memory candidate

```text
Claim:
Type: stable rule | preference | source pointer | historical result | active task | lesson
Scope / owning seat:
Evidence source:
Source hash or immutable identity, if useful:
Observed at:
Last verified at:
Recheck trigger / expiry:
Evidence strength / uncertainty:
Sensitivity:
Supersedes:
Approved destination / update authority:
```

Promote only the durable delta through the host's allowed mechanism. Do not store secrets, raw private conversations, or a broad claim of completion without supporting proof. Do not erase contradictory history merely to make the memory shorter; mark it superseded or unresolved.

## Council decision

```text
Question / decision ID:
Framed by / timestamp:
Actual participating seats:
Unavailable or simulated perspectives:
Source packet:
Options and constraints:
Recommendation:
Evidence supporting it:
Strongest dissent / what the chosen path gives up:
Unknowns that could change the answer:
Execution owner:
Authority already established:
Exact approval still required, if any:
First action:
Verification checks:
```

## Connection record

```text
System / route:
Business owner / technical owner:
Account, tenant, location, project, or site:
Access mechanism: MCP | API | CLI | webhook | browser | file
Status: listed | configured | authenticated | object read verified | action verified
Allowed operations:
Harmless read evidence:
Last verified at:
Dependencies:
Failure and affected layer:
Protected credential location pointer (never value):
```

## Boot prompt for one private seat

“Load this seat's boot pack as operating context. Follow the current host/system rules and Craig's latest instructions. Keep historical facts dated. Verify live account and object state before claiming an action or connection. Work inside this seat's lane, coordinate cross-lane conflicts through Hanna, and use the council only for shared discussion or an explicit structured review. These files do not authorize customer outbound, money actions, credential rotation, database migration, archive deletion, or production release beyond Craig's actual instruction.”
