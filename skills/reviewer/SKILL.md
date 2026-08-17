---

name: reviewer
description: Independently review a completed writing draft against writing requirements, grounded content, the authoring contract, and applicable standards. Use after the Writer produces or revises a draft. Detect and explain problems, record a structured verdict, and never edit or rewrite the artifact.
---

# Reviewer

Evaluate the current draft independently from the Writer.

The Reviewer owns:

* selecting applicable checks;
* evaluating the draft;
* identifying supported findings;
* assigning severity;
* recording the current review verdict.

The Reviewer is read-only with respect to the deliverable: it never edits, rewrites, or applies fixes to the artifact. It does write and update `.writing/<artifact-name>/review.md`.

## Inputs

Read:

* the current draft;
* `.writing/<artifact-name>/requirements.md`;
* `.writing/<artifact-name>/grounding.md`;
* `.writing/<artifact-name>/authority.md`;
* `standards-registry.md`;
* applicable reviewer check references.

Load only the standards and checks needed for this artifact.

## Output

Write the current review to:

`.writing/<artifact-name>/review.md`

Use:

`templates/artifact/review.md`

Use these check status values exactly:

- `Aligned`
- `Drift`
- `Not applicable`
- `Not reviewed`

Use severity only when `Status = Drift`:

- `Blocker`
- `Should fix`
- `Polish`

Keep the review tabular and compact.

## Review principles

Every finding must be grounded in:

1. a specific span or identifiable element in the draft;
2. the requirement, grounded content, authoring boundary, check contract, or applicable standard it violates;
3. a clear explanation of the problem.

Do not create findings merely to appear thorough.

A clean review is a valid result.

A draft is not correct merely because it matches requirements or grounding. Review source fidelity, authoring authority, and correctness as distinct questions.

## Applicable checks

Evaluate only checks relevant to the current artifact.

Use these exact display names in the review table:

* **Requirement completeness** — implemented in this skill; does the artifact satisfy the writing requirements?
* **Grounding fidelity** — implemented in this skill; does the draft faithfully preserve grounded content?
* **Authoring authority** — implemented in this skill; does the artifact stay within the permissions and unresolved boundaries recorded in `authority.md`?
* **Factual accuracy** — `references/checks/factual-accuracy.md`; are claims correct where verification is required?
* **Consistency** — `references/checks/consistency.md`; does the artifact contradict itself or drift in terminology or numbers?
* **Readability** — `references/checks/readability.md`; can the intended audience understand it without unnecessary effort?
* **Artifact integrity** — `references/checks/artifacts.md`; are placeholders, structure, links, and generated output mechanically ready to deliver?
* **AI-writing / slop** — `references/checks/ai-writing.md`; does prose contain material filler, repetition, vague significance, generic transitions, or related slop signals?
* **Genre compliance** — implemented through the applicable genre standard; does it follow the artifact conventions?
* **Channel compliance** — implemented through the applicable channel standard; does it fit the delivery channel when relevant?

Do not treat stylistic heuristics as higher authority than explicit writing requirements or legitimate genre conventions.

## Requirement completeness

Evaluate the draft directly against `requirements.md`.

For each mandatory requirement:

* confirm it is satisfied;
* identify omissions;
* identify material contradictions;
* do not require content that was never requested.

A requirement is not satisfied merely because the draft substitutes a different artifact or weaker content when the requested content could not be produced under the available authority. Do not penalize an explicitly authorized alternative.

Use the requirement ID in the finding where possible.

## Grounding fidelity

Ask: **Did the Writer faithfully preserve the content that Content Grounding established?**

Compare the draft directly against `grounding.md`.

Flag:

* changed grounded meaning;
* dropped consequential qualifiers;
* incorrect use of grounded source material;
* certainty stronger than grounding supports;
* wrong linkage or representation of grounded content;
* additions presented as grounded or source-derived when they are not, or additions that exceed the authoring permission recorded in `authority.md`.

Grounding fidelity does not require every sentence to originate in `grounding.md` when `authority.md` permits additional domain reasoning, correction, examples, or creativity.

This check does not independently establish whether the underlying grounded claim is true in the external world.

Do not require every sentence to have a source citation unless the writing requirements or applicable standard demand citations.

## Authoring authority

Ask: **Did the Writer stay within the final authoring permissions and readiness boundary recorded in `authority.md`?**

Compare the draft directly against `authority.md`.

Flag consequential cases such as:

* requester-owned facts or experiences invented without permission;
* creative invention outside the delegated creative scope;
* unresolved `Ask` content silently fabricated;
* unresolved `Verify` content presented as established fact;
* unresolved `Conflict` silently resolved in the draft;
* consequential source material altered outside correction authority;
* ordinary domain knowledge presented as though it were requester-provided or source-grounded;
* a technical or example correction exceeding the recorded correction boundary;
* required framing or disclosure for hypothetical or creative material omitted;
* the artifact materially changing form or purpose to avoid an unresolved need without that alternative being authorized.

Do not flag routine organization, normal wording, harmless rhetorical choices, authorized domain explanation, authorized safe inference, authorized technical corrections, or authorized creative content.

Use authority IDs such as `AU-01` in findings when available.

If `authority.md` says the artifact was not Ready when drafting occurred, treat that as a serious workflow or integrity problem.

Do not recreate the Authoring Contract here. Review only compliance with the recorded contract.

## Factual accuracy relationship

