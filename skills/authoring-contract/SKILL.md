---
name: authoring-contract
description: Resolve the writing requirements and grounded content into an explicit authoring-permission and readiness contract before drafting. Use after Content Grounding and before Writer to determine what the Writer may use, infer, verify, correct, or creatively invent, and whether consequential unresolved needs require verification, requester input, or conflict resolution.
---

# Authoring Contract

Determine what the Writer is authorized to do with the requirements and grounded content before drafting begins.

This stage is a **permission and readiness gate**.

It does not gather broad context, draft prose, rewrite sources, or perform the final review.

The Authoring Contract answers:

> Given what the requester wants and what is currently known, what may the Writer responsibly do?

## Inputs

Read:

- `.writing/<artifact-name>/requirements.md`
- `.writing/<artifact-name>/grounding.md`

Use the requester’s authorship or creative intent already captured in `requirements.md`.

Use the source roles, evidence, qualifications, gaps, and conflicts recorded in `requirements.md` and `grounding.md`.

Do not reconstruct the task from conversation history when the durable artifact state is sufficient.

## Output

Write the contract to:

`.writing/<artifact-name>/authority.md`

Use the canonical structure from:

`templates/artifact/authority.md`

Keep the contract compact.

Record only decisions that materially affect:

- factual integrity;
- requester authorship;
- creative freedom;
- use of ordinary domain knowledge;
- correction of supplied material;
- verification needs;
- ability to complete the requested artifact honestly.

Do not create authority rows for ordinary wording, organization, transitions, formatting, or other routine writing choices unless the requester explicitly constrained them.

## Core distinction

Keep these questions separate:

- **Requirements:** What must the artifact accomplish?
- **Grounding:** What do we currently know, and from what source?
- **Authoring Contract:** What may the Writer do with what is known or missing?

Grounded content is not the same thing as authoring permission.

Missing grounded information is not automatically a prohibition on all useful writing.

Creative permission is not permission to fabricate real-world facts.

## Source roles

When consequential, preserve or resolve the role of supplied material.

Use only the level of distinction needed for the task.

Common roles include:

- **Authoritative source** — content whose substance must not be materially changed without explicit permission or resolution.
- **Factual/reference source** — evidence the artifact may rely on, but not necessarily immutable wording or implementation.
- **Structural reference** — guides organization or document shape rather than factual content.
- **Style reference** — guides voice or presentation rather than factual content.
- **Technical/example material to inspect** — informs the artifact but may require correctness checking rather than blind preservation.

Do not assume that requester-supplied material is automatically authoritative, immutable, or correct.

Respect any explicit requester instruction about preservation, correction, adaptation, or reference use.

## Authority states

For each consequential information or authorship need, assign one of these states.

### `Ready`

Use when the Writer may proceed without further requester action.

This can include:

- information already grounded;
- conclusions safely and transparently derived from grounded information;
- ordinary domain knowledge that the contract determines may be used within the task’s scope;
- routine explanatory material;
- non-consequential mechanical corrections;
- other content whose use does not create unsupported requester-specific facts or materially alter supplied meaning.

When `Ready` depends on domain augmentation or a correction, record the boundary clearly.

Do not represent augmented domain knowledge as requester-provided or source-grounded evidence.

### `Verify`

Use when a consequential factual claim requires an authoritative or current source before it can be presented as settled.

Examples include:

- unstable regulatory or policy claims;
- current product or technical behavior that materially affects correctness;
- claims whose accuracy cannot responsibly be established from the available evidence.

A `Verify` item is unresolved until the required evidence is grounded.

Route the information need back to Content Grounding or the appropriate retrieval path.

Do not let Writer present an unresolved `Verify` item as established fact.

### `Ask`

Use when only the requester can supply or authorize the required information.

Typical examples include:

- personal experience;
- organizational decisions;
- internal measurements;
- actual experiment outcomes;
- intended position or opinion;
- real customer history;
- approved thresholds, owners, or commitments;
- consequential preferences that cannot be safely inferred.

Do not replace a missing requester-owned fact with plausible prose.

Ask only when the item materially affects fulfillment of the request.

### `Creative`

Use when invention is part of the artifact and creative authorship has been delegated.

Creative authority may be:

- explicit, such as a request to invent a fictional story, scenario, slogan, or example;
- inherent in a clearly creative request where unspecified creative choices are naturally delegated.

Creative authority can cover fictional:

- characters;
- events;
- dialogue;
- imagery;
- examples;
- scenarios;
- stylistic choices;
- other invented material within the granted scope.

It does **not** authorize invention of real:

- personal experience;
- measurements;
- experiment results;
- quotations;
- organizational facts;
- customer behavior;
- source claims;
- other content represented as factual.

If creative content could reasonably be mistaken for real factual evidence, require clear framing or disclosure.

Do not force unnecessary clarification for ordinary creative choices when the requester has already delegated creative authorship.

### `Conflict`

Use when the artifact cannot responsibly proceed without resolving a consequential inconsistency or authority boundary.

Examples include:

- supplied material appears materially incorrect;
- two sources materially contradict one another;
- the requester asks for a factual result that available evidence cannot support;
- completing the requested artifact would require silently changing the nature of the artifact;
- supplied authoritative material conflicts with a requested correction;
- a consequential correction would materially alter requester-supplied content and correction authority is not established.

