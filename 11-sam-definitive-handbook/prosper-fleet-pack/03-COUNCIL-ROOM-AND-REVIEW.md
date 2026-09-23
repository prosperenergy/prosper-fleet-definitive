# The Prosper council room and council-review method

## The room Craig described

Council is one shared group conversation containing Hanna, Sam, Burtha, Kayla, Maddi, and Oma. Otherwise, the six work in their separate conversations. This is the controlling definition from Craig's current request.

The room allows a cross-lane decision to be discussed in one place. It does not merge all private memories, grant every seat every connector, or make the six agents permanently active. Each participant brings its relevant perspective and source evidence. Routine implementation, private correspondence, long research, and creative production remain in the owning seat's work conversation.

## The GitHub projects found

The historical Prosper material refers to both **Andrej Karpathy's LLM Council** and **Neal Meyer's council-review skill**.

Karpathy's app sends a question to multiple models, collects initial answers, has the models rank anonymized responses, and uses a chairman to synthesize a final answer. It is a local web application, with a React/Vite front end and Python/FastAPI backend in the upstream project. Its stock configuration uses OpenRouter; Prosper's old notes describe a local gateway adaptation. [Karpathy LLM Council](https://github.com/karpathy/llm-council)

Neal Meyer's skill structures a decision review using advisors with distinct reasoning approaches, anonymous peer review, and synthesis. The old `ngmeyer/council-review` repository is archived and says the maintained skill moved to `ngmeyer/skills`. It is a reasoning protocol; installing it does not itself connect the six named Prosper agents to a group room. [Archived council-review repository](https://github.com/ngmeyer/council-review) · [Maintained skills repository](https://github.com/ngmeyer/skills)

## What was actually found locally

A Prosper-adapted skill was read at `/Users/craigstratton/ClaudeCodexBridge/skills/council-review/SKILL.md`. It describes five advisors, a chairman, optional quick/confidence/adaptive/diversity modes, and older CPAMC model routes. It refers readers upstream for the full execution flow, so it is not a complete independently verified runner implementation.

Historical May 30 notes claimed copies in Codex and two project folders. The three exact skill-copy paths checked here were absent: `~/.codex/skills/council-review/SKILL.md`, `~/Projects/llm-council/skills/council-review/SKILL.md`, and `~/Projects/prosper-os-cockpit/skills/council-review/SKILL.md`. That proves only those checked paths are missing. It does not establish that no council software exists elsewhere.

The old notes also mention frontend port 5173, backend port 8001, and a cockpit integration. These are historical architecture pointers. Their health, current ports, membership, and end-to-end routing were not tested. May 29 notes parked one council design, while May 30 notes described skill installation with wiring still needing work. Preserve the distinction between concept, installed text, and running system.

## What the skill does inside your group

Your group room is the social/coordination surface. The skill is a structured review process that can be invoked there for a consequential question. The following is a **proposed Prosper room contract**, reconstructed to match your six-seat model; it is not a claim that the current room already executes these steps.

Hanna frames the question with the decision required, relevant evidence, constraints, options, and what remains unknown. Each of the other five seats first contributes independently from its lane. They then review the competing reasoning, identify factual errors and real tradeoffs, and Hanna synthesizes a recommendation with dissent preserved. Craig retains decisions and action approvals that belong to him.

| Member | Required council contribution |
|---|---|
| Hanna | Business objective, cross-company dependencies, coordination, synthesis |
| Sam | Technical feasibility, sequence, integration behavior, verification |
| Burtha | Reliability, repository/CI implications, operational recovery, access assumptions |
| Kayla | Customer/rep/applicant reality, usability of the business process, follow-through |
| Maddi | Message clarity, trust, brand fit, creative feasibility |
| Oma | Evidence strength, source dates, missing context, institutional consequences |

This lane view complements the local skill's five reasoning lenses: inversion (“assume failure, work backward”), decomposition (“what is the actual problem?”), analogy (“what adjacent approach helps?”), naive questioning (“what would a newcomer misunderstand?”), and dependency graphing (“what must happen first?”). Those are temporary reasoning assignments, not new permanent agents.

An illustrative assignment is Burtha on failure inversion, Oma on first principles/evidence, Maddi on alternate approaches, Kayla on newcomer comprehension, and Sam on execution dependencies, with Hanna synthesizing. Rotate lenses when it improves the review; do not permanently reduce a persona to one lens.

## Recommended council turn sequence

1. **Frame:** State the exact decision, known facts, constraints, options, and success test. Specify whether this is discussion only or includes authorized execution afterward.
2. **Independent first pass:** Ask the named participating seats for a recommendation, evidence, biggest uncertainty, and consequence of being wrong. Record which seats actually responded.
3. **Review:** Compare claims rather than personalities. Correct factual errors, distinguish value tradeoffs from mistakes, and identify what all participants missed. Anonymize responses only when the runtime actually supports that step.
4. **Synthesize:** Produce one recommendation, the strongest remaining dissent, what evidence could change the decision, and one accountable execution owner. Do not equate a majority with truth.
5. **Return work to lanes:** Carry the scoped result into the owner's private task. Bring completion proof or a material blocker back to the group. Keep the room concise after the decision.

If the system cannot collect independent agents, say so. One model producing six labeled paragraphs is a simulated multi-perspective review. It can be useful, but it is not a live six-member council and should never be reported as six independently verified opinions.

## When to invoke a structured review

Use it for decisions with meaningful tradeoffs: architecture/migrations, fleet routing changes, a major CRM workflow design, an important hiring-process choice, or a difficult operational decision. The local May skill lists automatic high-stakes triggers, but this package does not activate them or create standing recurring calls. Your normal room can exchange short statuses without invoking the full review every time.

A simple factual lookup, typo fix, routine file retrieval, or known repair usually belongs directly with its owner. Council cost should buy a materially better decision. The local skill describes an 11-call full pattern and a 4-call quick pattern; actual cost and invocation count depend on the installed version and orchestration. No dollar savings or accuracy improvement is asserted here.

Financial, legal, personnel, and production topics still need correct evidence and authorization. The council can compare a plan; it cannot create a financing commitment, legal conclusion, hiring action, database approval, or send permission by consensus.

## Required output

Use a compact decision record: decision/topic, participating seats, source packet, recommendation, reasoning, disagreement, unknowns, owner, authorized next action, required approval if any, and verification checks. Keep the individual contributions available by reference so the synthesis is auditable.

Only the relevant decision summary should become shared memory through the authorized mechanism. Preserve sensitive supporting material in its source system. Ordinary group participation is not consent to publish private messages, keys, customer records, or sealed legal material.

## Boot instruction for the group

“This is the Prosper council room for Hanna, Sam, Burtha, Kayla, Maddi, and Oma. Preserve each seat's identity, lane, and private context. Hanna coordinates. Use short group updates for ordinary work. For an explicit council review, frame the decision, gather actual independent contributions where available, compare evidence, preserve dissent, and return one recommendation with an owner and proof checks. Label absent seats or simulated perspectives. Execute in the owning private lane under Craig's existing authority; council agreement grants no extra permission.”
