---

name: writing-requirements
description: Interpret a writing request and convert it into explicit, actionable writing requirements, including consequential authorship intent and reference roles needed by downstream grounding and authoring-authority decisions. Use before gathering content or drafting whenever a new written artifact is requested or an existing artifact is substantially reworked.
---

# Writing Requirements

Determine exactly what the requester expects from the written artifact.

Do not gather supporting content or begin drafting in this stage.

Capture consequential authorship intent and source-role expectations, but do not decide final authoring permission or writing readiness here.

## Inputs

Use all request context already available, including:

* the current request;
* relevant conversation context;
* explicitly referenced examples or standards;
* existing artifact instructions, if revising something.

Do not ask for information that is already available.

## Output

Write the requirements to:

`.writing/<artifact-name>/requirements.md`

Use the canonical structure from:

`templates/artifact/requirements.md`

Each requirement must be independently understandable and assigned a stable ID such as `RQ-01`.

## What to identify

Capture only requirements that materially affect the artifact.

These can include:

* **Communicative goal** — what the artifact should accomplish.
* **Audience** — who the artifact is for when that affects content or writing.
* **Subject and scope** — what the artifact covers and relevant boundaries.
* **Writing form** — artifact, genre, or delivery medium when specified or inferable.
* **Situation / exigence** — why the artifact is needed when that matters to its purpose.
* **Required content** — information, topics, questions, decisions, visuals, or other material that must appear.
* **Explicit constraints** — length, page count, structure, format, deadline-sensitive wording, required sections, or prohibited content.
* **Authorship and grounding expectations** — whose real position, experience, decision, or perspective the artifact represents; whether the requester has delegated creative choices and at what level when consequential; whether the requester expects faithful transformation, substantive improvement, correction, adaptation, or some combination; and which requester-owned facts, experiences, decisions, or claims must not be silently invented.
* **Reference intent** — when the requester provides or names a reference, record what aspect of that reference should influence the artifact.

These are analytical dimensions, not mandatory fields. Do not create empty requirements merely to cover every category.

## Authorship intent

Some requests inherently delegate creative authorship. When the requester clearly asks for fiction, imaginative copy, a hypothetical scenario, or another explicitly creative artifact, unspecified creative choices do not automatically require clarification. Do not force the requester to define every character, image, example, metaphor, or stylistic choice when creative authorship is already inherent in the task.

Creative authority does not authorize invention of the requester's real personal history, real measurements, real experiment results, actual customer behavior, personal experience presented as real, quotations presented as real, organizational decisions, or other factual claims represented as true.

Some requests imply limited rather than broad authorship, such as requests to rewrite without changing substance, use material as relevant information, make material clearer, or turn notes into a report. Record the consequential boundary when it matters.

Record the requester's stated or clearly implied intent. The downstream Authoring Contract combines it with Grounding to decide what the Writer may actually add, infer, verify, correct, or creatively invent.

## Requirement formulation

Convert the request into concrete requirements rather than copying the request verbatim.

Good requirement:

`RQ-03: Keep the executive memo within three pages.`

Weak requirement:

`RQ-03: Length.`

Good requirement:

`RQ-05: Use the supplied design document as a reference for abstraction level and section organization, not as a factual source.`

Weak requirement:

`RQ-05: Follow the reference.`

A requirement should state enough for the Content Grounding and Writer stages to act without reconstructing the original conversation.

Do not convert uncertainty about available information into an artificial writing restriction at this stage. Record a clear requester requirement even when it is not yet known whether Grounding can supply the necessary information; Grounding and the Authoring Contract determine whether it is ready to fulfill.

## Reference handling

A reference can serve different purposes.

Examples:

* authoritative source requiring strong fidelity;
* factual or evidential source;
* structural example;
* writing-style example;
* genre convention;
* policy or standard;
* visual reference;
* terminology source;
* technical or example material that should be inspected rather than presumed immutable or correct.

Determine the intended role from the request.

A supplied reference is not automatically authoritative or immutable.

Do not assume that every reference is a factual source.

If the requester says what to take from the reference, record that directly.

When the requester supplies material as an example, relevant information, draft, or starting point, record the intended relationship to that material rather than assuming verbatim preservation.

If the requester explicitly requires exact preservation, record that constraint.

If the intended role is consequential and unclear, clarify it.

The Content Grounding stage is responsible for examining the reference and deriving the requested information.

## Inference

Infer requirements when they follow clearly from the request or surrounding context.

Do not force the requester to specify things such as tone, structure, word count, or voice when they are unnecessary or can be safely derived later from artifact type and applicable standards.

Record an inferred requirement only when it meaningfully constrains downstream work.

Safe inference of a writing requirement is different from permission to invent the content that would satisfy it. Requirements may infer that a beginner guide needs understandable, usable examples, or that a formal report needs a coherent structure, when that follows naturally from the artifact type. This stage does not thereby authorize unsupported factual content.

Do not infer unnecessary restrictions merely because the requester did not explicitly authorize every normal writing choice.

Do not invent preferences merely to make the brief appear complete.

## Clarification

Ask for clarification only when all of the following are true:

1. the information is unresolved;
2. it materially affects the artifact;
3. different plausible interpretations would produce meaningfully different outputs;
4. the answer cannot be safely determined from available context.

In this stage, clarification should primarily resolve the requester's intent, scope, authorship expectations, or consequential reference role. Do not ask merely because factual or content information may be missing if the requirement itself is already clear.

Missing evidence, missing user-owned facts, verification needs, and source conflicts discovered later should be recorded by Grounding and resolved through the downstream Authoring Contract unless they also make the requirement itself ambiguous.

Do not ask the requester to specify ordinary creative or structural choices when the request already delegates them.

Otherwise proceed with the best-supported interpretation.

If clarification is needed, ask the smallest question that resolves the ambiguity.

After receiving the answer, update the requirement table and continue.

## Updating requirements

Requirements can change when:

* the requester adds or changes instructions;
* a referenced source resolves an intentionally open requirement;
* Content Grounding or the Authoring Contract discovers a consequential conflict, missing intent, or source-role issue that requires the requester to clarify or change the task;
* later work reveals that an existing requirement was interpreted incorrectly.

Preserve stable requirement IDs where possible.

Modify the requirement instead of creating duplicate or contradictory entries.

If a requirement is superseded, mark that explicitly rather than silently leaving conflicting instructions.

## Handoff

This stage is complete when the requirements are sufficiently clear for Content Grounding to determine what information the final artifact needs.

Where consequential, `requirements.md` should also make clear:

* the requester's authorship intent;
* creative latitude already granted by the request;
* fidelity or correction expectations for supplied material;
* intended reference roles.

Do not require every task to contain such requirements.

The next stage receives:

`requirements.md`

It should not need to reread the entire conversation to understand the writing task.
