# Draft Registry

| Artifact | Target file | Stage | Review |
|---|---|---|---|
|  |  |  |  |

## Purpose

This registry is the project-level index for artifacts managed by Draft Agent.

It is navigation and status only.

Do not store writing requirements, schema, review findings, source material, or document knowledge here.

## Ownership

The Orchestrator owns `.draft/registry.md`. It creates the artifact row and updates it at each stage transition. Sub-agents do not update this registry.

## Artifact

Use a stable, human-readable artifact name.

The artifact name must match its runtime directory:

`.draft/<artifact-name>/`

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

Do not store another copy under `.draft/`.

## Stage

Use one of these values:

- `Requirements`
- `Planning`
- `Writing`
- `Review`
- `Complete`
- `Blocked`

The Orchestrator updates the existing row as the artifact moves through the pipeline.

## Review

Use one of these values:

- `Pending`
- `Pass`
- `Pass with polish`
- `Needs revision`
- `Blocked`

The value should reflect the latest verdict in:

`.draft/<artifact-name>/review.md`

Before the first review, use `Pending`.

## Rules

- Keep one row per managed artifact.
- Keep the registry compact.
- The Orchestrator updates the existing row as work progresses.
- Do not duplicate an artifact because its stage changes.
- Do not use the registry as a history log.
- Do not add columns unless the pipeline requires them for workflow operation.
