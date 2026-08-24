---
type: reviewer-check
name: factual-accuracy
applies-when: The artifact contains factual, quantitative, attributed, externally verifiable, source-dependent, technical, procedural, executable, or computational content whose correctness matters.
---

# Check: Factual accuracy

Evaluate whether consequential factual, technical, procedural, computational, or executable claims in the artifact are correct, supported, and represented with the appropriate level of certainty.

This check is concerned with truth and evidence.

Fidelity to a supplied or grounded source does not by itself establish correctness. Conversely, content is not factually wrong merely because it uses authorized ordinary domain knowledge that was not explicitly listed in the schema `<authority>`.

It does not evaluate whether the prose is elegant or whether every sentence has a citation.

## Core principle

A polished statement is not acceptable if the underlying claim is wrong, unsupported, misattributed, outdated where freshness matters, or stronger than the available evidence.

A factual or technical statement can fail this check even when it reproduces a `FACTUAL` authority bullet exactly, if available evidence or direct inspection establishes that the underlying claim or implementation is materially incorrect.

When `DOMAIN` authority bullets permit ordinary domain knowledge, technical correction, or safe inference, evaluate the resulting content for correctness rather than rejecting it solely because it was not listed in the schema `<authority>`.

Check the artifact against:

1. `requirements.md` — what correctness level the artifact requires;
2. `schema.md <authority>` — established factual basis (`FACTUAL` bullets) and permitted domain expansion (`DOMAIN` bullets);
3. `schema.md <specification>` — what the part is contracted to contain;
4. the original source when verification is necessary;
5. authoritative external sources when the task requires independent factual verification.

Do not silently replace the artifact's intended source basis with unrelated general knowledge.

Do not use that rule to preserve a demonstrable technical or factual defect.

---

# What to check

## FA-01 — Schema authority informs factual verification

Use the schema `<authority>` bullets to identify the factual claim, its intended source basis, and any evidence that requires verification.

The schema `<authority>` identifies the intended factual basis, but a `FACTUAL` bullet is not itself a guarantee that the grounded claim is correct. If the Writer faithfully reproduced a `FACTUAL` authority bullet that is independently shown to be wrong, record **Factual accuracy**, not **Specification fidelity**. If the Writer changed a correctly grounded `FACTUAL` bullet, record **Specification fidelity**. If the Writer added content using `DOMAIN` authority, evaluate its truth normally; do not flag it solely for drawing on domain knowledge.

Do not duplicate a finding across these checks unless there are genuinely distinct failures.

---

## FA-02 — Numbers are preserved accurately

Check consequential:

- counts;
- percentages;
- rates;
- dates;
- durations;
- costs;
- dimensions;
- rankings;
- measurements;
- thresholds.

Flag:

- transcription errors;
- inconsistent rounding that changes interpretation;
- incorrect units;
- incorrect arithmetic;
- percentages confused with percentage points;
- values attributed to the wrong condition.

Do not flag harmless formatting differences such as `10%` versus `10.0%`.

---

## FA-03 — Comparisons are valid

Verify that comparative claims match the underlying evidence.

Check statements such as:

- higher;
- lower;
- faster;
- cheaper;
- better;
- worse;
- most;
- least;
- doubled;
- reduced by;
- increased by.

Make sure the compared quantities use compatible:

- populations;
- metrics;
- units;
- time periods;
- experimental conditions.

Do not allow a valid number to support an invalid comparison.

---

## FA-04 — Attribution is correct

When the artifact attributes information to a:

- person;
- paper;
- organization;
- dataset;
- report;
- experiment;
- source;

verify that the source actually supports the attributed claim when verification is required.

Flag:

- wrong source;
- unsupported quotation;
- source credited with a stronger claim than it makes;
- opinion represented as an official position;
- secondary reporting represented as primary evidence.

---

## FA-05 — Quotations are faithful

For direct quotations:

- verify wording when the source is available;
- preserve meaningful context;
- preserve attribution.

Do not silently convert a paraphrase into quotation marks.

Do not require verbatim quotation when the artifact clearly uses paraphrase.

---

## FA-06 — Dates and chronology are correct

Check dates when they materially affect the claim.

Flag:

- incorrect dates;
- reversed event order;
- relative dates that are misleading in durable writing;
- historical statements presented as current facts.

When freshness matters, verify current status rather than assuming older grounded information remains current.

---

## FA-07 — Entities are correctly identified

Check consequential:

- names;
- organizations;
- products;
- models;
- versions;
- locations;
- roles;
- standards;
- technical identifiers.

Do not allow similar names to be silently substituted.

---

