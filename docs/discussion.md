# Draft Agent — Design Discussion

This document captures the design evolution from the original single-agent Writing Suite (in `backup/`) to the multi-agent Draft Agent system. It records what doesn't work in the current design, why, the architectural decisions made during the transition, and the research that informed them.

---

## 1. Why the current single-agent skill design doesn't work for multi-agent

### How the current system works

The `backup/` Writing Suite runs as one agent (Claude) switching between five phases using skill files:

1. Writing Requirements (`skills/writing-requirements/SKILL.md`)
2. Content Grounding (`skills/content-grounding/SKILL.md`)
3. Authoring Contract (`skills/authoring-contract/SKILL.md`)
4. Writer (`skills/writer/SKILL.md`)
5. Reviewer (`skills/reviewer/SKILL.md`)

The single agent loads a skill, does that phase's work, unloads it, loads the next. It writes three separate state files (`requirements.md`, `grounding.md`, `authority.md`) and the orchestration logic lives in the root `SKILL.md`.

### Flaw 1: Skills were designed for context switching, not agent boundaries

Skills exist because one agent needs to switch roles — "now I'm doing requirements work, now I'm doing grounding work." In a multi-agent system, each agent IS its role. A Reqs Agent doesn't need a skill file telling it to "not draft the artifact" because it literally cannot — it's a different agent. Loading a skill file into a sub-agent is an unnecessary indirection.

However, for the orchestrator agent that handles multiple phases directly with the user, skills remain useful for progressive context disclosure — loading phase-specific instructions only when entering that phase, rather than bloating the always-on prompt.

### Flaw 2: Three separate files create interleaving problems

The current design produces three separate files: `requirements.md`, `grounding.md`, `authority.md`. In practice, these phases loop back into each other:

- Grounding a source may reveal that a requirement was misunderstood → update requirements
- Authority may find an Ask item → ask user → user's answer changes a requirement → update requirements → re-ground → re-assess authority
- Authority may find a Verify item → send back to Grounding → Grounding finds new evidence → Authority reassesses

With three separate files, the agent must jump between files, track which file to update when, and manage cross-file consistency. In a multi-agent setup, this means either sub-agents writing to each other's files (violating ownership) or constant orchestrator-mediated file updates.

### Flaw 3: The Grounder has too much autonomous judgment

The Content Grounding skill tells the agent to "determine what information each requirement needs." This is a judgment call — the agent decides what content is needed, then goes and finds it. This is where slop enters the system:

- The agent can expand scope arbitrarily ("explain the architecture" → agent decides it also needs performance benchmarks, failure modes, scalability analysis)
- The agent can inflate gaps (recording things as "missing" that the user never asked for)
- The agent can filter important information from sources because it judged it "unnecessary"
- The agent can derive conclusions from sources that the sources don't actually support
- The user has no visibility into these judgment calls

The current skill says "do not ask the requester directly merely because information is missing" — so the Grounder makes silent decisions about what's needed and what's not, without user confirmation. Every unconfirmed judgment is a slop vector.

### Flaw 4: Authority states create dead-end labels instead of driving resolution

The Authoring Contract produces five states: Ready, Verify, Ask, Creative, Conflict. In theory, the Authority Agent resolves all non-Ready items before finishing. In practice:

- **Creative** is labeled and handed to the Writer with no plan for what the creative content should actually be. The Writer sees "Creative" and fills the space with generic AI prose because nobody planned what should go there. Creative items should be proposed (using context from Ready items), confirmed with the user, and then become Ready — not left as open-ended permission slips.

- **Conflict** is labeled but the resolution path loops between phases (Authority → ask user → update Requirements → re-ground → re-assess Authority), which is complex to manage when phases are separate agents or separate skills.

- The distinction between **Ask** (only user has this info) and **Verify** (info exists but might be wrong) matters for understanding WHY we're asking, but the action is the same — go to the user. In a multi-agent system where all user interaction goes through the orchestrator, this distinction adds complexity without changing the workflow.

### Flaw 5: No categorization or priority in requirements

