---
type: reviewer-check
name: ai-writing
applies-when: The artifact contains prose intended for a reader.
---

# Check: AI-writing / slop

Detect writing that is generic, mechanically generated, repetitive, inflated, hollow, or visibly contaminated by assistant-generation patterns.

This check is diagnostic.

The presence of a pattern is not automatically a defect.

A finding exists only when the pattern materially weakens the artifact in its actual context.

Evaluate the artifact against:

1. the patterns below;
2. the applicable writing requirements;
3. the applicable universal, genre, and channel standards.

Higher-priority requirements and legitimate genre or channel conventions override stylistic heuristics.

## Core principle

AI slop is not simply writing that resembles AI-generated text.

The important failure is:

> Fluent language substitutes for specificity, substance, judgment, evidence, or communicative purpose.

Specificity is the primary corrective signal.

Do not penalize writing merely for being polished, grammatical, formal, concise, or generated with AI assistance.

## Finding requirements

For every finding:

- identify the exact affected span or element;
- identify the pattern or rule involved;
- explain why it weakens this artifact;
- assign severity;
- suggest the direction of correction.

Do not rewrite the artifact.

Do not flag a phrase merely because it appears on a watch list.

Context determines whether the usage is actually weak.

---

# Content patterns

## AW-01 — Significance inflation

Flag language that assigns broad importance without establishing why.

Common signals include claims that something:

- marks a pivotal moment;
- plays a crucial role;
- represents a major shift;
- reflects a broader trend;
- sets the stage for something;
- stands as a testament;
- leaves a lasting impact.

The problem is unsupported significance, not the vocabulary itself.

Prefer concrete consequences, evidence, or scope.

---

## AW-02 — Notability substitution

Flag attempts to establish importance primarily through prestige or name-dropping rather than substantive relevance.

Examples include:

- long publication lists;
- institution lists;
- prominent-person references;
- generic claims of widespread recognition.

Named references are appropriate when the source itself provides relevant evidence or context.

---

## AW-03 — Superficial analytical clauses

Watch for appended clauses that imitate analysis without adding information.

Common forms include:

- `highlighting...`
- `underscoring...`
- `reflecting...`
- `demonstrating...`
- `showcasing...`
- `emphasizing...`

Flag them when removing the clause changes little or when the claimed interpretation is unsupported.

Do not flag a participial clause merely because of its grammar.

---

## AW-04 — Promotional inflation

Flag promotional adjectives and framing that replace concrete description.

Examples can include:

- groundbreaking;
- revolutionary;
- vibrant;
- profound;
- renowned;
- stunning;
- transformative;
- game-changing.

These words are valid when the evidence or genre supports them.

The defect is unsupported promotion.

---

## AW-05 — Vague attribution

Flag claims assigned to unnamed or unverifiable authorities when attribution matters.

Examples:

- `experts believe`;
- `research shows`;
- `industry reports indicate`;
- `many observers argue`;
- `studies suggest`;

without identifying the relevant evidence.

Do not require attribution for ordinary common knowledge.

---

## AW-06 — Formulaic problem or future sections

Flag generic passages such as:

- `Despite these challenges...`;
- generic `Challenges and Future Outlook`;
- vague statements that the subject will continue to evolve;
- automatic optimism after listing problems.

A challenges or future-work section is valid when it contains specific, relevant substance.

---

# Language and grammar patterns

## AW-07 — AI-associated vocabulary clusters

Watch for clusters of abstract, high-probability words such as:

- additionally;
- crucial;
- delve;
- enhance;
- foster;
- interplay;
- intricate;
- landscape;
- pivotal;
- showcase;
- tapestry;
- testament;
- underscore;
- vibrant.

Do not flag individual words automatically.

Flag when several such terms create abstract, inflated, or interchangeable prose.

Prefer the plainest precise word for the intended meaning.

---

## AW-08 — Unnecessarily elaborate copula avoidance

Flag constructions that use inflated verbs where a direct statement would be clearer.

Examples:

- `serves as`;
- `stands as`;
- `represents`;
- `boasts`;
- `offers`;

when `is`, `has`, or a more precise action would communicate the meaning better.

Do not mechanically replace valid uses.