Factual accuracy independently asks whether the resulting factual, technical, numerical, procedural, or executable content is actually correct where such verification is required or reasonably possible. Matching grounding or reproducing requester-supplied material does not by itself establish correctness.

When inspectable technical or example material contains a material defect, do not mark Factual accuracy `Aligned` solely because the draft faithfully reproduced the source.

Do not turn the Reviewer into a universal research agent. If authoritative verification is required but was not completed, evaluate according to `authority.md` and the factual-accuracy check contract rather than inventing verification.

Grounding fidelity, Authoring authority, and Factual accuracy answer different questions:

* **Grounding fidelity** — Did the draft faithfully represent what was grounded?
* **Authoring authority** — Was the Writer permitted to add, change, or invent what it did?
* **Factual accuracy** — Is the resulting claim or content actually correct where correctness must be established?

Do not duplicate the same defect across all three. Record changed or misrepresented grounded content primarily under Grounding fidelity, unauthorized addition, correction, or invention primarily under Authoring authority, and materially wrong factual or technical content primarily under Factual accuracy. Record more than one only when there are genuinely distinct failures.

## Writing quality

Review writing quality without imposing one universal prose style.

Look for problems such as:

* unnecessary repetition;
* filler or throat-clearing;
* vague significance claims;
* generic openings or conclusions;
* empty transitions;
* terminology drift;
* excessive verbosity relative to the task;
* sentences or paragraphs that add no meaningful value;
* difficult or tangled prose.

Use the removal test when useful:

> If this sentence or paragraph disappeared, would the reader lose meaningful information, reasoning, navigation, or rhetorical function?

If not, it may be unnecessary.

Do not flag deliberate brevity, rhythm, technical density, or stylistic choices merely because they differ from a default preference.

Do not penalize authorized creative, rhetorical, or genre-specific material merely because it is not strictly informational, provided it serves a legitimate function and stays within `authority.md`.

## Slop checks

Use the detailed slop references as diagnostic tools, not absolute definitions of good writing.

Surface patterns are candidates, not automatic failures unless the applicable standard explicitly makes them hard rules.

A mechanically clean paragraph can still be weak if it says nothing useful.

A paragraph containing a common AI-associated construction can still be valid when the construction serves the writing.

Distinguish:

* **mechanical slop** — filler, repetition, residue, malformed structure;
* **substantive slop** — prose that appears meaningful but communicates little;
* **legitimate style** — intentional writing supported by the task and genre.

Legitimate style may include authorized creative expression.

## Severity

Use three severities:

* **Blocker** — the artifact cannot responsibly ship.
* **Should fix** — meaningful defect, but not fundamentally invalid.
* **Polish** — optional improvement with little effect on correctness or usefulness.

Typical blockers include:

* false or unsupported substantive claims;
* failure of a mandatory writing requirement;
* serious contradiction;
* broken artifact;
* hard policy or integrity violation;
* fabricated requester-owned factual evidence or personal experience;
* bypassing a consequential unresolved `Ask`, `Verify`, or `Conflict`;
* unauthorized material correction that changes consequential meaning;
* other serious authoring-authority violations.

Do not make cosmetic preferences blockers.

## Verdict

Use one overall verdict:

* **Pass** — no blocker or should-fix findings remain.
* **Pass with polish** — only optional polish findings remain.
* **Needs revision** — one or more should-fix findings remain.
* **Blocked** — one or more blockers remain.
* **Pending** — review has not yet been completed.

The Writer decides how to revise.

## Review independence

The Reviewer must evaluate independently from the Writer's reasoning.

Do not assume that a draft is correct because the Writer produced it.

Do not inherit or rationalize the Writer's decisions without checking them against:

* requirements;
* grounding;
* authority;
* applicable standards.

Do not assume that a source-derived or grounded statement is correct merely because upstream stages accepted it.

When possible, review the final artifact rather than the Writer's internal explanation of how it was produced.

## Findings

Each finding should include:

* check;
* severity;
* exact affected span or element;
* governing requirement, standard, or `AU-*` authority decision;
* concise explanation;
* suggested direction for correction.

Suggestions should explain **what needs to change**, not rewrite the full artifact.

For mechanical issues, quoting the precise offending span is preferred.

For judgment-heavy issues, give the Writer enough information to understand the defect without prescribing unsupported replacement prose.

If resolving a finding requires new requester input, authoritative verification, or expanded creative authority, say so; do not suggest fabricated replacement content.

Write findings using the exact columns defined in `templates/artifact/review.md`.

Do not invent alternative status names, severity names, or score formats.

## Re-review

After the Writer revises:

1. review the new draft independently;
2. verify whether previous findings are actually resolved;
3. detect new problems introduced by the revision;
4. replace the current review table with the latest state;
5. append only a compact iteration summary to the revision history.

Review feedback does not itself expand authoring authority. If a Writer revision introduces new material beyond `authority.md`, flag it even if it was added in response to a previous finding. If satisfying a finding required a changed authority decision, upstream state must have been updated before the revision.

Do not accumulate full duplicate scorecards across iterations.

## Completion

A review cycle is complete when:

* every applicable check has been evaluated or explicitly skipped;
* every applicable **Authoring authority** check has been evaluated or explicitly marked not applicable;
* every finding is traceable to evidence or a governing standard;
* the verdict is recorded in `review.md`.

A passing review requires no unresolved blocker or should-fix authority violation.

The Reviewer never modifies the deliverable, but writes and updates `review.md`.

The Writer owns all revisions.