The current `requirements.md` is a flat table where all requirements are treated equally — document type, content needs, constraints, style choices all sit in the same flat list. Downstream agents (Writer, Reviewer, Planner) must re-analyze every requirement to figure out what category it belongs to. This creates:

- The "curse of instructions" problem — as requirements increase, agent adherence to each one drops
- No clear priority for the Planner — it doesn't know which requirements define the document shape vs which define content vs which are hard constraints
- No separation of cross-cutting concerns (genre, style) from content-specific requirements

### Flaw 6: Human-in-the-loop is an afterthought

The current skills treat user interaction as an exception — "ask for clarification only when all of the following are true" (four conditions). The Grounder is explicitly told NOT to ask the user. The default behavior is for the agent to make autonomous judgments and only involve the user when it's stuck.

This inverts the correct priority. Every consequential judgment the agent makes is a potential slop source. The agent should propose and confirm, not decide and inform. The user should be proactively involved in confirming scope, content extraction, and authority decisions — not just consulted when the agent can't proceed.

### Flaw 7: Skills contain AI slop themselves

The skill files contain verbose, repetitive instructions with extensive negative examples ("do not do X", "do not confuse Y with Z", "do not automatically allow it either"). While thorough, this style:

- Bloats context with defensive instructions
- Creates the prompt patching anti-pattern (instructions that say "remember not to...")
- Mixes behavioral rules with procedural instructions
- Contains redundant formulations of the same concept across multiple sections

For multi-agent, instructions should be direct, concise, and focused on what the agent SHOULD do, not exhaustive lists of what it shouldn't.

### Flaw 8: Planning and grounding have a circular dependency

Planning needs to know what content is available to plan around it. Grounding needs to know what sections exist to know what content to find. As separate phases, this creates a loop — plan needs content, content needs plan. Separating them forces either an arbitrary ordering or expensive re-runs.

---

## 2. Research findings that informed the architecture

Research into multi-agent AI engineering best practices (2025-2026) produced five key findings that directly shaped the Draft Agent design.

### Finding 1: Front-load context, don't relay questions

The dominant pattern is the "Structured Brief" — give the sub-agent everything it needs upfront so it never has to ask. Anthropic's own multi-agent research system does this: each sub-agent gets "an objective, an output format, guidance on tools and sources, and clear task boundaries" in one shot. The relay round-trip cost (latency + token overhead + user friction) almost always exceeds the cost of giving more context upfront.

When questions are unavoidable, sub-agents should return ALL questions at once with defaults, not one at a time. The orchestrator batches these into a single user conversation.

**Impact on Draft Agent:** The Planner sub-agent receives all requirements and references in one structured brief. When it has unresolved items, it returns them all at once — the orchestrator batches them into one user conversation per turn, not one question at a time.

### Finding 2: Fuse planning with research (STORM's lesson)

Stanford's STORM system proved that planning should NOT be a separate phase from content gathering. The outline/structure emerges from the research process. Separating them creates the circular dependency identified in Flaw 8.

**Impact on Draft Agent:** Planning and grounding are fused into a single Planner sub-agent. The Planner reads requirements and references, and simultaneously designs the document structure AND determines what content goes where. The structure emerges from the content, not independently.

### Finding 3: Don't over-decompose into too many agents

Research shows coordination errors amplify up to 17x in unstructured multi-agent systems. The "Multi-Agent Trap" paper (2026) warns that teams build elaborate agent architectures when improved prompting on fewer agents achieves equivalent results. The surviving production pattern is 3 stages, not 6. Coordination gains plateau beyond 4 agents.

**Impact on Draft Agent:** The original 5-phase pipeline (Requirements → Grounding → Authority → Writer → Reviewer) with 5 potential sub-agents is consolidated. Grounding and Authority are absorbed into the Planner. The system has 3 sub-agents (Planner, Writer, Reviewer), not 5.

### Finding 4: Document structure as a mutable tree

TreeWriter (2025) represents documents as mutable trees where non-leaf nodes are scaffolding (goals, constraints, outlines) and leaf nodes are content. Cross-cutting concerns (tone, identity) become annotations on ancestor nodes that all children inherit. This naturally handles documents that are not just "sections and headers."

