---

name: content-grounding
description: Resolve the writing requirements into grounded, usable content for the final artifact. Use after writing requirements are defined and before drafting. Determine what information each requirement needs, obtain only that information from available sources, preserve provenance, record consequential unresolved gaps and source conflicts for downstream authoring authority/readiness decisions, and prepare the content the Writer can directly use.
---

# Content Grounding

Prepare the content required to satisfy the writing requirements.

This stage does not broadly collect context. It determines what information the final artifact needs and grounds that information in available sources.

Do not draft the artifact.

Grounding determines what is supported by available evidence and what remains unresolved. It does not itself grant permission to creatively invent, augment with unverified domain knowledge, or silently correct consequential source conflicts.

Record unresolved consequential items for the downstream Authoring Contract.

## Inputs

Read:

* `.writing/<artifact-name>/requirements.md`
* relevant source references already available in the task or project

Follow source references only as needed to satisfy a requirement.

Sources may include:

* conversation context;
* existing files;
* PDFs;
* images;
* codebases;
* datasets;
* repositories;
* webpages;
* linked documents;
* project systems or tools;
* examples or standards referenced by the requester.

Do not copy source artifacts into `.writing/` unless a local copy is operationally required.

## Output

Write grounded content to:

`.writing/<artifact-name>/grounding.md`

Use the canonical structure from:

`templates/artifact/grounding.md`

Keep the output compact and structured.

Each grounded content item must:

* have a stable ID such as `GC-01`;
* identify which writing requirement it satisfies;
* contain the usable information needed downstream;
* preserve its source reference;
* preserve relevant uncertainty or qualification.

Use the template's unresolved-gap area when consequential information is missing, conflicting, unverifiable from the available evidence, or intentionally outside the current source set.

## Work requirement by requirement

For each writing requirement, determine whether additional information is needed.

A requirement can be:

* already satisfied by information present in the request;
* dependent on one or more available sources;
* unresolved because required information is absent;
* affected by contradiction, uncertainty, or source conflict;
* unrelated to content grounding.

Do not gather information merely because it appears potentially useful.

Gather only what is needed to produce the requested artifact.

## Determine the information need

Before retrieving anything, ask:

> What does the Writer need to know to satisfy this requirement correctly?

Distinguish information the Writer needs to know from freedom the Writer may need to exercise. Grounding prepares factual or contextual substance; it does not manufacture content merely because a requirement would benefit from richer examples, creative detail, ordinary domain explanation, hypothetical scenarios, or technical corrections.

If such material is not grounded in the current evidence, record the factual boundary or gap when consequential and leave the authority decision to the Authoring Contract. Do not make grounding artificially sparse: continue extracting all source-supported information needed by the artifact.

Translate the requirement into a concrete information need.

Example:

`RQ-04: Explain the experiment results and their implications.`

Possible information needs:

* final experiment metrics;
* baseline metrics;
* meaningful differences;
* important limitations;
* conclusions directly supported by the experiment.

Do not retrieve the entire experiment history if those items are sufficient.

## Use existing context first

Before asking the requester or performing additional retrieval:

1. inspect the information already available;
2. determine whether it resolves the requirement;
3. use it when sufficient.

Do not ask for information that already exists in the current context or referenced sources.

## Resolve missing or ambiguous information

When required information is unresolved:

1. inspect all information already available;
2. use direct derivation from that evidence when the result follows safely and transparently from the evidence;
3. follow explicitly referenced or clearly required available sources or tools when doing so is part of satisfying the requirement;
4. preserve meaningful uncertainty, contradiction, or absence;
5. if consequential information remains unresolved, record the gap precisely rather than inventing content to close it;
6. leave the final choice among requester clarification, external verification, creative delegation, safe domain augmentation, or conflict resolution to the downstream Authoring Contract.

Do not ask the requester directly merely because information is missing. Grounding may return to Writing Requirements when a source reveals that the requirement itself was misunderstood or remains ambiguous. When the requirement is clear and the missing item is an information or authority issue, record it for Authoring Contract instead of asking here.

Do not invent information to close a gap.

Record unresolved gaps explicitly when they cannot be resolved.

## Ordinary domain knowledge

General model knowledge is not automatically equivalent to grounded evidence from the request or referenced sources. Do not silently record unsupported domain knowledge in `grounding.md` as if the requester or source supplied it.

