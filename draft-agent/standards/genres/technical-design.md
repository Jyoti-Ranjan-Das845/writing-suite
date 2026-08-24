# Technical Design Standard

Apply this standard when writing or reviewing:

- High-Level Designs (HLDs);
- Low-Level Designs (LLDs);
- architecture proposals;
- system design documents;
- substantial engineering design documents.

This standard defines how technical design information should be communicated. It does not prescribe one mandatory document template.

The document structure must follow the actual design problem and the writing requirements.

## 1. Make the design understandable early

### TD-01 — State the outcome early

A reader should quickly understand:

- what is being designed or changed;
- why the change is needed;
- the proposed architectural direction;
- the important boundaries of the design.

Do not make the reader reconstruct the proposed design from implementation details scattered throughout the document.

### TD-02 — Establish scope

Make consequential scope boundaries clear.

State what the design covers and, when ambiguity is likely, what it does not cover.

Do not create a long `Non-goals` section when the exclusions are obvious or irrelevant.

### TD-03 — Give only necessary context

Explain the current state, problem, or constraint sufficiently for the proposed design to make sense.

Do not turn the design document into a history of the system.

## 2. Separate problem from solution

### TD-04 — Establish the problem before defending the design

The reader should understand the technical problem, requirement, constraint, or opportunity that caused the design decision.

Do not present architecture as an unexplained collection of components.

### TD-05 — Connect design decisions to requirements

Important architectural choices should be traceable to the requirement or constraint they address.

Explain why a component, boundary, data flow, protocol, storage choice, or operational mechanism exists when that reasoning is consequential.

Do not describe only **what** the system contains when reviewers also need to understand **why** it has that shape.

## 3. Maintain the correct abstraction level

### TD-06 — Match detail to the design level

The amount and type of detail must match the artifact's intended abstraction level.

Do not mix architectural decisions and implementation mechanics indiscriminately.

### TD-07 — High-Level Design

An HLD should primarily communicate:

- system boundaries;
- major components and responsibilities;
- important interactions;
- major data or control flows;
- external dependencies;
- trust boundaries where relevant;
- major technology or architectural choices;
- important constraints;
- significant tradeoffs;
- operational shape;
- consequential risks.

Implementation details belong in an HLD only when they materially affect an architectural decision.

Do not expand routine class, function, schema, endpoint, or algorithm details merely for completeness.

### TD-08 — Low-Level Design

An LLD should resolve the implementation details necessary to build the approved design.

Depending on the system, this can include:

- component internals;
- interfaces and contracts;
- APIs;
- schemas and data structures;
- state transitions;
- algorithms;
- validation rules;
- error behavior;
- concurrency behavior;
- persistence behavior;
- configuration;
- sequence flows;
- implementation-level failure handling;
- detailed testability considerations.

Do not repeat HLD material unless it is needed to establish context for an implementation decision.

### TD-09 — Preserve the HLD/LLD boundary

When both artifacts exist:

- HLD explains the architectural shape and design direction.
- LLD explains how that architecture will be implemented.

The LLD may refine the HLD.

It should not silently introduce architectural changes that contradict it.

## 4. Describe architecture through responsibilities and relationships

### TD-10 — Give each major component a clear responsibility

Describe what a component owns and why that responsibility belongs there.

Avoid component descriptions that merely restate the component name.

### TD-11 — Explain important interactions

Where components collaborate, make clear:

- who initiates the interaction;
- what information crosses the boundary;
- what the receiver is responsible for;
- what happens when the interaction fails, when consequential.

Do not enumerate every interaction if only a subset matters to understanding the design.

### TD-12 — Make boundaries explicit

Identify important:

- ownership boundaries;
- service boundaries;
- persistence boundaries;
- trust boundaries;
- external-system boundaries.

Clarify contracts where ambiguity at a boundary could create implementation or operational risk.

## 5. Explain data and control flow

### TD-13 — Show how important information moves

When data movement is central to the design, explain:

- where data originates;
- where it is transformed;
- where it is stored;
- where it crosses system boundaries;
- where consequential decisions are made.

### TD-14 — Distinguish data flow from control flow when necessary

Do not collapse different kinds of interaction into one vague description when the distinction matters.

Examples include:

- request execution versus asynchronous events;
- orchestration versus data movement;
- configuration flow versus runtime traffic;
- control-plane versus data-plane behavior.

## 6. Document consequential decisions

### TD-15 — Make major decisions explicit

For an architecturally significant choice, communicate:

- the decision;
- the relevant context;
- the rationale;
- important implications.

A reader should not have to infer the actual decision from a comparison table or discussion.

### TD-16 — Explain alternatives when they matter

Include alternatives when understanding why they were rejected improves review or prevents the same debate from being repeated.

For each meaningful alternative, explain the consequential tradeoff.

Do not manufacture alternatives merely because design documents conventionally contain an `Alternatives` section.

### TD-17 — Discuss tradeoffs, not universal superiority

Technical choices normally optimize some properties at the expense of others.

State the relevant tradeoffs directly.

Avoid claiming that a design is simply:

- better;
- scalable;
- flexible;
- robust;
- future-proof;