**Impact on Draft Agent:** The Planner's schema uses a part-based structure where cross-cutting requirements (Identity, Constraints) are referenced by parts but not duplicated into them. Each part serves specific requirements and inherits document-level identity and rules.

### Finding 5: JSON Schema for contracts, Markdown for content

Inter-agent handoffs should use enforced schemas for structure. The actual document content travels as markdown inside the schema envelope. OpenAI's structured outputs cookbook describes agent output schemas as "contracts between agents — analogous to API contracts in microservice architectures."

**Impact on Draft Agent:** The Planner's output uses XML-tagged structured markup for metadata (serves, specification, authority, status, notes) with free-form content within each tag. This is parseable by the orchestrator and readable by the Writer.

### Sources

- [Multi-Agent in Production 2026: 3 Patterns That Survived](https://niteagent.com/blog/multi-agent-production-2026/)
- [Anthropic: How We Built Our Multi-Agent Research System](https://www.anthropic.com/engineering/multi-agent-research-system)
- [Stanford STORM Research Project](https://storm-project.stanford.edu/research/storm/)
- [TreeWriter: AI-Assisted Hierarchical Planning and Writing](https://arxiv.org/abs/2601.12740)
- [OpenAI Structured Outputs for Multi-Agent Systems](https://developers.openai.com/cookbook/examples/structured_outputs_multi_agent)
- [The Multi-Agent Trap (Towards Data Science)](https://towardsdatascience.com/the-multi-agent-trap/)
- [Why Your Multi-Agent System is Failing: 17x Error Trap](https://towardsdatascience.com/why-your-multi-agent-system-is-failing-escaping-the-17x-error-trap-of-the-bag-of-agents/)
- [Building Multi-Agent Systems with Context Engineering (Vellum)](https://www.vellum.ai/blog/multi-agent-systems-building-with-context-engineering)

---

## 3. Architectural decisions

### Decision: Requirements are simple records, not stateful items

**Why:** Requirements capture what the user wants. They are recorded facts, not work items with progress. The user says "write a technical blog" — that's a requirement. It doesn't have a state (pending, in-progress, ready). It just exists.

State tracking belongs to downstream phases — the Planner tracks whether each part of the schema is resolved or unresolved. Requirements are inputs, not processes.

**Result:** Requirements table has four columns: `ID`, `Requirement`, `Type`, `References`. No State column. Three types: Identity, Constraint, Topic.

```
| ID    | Requirement                          | Type       | References              |
|-------|--------------------------------------|------------|-------------------------|
| RQ-01 | Technical blog post for developers   | Identity   | —                       |
| RQ-02 | Must be under 1500 words             | Constraint | style-guide.md          |
| RQ-03 | Follow Amazon 6-pager structure      | Identity   | amazon-6-pager template |
| RQ-04 | Cover Q2 revenue growth              | Topic      | revenue-q2.csv          |
| RQ-05 | Include competitive analysis section | Topic      | competitor-report.pdf   |
| RQ-06 | Formal tone, no jargon               | Identity   | —                       |
```

The `References` column holds source links, files, templates, standards — whatever the requirement points to. Identity requirements may reference genre standards (like Amazon 6-pager), channel templates, or web references. Constraint requirements may reference style guides. Topic requirements reference the data/content sources.

This is universal — it works for any document type:
- A README: Identity (repo README, developer audience), Constraint (follow existing structure), Topic (installation, API reference)
- An email: Identity (internal memo, executive tone), Constraint (under 300 words), Topic (key finding, recommendation)
- A design doc: Identity (HLD, engineering audience), Constraint (must include alternatives), Topic (architecture overview, failure modes)

### Decision: Orchestrator handles requirements directly with the user

**Why:** Omnigent sub-agents cannot talk to the user. They communicate with the parent orchestrator via `sys_session_send` / `sys_read_inbox`. Requirements gathering is fundamentally a user conversation — extracting intent, clarifying ambiguity, resolving genre/channel selection. Routing this through a sub-agent adds relay complexity for no benefit.

**Result:** The orchestrator uses a skill (`skills/requirements/SKILL.md`) that tells it how to record requirements. The skill links to `standards-registry.md` for genre/channel resolution. If the user asks for a genre that doesn't exist in the registry, the orchestrator resolves it directly with the user.

### Decision: Fuse Planning, Grounding, and Authority into one Planner sub-agent

**Why (Planning + Grounding):** Planning and grounding have a circular dependency — the plan needs content, content needs the plan. Stanford's STORM system proved that fusing research and planning eliminates this loop. The Planner reads requirements and references, and simultaneously designs the document structure AND determines what content goes where. The structure emerges from the content, not independently.

**Why (+ Authority):** Authority is a check on grounding output — "is this content ready? is it conflicting? does it need user input?" When the same agent does grounding, the authority check happens inline. The Planner naturally encounters every authority situation as it works:
- It finds content for a part → marks it Resolved
- It can't find content → marks it Unresolved with a note (gap)
- Two sources contradict → marks it Unresolved with a note (conflict)
- The requirement asks for invented content → records specific creativity boundaries in the authority tag

The Planner's prompt includes the authority rules (what counts as creative, what level of invention is allowed, how to distinguish creative permission from factual permission). These rules — currently in the authoring contract skill — become part of the Planner's instructions.

**Result:** One sub-agent (Planner) replaces three separate phases (Grounding, Authority, Planning). The pipeline goes from 5 phases to 3 stages.

### Decision: The Planner produces a document schema with tagged parts

**Why:** The Planner's output needs to be structured enough for the orchestrator to parse (identify unresolved items) and rich enough for the Writer to act on (know exactly what to write). A mutable part-based structure with XML tags gives both: machine-parseable metadata with free-form content within each tag.

**Result:** The schema is a sequence of `<part>` elements. Each part has five tagged fields:

**`<serves>`** — Comma-separated requirement IDs this part fulfills. Every requirement ID must exist in requirements.md. Every requirement should appear in at least one part's serves tag.

```xml
<serves>RQ-01, RQ-03, RQ-07</serves>
```

**`<specification>`** — Bulleted list of instructions for the Writer. Each bullet is one specific, actionable instruction about what content to include and how to use it. Not vague ("discuss revenue") but precise ("present Q2 revenue from revenue-q2.csv, compare QoQ, frame as growth narrative"). When a previously unresolved item gets resolved, the resolution becomes a new bullet added explicitly.

```xml
<specification>
- Present Q2 revenue figures using exact numbers from revenue-q2.csv
- Use $4.2M as the total figure (confirmed — report's $4.5M was a projection)
- Break down by top 3 product lines: Cloud, Enterprise, Developer Tools
- Compare quarter-over-quarter growth (Q1 vs Q2)
- Frame as growth narrative, not raw data dump
- Include a table showing revenue by product line
- Open with headline number before breakdown
</specification>
```

**`<authority>`** — Bulleted list of permission boundaries for the Writer in this part. Each bullet states what the Writer may or may not do. Four prefixes:
- `FACTUAL:` Must use source data exactly as specified. No invention.
- `DOMAIN:` May use ordinary knowledge to explain, contextualize, interpret. Doesn't need a source.
- `CREATIVE:` May invent within this scope. Prose choices, framing, examples.
- `PROHIBIT:` Must not do this. Hard boundary.

```xml
<authority>
- FACTUAL: Use exact figures from revenue-q2.csv only. Do not round or estimate.
- FACTUAL: The $4.2M figure is confirmed actual revenue. Do not present $4.5M from the report.
- DOMAIN: May explain standard financial terms (YoY, QoQ) without sourcing.
- CREATIVE: May choose narrative framing — story-led, data-led, or comparison-led.
- CREATIVE: May write transitions and contextual sentences connecting data points.
- PROHIBIT: Do not extrapolate future quarters from this data.
- PROHIBIT: Do not compare against competitors here (covered in Part 4).
</authority>
```

**`<status>`** — One word: `Resolved` or `Unresolved`. No explanations (those go in notes).

```xml
<status>Resolved</status>
```

**`<notes>`** — When Unresolved: bulleted list of questions/issues needing resolution. When Resolved after being previously Unresolved: keeps the resolution record prefixed with `RESOLVED:` so the Writer can see what was clarified and why. When Resolved with no prior issues: empty.

```xml
<notes>
- RESOLVED: User confirmed $4.2M from CSV is correct. Report's $4.5M was year-end projection.
- RESOLVED: Top 3 product lines by revenue: Cloud, Enterprise, Developer Tools.
</notes>
```

Complete example of a part:

```xml
<part id="3" title="Revenue Analysis">

<serves>RQ-03, RQ-07</serves>

<specification>
- Present Q2 revenue figures using exact numbers from revenue-q2.csv
- Use $4.2M as the total figure (confirmed — report's $4.5M was a projection)
- Break down by top 3 product lines: Cloud, Enterprise, Developer Tools
- Compare quarter-over-quarter growth (Q1 vs Q2)
- Frame as growth narrative, not raw data dump
- Include a table showing revenue by product line
- Open with headline number before breakdown
</specification>

<authority>
- FACTUAL: Use exact figures from revenue-q2.csv only. Do not round or estimate.
- DOMAIN: May explain standard financial terms (YoY, QoQ) without sourcing.
- CREATIVE: May choose narrative framing — story-led, data-led, or comparison-led.
- CREATIVE: May write transitions and contextual sentences.
- PROHIBIT: Do not extrapolate future quarters.
- PROHIBIT: Do not compare against competitors here (covered in Part 4).
</authority>

<status>Resolved</status>

<notes>
- RESOLVED: User confirmed $4.2M from CSV is correct. Report's $4.5M was year-end projection.
- RESOLVED: Top 3 product lines by revenue: Cloud, Enterprise, Developer Tools.
</notes>

</part>
```

### Decision: Planner runs in multi-turn via orchestrator relay

**Why:** The Planner will encounter unresolved items that need user input (gaps, conflicts, ambiguities). Rather than re-running the Planner from scratch, the orchestrator resumes the same Planner session with the user's answers. The Planner retains context from the previous turn and updates specific parts.

**The flow:**

```
Turn 1:
  Orchestrator → sends requirements.md + references to Planner
  Planner → reads references, builds schema, marks parts Resolved/Unresolved
  Planner → returns schema to Orchestrator

  Orchestrator reads all Unresolved notes
  Orchestrator batches all questions into one user conversation
  User answers

Turn 2:
  Orchestrator → resumes Planner with specific answers
  Planner → updates previously Unresolved parts
  Planner → adds resolved clarifications as new specification bullets
  Planner → adds resolution record to notes
  Planner → may find new unresolved items, returns again

  (repeat until all parts are Resolved)
```

**Why answers are NOT recorded as new requirements:** The user's answers to Planner questions are clarifications about execution, not about intent. "Use $4.2M, not $4.5M" is a factual resolution, not a new requirement. "Top 3 by revenue" is a specification detail. Recording these as RQ-* entries pollutes the requirements file with execution details. Instead, answers go directly to the Planner, which records them in the specification and notes of the relevant schema parts.

**Exception:** If the user's answer genuinely changes the document scope ("actually, remove all revenue sections, this should be about product features"), the orchestrator updates requirements.md and re-runs the Planner from scratch. This is rare and obvious when it happens.

### Decision: Proactive user confirmation instead of autonomous judgment

**Why:** Every unconfirmed agent judgment is a slop vector. The agent should propose and confirm, not decide and inform. The user should be proactively involved in confirming scope, content extraction, and authority decisions — not just consulted when the agent can't proceed.

This applies at every stage:
- Requirements: "Here are the requirements I derived. Confirm?"
- Planning: The Planner returns unresolved items; the orchestrator presents them to the user
- Authority: The Planner records specific creativity boundaries; the orchestrator confirms them with the user

### Decision: Writer receives full requirements + resolved schema

**Why:** The Writer needs full context to write well. It receives:
- The complete requirements.md (all requirements, not filtered)
- The fully resolved schema (all parts Resolved, with specifications and authority boundaries)
- Applicable writing standards (loaded by orchestrator based on Identity requirements)

The Writer's job is prose-level creativity — word choice, sentence structure, transitions, flow. Content decisions (what to include, what data to use, what claims to make) are all made upstream by the Planner and confirmed by the user. The fewer content decisions the Writer makes, the less slop it introduces.

---

## 4. Open design questions

### How should the Planner handle cross-cutting requirements?

Identity requirements (tone, voice, audience, genre) and Constraint requirements (length limits, format rules) apply to the whole document, not specific parts. The Planner needs to ensure these are respected globally. Current thinking: the schema has a document-level header where Identity and Constraint requirements are listed, and each part inherits them. The Writer reads the header first, then writes each part within those constraints.

### Reviewer design

The Reviewer's responsibilities, checks, and output format have not yet been redesigned for the multi-agent architecture. The current reviewer skill (`backup/skills/reviewer/SKILL.md`) and its check references (`backup/skills/reviewer/references/checks/`) need to be evaluated for what carries forward.

---

## 5. Architecture summary

```
Draft Agent (Orchestrator)
│
├── Skill: Requirements Management
│   → Loaded when recording requirements
│   → Links to standards-registry.md for genre/channel resolution
│   → Output: .draft/<artifact>/requirements.md
│
├── Sub-agent: Planner
│   → Receives: requirements.md + user-provided references
│   → Builds document schema (parts with serves, specification,
│     authority, status, notes)
│   → Grounds content from references into specification bullets
│   → Sets authority boundaries per part
│   → Returns unresolved items to orchestrator for user resolution
│   → Multi-turn via sys_session_send / sys_read_inbox
│   → Output: .draft/<artifact>/schema (document parts)
│
├── Sub-agent: Writer
│   → Receives: requirements.md + resolved schema + writing standards
│   → Reads full requirements for context
│   → Follows specification and authority per part
│   → Produces the document
│   → Output: <target-file> (the deliverable)
│
└── Sub-agent: Reviewer
│   → Receives: document + requirements.md + schema
│   → Evaluates the document against requirements and schema
│   → Output: .draft/<artifact>/review.md
│
Writer ↔ Reviewer loop:
  Orchestrator resumes Writer with review.md
  Writer revises document
  Orchestrator resumes Reviewer with revised document
  Bounded to N cycles (e.g., 3)

Runtime workspace:
  .draft/
    registry.md              ← project-level artifact index (orchestrator-owned)
    <artifact>/
      requirements.md        ← recorded requirements (orchestrator-owned)
      schema                 ← document schema (planner-produced, orchestrator-resolved)
      review.md              ← reviewer output

Deliverable:
  <target-file>              ← the actual document, at user's requested path
```

### Pipeline flow

```
1. User → Orchestrator
   Orchestrator loads requirements skill
   Orchestrator records requirements (ID, Requirement, Type, References)
   Orchestrator resolves genre/channel against standards-registry.md
   User confirms requirements

2. Orchestrator → Planner (sub-agent, Turn 1)
   Planner receives requirements.md + references
   Planner reads references, builds document schema
   Planner grounds content into specification bullets
   Planner sets authority boundaries per part
   Planner marks parts Resolved or Unresolved
   Planner returns schema to Orchestrator

3. Orchestrator resolves unresolved items with user
   Orchestrator reads all Unresolved notes
   Orchestrator batches questions into one user conversation
   User answers

4. Orchestrator → Planner (sub-agent, Turn 2+)
   Orchestrator resumes Planner with answers
   Planner updates parts, records resolutions
   Repeat until all parts Resolved

5. Orchestrator → Writer (sub-agent)
   Writer receives requirements.md + resolved schema + standards
   Writer produces the document

6. Orchestrator → Reviewer (sub-agent)
   Reviewer receives document + requirements.md + schema
   Reviewer produces review.md

7. Writer ↔ Reviewer loop (orchestrator-mediated)
   If review verdict = Revise:
     Orchestrator resumes Writer with review.md
     Writer revises
     Orchestrator resumes Reviewer with revised document
   Bounded to N cycles
```
