# Writing Registry

| Artifact | Target file | Stage | Review |
|---|---|---|---|
|  |  |  |  |

## Purpose

This registry is the project-level index for artifacts managed by the Writing Suite.

It is navigation and status only.

Do not store writing requirements, grounded content, review findings, source material, or document knowledge here.

## Ownership

The root workflow/orchestrator owns `.writing/registry.md`. It creates and updates the existing artifact row at each workflow transition. Individual stage skills do not update this registry.

## Artifact

Use a stable, human-readable artifact name.

The artifact name must match its runtime directory:

`.writing/<artifact-name>/`

Prefer a short slug derived from the target artifact.

Example:

`router-hld`

Do not create a new artifact name for ordinary revisions of the same document.

## Target file

Record the actual deliverable path relative to the project when possible.

Examples:

- `docs/router-hld.md`
- `README.md`
- `reports/experiment-results.md`

The final artifact remains at this location.

Do not store another copy under `.writing/`.

## Stage

Use one of these values:

- `Requirements`
- `Grounding`
- `Authority`
- `Writing`
- `Review`
- `Complete`
- `Blocked`

The root workflow/orchestrator updates the existing row as the artifact moves through the workflow.

## Review

Use one of these values:

- `Pending`
- `Pass`
- `Pass with polish`
- `Needs revision`
- `Blocked`

The value should reflect the latest verdict in:

`.writing/<artifact-name>/review.md`

Before the first review, use `Pending`.

## Rules

- Keep one row per managed artifact.
- Keep the registry compact.
- The root workflow/orchestrator updates the existing row as work progresses.
- Do not duplicate an artifact because its stage changes.
- Do not use the registry as a history log.
- Do not add columns unless the suite requires them for workflow operation.