Safe conclusions directly derived from grounded evidence may be recorded when clearly represented as derivations. When additional domain knowledge could materially improve or correct the artifact but is not grounded in the current source set, record the relevant need or boundary for Authoring Contract rather than automatically forbidding or using it.

If the requester explicitly asked for external research or an authoritative source is already identified and accessible, retrieve and ground that information here.

## Reference handling

Use the reference intent recorded by the Writing Requirements stage.

A source can contribute different kinds of grounded output.

### Content source

Extract information the final artifact may directly communicate.

Examples:

* experiment results;
* facts;
* observed system behavior;
* decisions;
* measurements;
* quotations;
* technical details.

Record these as grounded content items.

### Writing reference

A reference may instead define how the artifact should be written.

Examples:

* abstraction level;
* structural conventions;
* expected information density;
* terminology;
* presentation pattern;
* document conventions.

Do not incorrectly turn these into factual content.

When a writing reference resolves or extends a writing requirement, record the derived requirement clearly and link it back to the originating requirement.

Example:

`RQ-05: Follow the supplied reference for document structure.`

After examining the source:

* establish the problem before alternatives;
* use continuous narrative;
* keep implementation details below architectural decisions.

These are resolved writing requirements, not grounded factual claims.

### Material to inspect

Use this role when Requirements identifies supplied material as an example, draft, technical example, or other source that should inform the artifact without being presumed immutable or correct.

Grounding should:

* extract the content the source actually provides;
* preserve the source pointer;
* preserve relevant limitations;
* record consequential internal inconsistency, contradiction, staleness, or apparent correctness concerns when they can be identified from available evidence;
* not silently normalize a consequential problem;
* not decide whether the Writer may correct it.

That correction decision belongs to Authoring Contract. Do not turn Grounding into a universal fact-checker.

## Source references

Reference original sources where they already exist.

A source reference should be precise enough to revisit the evidence when necessary.

Examples:

* file path + section;
* PDF + page;
* repository + file + line range;
* URL + section;
* dataset + row/query;
* conversation message;
* connected document identifier.

Do not duplicate large source content merely for convenience.

Persist the derived understanding and preserve the pointer to its source.

## Grounded content

A grounded content item should contain the information in the form most useful to the Writer.

Do not merely store retrieved chunks.

Convert source material into a concise, faithful understanding.

Preserve:

* concrete facts;
* relationships;
* conclusions directly supported by evidence;
* necessary qualifiers;
* important disagreement or uncertainty;
* source provenance.

Do not add unsupported interpretation.

Do not label model-generated augmentation, hypothetical content, or unverified domain knowledge as grounded content. If a derived conclusion is included, its relationship to the supporting evidence must remain clear.

## Multiple sources

When several sources contribute to one grounded content item:

* synthesize them when they agree;
* preserve meaningful differences when they disagree;
* retain references to each relevant source.

Do not silently reconcile contradictory evidence.

If a contradiction materially affects the artifact, record it explicitly. When it changes the interpretation of the requirement itself, return to Writing Requirements. Otherwise preserve it for Authoring Contract to determine whether the next action is verification, clarification, correction, or another resolution.

## Requirement linkage

Every grounded content item must identify the requirement it helps satisfy.

One requirement can map to many grounded content items.

One grounded content item can support multiple requirements when genuinely applicable.

Do not duplicate the same grounded information simply to satisfy multiple rows.

Use references instead.

## Completeness

Before handing off to the Authoring Contract, verify:

* all relevant currently available evidence has been prepared;
* required sources that belong to the current grounding scope have been examined;
* each requirement needing factual or contextual support is either sufficiently grounded or its consequential gap or conflict is explicitly recorded;
* required references have been interpreted according to their intended role;
* consequential ambiguities, gaps, contradictions, and verification needs are resolved from available evidence or explicitly recorded for the Authoring Contract;
* source provenance is available;
* unnecessary retrieved material has not been carried forward.

The goal is not maximum context.

The goal is **minimum sufficient grounded content for correct writing**.

Complete grounding does not mean every requirement already has every piece of information necessary to finish the artifact.

## Handoff

This stage is complete when the Authoring Contract can use:

* `requirements.md`
* `grounding.md`

without reopening all original sources merely to understand what is known, what is missing, and what source roles or conflicts matter.

The next stage is **Authoring Contract**. Downstream stages may follow a source reference only when deeper verification or detail is genuinely required.
