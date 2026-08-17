---
type: reviewer-check
name: consistency
applies-when: The artifact contains multiple claims, values, terms, sections, tables, figures, or other elements that must remain internally coherent.
---

# Check: Consistency

Evaluate whether the artifact is internally coherent.

This check asks:

> Does the artifact agree with itself?

It does not determine whether claims are true in the outside world. That belongs to `factual-accuracy.md`.

It does not determine whether claims match the source material. That belongs primarily to Grounding fidelity and Factual accuracy.

Focus on contradictions, incompatible values, and terminology or naming drift inside the artifact itself.

## Core principle

A reader should encounter one coherent representation of the artifact's:

- facts;
- numbers;
- terminology;
- decisions;
- states;
- dates;
- scope;
- structure.

Do not force cosmetic uniformity where variation has no effect on meaning.

---

# What to check

## CO-01 — Self-contradiction

Flag two or more statements that cannot all be true within the artifact's stated context.

Examples:

Earlier:

`The migration will use a single deployment phase.`

Later:

`The first of three deployment phases begins Monday.`

Or:

Introduction:

`The system has three major components.`

Body:

Four major components are described.

For every contradiction finding, identify both conflicting spans.

Do not decide silently which statement is correct unless the artifact itself establishes that.

---

## CO-02 — Decision consistency

Check whether a decision stated in one place changes elsewhere.

Examples:

- one section selects Option A while another assumes Option B;
- the summary recommends a service while the implementation section assumes an in-process library;
- a decision is described as final in one section and unresolved in another.

Distinguish an intentional evolution of a decision from an accidental contradiction.

If the artifact documents a decision change, the change should be explicit.

---

## CO-03 — Scope consistency

Check that scope remains stable across the artifact.

Flag cases such as:

- introduction says the design covers routing only;
- later sections quietly include model hosting;
- non-goals exclude a capability that another section designs in detail.

Do not flag legitimate detail that remains within the stated scope.

---

## CO-04 — Requirement consistency

Check whether different parts of the artifact state incompatible requirements.

Examples:

- one section requires synchronous execution;
- another requires the same operation to be non-blocking and asynchronous without explaining the distinction;
- one section sets a 500 ms latency target;
- another states the requirement as 1 second.

This check concerns inconsistency between statements in the artifact.

Whether either requirement is factually correct belongs elsewhere.

---

# Numerical consistency

## CO-05 — Arithmetic reconciles

Check arithmetic that can be validated from values within the artifact.

Examples:

- components should sum to a stated total;
- percentages should reconcile;
- subtotal and total should agree;
- before/after values should match the claimed difference;
- ratios should correspond to the stated numerator and denominator.

Example:

`Model A: 40%`
`Model B: 35%`
`Model C: 30%`
`Total: 100%`

The listed percentages sum to 105%.

Flag the broken calculation.

---

## CO-06 — Repeated values remain stable

When the same quantity appears more than once, verify that it remains consistent unless the difference is explicitly explained.

Check:

- task counts;
- model counts;
- costs;
- percentages;
- latency values;
- dates;
- limits;
- thresholds;
- version numbers.

Example:

Executive summary:

`The evaluation used 7,080 tasks.`

Methodology:

`The evaluation contains 7,800 tasks.`

Quote both values in the finding.

---

## CO-07 — Units remain compatible

Check for internal unit conflicts.

Examples:

- milliseconds versus seconds;
- dollars versus thousands of dollars;
- GB versus MB;
- percentage versus percentage points.

Do not flag a deliberate unit conversion when it is correct and clear.

---

## CO-08 — Derived statements match values

Check statements such as:

- `doubled`;
- `halved`;
- `increased by 20%`;
- `increased by 20 percentage points`;
- `three times larger`;

against the values already stated in the artifact.

This is an internal arithmetic check.

If the source values themselves may be wrong, that is separately a factual-accuracy issue.

---

# Terminology consistency

## CO-09 — One concept keeps one canonical name

Flag terminology drift when the same thing receives different names in a way that could make the reader think they are different concepts.

Example:

- `routing engine`;
- `model selector`;
- `router service`;

used interchangeably without establishing equivalence.

Variation is not automatically wrong.

Flag it when it creates ambiguity or unnecessary cognitive load.

---

## CO-10 — Different concepts remain distinguishable

The reverse problem also matters.

Do not allow one term to refer to two materially different concepts without clarification.

Example:

`model score`

used once for predicted quality and elsewhere for the final cost-adjusted routing score.

Require the distinction to be explicit.

---

## CO-11 — Acronyms remain stable

Check that:

- the same acronym has the same expansion;
- an acronym is not reused for another concept;
- renamed concepts do not retain outdated acronyms.

Do not require an acronym to be repeated or re-expanded unnecessarily.

---

## CO-12 — Roles and actors remain stable

Check names for:

- users;
- services;
- teams;
- agents;
- system roles;
- external actors.

Flag cases where a role changes name in a way that changes or obscures responsibility.

Example:

`Orchestrator` in one section and `Router` in another may be a real distinction or accidental drift.

Use context to determine which.

---

## CO-13 — State names remain stable

For workflows and state machines, check that state names are consistent across:

- prose;
- diagrams;
- tables;
- examples;
- sequences.

Example:

`Pending Review` in the state table versus `Awaiting Approval` in the sequence description.

Flag only when they are intended to represent the same state.

---

# Structural consistency

## CO-14 — Counts match enumerations

If the artifact says:

- `three principles`;
- `four stages`;
- `two alternatives`;