## FA-08 — Technical claims are accurate

For technical or instructional artifacts, verify where relevant:

- system behavior;
- interfaces;
- architecture;
- algorithms;
- configuration;
- protocols;
- model behavior;
- implementation constraints;
- code examples;
- command examples;
- data shapes and types;
- formulas and calculations;
- procedural steps;
- compatibility assumptions;
- preconditions necessary for an example or instruction to work.

against the grounded technical source where available.

When an artifact presents code, commands, calculations, or procedures as usable examples, correctness includes internal coherence and practical executability to the degree reasonably reviewable.

Flag, when consequential:

- descriptions that simplify a system past the point of correctness;
- code likely not runnable as presented;
- incompatible shapes, types, or interfaces;
- invalid command or configuration syntax;
- impossible or inconsistent procedural ordering;
- calculation or formula errors;
- omitted prerequisites that make an example materially misleading;
- obsolete behavior represented as current when freshness matters.

The Reviewer does not need to execute every code sample or procedure. Use direct inspection and available evidence when sufficient. If actual execution or external verification is necessary and the task requires that level of certainty, follow the existing verification rules. If it cannot be checked, use the appropriate review status rather than pretending it is correct.

Do not mark technical content `Aligned` merely because it matches a supplied example.

Authoritative source material may require preservation even when a concern exists. Factual accuracy should still report a material correctness concern. Whether the Writer is permitted to alter the source belongs to **Authoring authority**, not this check. A document can faithfully represent an authoritative source and still have a factual-accuracy finding explaining that the source claim appears wrong, stale, or technically defective.

---

## FA-09 — Causal claims are supported

Distinguish:

- causation;
- correlation;
- association;
- temporal sequence;
- hypothesis.

Flag causal language when the evidence only establishes association or observation.

Examples of potentially consequential causal wording:

- `caused`;
- `resulted in`;
- `led to`;
- `because of`;
- `therefore`.

Do not weaken properly supported causal claims merely because cautious wording is possible.

---

## FA-10 — Generalization matches evidence

Check whether the artifact extends a local observation beyond the evidence.

Example:

Evidence:

`The method improved performance on this coding benchmark.`

Unsupported generalization:

`The method improves LLM performance across real-world tasks.`

Preserve the population, conditions, and scope supported by the evidence.

---

## FA-11 — Certainty matches evidence

Check distinctions such as:

- confirmed;
- observed;
- estimated;
- inferred;
- likely;
- possible;
- proposed;
- assumed;
- unknown.

Flag when the artifact turns:

- an estimate into an exact value;
- an assumption into a fact;
- a hypothesis into a conclusion;
- preliminary evidence into certainty;
- a proposal into an approved decision.

Do not add unnecessary hedging to well-established facts.

Ordinary domain knowledge or safe inference permitted by `DOMAIN` authority bullets must still be expressed at a certainty level justified by the evidence and nature of the claim. Authorization does not convert inference into fact.

---

## FA-12 — Source limitations are preserved

When a source itself contains important limitations, do not omit them when doing so materially changes the claim.

Examples:

- limited sample;
- preliminary result;
- restricted geography;
- specific experimental conditions;
- known evaluator limitation.

Not every source caveat belongs in the final artifact.

Preserve those that affect interpretation.

---

# Internal versus external verification

## Schema-grounded verification

Use `schema.md <authority>` as the primary established source basis when the task has already established its factual source material, but distinguish fidelity to that basis from independent correctness.

This prevents the Reviewer from silently introducing a different factual basis.

Do not duplicate a Specification fidelity finding merely because the same claim appears in a `FACTUAL` authority bullet. If the Writer changed a correctly grounded `FACTUAL` bullet, record Specification fidelity. Record Factual accuracy only when available evidence independently shows that the grounded or final factual claim is wrong or unsupported.

If direct technical inspection reveals a material internal defect, no external research is required merely to state that defect when the evidence is already sufficient.

## Original-source verification

Follow the stored source pointer when:

- the grounded item appears ambiguous;
- the draft makes a stronger claim than grounding clearly supports;
- quotation accuracy matters;
- exact values matter;
- contradictory grounded items exist;
- the requirement explicitly calls for source verification.

Do not reopen every source automatically.

## External verification

Use external research only when:

- the writing requirements require current or independently verified facts;
- the claim is time-sensitive;
- factual accuracy cannot be established from the supplied sources;
- the Reviewer is explicitly responsible for independent verification.

When external evidence conflicts with the task's supplied source:

- do not silently replace one with the other;
- report the discrepancy;
- distinguish what the supplied source says from what external verification shows.