Do not silently choose a side.

Resolve the conflict through the appropriate path:

- requester clarification;
- authoritative verification;
- requirement update;
- grounding update;
- explicit correction permission;
- or another clearly supported resolution.

Minor mechanical errors that do not affect meaning do not require `Conflict`.

## Creative and informative behavior

The suite is informative before it is creatively expansive.

Do not use creativity merely to make an underspecified artifact feel complete.

When creative authorship is delegated, give the Writer the freedom necessary to fulfill the task well.

When that freedom materially extends beyond supplied facts or could be mistaken for factual content, preserve the boundary in `authority.md` and require appropriate framing or requester-facing disclosure.

The purpose is not to suppress creativity.

The purpose is to make creativity intentional.

## Ordinary domain knowledge

Ordinary domain knowledge is different from both grounded evidence and creative invention.

It may be useful for:

- explanation;
- interpretation;
- standard implementation detail;
- safe examples;
- technical reasoning;
- completeness expected from the artifact type.

Do not automatically prohibit it merely because it was not copied from a source.

Do not automatically allow it either.

Determine whether its use is consequential.

If it can be used without asserting requester-specific facts, contradicting an authoritative source, or materially changing the requester’s supplied content, it may be authorized as `Ready`.

If it requires current or authoritative factual verification, use `Verify`.

If it would materially alter requester-owned or authoritative content, use `Conflict` or `Ask` as appropriate.

## Corrections to supplied material

Do not equate source fidelity with correctness.

When supplied material appears wrong, incomplete, contradictory, or technically unusable, first consider its source role.

### Non-consequential correction

Mechanical issues such as obvious punctuation, formatting, or equivalent local fixes that do not materially affect meaning may be authorized without requester interruption.

### Consequential correction

A correction is consequential when it materially changes:

- factual meaning;
- executable behavior;
- a decision;
- an approved value;
- source interpretation;
- requester intent.

If the requester has explicitly authorized correction or substantive improvement, the contract may permit the correction within that scope.

Otherwise, record `Conflict` and surface the issue rather than silently changing the material.

Do not preserve a consequential error merely because it appeared in a supplied reference.

Do not silently rewrite consequential requester content merely because the model believes it can improve it.

## Readiness

After resolving the consequential authority items, record the overall readiness decision.

The artifact is **Ready to write** only when:

- every consequential requirement has sufficient factual/contextual support or an authorized way to complete it;
- every required creative element has appropriate creative authority;
- no consequential `Ask` item remains unresolved;
- no consequential `Verify` item remains unresolved;
- no consequential `Conflict` item remains unresolved.

`Ready` and properly authorized `Creative` items can proceed to Writer.

Unresolved `Ask`, `Verify`, or `Conflict` items block the transition to Writer when they are necessary to fulfill the requested artifact.

Do not block drafting for minor optional information that is not necessary to satisfy the request.

## Resolution loop

The Authoring Contract may reveal that earlier stages need more work.

### If verification is needed

Return the specific information need to Content Grounding.

After new evidence is grounded, reassess the affected authority item.

### If requester input is needed

Ask the smallest question that resolves the consequential need.

Update Requirements and/or Grounding when the answer changes them.

Then reassess the Authoring Contract.

### If a source or requirement conflicts

Resolve the smallest consequential conflict.

Do not reopen unrelated requirements or sources.

### If creative authority is granted later

Record the new boundary clearly and reassess readiness.

Do not treat a later creative authorization as permission to invent unrelated factual content.

## Requirement linkage

Every consequential authority decision must identify what it applies to.

Prefer linking to:

- one or more `RQ-*` requirements;
- relevant `GC-*` grounded items;
- a source role or recorded gap when necessary.

Do not duplicate the full requirement or grounded content in `authority.md`.

Reference it.

## Minimality

Do not turn the Authoring Contract into a second requirements document or second grounding document.

A good contract records only the decisions the Writer and Reviewer need.

If all substantive content is grounded, no consequential correction is needed, and the requester has granted all necessary writing freedom, the contract may be very small.

Do not manufacture authority problems merely to populate the file.

## Handoff to Writer

This stage is complete only when the artifact is ready to draft.

The Writer receives:

- `requirements.md`
- `grounding.md`
- `authority.md`
- applicable reusable writing standards

The Writer must treat:

- `requirements.md` as the artifact obligations;
- `grounding.md` as the factual/contextual base;
- `authority.md` as the permission boundary.

The Writer may exercise useful domain reasoning, correction, examples, or creativity only within that boundary.

If an unresolved consequential authority issue is discovered during drafting, do not silently improvise around it. Return to the appropriate earlier stage and update the durable state.

## Core invariants

- Do not silently invent requester-owned facts or evidence.
- Do not confuse creative permission with factual permission.
- Do not confuse grounded evidence with permission to modify it.
- Do not confuse source fidelity with correctness.
- Do not treat ordinary domain knowledge as if it came from the requester or source.
- Do not ask the requester when the request already grants sufficient creative or structural freedom.
- Do not block writing for inconsequential missing details.
- Do not silently change a consequential supplied claim, decision, or example without sufficient correction authority.
- Keep the contract traceable, compact, and actionable.
