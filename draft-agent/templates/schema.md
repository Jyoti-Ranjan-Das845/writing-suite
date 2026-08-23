# Document Schema

```xml
<schema>
  <part id="P01">
    <title></title>
    <serves></serves>
    <specification></specification>
    <authority>
      <!-- Each bullet carries a prefix that governs how the Writer may use it:
           FACTUAL   — must be stated accurately; do not contradict or omit
           DOMAIN    — Writer may draw on domain knowledge to expand
           CREATIVE  — Writer has latitude within the stated specification
           PROHIBIT  — must not appear in this part -->
    </authority>
    <status>Pending</status>
    <notes></notes>
  </part>
</schema>
```

## Fields

### `id`

Stable part identifier: `P01`, `P02`, `P03`, and so on.

Do not reuse or renumber IDs once assigned.

### `title`

Human-readable name for this part of the document.

Use a noun phrase that describes what this part is, not what it does.

### `serves`

Which requirements this part satisfies.

List requirement IDs from `requirements.md`: `RQ-01`, `RQ-02`, and so on.

A part may serve multiple requirements. A requirement may be served by multiple parts.

### `specification`

Precise description of what this part must contain and how it must be structured.

Include:

- content scope (what goes here, what does not)
- structural form (prose, table, list, code block, diagram, image, chart, etc.)
- ordering or grouping rules if the part has internal structure
- length or density guidance if constrained

Write this as a contract the Writer must fulfill, not as a style suggestion.

### `authority`

Bullet list of grounded content items the Writer must respect.

Each bullet must begin with one of these prefixes:

- `FACTUAL` — claim or data that must be stated accurately; do not contradict, soften, or omit
- `DOMAIN` — established domain knowledge the Writer may draw on and expand with judgment
- `CREATIVE` — direction or intent the Writer has latitude to express within the specification
- `PROHIBIT` — content, framing, or claim that must not appear in this part

Source material may be quoted, paraphrased, or summarised in each bullet. The prefix governs how the Writer treats it, not how it was collected.

### `status`

Tracks planning state for this part.

Use one of:

- `Pending` — not yet planned
- `Ready` — specification and authority are complete; Writer may proceed
- `Blocked` — cannot proceed; reason recorded in `notes`

The Writer must not draft a part whose status is not `Ready`.

### `notes`

Free-form field for planning remarks, open questions, or block reasons.

Clear this field or mark it resolved when the issue is closed.

## Rules

- One `<part>` per distinct section, component, or content block.
- Parts are ordered as they should appear in the final document.
- Do not create a part for content that does not have its own specification.
- Keep `<specification>` precise enough that a Writer with no other context could produce the correct content.
- Keep `<authority>` minimal — include only what constrains or enables the Writer's choices.
- Set `<status>Ready</status>` only when both `<specification>` and `<authority>` are complete.
- The Planner owns this file. The Writer reads it. The Reviewer references it.