---

## AW-09 — Formulaic negative parallelism

Watch for repeated constructions such as:

- `It's not X. It's Y.`
- `It's not just X; it's Y.`
- `Not only X, but also Y.`

These can be rhetorically effective.

Flag them only when they manufacture contrast or profundity where no substantive distinction exists.

---

## AW-10 — Rule-of-three overuse

Flag repeated forced triplets that make writing appear artificially comprehensive or rhythmic.

A natural three-item list is not a problem.

The signal becomes meaningful when multiple unrelated statements are repeatedly forced into groups of three without informational reason.

---

## AW-11 — Synonym cycling

Flag unnecessary terminology changes used only to avoid repetition.

Example pattern:

`the router → the selector → the decision engine → the routing mechanism`

when all terms refer to the same concept.

Prefer one canonical term for one concept.

This is especially important in technical writing.

---

## AW-12 — False ranges

Flag constructions of the form:

`from X to Y`

when X and Y do not define a meaningful spectrum, sequence, or range.

Use direct enumeration or explain the actual relationship instead.

---

# Surface-style patterns

## AW-13 — Punctuation mannerisms

Watch for repeated punctuation patterns strongly associated with generated prose, including excessive:

- em dashes;
- semicolons;
- parenthetical interruptions;
- rhetorical colons.

No punctuation mark is inherently prohibited.

Flag only when its frequency or use harms readability, creates an artificial cadence, or conflicts with an applicable standard.

---

## AW-14 — Mechanical emphasis

Flag excessive bolding or other emphasis that repeatedly tells the reader what to notice rather than allowing structure and content to establish importance.

Technical literals, key warnings, and deliberate emphasis may legitimately use formatting.

---

## AW-15 — Inline-header list overuse

Watch for repeated structures such as:

`**Scalability:** ...`

`**Reliability:** ...`

`**Security:** ...`

They are valid when the labels genuinely aid scanning.

Flag them when ordinary connected reasoning has been mechanically converted into labeled bullets.

---

## AW-16 — Artificial heading capitalization or structure

Flag headings whose capitalization or hierarchy conflicts with the applicable writing standard or creates unnecessary visual ceremony.

Do not impose sentence case when the applicable channel or organizational convention specifies otherwise.

---

## AW-17 — Decorative emoji

Flag emoji used as automatic decoration rather than communication.

Emoji may be appropriate in channels whose conventions or author's voice support them.

Do not apply a universal prohibition.

---

## AW-18 — Mechanical typography preferences

Do not treat typography choices such as straight versus curly quotation marks as AI slop by themselves.

Flag typography only when:

- inconsistent within the artifact;
- malformed;
- incompatible with the target format;
- explicitly prohibited by an applicable standard.

---

# Communication patterns

## AW-19 — Chatbot residue

Flag assistant-to-user language accidentally left inside the artifact.

Examples:

- `Here is the revised version`;
- `I hope this helps`;
- `Certainly!`;
- `Let me know if you'd like...`;
- `Would you like me to...`;
- references to the prompt or previous assistant response.

Do not flag similar language when it is genuinely appropriate to the artifact itself, such as a personal email.

---

## AW-20 — Model or knowledge disclaimers

Flag irrelevant model-centric disclaimers such as:

- `As of my last update`;
- `As an AI language model`;
- `Based on the information available to me`;

when they are generation residue rather than meaningful qualification.

Legitimate source limitations or uncertainty should be stated specifically instead.

---

## AW-21 — Sycophantic framing

Flag praise directed at the requester rather than the substance when it leaks into an artifact.

Examples:

- `Great question`;
- `Excellent point`;
- `You're absolutely right`;

when they are automatic validation rather than intentional communication.

Do not flag genuine interpersonal acknowledgment in a channel where it is appropriate.

---

# Filler and hedging

## AW-22 — Filler phrases

Flag phrases that add words without adding meaning.

Examples:

- `in order to` when `to` is sufficient;
- `due to the fact that` when `because` is sufficient;
- `at this point in time` when `now` is sufficient;
- `in the event that` when `if` is sufficient;
- `has the ability to` when `can` is sufficient;
- `it is important to note that` when the sentence can state the point directly.

