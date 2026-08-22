---

name: writing-suite
description: End-to-end writing workflow for producing grounded, clear, concise, and review-ready written artifacts. Use when an agent needs to create or substantially revise a document, report, memo, README, email, post, or other written artifact. The suite turns the request into explicit writing requirements, grounds the required content in available sources, resolves the Writer's authority over supplied or missing information before drafting, writes using applicable standards, and independently reviews and revises the result before completion.
---

# Writing Suite

Use this suite when a task requires producing a written artifact.

The suite separates five responsibilities:

1. **Writing Requirements** — determine exactly what the artifact must accomplish.
2. **Content Grounding** — gather and prepare only the content needed to satisfy those requirements.
3. **Authoring Contract** — determine what the Writer is authorized to use, add, infer, verify, correct, or creatively invent, and whether the artifact is ready to draft.
4. **Writer** — produce and revise the artifact using the requirements, grounded content, and applicable writing standards.
5. **Reviewer** — independently evaluate the current draft and return findings. The Reviewer never edits or rewrites the deliverable.

The Authoring Contract is a permission/readiness gate. It does not draft content or replace Requirements or Grounding. It prevents both unauthorized invention and unnecessary restriction of legitimate domain or creative freedom.

Do not collapse these responsibilities into one undifferentiated generation step.

## Core workflow

```text
Request
  ↓
Writing Requirements
  ↓
Content Grounding
  ↓
Authoring Contract
  ↓
Writer
  ↓
Reviewer
  ↓
Writer revises if needed
  ↓
Reviewer
  ↓
Final artifact
```

Do not enter the Writer stage until the Authoring Contract has established that the artifact is ready to draft.

The Writer owns both initial drafting and revisions.

The Reviewer remains independent and read-only with respect to the deliverable. It writes and updates `.writing/<artifact-name>/review.md`. Continue the Writer–Reviewer loop until all required checks pass or the configured review-cycle limit is reached.

## Runtime workspace

Before starting a writing task, look for a `.writing/` directory in the current project or workspace.

If `.writing/` exists, use it.

If it does not exist, initialize it from the suite templates.

The runtime structure is:

```text
.writing/
├── registry.md
└── <artifact-name>/
    ├── requirements.md
    ├── grounding.md
    ├── authority.md
    └── review.md
```

The finished artifact remains at its requested project location. `.writing/` contains only working state for the writing process.

Do not copy source PDFs, images, webpages, repositories, datasets, or other source artifacts into `.writing/` unless the task explicitly requires a local copy. Reference sources where they already exist.

## Project registry

`.writing/registry.md` is the project-level index for artifacts managed by this suite.

Keep it tabular and minimal.

It tracks only the information needed to locate an artifact and understand its current writing state.

Use `templates/registry.md` as its canonical shape.

The root workflow/orchestrator is the sole logical owner of this registry. It creates and updates the existing row at each transition; individual stage skills do not update it.

### Registry transition contract

| Event | Stage | Review |
|---|---|---|
| Artifact initialized | `Requirements` | `Pending` |
| Requirements ready | `Grounding` | unchanged |
| Grounding ready | `Authority` | unchanged |
| Authoring Contract ready | `Writing` | unchanged |
| Draft ready for review | `Review` | unchanged |
| Reviewer returns `Needs revision` | `Writing` | `Needs revision` |
| Reviewer returns `Blocked` | `Blocked` | `Blocked` |
| Reviewer returns `Pass` or `Pass with polish` and the workflow is complete | `Complete` | corresponding verdict |

While consequential `Ask`, `Verify`, or `Conflict` items remain unresolved, the artifact must not transition from `Authority` to `Writing`. Do not use `Complete` to mean merely that a draft exists.

Keep one row per artifact. Do not use the registry as a history log.

## Artifact state

Each artifact receives its own directory under `.writing/`.

### `requirements.md`

Owned by the **Writing Requirements** skill.

Contains the explicit writing requirements derived from the request and already-available context.

Requirements must be:

* concrete enough for downstream work;
* traceable to their origin when relevant;
* free of unnecessary fields;
* updated when consequential clarification changes the task.

Use `templates/artifact/requirements.md`.

### `grounding.md`

Owned by the **Content Grounding** skill.

For each applicable requirement, record the grounded content needed by the final artifact and its source reference.

Persist derived knowledge, not unnecessary copies of source material.

If a referenced source changes how the artifact should be written rather than what it should say, record the resulting requirement and link it to the requirement that caused the reference to be examined.

Use `templates/artifact/grounding.md`.

### `authority.md`

Owned by the **Authoring Contract** skill.

Records the final authoring/readiness decisions derived from `requirements.md` and `grounding.md`, including consequential source roles and boundaries. It records whether required information is:

* ready;
* requires verification;
* requires requester input;
* requires delegated creative authority;
* or is in conflict.

It records the overall readiness decision and gives the Writer and Reviewer an explicit, durable authority boundary.

`authority.md` must remain compact. It is not another grounding dump, does not contain prose drafts, and does not itself invent or resolve missing factual evidence. Unresolved consequential authority items prevent drafting.

Use `templates/artifact/authority.md`.

### `review.md`

Owned by the **Reviewer**.

Contains the current review verdict and check results for the artifact.

The Reviewer detects and explains problems, writes and updates `review.md`, but never modifies the deliverable.

The Writer consumes these findings and performs revisions.

Use `templates/artifact/review.md`.

## Skills

Load detailed instructions only when entering the corresponding stage.

### Writing Requirements

Path:

`skills/writing-requirements/SKILL.md`

Use it to interpret the request and produce the writing requirements.

