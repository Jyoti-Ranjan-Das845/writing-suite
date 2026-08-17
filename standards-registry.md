# Standards Registry

This registry is the canonical index of reusable writing standards available to the Writing Suite.

The Writer and Reviewer use it to determine which standards apply to the current artifact.

Do not load every standard by default.

| Standard | Type | Applies when | Path |
|---|---|---|---|
| Universal writing | Universal | Always | `standards/universal/writing.md` |
| Technical design | Genre | Writing or reviewing a technical design document, HLD, LLD, architecture proposal, or engineering design | `standards/genres/technical-design.md` |
| Decision memo | Genre | Writing or reviewing a decision memo, recommendation memo, proposal, or decision-oriented narrative | `standards/genres/decision-memo.md` |
| Experiment report | Genre | Writing or reviewing an experiment, evaluation, benchmark, or empirical engineering report | `standards/genres/experiment-report.md` |
| Email | Channel | Final artifact will be sent as email | `standards/channels/email.md` |
| Slack | Channel | Final artifact will be sent through Slack or a similar workplace chat | `standards/channels/slack.md` |
| LinkedIn | Channel | Final artifact is intended for LinkedIn | `standards/channels/linkedin.md` |
| X | Channel | Final artifact is intended for X | `standards/channels/x.md` |

## Selection rules

### Universal

Load every standard with `Type = Universal`.

### Genre

Load a genre standard only when the artifact clearly belongs to that genre or the writing requirements explicitly request it.

Normally select one primary genre.

Do not force an artifact into a genre merely because a related standard exists.

### Channel

Load a channel standard only when the artifact will actually be delivered through that channel.

Channel standards supplement the primary writing or genre standard. They do not replace it.

## Multiple applicable standards

An artifact may use:

- the universal standard;
- one primary genre standard;
- one channel standard.

Load additional standards only when the writing requirements genuinely require them.

Example:

A technical architecture recommendation sent by email may use:

1. `Universal writing`
2. `Technical design`
3. `Email`

Do not load unrelated standards for additional stylistic guidance.

## Precedence

When standards conflict, apply this order:

1. hard truth, fidelity, safety, legal, and policy constraints;
2. explicit current-task writing requirements;
3. requirements derived from requester-specified references;
4. channel requirements intrinsic to delivery;
5. primary genre standard;
6. universal writing standard.

## Registry rules

- One row represents one reusable standard.
- `Standard` must be a clear human-readable name.
- `Type` must be one of:
  - `Universal`
  - `Genre`
  - `Channel`
- `Applies when` must describe the triggering condition clearly enough for an agent to decide whether to load the standard.
- `Path` must point to the canonical standard file.
- Do not duplicate the same rules across multiple standards merely for convenience.
- Do not create organization-specific standards unless actual organization-specific writing guidance is available.
- Adding a reusable standard requires:
  1. adding its standard file;
  2. adding exactly one corresponding registry row.

## Source of truth

The files listed here are the canonical reusable writing standards.

Task-specific instructions belong in:

`.writing/<artifact-name>/requirements.md`

Task-specific factual or contextual content belongs in:

`.writing/<artifact-name>/grounding.md`

Do not place either in this registry.
