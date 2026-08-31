# Draft Agent

Draft Agent is an Omnigent writing system that turns a document request into a
planned, source-grounded, progressively written, and independently reviewed
artifact.

The repository intentionally contains only the deployable agent bundle, its
documentation, and this README. Runtime work is created in the project from
which the agent is launched and is not part of this repository.

## What it does

Draft Agent coordinates four specialists while remaining the only agent that
talks with the user:

- **Investigation** resolves a bounded uncertainty when the workflow cannot
  make a responsible decision without checking something.
- **Planner** reads confirmed requirements and their references, then creates
  `schema.md`.
- **Writer** realizes the schema progressively and writes the requested
  artifact.
- **Reviewer** independently checks every schema part and the whole document
  for fidelity, attention economy, coherence, and craft.

The orchestrator never substitutes for specialist work. It owns the user
conversation, workspace state, specialist dispatch, and review/revision loop.

## Requirements

- A working Omnigent installation with the `omnigent` command available.
- Access to the Claude SDK and Claude Code/native harnesses used by the bundled
  configurations.
- Credentials required by those harnesses and any source systems the document
  references.

## Start the agent

Launch Draft Agent from the directory where you want its runtime `.draft/`
workspace to live. Pass the agent bundle by path:

```bash
cd /path/to/your-project
omnigent run /path/to/writing-suite/draft-agent --server local
```

Omnigent prints the local conversation URL. Open that URL in a browser and talk
to Draft Agent there. With the standard local server, conversations are served
from `http://127.0.0.1:6767`.

The launch directory is important: it anchors `.draft/` for the life of the
run. You may reference files elsewhere when the task requires them, but the
workflow registry and document workspaces remain under the launch directory.

## Use the agent

Give it a document outcome and any source material or constraints that matter:

```text
Create a summary document of this article:
https://example.com/article
```

```text
Write docs/router-hld.md from this repository. Cover request routing,
deployment boundaries, and failure handling.
```

For a new document, Draft Agent proposes a file name and location. If you did
not provide either one, the default target is inside the new document workspace.
Accept the defaults or provide replacements. The agent then runs the workflow
without asking for preferences you did not express unless your request contains
a material ambiguity or conflict.

Follow-up requests about the same artifact reuse its workspace:

```text
Shorten the summary and preserve all numerical claims.
```

A genuinely separate requested document receives a new workspace.

## Runtime files

Each launch project gets a machine-managed `.draft/` directory:

```text
.draft/
├── registry.csv
└── ws-01/
    ├── requirements.md
    ├── schema.md
    ├── review.md
    └── document.md        # only when the workspace-default target is used
```

`registry.csv` has exactly three columns:

```text
workspace_id,target_path,stage
```

An explicit target such as `docs/router-hld.md` remains at that path. The
workspace stores the durable agreement, plan, and review that support it.

## Workflow

```text
requirements → planning → plan → writing → written → reviewing
                                                     ├─ passed
                                                     ├─ revision_required → writing
                                                     └─ blocked → reviewing
```

- `requirements.md` preserves the user's request and raw references.
- `schema.md` maps every planned part to requirements and authoring authority.
- The Writer writes each schema part through a separate durable file mutation.
- `review.md` records `PASS`, `FAIL`, or `NOT_VERIFIED` for every part and for
  the integrated document.
- A revision verdict starts a fresh Writer and then a fresh Reviewer on the
  same workspace. Only an independent `PASS` completes the workflow.

See [Architecture](docs/architecture.md) for the contracts and separation of
responsibilities. See [Writing Quality North Star](docs/writing-quality-north-star.md)
for the shared quality model.

## Bundle layout

```text
draft-agent/
├── config.yaml
├── agents/
│   ├── investigation/config.yaml
│   ├── planner/
│   │   ├── config.yaml
│   │   └── skills/writing-schema/
│   ├── writer/
│   │   ├── config.yaml
│   │   └── skills/progressive-writing/
│   └── reviewer/
│       ├── config.yaml
│       └── skills/document-review/
├── skills/writing-requirements/
└── tools/python/workspace_init.py
```

The procedural skills are bundled with the agents that own them. Host or
project skills are suppressed by configuration so specialist behavior is
driven by the bundle's named contracts.