### Content Grounding

Path:

`skills/content-grounding/SKILL.md`

Use it after the requirements are sufficiently clear.

Its output must contain the content the Writer actually needs, not a broad dump of potentially relevant context.

### Authoring Contract

Path:

`skills/authoring-contract/SKILL.md`

Use it after requirements and grounding are sufficiently resolved.

Its inputs are:

* `requirements.md`;
* `grounding.md`;
* the requester’s already-established authorship or creative intent when relevant.

Its output is:

* `authority.md`.

It decides whether consequential content needs are `Ready`, `Verify`, `Ask`, `Creative`, or `Conflict`, and whether the artifact is ready for Writer.

When needed, distinguish consequential source roles such as authoritative source, factual/reference source, structural reference, style reference, and technical/example material to inspect.

### Writer

Path:

`skills/writer/SKILL.md`

Use it after requirements, grounding, and the Authoring Contract are ready.

The Writer receives:

* the writing requirements;
* grounded content;
* authoring contract;
* applicable reusable writing standards.

The Writer must operate within the authority recorded in `authority.md`.

The Writer owns document organization, drafting, and revision.

### Reviewer

Path:

`skills/reviewer/SKILL.md`

Use it on a completed draft.

The Reviewer independently selects the applicable checks, evaluates the draft, and records findings in `review.md`.

It must not edit or rewrite the artifact.

## Writing standards

Reusable writing standards live under `standards/`.

They are not task-specific context.

The categories are:

```text
standards/
├── universal/
├── genres/
└── channels/
```

* **Universal standards** apply broadly across writing tasks.
* **Genre standards** define conventions for particular artifact types.
* **Channel standards** define conventions for where writing will be delivered.

`standards-registry.md` is the canonical navigation table for available standards.

The Writer and Reviewer must use the registry to determine which conditional standards apply.

Do not load every standard by default.

## Sources of writing direction

Keep these sources distinct.

### Task-specific requirements

Come from the requester, surrounding task, or explicitly referenced material.

These are recorded in `requirements.md`.

### Grounded content

Comes from source material examined specifically to satisfy the writing requirements.

This is recorded in `grounding.md`.

### Authoring authority

Authoring authority is not another source of factual content. It records what the Writer may do with the requirements and grounded content, including permitted augmentation, correction, verification, or creative invention.

It is recorded in `authority.md`. Do not duplicate requirements or grounded content into `authority.md`.

Grounding answers “what do we know?” Authority answers “what may the Writer do?”

### Reusable standards

Come from the suite's `standards/` directory.

These describe generally reusable writing conventions and quality expectations.

Do not duplicate reusable standards into individual artifact state.

## Precedence

When writing directions conflict, use this order:

1. hard truth, fidelity, safety, legal, and policy constraints;
2. explicit current-task writing requirements;
3. requirements derived from requester-specified references;
4. channel requirements intrinsic to delivery;
5. primary genre standard;
6. universal writing standard.

Precedence determines which writing direction wins when directions conflict. It does not itself grant permission to invent, augment, or alter content; `authority.md` controls that permission. Authoring authority can never override hard truth, safety, legal or policy constraints, or an explicit requester prohibition. Do not silently resolve a consequential source or correctness conflict merely because one direction has higher precedence; use the Authoring Contract conflict handling.

Do not silently resolve a consequential irreconcilable conflict. Surface it.

## Context discipline

Keep always-loaded context small.

At each stage:

1. read the current artifact state required for that stage;
2. load the active sub-skill;
3. load only references or standards needed for the current decision;
4. follow source pointers only when deeper evidence is required;
5. write durable conclusions and authoring decisions back to the appropriate runtime artifact, including `authority.md` when applicable.

Do not rely on conversation history as the only storage for decisions that downstream stages need.

## Review loop

After the Writer produces a draft:

1. spawn or invoke an independent Reviewer;
2. run the applicable review checks;
3. write the current verdict and findings to `review.md`;
4. if all required checks pass, finish;
5. otherwise, give the findings to the Writer;
6. revise only what the findings justify;
7. review again.

The Reviewer must also verify that the artifact stayed within the final authoring authority recorded in `authority.md`.

Use a bounded revision loop. Do not repeatedly rewrite an artifact merely to optimize reviewer scores.

If unresolved blockers remain after the review-cycle limit, preserve them explicitly rather than hiding them.

## Core invariants

Across the entire suite:

* Do not invent requester-specific facts, personal experiences, measurements, evidence, decisions, quotations, source claims, or other factual content presented as real without support or authorization.
* Creative invention is allowed only when the requester has delegated creative authorship for that material, either explicitly or inherently through a clearly creative request. Do not silently treat missing factual evidence as creative permission.
* Ordinary domain knowledge, safe inference, explanatory examples, and technical corrections may be used only within the authority established in `authority.md`. Do not misrepresent them as requester-provided or source-grounded facts.
* Do not silently make a consequential correction or reinterpretation of requester-supplied material when it materially changes meaning, factual content, or an intended decision. Surface or resolve the conflict according to the Authoring Contract.
* Do not substitute fluent prose for missing substance.
* Do not silently discard uncertainty, disagreement, or important qualifiers.
* Do not ask the requester again for information already available.
* Ask the requester only when a consequential unresolved need requires requester input or when a conflict cannot be safely resolved under the established authority. Do not introduce excessive clarification.
* Keep source provenance available for grounded content.
* Keep runtime state compact and structured.
* Keep process instructions, reusable standards, and task-specific knowledge separate.
* Prefer progressive disclosure over loading the whole suite into context.