without explaining what property improves, under what conditions, and at what cost.

## 7. Make constraints and invariants visible

### TD-18 — State constraints that shape the design

Capture technical or operational constraints when they materially influence architecture.

Examples can include:

- latency;
- throughput;
- deployment model;
- compatibility;
- tenancy;
- portability;
- consistency;
- cost;
- security;
- regulatory boundaries;
- existing platform constraints.

Do not list generic non-functional requirements that do not affect the design.

### TD-19 — State important invariants

If correctness depends on something always remaining true, make that condition explicit.

Examples:

- one component remains the source of truth;
- an operation is idempotent;
- callers never receive provider credentials;
- only one service mutates a particular state.

An invariant should be testable or operationally meaningful where practical.

## 8. Describe failure behavior where it matters

### TD-20 — Design the failure path

For consequential dependencies and workflows, explain relevant failure behavior.

Depending on the system, this can include:

- timeout behavior;
- retries;
- fallback;
- partial failure;
- duplicate processing;
- unavailable dependencies;
- invalid input;
- state recovery;
- degradation behavior.

Do not enumerate hypothetical failure modes that have no meaningful effect on the design.

### TD-21 — Identify unresolved risks honestly

Distinguish between:

- a resolved design decision;
- an accepted risk;
- an assumption;
- an open question;
- future work.

Do not present an unresolved design issue as settled merely to make the document appear complete.

## 9. Cover operational concerns when architecturally relevant

### TD-22 — Include operability when it changes the design

Address topics such as:

- observability;
- deployment;
- rollout;
- rollback;
- migration;
- capacity;
- configuration;
- ownership;

when they materially influence how the system must be built or operated.

Do not add boilerplate operational sections when they contribute no design information.

### TD-23 — Make rollout and compatibility explicit for risky changes

When a design changes an existing system, explain consequential:

- migration steps;
- backward compatibility;
- coexistence;
- staged rollout;
- rollback behavior.

The level of detail should match the risk of the change.

## 10. Cover security and privacy as design properties

### TD-24 — Identify meaningful trust boundaries

When security or privacy is relevant, communicate:

- who can access what;
- where trust changes;
- what credentials or sensitive data cross boundaries;
- where authorization or validation occurs.

Do not add generic security statements that do not describe the actual design.

## 11. Use diagrams to clarify architecture

### TD-25 — Give every diagram a purpose

Use a diagram when relationships, flow, topology, sequence, or boundaries are easier to understand visually than in prose.

A diagram should answer a specific design question.

### TD-26 — Match diagram abstraction to document abstraction

An HLD diagram should emphasize architectural structure and relationships rather than implementation noise.

An LLD diagram may show detailed sequences, states, interfaces, or internal component behavior.

### TD-27 — Explain diagrams in prose

A diagram supplements the written design.

The surrounding text should explain the important takeaway, decision, or flow represented by the diagram.

Do not force the reader to derive the design solely from arrows and boxes.

### TD-28 — Keep diagram semantics unambiguous

Use consistent names between diagrams and prose.

Where arrows, line styles, colors, or boundaries carry special meaning, make that meaning clear.

Do not include decorative components that do not contribute to understanding the design.

## 12. Keep evidence close to claims

### TD-29 — Support consequential claims

When a design choice depends on evidence such as:

- benchmarks;
- production measurements;
- experiments;
- incidents;
- capacity estimates;
- external limitations;

place the relevant evidence near the decision or reference it precisely.

Do not use vague claims such as `this will improve performance` when the design depends on a measurable assumption.

### TD-30 — Distinguish facts from projections

Make it clear whether a number or behavior is:

- observed;
- measured;
- estimated;
- assumed;
- targeted.

Do not present estimates as measured results.

## 13. Optimize for technical review

### TD-31 — Make consequential review questions visible

A strong design document should make it possible for reviewers to identify:

- what decisions are being proposed;
- what assumptions those decisions depend on;
- what tradeoffs were made;
- where risk remains;
- what is still unresolved.

Do not bury the decisions that need review beneath explanatory material.

### TD-32 — Do not optimize for apparent completeness

A design document is not stronger because it contains more sections.

Include detail when it:

- establishes a requirement;
- explains a decision;
- defines a contract;
- resolves ambiguity;
- exposes a tradeoff;
- identifies a risk;
- enables implementation;
- enables review.

Remove material that does none of these.

## 14. Preserve terminology and traceability

### TD-33 — Use canonical system names

Use the same component, interface, entity, and concept names throughout:

- prose;
- diagrams;
- tables;
- examples.

Do not rotate terminology for stylistic variety.

### TD-34 — Preserve traceability when useful

When requirements, decisions, components, or interfaces already have stable identifiers, use them where they materially improve review or implementation traceability.

Do not introduce identifiers solely to make the document appear formal.

## Review expectation

When reviewing a technical design, prioritize defects that affect:

1. correctness;
2. architectural understanding;
3. decision clarity;
4. boundary or contract clarity;
5. implementation feasibility;
6. operational safety;
7. reviewability.

Do not flag a missing conventional section merely because another design document contains one.

The question is whether the information required to understand, evaluate, and implement the design is present at the correct level of abstraction.