verify that the following content actually contains that number.

Flag stale counts left behind after editing.

---

## CO-15 — Summary matches body

Check whether summaries, executive sections, introductions, and conclusions accurately represent the detailed content.

Common failures:

- summary names three findings while the body supports two;
- conclusion introduces a new recommendation;
- executive summary states a decision that the body still treats as unresolved.

Do not require the summary to repeat every body detail.

---

## CO-16 — Tables and prose agree

When the same information appears in a table and prose, verify that the representations agree.

Check:

- values;
- labels;
- selected option;
- rankings;
- status;
- ownership;
- dates.

If they conflict, quote or identify both representations.

---

## CO-17 — Figures and prose agree

When a diagram, chart, or figure conveys information also stated in prose, check for meaningful inconsistencies such as:

- different component names;
- missing or additional components;
- contradictory direction of flow;
- inconsistent boundaries;
- different state names.

Do not flag differences caused purely by intentional abstraction.

---

# Temporal consistency

## CO-18 — Dates agree internally

Check dates repeated within the artifact.

Examples:

- launch date;
- review date;
- experiment period;
- milestone;
- deadline.

This check determines whether the artifact contradicts itself.

Whether the date is correct in reality belongs to Factual accuracy.

---

## CO-19 — Sequence remains coherent

Check statements about ordering such as:

- before;
- after;
- first;
- next;
- finally;
- phase 1 / phase 2;
- prerequisite relationships.

Flag sequences that cannot coexist.

---

# Status and certainty consistency

## CO-20 — Status remains coherent

Check whether something is represented consistently as:

- proposed;
- approved;
- implemented;
- tested;
- deployed;
- deprecated;
- blocked.

Example:

One section says:

`The feature is currently in production.`

Another says:

`The feature will be deployed after the POC.`

Unless different environments or scopes explain the distinction, this is inconsistent.

---

## CO-21 — Assumptions do not silently become facts

If an artifact explicitly labels something as an assumption in one place, do not allow later sections to treat it as established fact without explanation.

Likewise, an unresolved question should not silently become a settled design decision.

This check concerns internal status drift.

Whether the assumption is actually true belongs to Factual accuracy.

---

# Intentional differences

Do not flag differences that are intentionally scoped.

Examples:

- development environment uses one value and production another;
- P50 latency differs from P95 latency;
- phase 1 and phase 2 have different limits;
- current state differs from proposed state;
- HLD terminology intentionally maps to a more specific LLD concept.

A finding exists only when the artifact fails to make a consequential distinction clear enough.

---

# Relationship to other checks

## Factual accuracy

Use `factual-accuracy.md` when asking:

> Is this claim true or supported by evidence?

Use this check when asking:

> Does this claim agree with the rest of the artifact?

A sentence can be internally consistent and factually wrong.

It can also be individually correct but contradict another correct-looking sentence in the same draft.

These are separate failures.

## AI-writing / slop

Terminology drift may also be detected as synonym cycling by `ai-writing.md`.

Record the finding under Consistency when the main problem is ambiguity or conceptual instability.

Do not duplicate the same defect under both checks unless it creates genuinely separate consequences.

## Artifact integrity

Broken links, placeholders, malformed tables, and rendering problems belong to `artifacts.md`.

Consistency covers disagreement between meaningful artifact elements, not their mechanical validity.

---

# Finding requirements

For a contradiction, quote or identify **both conflicting spans** whenever possible.

For broken arithmetic:

- identify the relevant values;
- show the inconsistency concisely.

For terminology drift:

- identify the competing terms;
- explain why they appear to represent the same concept or why the distinction is unclear.

Do not simply write:

`The document is inconsistent.`

A consistency finding must identify the inconsistency.

---

# Grading

## Aligned

Use `Aligned` when:

- no material internal contradiction exists;
- consequential numbers reconcile;
- repeated values remain coherent;
- terminology remains sufficiently stable;
- tables, summaries, and prose agree where they represent the same information.

## Drift

Use `Drift` when an internal inconsistency exists.

### Blocker

Use when the inconsistency makes the artifact fundamentally ambiguous or unsafe to use.

Examples:

- two incompatible final decisions;
- contradictory requirements that prevent implementation;
- materially conflicting financial or technical values;
- the artifact gives incompatible instructions to the reader.

### Should fix

Use for meaningful inconsistencies that could mislead or confuse the reader.

Examples:

- conflicting dates;
- mismatched totals;
- inconsistent component counts;
- terminology drift that obscures architecture;
- summary contradicts the detailed result.

### Polish

Use for minor consistency defects with little effect on meaning.

Examples:

- one isolated terminology slip where the intended concept remains obvious;
- low-impact naming inconsistency.

## Not applicable

Use `Not applicable` when the artifact is too small or contains no repeated or related elements that can meaningfully be checked for internal consistency.

## Not reviewed

Use `Not reviewed` only when the check could not actually be performed.

---

# Reviewer output

For each finding, populate the canonical `review.md` fields:

- `Check`: `Consistency`
- `Status`: `Drift`
- `Severity`: `Blocker`, `Should fix`, or `Polish`
- `Finding`: concise description of the internal inconsistency
- `Affected span / element`: identify both conflicting spans, values, terms, or elements where possible
- `Governing requirement or standard`: `consistency.md` plus the relevant rule ID
- `Suggested direction`: indicate what must be reconciled or clarified

Do not decide which conflicting statement should change unless requirements, grounding, or another authoritative source clearly establishes it.

A clean internal consistency review should be recorded as `Aligned`.
