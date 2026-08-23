# Review

## Verdict

| Field | Value |
|---|---|
| Verdict | Pending |
| Review iteration | 0 |

## Checks

| Check | Status | Severity | Finding | Affected span / element | Governing requirement or standard | Suggested direction |
|---|---|---|---|---|---|---|
| Requirement completeness | Not reviewed | — | — | — | requirements.md | — |
| Specification fidelity | Not reviewed | — | — | — | schema.md `<specification>` | — |
| Authority compliance | Not reviewed | — | — | — | schema.md `<authority>` | — |
| Factual accuracy | Not reviewed | — | — | — | Applicable reviewer check / standard | — |
| Consistency | Not reviewed | — | — | — | Applicable reviewer check / standard | — |
| Readability | Not reviewed | — | — | — | Applicable reviewer check / standard | — |
| Artifact integrity | Not reviewed | — | — | — | Applicable reviewer check / standard | — |
| AI-writing / slop | Not reviewed | — | — | — | Applicable reviewer check / standard | — |
| Genre compliance | Not applicable | — | — | — | Applicable genre standard | — |
| Channel compliance | Not applicable | — | — | — | Applicable channel standard | — |

## Status values

Use only:

- `Aligned`
- `Drift`
- `Not applicable`
- `Not reviewed`

## Severity values

Use only when `Status = Drift`:

- `Blocker`
- `Should fix`
- `Polish`

Use `—` when there is no finding.

## Verdict values

Use only:

- `Pass`
- `Pass with polish`
- `Needs revision`
- `Blocked`
- `Pending`

Interpret them as:

- `Pass` — all applicable checks are aligned.
- `Pass with polish` — only polish findings remain.
- `Needs revision` — one or more `Should fix` findings remain.
- `Blocked` — one or more `Blocker` findings remain.
- `Pending` — review has not been completed.

## Review rules

- One row represents one review check.
- If a check has multiple distinct findings, add additional rows for that check.
- Every `Drift` row must identify the affected span or element when possible.
- Every `Drift` row must identify the requirement, schema specification, authority constraint, reviewer check, or writing standard that governs the finding.
- Suggestions describe the correction direction. They do not rewrite the artifact.
- Do not create findings merely to populate the table.
- A clean check should be marked `Aligned`.
- Skip irrelevant checks explicitly with `Not applicable`.

## Review history

Keep only a compact history of completed review cycles.

| Iteration | Verdict | Summary |
|---|---|---|
