# Writing Skill Suite

This repository contains the Writing Skill Suite.

## Canonical instructions

`SKILL.md` is the canonical entry point for the suite.

Read it before modifying or executing the writing workflow.

Do not duplicate the suite methodology in this file.

## Repository map

Use the repository according to these responsibilities:

- `SKILL.md` — overall workflow and orchestration
- `skills/writing-requirements/SKILL.md` — derive actionable writing requirements
- `skills/content-grounding/SKILL.md` — gather and prepare only the content needed to satisfy those requirements
- `skills/authoring-contract/SKILL.md` — resolve authoring permission and readiness before drafting
- `skills/writer/SKILL.md` — draft and revise the artifact
- `skills/reviewer/SKILL.md` — independently review the artifact
- `skills/reviewer/references/checks/` — detailed reviewer checks
- `standards-registry.md` — canonical index of reusable writing standards
- `standards/` — universal, genre, and channel writing standards
- `templates/` — canonical shapes for runtime writing state

## Progressive loading

Do not load the entire suite into context by default.

Start with `SKILL.md`.

Then load only:

1. the sub-skill needed for the current stage;
2. the runtime state needed for the current artifact, including `authority.md` when entering Writer or Reviewer;
3. the standards selected through `standards-registry.md`;
4. reviewer checks applicable to the current review.

Follow referenced files only when they are needed.

## Sources of truth

Keep these separate:

- workflow behavior → `SKILL.md` and `skills/`
- reusable writing rules → `standards-registry.md` and `standards/`
- task requirements → `.writing/<artifact-name>/requirements.md`
- grounded task content → `.writing/<artifact-name>/grounding.md`
- authoring permission/readiness → `.writing/<artifact-name>/authority.md`
- review state → `.writing/<artifact-name>/review.md`
- final deliverable → its requested project path

Do not create competing copies of these instructions or standards.

## Reviewer boundary

The Reviewer is read-only with respect to the deliverable: it must not edit or rewrite it. The Reviewer writes and updates `.writing/<artifact-name>/review.md`; the Writer performs deliverable revisions.

## Writing tasks

When this repository itself is used to produce a written artifact, follow `SKILL.md` rather than treating this `AGENTS.md` file as the writing methodology.