If a `FACTUAL` authority bullet flags a claim as requiring verification and that verification was not completed, do not silently perform an unrelated verification path unless the Reviewer is explicitly responsible and tools and scope permit it. An unresolved verification requirement should not be marked `Aligned`. Do not fabricate verification.

---

# Current information

For claims whose truth can change over time, check freshness when it matters.

Examples include:

- current office holders;
- pricing;
- software versions;
- regulations;
- policies;
- company roles;
- product availability;
- benchmark leaderboards;
- market data.

A historically correct source may no longer support a present-tense claim.

Flag stale claims when the artifact represents them as current.

---

# Citation accuracy

When the artifact contains citations or source references, verify where practical that:

- the citation points to the intended source;
- the source supports the nearby claim;
- the attribution is not materially overstated;
- the citation is not attached to an unrelated statement.

Do not require citations merely because a statement is factual unless the writing requirements or applicable standard require them.

---

# Missing evidence

A factual claim may be unsupported even when it cannot be proven false.

Distinguish:

## Contradicted

Available evidence shows that the claim is wrong.

## Unsupported

The artifact makes a consequential claim for which the available grounding or required source does not provide support.

## Unverified

The claim may be plausible, but the required verification level has not been completed. `Unsupported` means the available basis does not support the claim; `Contradicted` means evidence shows it is wrong; `Unverified` means required checking remains incomplete.

Do not fabricate evidence to repair an unsupported claim.

The Writer should:

- correct it when existing authority permits the correction;
- qualify or remove it;
- correct it when existing schema authority permits the correction;
- qualify or remove it;
- or return the unresolved need to the Planner to update the schema — expanding `<authority>`, adjusting `<specification>`, or setting `<status>Blocked</status>` on the affected part.

---

# Conflicting sources

When reliable sources disagree:

- identify the conflict;
- preserve the relevant distinction;
- do not select one silently unless the writing requirements establish source precedence.

A conflict may require a `Should fix` or `Blocker` finding depending on its importance to the artifact.

If the conflict is between supplied material and independently established correctness, report the discrepancy. Do not assume higher source fidelity means the correctness concern disappears. Whether the source may be changed is governed by requirements and authority.

---

# Materiality

Do not turn factual review into pedantic correction.

Prioritize claims that affect:

- the artifact's central argument;
- decisions;
- technical correctness;
- credibility;
- quantitative interpretation;
- legal or policy meaning;
- important chronology;
- user action;
- practical usability when the artifact is instructional or procedural.

Minor factual imperfections can still be findings, but severity should reflect their actual impact.

A defect that makes a central example unusable can be material even if the surrounding prose is accurate. Do not turn minor implementation style preferences into factual findings.

---

# Grading

## Aligned

Use `Aligned` when:

- consequential factual and technical content is correct to the level required by the task, not merely source-consistent;
- numbers and attribution are accurate;
- certainty and scope match the evidence;
- no material unsupported factual claim remains.

## Drift

Use `Drift` when a factual problem exists.

Assign:

### Blocker

Use when the issue makes the artifact materially unreliable or unsafe to ship.

Examples:

- central claim is false;
- fabricated evidence;
- critical number is wrong;
- material quotation is fabricated;
- recommendation depends on an unsupported factual premise;
- significant legal, safety, financial, or technical statement is incorrect;
- a central technical or procedural example is materially wrong or unusable and would mislead the intended reader.

### Should fix

Use when a meaningful factual defect exists but does not invalidate the entire artifact.

Examples:

- incorrect secondary number;
- overstated generalization;
- important missing qualifier;
- inaccurate source attribution;
- stale current-state statement;
- meaningful but non-central technical or procedural defect.

### Polish

Use sparingly for low-impact factual precision issues.

Examples:

- harmless rounding inconsistency;
- minor imprecision that does not change interpretation.

## Not applicable

Use `Not applicable` when the artifact contains no consequential factual or source-dependent claims.

## Not reviewed

Use `Not reviewed` only when factual checking was required but could not actually be performed.

---

# Reviewer output

For each finding, populate the canonical `review.md` fields:

- `Check`: `Factual accuracy`
- `Status`: `Drift`
- `Severity`: `Blocker`, `Should fix`, or `Polish`
- `Finding`: state what is inaccurate, unsupported, stale, or overstated
- `Affected span / element`: identify the exact claim
- `Governing requirement or standard`: `factual-accuracy.md` plus the relevant rule ID
- `Suggested direction`: state whether the Writer should correct, qualify, remove, verify, or return the unresolved need to the Planner to update the schema

Do not rewrite the full passage.

A clean factual review should be recorded as `Aligned`.
