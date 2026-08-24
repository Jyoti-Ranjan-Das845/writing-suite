---
name: requirements
description: Interpret the user's writing request and produce a complete, actionable requirements.md. Use at the start of every new artifact request, and again whenever the user substantially changes the task.
---

# requirements — establish what the artifact must be

Determine exactly what the user expects from the written artifact.

Do not gather content, design the document structure, or begin drafting here. This skill's only output is `requirements.md`.

## Procedure

1. Read the user's request and all available conversation context. Do not ask for information already present.

2. Identify every requirement that materially affects the artifact. Consider:
   - **Communicative goal** — what the artifact must accomplish for its reader.
   - **Audience** — who will read it, when that affects content or writing choices.
   - **Subject and scope** — what the artifact covers and what it explicitly excludes.
   - **Writing form** — artifact type, genre, or delivery channel when specified or clearly inferable.
   - **Required content** — topics, decisions, data, sections, or other material that must appear.
   - **Constraints** — length, format, structure, tone, prohibited content, or deadline-sensitive wording.
   - **References** — any document, URL, or material the user supplies; record the intended role (factual source, structural example, style model, authoritative source, terminology reference, or starting draft), not just the pointer.
   - **Authorship intent** — whether the artifact represents the user's real experience, position, or facts; how much creative latitude has been delegated; whether the task is transformation, improvement, adaptation, or original authorship.

   These are analytical lenses, not mandatory fields. Do not create empty requirements to cover every category.

3. Write each requirement as a concrete, actionable statement. Assign stable IDs: `RQ-01`, `RQ-02`, and so on.

   Good: `RQ-03: Keep the memo within three pages.`
   Weak: `RQ-03: Length.`

   Good: `RQ-05: Use the supplied document as a structural reference only — not as a factual source.`
   Weak: `RQ-05: Follow the reference.`

4. If a requirement is ambiguous and the ambiguity would produce meaningfully different artifacts, ask the smallest question that resolves it. Ask only when:
   - the information is unavailable from context;
   - it materially affects the artifact;
   - different interpretations produce meaningfully different outputs.

   Do not ask about ordinary creative or structural choices when the request already delegates them. After receiving the answer, add or update the requirement and continue.

5. Write `requirements.md` to `.draft/<artifact-name>/requirements.md` using the canonical template at `templates/requirements.md`. Each row must be independently understandable.

6. Update the registry: set the artifact's `Stage` to `Requirements` in `.draft/registry.md`.

7. Hand off to the Planner. Pass the path to `requirements.md`. The Planner must not need to re-read the full conversation to understand the task.

## Requirement formulation rules

- Write what the artifact must do or be — not what information might be available.
- Infer requirements when they follow clearly from the request. Do not force the user to specify tone, structure, or voice when they are safely derivable from the artifact type.
- Record an inferred requirement only when it meaningfully constrains downstream work.
- Do not invent preferences to make the brief appear complete.
- Do not convert uncertainty about available content into an artificial writing restriction. Record the requirement clearly; the Planner determines whether the content is available to satisfy it.

## Reference handling

A supplied reference can serve different roles:

- authoritative source requiring strong fidelity;
- factual or evidential source;
- structural or organizational model;
- writing-style example;
- terminology source;
- starting draft or raw material.

Determine the intended role from the request. A reference is not automatically authoritative or immutable. If the user says what to take from it, record that directly. If the role is consequential and unclear, ask.

## Authorship intent

Some requests delegate creative authorship broadly — fiction, imaginative copy, hypothetical scenarios. When that is clear, unspecified creative choices do not require clarification.

Creative latitude does not authorize invention of the user's real personal history, measurements, experiment results, organizational decisions, or factual claims represented as true.

Some requests imply limited authorship — rewrite without changing substance, turn notes into a report, make this clearer. Record the consequential boundary when it matters.

## Updating requirements

Requirements change when:

- the user adds or changes instructions;
- a referenced source resolves an open requirement;
- the Planner discovers a consequential conflict or missing intent that requires the user to clarify.

Preserve stable IDs where possible. Update the existing row instead of creating a conflicting duplicate. If a requirement is superseded, mark it explicitly.

## Notes

- This skill is for the Orchestrator only. The Planner, Writer, and Reviewer read `requirements.md`; they do not run this skill.
- Do not conflate a missing requirement with missing content. A requirement can be clear before the Planner knows whether the content exists to satisfy it.
- If the user provides no writing request — only a question or instruction — do not produce a `requirements.md`. Reply directly and wait for an actual artifact request.
