# Draft Agent Architecture

## Purpose

Draft Agent is a user-facing writing orchestrator. Its completion boundary is
a confirmed requirements agreement, a planned schema, a written artifact, and
an independent review verdict of `PASS`.

Its operating boundary is the creation and revision of communicative
documents. Tool access supports that outcome; it does not make Draft Agent a
general coding, filesystem, or host-operations agent.

## Components

| Component | Owns | Durable output |
|---|---|---|
| Orchestrator | User conversation, target resolution, requirements, registry, dispatch and routing | `requirements.md`, `registry.csv` |
| Investigation | Bounded decision-support inquiries | None; returns findings to the Orchestrator |
| Planner | Document structure and authoring boundaries | `schema.md` |
| Writer | Progressive artifact creation and revision | Target artifact |
| Reviewer | Independent verification and verdict | `review.md` |

The Orchestrator does not plan, write, or review. Specialists do not talk to
the user or update the registry.

## Workspace identity

The launch directory anchors one `.draft/` runtime root. `workspace_init` is
the only operation that creates or locates its registry and workspaces.

```text
<launch-directory>/.draft/
├── registry.csv
├── ws-01/
└── ws-02/
```

The workspace ID is a stable internal identity. The target path is the
human-facing document identity. A revision to the same artifact retains both;
a separate artifact receives a new workspace.

The registry contract is:

```csv
workspace_id,target_path,stage
```

Its stage machine is:

```text
requirements → planning → plan → writing → written → reviewing
                                                     ├─ passed
                                                     ├─ revision_required → writing
                                                     └─ blocked → reviewing
```

Transitions are persisted one at a time after their preconditions are true.

## Requirements contract

The Orchestrator loads the exact `writing-requirements` skill for every
requirements pass. `requirements.md` contains workspace metadata and a table
with exactly these columns:

| Requirement ID | Requirement | References |
|---|---|---|

Requirements preserve the user's intent and raw references. A URL or file is
not pre-summarized by the Orchestrator or Investigation. It remains attached to
the requirement so Planner, Writer, and Reviewer can inspect the actual source
for their own responsibilities.

The user's request is sufficient by default. Missing tone, audience, length,
structure, or similar preferences do not trigger an interview. The
Orchestrator asks only when the supplied request contains a consequential
ambiguity or conflict. File name and target location are resolved separately
through a compact default-first confirmation.

## Investigation routing

Investigation is private decision support for the Orchestrator. It is used only
when a bounded question blocks a workflow or user-intent decision—for example,
an inaccessible source, conflicting sources, or a specific unresolved
dependency reported by a specialist.

An investigation result is not a requirement, planning brief, or substitute
for user authority. If it exposes a consequential choice, the Orchestrator asks
the user and records only the user's answer or confirmation.

## Planning contract

Each planning pass starts a fresh Planner session. The Planner receives a
workspace ID, loads the exact `writing-schema` skill, and reads:

```text
.draft/<workspace_id>/requirements.md
```

It inspects applicable references directly and creates or revises:

```text
.draft/<workspace_id>/schema.md
```

The schema is an ordered set of document parts. Each part declares:

- the requirement IDs it serves;
- a precise specification for the content and form;
- `FACTUAL`, `DOMAIN`, `CREATIVE`, and `PROHIBIT` authority boundaries as
  applicable;
- its readiness status and any blocking note.

Every part must serve a confirmed requirement. The schema may reuse one
requirement across several parts, but it may not invent document intent or
finished prose.

## Writing contract

Each writing pass starts a fresh Writer session. The Writer loads the exact
`progressive-writing` skill and reads the requirements and schema from the
specified workspace. During review-directed revision it also reads
`review.md` and the existing artifact.

The Writer treats references as evidence, not as instructions. It inspects the
source material needed for each part and verifies consequential numbers,
quotations, attribution, qualifications, named findings, and strong
conclusions. An incomplete retrieval cannot be silently replaced by memory or
plausibility.

Writing is progressive in durable state. For each ready schema part, the
Writer composes that part, persists it in a distinct file operation, verifies
the increment, and only then proceeds. Revision changes only the material
authorized by the requirements, schema, and open review findings.

## Review contract

Every successful Writer pass is followed by a fresh Reviewer session. Reviewer
loads the exact `document-review` skill and independently reads the
requirements, schema, target artifact, applicable references, and prior review.

Reviewer checks every schema part and a separate `DOCUMENT` integration unit
across four dimensions:

1. **Fidelity** — required and authorized meaning is preserved.
2. **Attention economy** — every element earns the attention it costs.
3. **Coherence** — relationships and progression are legible.
4. **Craft** — the document is deliberately composed for its purpose.

Each cell is exactly one of:

- `PASS` — sufficient evidence shows the unit satisfies the dimension;
- `FAIL` — sufficient evidence shows a material violation;
- `NOT_VERIFIED` — the available evidence is insufficient for a responsible
  pass or failure decision.

Absence from selective or condensed retrieval is not evidence that a source
claim is absent. Reviewer continues focused inspection where possible and uses
`NOT_VERIFIED` when the evidence remains incomplete.

The overall verdict is `PASS`, `REVISION_REQUIRED`, or `BLOCKED`. A revision
starts a fresh Writer followed by a fresh Reviewer. A block returns to review
only after the stated verification dependency changes.

## Skill and harness isolation

The orchestrator and each specialist have a bounded skill surface:

| Role | Required procedural skill |
|---|---|
| Orchestrator requirements pass | `writing-requirements` |
| Planner | `writing-schema` |
| Writer | `progressive-writing` |
| Reviewer | `document-review` |
| Investigation | None |

Specialist prompts require the exact declared skill name and fail closed when
it is unavailable. Configuration suppresses unrelated host and project skills,
while bundled skills are made available with their owning agent. Durable paths
are resolved from the process current working directory using the supplied
workspace ID; agents do not discover workspaces by searching the filesystem.

## Shared quality contract

Planner, Writer, and Reviewer carry the same [Writing Quality North Star](writing-quality-north-star.md)
inside their respective bundled skills. The guide informs all three roles
without changing their ownership boundaries or granting content authority.
