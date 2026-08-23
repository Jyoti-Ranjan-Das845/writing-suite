# Writing Requirements

| ID | Requirement | Type | References |
|---|---|---|---|
| RQ-01 |  |  |  |

## Rules

- Use stable IDs: `RQ-01`, `RQ-02`, `RQ-03`, and so on.
- Each row must contain one independently understandable requirement.
- Write requirements as actionable statements, not category labels.
- Add only requirements that materially affect the artifact.
- Do not create empty requirements for purpose, audience, tone, structure, length, or other dimensions when they do not matter.
- `Type` must be one of:
  - `Identity` — defines what the artifact is (purpose, audience, form, genre, channel)
  - `Constraint` — restricts how the artifact may be written (tone, length, format, scope limits, prohibitions)
  - `Topic` — specifies content that must or must not appear
- `References` records where the requirement came from:
  - `User` — stated directly by the user
  - `Derived from RQ-XX` — logically inferred from another requirement
  - `<source pointer>` — resolved from a referenced document or URL
- Preserve explicit user requirements exactly in meaning.
- Inferred requirements must be strongly supported by available context.
- If a requirement is resolved from a referenced source, preserve the source pointer in `References`.
- If a requirement changes, update the existing row where possible instead of creating a conflicting duplicate.
- If a requirement is superseded and retaining that history matters, mark it `Superseded` in the requirement text and point to the replacement requirement.

## Completeness check

Before handing off to the Planner, confirm that the requirements capture any consequential:

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
