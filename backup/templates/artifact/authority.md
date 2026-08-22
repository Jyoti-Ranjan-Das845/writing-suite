# Authoring Contract

## Readiness

| Field | Value |
|---|---|
| Readiness | Pending |

Use one of:

- `Ready`
- `Not ready`
- `Pending`

## Authority decisions

| ID | Applies to | State | Source role | Boundary / resolution |
|---|---|---|---|---|

Use stable IDs such as `AU-01`.

### State

Use one of:

- `Ready`
- `Verify`
- `Ask`
- `Creative`
- `Conflict`

### Applies to

Reference the requirement or grounded content affected by the decision.

Prefer:

- `RQ-03`
- `GC-02`
- `RQ-03, GC-02`

Do not duplicate the full requirement or grounded content.

### Source role

Use only when consequential.

Typical values:

- `Authoritative source`
- `Factual/reference source`
- `Structural reference`
- `Style reference`
- `Technical/example material to inspect`
- `Not applicable`

Do not force a source role when none is needed.

### Boundary / resolution

Record only what the Writer and Reviewer need to know.

Examples of useful information include:

- ordinary domain explanation may be added, but do not present it as source-provided;
- preserve supplied numerical values;
- requester experience is required before this can be written as factual first-person content;
- authoritative verification is required before stating the claim as current fact;
- creative invention is permitted for fictional characters and events;
- supplied technical example may be corrected within the requested algorithm without changing its intended behavior.

Keep this concise.

## Overall authoring boundary

Record only consequential artifact-wide permissions or restrictions that do not belong cleanly to one row.

If none are needed, write:

`None beyond the decisions above.`

## Unresolved items

Include this section only when `Readiness = Not ready` or consequential items remain unresolved.

| ID | Required resolution |
|---|---|

Reference the corresponding `AU-*` item.

Do not repeat the full analysis.

## Completion rule

Set:

`Readiness: Ready`

only when every consequential requirement has either:

- sufficient grounded support;
- an authorized `Ready` path;
- authorized `Creative` latitude;

and no necessary `Ask`, `Verify`, or `Conflict` item remains unresolved.

Do not mark the artifact ready merely because drafting is possible.
