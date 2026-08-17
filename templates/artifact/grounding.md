# Content Grounding

| ID | Satisfies | Grounded content | Source |
|---|---|---|---|
| GC-01 | RQ-01 |  |  |

## Rules

- Use stable IDs: `GC-01`, `GC-02`, `GC-03`, and so on.
- `Satisfies` must reference one or more requirement IDs from `requirements.md`.
- `Grounded content` should contain the concise, usable information the Writer needs.
- Do not paste raw retrieved chunks when a faithful synthesis is sufficient.
- Preserve important qualifiers, uncertainty, disagreement, and limitations.
- Do not add unsupported conclusions or assumptions.
- `Source` must point back to the original evidence precisely enough to revisit it.

## Source pointers

Use the most precise source reference available.

Examples:

- `conversation: current request`
- `docs/design.md#Failure handling`
- `report.pdf, p. 14`
- `src/router.py:120-168`
- `GitHub: <repo>/<path>#L120-L168`
- `https://... — section: Evaluation`
- `dataset: results.csv, rows 20-35`
- `Drive: <document> — section: Architecture`

Do not copy source files into `.writing/` merely to make them easier to reference.

## Requirement coverage

A requirement can have:

- no grounding row when it requires no factual or contextual content;
- one grounding row;
- several grounding rows when multiple pieces of information are needed.

A grounded item may satisfy multiple requirements. List all applicable requirement IDs rather than duplicating the content.

## Derived writing requirements

Sometimes examining a reference reveals a constraint about **how the artifact should be written**, rather than content the artifact should communicate.

Do not store that as grounded factual content.

Add or update the corresponding requirement in `requirements.md`.

Example:

A requirement says:

`RQ-05: Follow the supplied design document for structure.`

The reference reveals:

- lead with the architectural decision;
- explain alternatives afterward;
- keep implementation detail out of the HLD.

These should become resolved requirements in `requirements.md`, with the reference preserved as their origin.

## Gaps

If required information cannot be established, record it explicitly.

| Requirement | Unresolved information | Reason / next source |
|---|---|---|
| RQ-XX |  |  |

Do not create this section when there are no unresolved gaps.

Do not invent content to eliminate a gap.

## Completeness check

Before handing off to the Authoring Contract, confirm:

- every requirement needing substantive support has sufficient grounded content;
- each grounded item is linked to its requirement;
- each grounded item has usable provenance;
- consequential uncertainty is preserved;
- contradictions are not silently reconciled;
- writing-reference conclusions have been moved into `requirements.md`;
- irrelevant retrieved material has not been carried forward.

The grounding file should contain the **minimum sufficient content needed to write the artifact correctly**.
