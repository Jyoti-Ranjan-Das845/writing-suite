# Writing Skill Suite

This repository contains the Writing Skill Suite.

## Canonical instructions

`SKILL.md` is the canonical entry point for the suite.

Read it before executing or modifying the writing workflow.

Do not duplicate the suite methodology in this file.

## Repository map

- `SKILL.md` — overall workflow and orchestration
- `skills/writing-requirements/SKILL.md` — derive actionable writing requirements
- `skills/content-grounding/SKILL.md` — prepare the minimum sufficient grounded content
- `skills/authoring-contract/SKILL.md` — resolve authoring permission and readiness before drafting
- `skills/writer/SKILL.md` — organize, draft, and revise the artifact
- `skills/reviewer/SKILL.md` — independently evaluate the artifact
- `skills/reviewer/references/checks/` — detailed review checks
- `standards-registry.md` — canonical index of reusable writing standards
- `standards/` — universal, genre, and channel standards
- `templates/` — canonical runtime-state shapes

## Progressive disclosure

Start with `SKILL.md`.

Load only the active sub-skill, current artifact state (including `authority.md` when relevant), applicable standards, and applicable reviewer checks. Use an independent Reviewer context or subagent when available.

## Sources of truth

Keep each concern in its canonical location.

| Concern | Source of truth |
|---|---|
| Workflow | `SKILL.md` and `skills/` |
| Reusable writing standards | `standards-registry.md` and `standards/` |
| Writing requirements | `.writing/<artifact-name>/requirements.md` |
| Grounded content | `.writing/<artifact-name>/grounding.md` |
| Authoring permission and readiness | `.writing/<artifact-name>/authority.md` |
| Review findings | `.writing/<artifact-name>/review.md` |
| Deliverable | Requested target file |

Do not create competing copies of requirements, grounded content, authoring state, standards, or review state.

## Reviewer boundary

The Reviewer is read-only with respect to the deliverable: it must not edit or rewrite it. The Reviewer writes and updates `.writing/<artifact-name>/review.md`; the Writer performs deliverable revisions.

## Writing tasks inside this repository

If asked to create a written artifact while working inside this repository, follow `SKILL.md`; this file is navigation, not a replacement workflow.