Do not remove wording when it carries necessary emphasis, rhythm, or legal precision.

---

## AW-23 — Excessive hedging

Flag stacked qualifiers that weaken a claim beyond what uncertainty requires.

Examples:

`could potentially possibly...`

`it may perhaps be the case that...`

Use the minimum qualification required by the evidence.

Do not remove genuine uncertainty.

---

## AW-24 — Generic positive conclusions

Flag endings that add optimism or significance without adding information.

Examples:

- `The future looks bright.`
- `Exciting times lie ahead.`
- `This is a major step in the right direction.`
- `The possibilities are endless.`
- `We're only getting started.`

A conclusion should contribute a real:

- implication;
- decision;
- next action;
- finding;
- unresolved question;

or simply end when the artifact is complete.

---

# Semantic slop check

The 24 patterns above primarily detect observable writing tendencies.

They are not sufficient.

A draft can contain none of them and still communicate almost nothing.

## AW-25 — Hollow content

Apply the removal test:

> If this sentence or paragraph disappeared, what meaningful information, reasoning, qualification, navigation, or intentional rhetorical function would the reader lose?

If the answer is effectively nothing, the content may be hollow.

Look for:

- paragraphs that restate the heading;
- sentences that announce importance without explaining it;
- conclusions that merely repeat previous content;
- generic professional observations applicable to almost any subject;
- polished statements unsupported by evidence or judgment;
- paragraphs whose only purpose appears to be making the artifact longer.

This is a substantive finding, not merely a style finding.

Do not propose invented substance as the fix.

If necessary substance is missing and the artifact cannot be completed as written, return the unresolved need to the Planner to update the schema — either expanding `<specification>` or `<authority>`, or setting `<status>Blocked</status>` on the affected part.

---

# Authenticity and naturalness

Do not require every artifact to contain:

- first person;
- personal opinion;
- humor;
- emotional reaction;
- informal phrasing;
- stylistic irregularity.

Those characteristics may improve some personal or social writing and be inappropriate in technical, legal, scientific, or formal artifacts.

Instead ask:

> Does the writing sound like an intentional communication for this audience and purpose, or like generic prose that could have been produced for almost any topic?

Naturalness comes primarily from:

- specificity;
- meaningful judgment;
- appropriate terminology;
- real evidence;
- purposeful structure;
- proportionate detail.

Do not inject artificial personality merely to make text appear less machine-generated.

---

# Pattern interaction

A single weak signal is often harmless.

Multiple signals occurring together provide stronger evidence.

For example:

- significance inflation;
- vague attribution;
- abstract AI vocabulary;
- generic conclusion;

within the same paragraph may indicate substantive slop even when each phrase could individually be acceptable.

Evaluate the combined effect.

---

# Grading

## Aligned

Use `Aligned` when:

- no material AI-writing or slop problem is present;
- any detected surface patterns are legitimate in context;
- the prose contains sufficient specificity and substance.

## Drift

Use `Drift` when one or more patterns materially weaken the artifact.

Typical examples:

- unnecessary filler;
- repeated formulaic phrasing;
- terminology cycling;
- unsupported significance language;
- generic conclusion;
- one or more hollow sentences;
- excessive stylistic mannerisms.

Assign severity according to impact:

- `Polish` for cosmetic or low-impact cases;
- `Should fix` when the problem meaningfully reduces clarity, credibility, specificity, or usefulness;
- `Blocker` only when the slop causes a fundamental failure such as fabricated substance or failure to communicate the required content.

## Not applicable

Use `Not applicable` when there is no prose to evaluate.

## Not reviewed

Use `Not reviewed` only when the check could not actually be performed.

---

# Reviewer output

For each finding, populate the canonical `review.md` fields:

- `Check`: `AI-writing / slop`
- `Status`: `Drift`
- `Severity`: `Blocker`, `Should fix`, or `Polish`
- `Finding`: concise explanation of the problem
- `Affected span / element`: exact text or location
- `Governing requirement or standard`: `ai-writing.md` plus the relevant rule ID
- `Suggested direction`: explain what kind of correction is needed

Do not provide a rewritten version of the artifact.

A clean `Aligned` result is valid and should be common.
