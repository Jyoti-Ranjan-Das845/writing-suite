# Writing Requirements

| ID | Requirement | Origin |
|---|---|---|
| RQ-01 |  |  |

## Rules

- Use stable IDs: `RQ-01`, `RQ-02`, `RQ-03`, and so on.
- Each row must contain one independently understandable requirement.
- Write requirements as actionable statements, not category labels.
- Add only requirements that materially affect the artifact.
- Do not create empty requirements for purpose, audience, tone, structure, length, or other dimensions when they do not matter.
- `Origin` should identify where the requirement came from, such as:
  - `User`
  - `Existing artifact`
  - `Reference: <source pointer>`
  - `Derived from RQ-XX`
- Preserve explicit user requirements exactly in meaning.
- Inferred requirements must be strongly supported by available context.
- If a requirement is resolved from a referenced source, preserve the source pointer in `Origin`.
- If a requirement changes, update the existing row where possible instead of creating a conflicting duplicate.
- If a requirement is superseded and retaining that history matters, mark it `Superseded` in the requirement text and point to the replacement requirement.
- Do not store factual research or source summaries here. Those belong in `grounding.md`.

## Completeness check

Before handing off to Content Grounding, confirm that the requirements capture any consequential:

- communicative goal;
- audience;
- scope and exclusions;
- artifact or writing form;
- required content;
- reference intent;
- structure or format constraints;
- length or information-density constraints;
- authorship or grounding constraints;
- other explicit requester instructions.

These are checks, not mandatory fields.
