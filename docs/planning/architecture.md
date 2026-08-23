# Multi-Agent Architecture Definition

> Task: [#149](https://github.com/pradeepdas/vid/issues/149)
> Story: [#147 Planning](https://github.com/pradeepdas/vid/issues/147)

This document defines the overall multi-agent architecture for Draft Agent — the system that replaces the single-agent Writing Suite.

---

## 1. Architecture overview

Draft Agent is a **hub-and-spoke** multi-agent system built on Omnigent. One orchestrator agent coordinates three sub-agents. The orchestrator is the only agent that talks to the user.

```
                    ┌─────────┐
                    │  User   │
                    └────┬────┘
                         │
                         ▼
              ┌─────────────────────┐
              │   Draft Agent       │
              │   (Orchestrator)    │
              │                     │
              │  - Requirements     │
              │    management       │
              │  - User interaction │
              │  - Pipeline control │
              │  - Conflict         │
              │    resolution       │
              └──┬──────┬───────┬──┘
                 │      │       │
        ┌────────┘      │       └────────┐
        ▼               ▼                ▼
  ┌───────────┐  ┌────────────┐  ┌────────────┐
  │  Planner  │  │   Writer   │  │  Reviewer  │
  │           │  │            │  │            │
  │ - Schema  │  │ - Prose    │  │ - Evaluate │
  │ - Ground  │  │ - Format   │  │ - Checks   │
  │ - Authority│ │ - Standards│  │ - Verdict  │
  └───────────┘  └────────────┘  └────────────┘
   sub-agent       sub-agent       sub-agent
```

---

## 2. Why this architecture

### Why hub-and-spoke (not peer-to-peer)

Omnigent uses a hub-and-spoke communication model. Sub-agents can ONLY talk to their parent orchestrator via `sys_session_send` (parent → child) and `sys_read_inbox` (child → parent). Sub-agents cannot talk to each other or to the user directly.

This constraint drives the design: all user interaction goes through the orchestrator.

### Why 3 sub-agents (not 5)

The original Writing Suite had 5 phases. The initial multi-agent design proposed 5 sub-agents (one per phase). This was reduced to 3 based on:

1. **Requirements, Grounding, and Authority all need user interaction.** Since sub-agents can't talk to the user, making them sub-agents would require constant orchestrator relay — every question goes orchestrator → sub-agent → orchestrator → user → orchestrator → sub-agent. This adds complexity for no benefit. The orchestrator handles requirements directly.

2. **Planning and Grounding have a circular dependency.** The plan needs content, content needs the plan. Stanford's STORM system (2025) proved that fusing research and planning eliminates this loop. The Planner sub-agent does both.

3. **Authority is a check, not a phase.** Authority asks "is everything ready?" — it's a validation pass on grounding output. When the Planner does grounding, authority checks happen inline. No separate agent needed.

4. **Research shows over-decomposition hurts.** Coordination errors amplify up to 17x in multi-agent systems. Gains plateau beyond 4 agents. The "Multi-Agent Trap" (2026) warns against elaborate architectures when fewer agents suffice.

### Why the orchestrator handles requirements directly

Requirements gathering is fundamentally a user conversation — extracting intent, clarifying ambiguity, resolving genre/channel selection against the standards registry. The orchestrator uses a **skill** (`skills/requirements/SKILL.md`) for progressive context disclosure: the skill loads when the orchestrator enters the requirements phase, providing instructions on how to record requirements without bloating the always-on prompt.

---

## 3. Agent responsibilities

### Draft Agent (Orchestrator)

**Role:** Pipeline coordinator, user interface, requirements manager.

**Responsibilities:**
- Record requirements from user conversation (using requirements skill)
- Resolve genre/channel against `standards-registry.md`
- Launch Planner sub-agent with requirements + references
- Receive Planner output; resolve unresolved items with user
- Resume Planner with answers until all items resolved
- Launch Writer sub-agent with resolved schema + standards
- Launch Reviewer sub-agent with draft + requirements + schema
- Mediate Writer ↔ Reviewer loop (bounded to N cycles)
- Own the project registry (`.draft/registry.md`)

**Owns:**
- `.draft/registry.md` (project-level artifact index)
- `.draft/<artifact>/requirements.md`

**Skill:** `skills/requirements/SKILL.md` — loaded when entering requirements phase

### Planner (Sub-agent)

**Role:** Document architect + content grounder + authority assessor.

**Responsibilities:**
- Receive requirements.md + user-provided references
- Read references to extract relevant content
- Design document schema as a sequence of parts
- Ground content into specification bullets per part
- Set authority boundaries per part (FACTUAL / DOMAIN / CREATIVE / PROHIBIT)
- Mark parts Resolved or Unresolved
- Return unresolved items with notes explaining what needs resolution
- On subsequent turns: incorporate orchestrator-provided answers, update parts

**Receives:** requirements.md + references (Turn 1); specific answers (Turn 2+)
**Produces:** Document schema (XML-tagged parts)

**Multi-turn:** Yes — runs across multiple turns via `sys_session_send` / `sys_read_inbox` until all parts are Resolved.

### Writer (Sub-agent)

**Role:** Prose producer.

**Responsibilities:**
- Receive full requirements.md + resolved schema + writing standards
- Read specification per part (what to write, what data to use)
- Respect authority per part (what's factual, creative, prohibited)
- Apply document-level identity (tone, voice, audience) from requirements
- Apply writing standards (universal + genre + channel)
- Produce the complete document
- On review cycle: receive review.md, revise the document

**Receives:** requirements.md + resolved schema + standards (initial); review.md (revision cycles)
**Produces:** The target document file

**Multi-turn:** Yes — may be resumed with review feedback for revision cycles.

### Reviewer (Sub-agent)

**Role:** Independent evaluator.

**Responsibilities:**
- Receive the draft document + requirements.md + schema
- Evaluate against requirements, schema specifications, and standards
- Run checks (factual accuracy, consistency, readability, etc.)
- Produce a verdict (Pass / Revise / Fail) with findings
- Each finding has severity (Critical / Major / Minor)

**Receives:** document + requirements.md + schema
**Produces:** `.draft/<artifact>/review.md`

**Multi-turn:** Yes — may be resumed with revised document for subsequent review cycles.

> Note: Reviewer checks and detailed evaluation criteria are not yet redesigned for the multi-agent context. The current checks from `backup/skills/reviewer/references/checks/` need evaluation.

---

## 4. Communication model

```
Orchestrator ──sys_session_send──▶ Planner
Orchestrator ◀──sys_read_inbox─── Planner

Orchestrator ──sys_session_send──▶ Writer
Orchestrator ◀──sys_read_inbox─── Writer

Orchestrator ──sys_session_send──▶ Reviewer
Orchestrator ◀──sys_read_inbox─── Reviewer

User ◀──────────────────────────▶ Orchestrator (direct)
```

No sub-agent talks to another sub-agent. No sub-agent talks to the user. All coordination flows through the orchestrator.

### Message types

| From | To | Contains |
|------|----|----------|
| Orchestrator | Planner (Turn 1) | requirements.md content + reference file contents |
| Planner | Orchestrator | Complete schema with Resolved/Unresolved parts |
| Orchestrator | Planner (Turn 2+) | Specific answers to unresolved notes |
| Orchestrator | Writer | requirements.md + resolved schema + writing standards |
| Writer | Orchestrator | Completed document |
| Orchestrator | Reviewer | Document + requirements.md + schema |
| Reviewer | Orchestrator | review.md content |
| Orchestrator | Writer (revision) | review.md findings to address |
| Writer | Orchestrator (revision) | Revised document |

---

## 5. Data artifacts

```
.draft/
├── registry.md                  ← Project-level artifact index
│                                   Owned by: Orchestrator
│
└── <artifact>/
    ├── requirements.md          ← Recorded requirements
    │                               Owned by: Orchestrator
    │                               Format: ID | Requirement | Type | References
    │
    ├── schema                   ← Document schema (XML-tagged parts)
    │                               Produced by: Planner
    │                               Resolved by: Orchestrator (patches answers)
    │                               Format: <part> elements with serves,
    │                               specification, authority, status, notes
    │
    └── review.md                ← Reviewer evaluation
                                    Produced by: Reviewer
                                    Format: Verdict + findings table

<target-file>                    ← The deliverable document
                                    Produced by: Writer
```

### Ownership rules

- **Orchestrator** owns `registry.md` and `requirements.md` — sub-agents never modify these
- **Planner** produces the schema — orchestrator may patch resolved answers into it
- **Writer** produces the target document — reviewer never modifies it
- **Reviewer** produces `review.md` — writer reads it for revision guidance

---

## 6. Technology stack

| Component | Technology | Notes |
|-----------|-----------|-------|
| Agent framework | Omnigent | Hub-and-spoke multi-agent orchestration |
| Agent runtime | `claude` executor | All agents use Claude as the LLM |
| Inter-agent communication | `sys_session_send` / `sys_read_inbox` | Omnigent's native message passing |
| Orchestrator skills | Omnigent `load_skill` | Progressive context disclosure |
| Schema format | XML-tagged markdown | Structured metadata, free-form content |
| Requirements format | Markdown table | Simple, readable, no enforcement needed |
| Standards | Markdown files | Loaded from `standards-registry.md` |
| Workspace | `.draft/` directory | Per-project, created at runtime |

---

## 7. Design principles

1. **Human-in-the-loop first.** Every consequential judgment is confirmed with the user. The agent proposes, the user confirms. No silent autonomous decisions.

2. **Minimum viable agents.** 3 sub-agents, not 5. Each agent does one coherent job. No over-decomposition.

3. **Front-load context.** Sub-agents receive everything they need upfront (structured brief pattern). Questions are batched and returned all at once, not one at a time.

4. **Single source of truth.** Each artifact has one owner. No cross-agent file writes. No duplicate state.

5. **Prose creativity at the Writer level only.** Content decisions (what to include, what claims to make) happen upstream. The Writer exercises prose-level creativity (word choice, structure, flow) within specification and authority boundaries.

---

## Related documents

- [`docs/discussion.md`](../discussion.md) — Full design discussion with rationale
- [`docs/planning/study-skill-phases.md`](./study-skill-phases.md) — Study of current skill phases
- [`docs/planning/phase-agent-mapping.md`](./phase-agent-mapping.md) — How phases map to agents
- [`docs/planning/orchestration-flow.md`](./orchestration-flow.md) — Orchestration flow documentation
