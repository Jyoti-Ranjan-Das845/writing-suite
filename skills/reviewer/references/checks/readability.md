---
type: reviewer-check
name: readability
applies-when: The artifact contains prose, structured explanation, instructions, or other reader-facing content.
---

# Check: Readability

Evaluate whether the intended reader can understand the artifact efficiently and correctly.

This check is about reader effort.

It does not ask whether the artifact is factually true, mechanically valid, or stylistically fashionable.

The central question is:

> Can the intended audience understand the content without unnecessary cognitive effort?

Evaluate readability relative to:

- the stated audience;
- the artifact's purpose;
- the applicable genre;
- the delivery channel;
- the technical complexity of the subject.

Do not simplify material past the point of precision.

---

# Core principle

Readable writing is not always simple writing.

A technically complex artifact may legitimately contain:

- specialized terminology;
- dense reasoning;
- equations;
- long sentences;
- detailed tables.

The problem is not complexity itself.

The problem is avoidable difficulty.

A finding should identify what makes understanding harder than necessary.

---

# What to check

## RD-01 — Audience fit

Check whether the artifact assumes an appropriate level of knowledge.

Flag when it:

- assumes knowledge the intended audience is unlikely to have;
- explains basic material the intended audience already knows to an excessive degree;
- uses unexplained domain terminology when explanation is necessary;
- removes necessary technical terminology in favor of vague simplification.

Readability depends on the actual audience, not a universal reading level.

---

## RD-02 — Purpose is apparent

The reader should be able to understand what the artifact or section is trying to accomplish.

Flag openings or sections where the reader must consume substantial material before discovering the point.

Do not require every artifact to state its purpose explicitly when the purpose is already obvious.

---

## RD-03 — Important information is easy to locate

Check whether the artifact makes consequential:

- decisions;
- conclusions;
- actions;
- constraints;
- findings;
- risks;

reasonably easy to find.

Flag when important information is buried beneath less important context.

This is especially important for:

- executive documents;
- emails;
- technical designs;
- reports;
- operational instructions.

---

## RD-04 — Sentences are cognitively manageable

Flag sentences that contain too many independent ideas, nested qualifications, or structural turns to process reliably.

Common signals include:

- several independent clauses;
- deeply nested parentheticals;
- multiple levels of qualification;
- long chains of `which`, `that`, or `where`;
- several unrelated concepts joined into one sentence.

Do not use a fixed sentence-length threshold.

A long sentence can remain highly readable when its structure is clear.

---

## RD-05 — Sentence relationships are clear

The reader should understand how clauses relate.

Flag ambiguous relationships such as unclear:

- cause;
- contrast;
- condition;
- sequence;
- exception;
- ownership.

Do not require explicit transition words when grammar and context already make the relationship obvious.

---

## RD-06 — References are unambiguous

Watch for unclear:

- `it`;
- `this`;
- `that`;
- `they`;
- `these`;
- `the former`;
- `the latter`;

when multiple plausible referents exist.

Prefer repeating the relevant noun when that reduces ambiguity.

---

# Paragraph readability

## RD-07 — Each paragraph has a coherent function

A paragraph should normally develop one:

- point;
- step;
- concept;
- argument;
- explanation.

Flag paragraphs that combine several unrelated purposes without clear structure.

---

## RD-08 — Paragraph progression is clear

Sentences within a paragraph should follow a comprehensible relationship.

Useful patterns may include:

- claim → evidence;
- statement → explanation;
- problem → consequence;
- decision → rationale;
- observation → implication;
- step → next step.

No fixed pattern is required.

Flag paragraphs that feel like a list of facts without a discernible relationship when the relationship matters.

---

## RD-09 — Paragraphs are proportionate

Flag very large paragraphs when their density makes the content difficult to navigate.

Do not mechanically split paragraphs based on line count.

Likewise, do not flag short paragraphs merely for being short.

A paragraph's length should reflect the complexity of the idea it contains.

---

# Organization

## RD-10 — Information order matches reader needs

Check whether the sequence supports comprehension.

Examples:

- explain a term before depending on it;
- establish a problem before evaluating its solution;
- state a decision before extensive implementation details when the audience needs the decision first;
- give prerequisites before procedural steps.

Flag ordering that forces the reader to mentally reorder the document.

---

## RD-11 — Dependencies are introduced before use

If understanding one concept depends on another, establish the dependency first when practical.

Flag unexplained forward references that materially obstruct understanding.

Do not prohibit deliberate previewing of later material.

---

## RD-12 — Sections have clear boundaries

Check whether headings and section breaks help the reader understand changes in topic or purpose.

Flag:

- several unrelated subjects under one heading;
- excessive fragmentation into tiny sections;
- headings that do not match their content.

Do not require more headings merely because the artifact is long.

---

# Terminology

## RD-13 — Specialized terms are appropriate

Use technical terminology when it improves precision for the intended audience.

Flag jargon when:

- a clearer familiar term would work;
- the reader is unlikely to know it;
- the term is unnecessary to the subject.

Do not replace established domain terminology with imprecise everyday wording.

---

## RD-14 — Necessary terms are explained

When an unfamiliar term is necessary, provide enough explanation for the reader to continue.

Explanation may come through:

- definition;
- context;
- example;
- expansion of an acronym.

Do not define every technical term automatically.

---

## RD-15 — Terminology does not overload working memory

Even when terminology is consistent, too many new concepts introduced at once can make a section difficult to follow.

Flag sections that introduce several unfamiliar concepts before establishing how they relate.

The correction may involve:

- reordering;
- grouping;
- defining concepts incrementally.

---

# Concision and density

## RD-16 — Remove unnecessary reader work

Flag wording that makes the reader process more language than the idea requires.

Common causes:

- unnecessary setup;
- repeated explanations;
- excessive qualifications;
- redundant examples;
- bloated transitions.

This overlaps with AI-writing / slop, but Readability focuses on the resulting reader effort.

---

## RD-17 — Preserve necessary explanation

Do not reward brevity that makes the artifact cryptic.

Flag missing explanation when the reader must infer a consequential:

- assumption;
- relationship;
- step;
- constraint;
- implication.

Concise writing should remain sufficiently explicit.

---

## RD-18 — Match information density to the artifact

A design document, executive email, research report, and social post legitimately have different information densities.

Evaluate density against:

- audience;
- purpose;
- channel;
- genre.

Do not apply one universal brevity standard.

---

# Lists and tables

## RD-19 — Use lists for genuinely parallel information

Lists should make parallel information easier to scan.

Flag lists where:

- items are not comparable;
- connected reasoning has been fragmented;
- each bullet is effectively a separate paragraph with no benefit from list structure.

---

## RD-20 — Keep list items parallel when practical

Check whether items use comparable grammatical and conceptual structure.

Example of unnecessary mismatch:

- `Reduce latency`
- `Cost improvements`
- `The system should be easier to operate`

Prefer consistent framing when the items represent the same kind of information.

Do not force parallel grammar when meanings genuinely differ.

---

## RD-21 — Tables should reduce comparison effort

Use tables when readers benefit from comparing values or attributes across consistent dimensions.

Flag tables that are harder to understand than equivalent prose because they contain:

- long narrative cells;
- inconsistent dimensions;
- unclear headers;
- too many unrelated columns.

Mechanical table failures belong to Artifact integrity.

---

# Procedures and instructions

## RD-22 — Steps are actionable

When the artifact contains instructions, each step should make clear what the reader should do.

Flag vague instructions such as:

`Configure the environment appropriately.`

when the artifact is expected to provide operational guidance.

---

## RD-23 — Sequence is explicit when order matters

Use numbered steps or explicit ordering when actions must occur in sequence.

Do not use numbered steps for independent options.

---

## RD-24 — Preconditions are visible

If a procedure depends on:

- permissions;
- configuration;
- tools;
- files;
- prior state;

make consequential prerequisites clear before the reader reaches the dependent step.

---

## RD-25 — Expected outcomes are clear when needed

For operational procedures, tell the reader how to know a consequential step succeeded when that is not obvious.

Do not add verification text after trivial actions.

---

# Technical readability

## RD-26 — Separate abstraction levels when necessary

Flag sections that rapidly alternate between:

- architecture;
- API detail;
- implementation internals;
- operational behavior;

in a way that makes the design difficult to follow.

This is especially important for HLD and LLD writing.

---

## RD-27 — Explain diagrams and code in context

When a technical artifact contains:

- code;
- diagrams;
- schemas;
- equations;
- configuration;

the surrounding prose should establish why the element matters when that is not self-evident.

Do not narrate every obvious detail already visible.

---

## RD-28 — Avoid unexplained implementation jumps

Flag reasoning such as:

`We need reliable routing. Therefore, we use Redis.`

when the relationship between requirement and implementation is consequential but unstated.

The reader should understand the reasoning step.

---

# Ambiguity

## RD-29 — Avoid ambiguous modifiers

Flag sentences where words such as:

- only;
- just;
- almost;
- approximately;
- primarily;

can attach to multiple parts of the sentence and change meaning.

---

## RD-30 — Make conditions explicit

If a statement is true only:

- in production;
- for one model;
- after migration;
- above a threshold;
- under a specific configuration;

state the relevant condition where omission could mislead the reader.

---

## RD-31 — Avoid vague comparative terms

Words such as:

- better;
- faster;
- cheaper;
- larger;
- significant;
- efficient;

should have enough context for the reader to understand the comparison when the distinction matters.

This may also be a factual-accuracy issue if the comparison is unsupported.

---

# Navigation

## RD-32 — Headings should help prediction

A heading should let the reader anticipate the content that follows.

Flag vague headings such as:

- `Overview`;
- `Details`;
- `Other`;
- `More Information`;

when a more informative heading would materially improve navigation.

Do not flag conventional headings when their meaning is clear from context.

---

## RD-33 — Avoid excessive hierarchy

Too many nested headings can make a document harder rather than easier to navigate.

Flag hierarchy that fragments a straightforward argument into many tiny sections.

Do not impose a maximum heading depth mechanically.

---

## RD-34 — Make long artifacts skimmable

For long reader-facing artifacts, check whether readers can locate major:

- decisions;
- findings;
- sections;
- actions.

This may be achieved through:

- headings;
- summaries;
- tables;
- navigation links;

depending on the artifact.

Do not require all of them.

---

# Tone and readability

## RD-35 — Avoid unnecessary formality

Flag language that makes straightforward ideas harder to understand through inflated formality.

Prefer:

`We tested three models.`

over:

`An evaluation of three models was subsequently undertaken.`

when the latter provides no useful distinction.

---

## RD-36 — Avoid unnecessary informality

Conversational writing can be readable.

However, flag:

- unexplained shorthand;
- excessive slang;
- fragmentary language;
- inside jokes;

when they impair the intended audience's understanding.

---

## RD-37 — Keep tone from obscuring meaning

Do not let:

- excessive politeness;
- enthusiasm;
- caution;
- criticism;

hide the actual message.

Example:

A blocker should still be identifiable as a blocker even when communicated diplomatically.

---

# Readability heuristics

Readability scores or formulae may be used as supporting signals when appropriate.

Do not use a numerical readability score as the sole basis for a finding.

Such formulas often treat:

- long technical terms;
- domain vocabulary;
- sentence length;

as inherently difficult even when they are appropriate for the audience.

Semantic judgment takes precedence.

---

# Removal and simplification tests

When a passage feels difficult, ask:

### Removal test

> Can any part be removed without losing necessary meaning?

If yes, unnecessary material may be increasing reader effort.

### Split test

> Does this sentence contain multiple ideas that would become clearer if separated?

If yes, splitting may help.

### Explicitness test

> Is the reader being asked to infer a relationship that should be stated?

If yes, make the relationship explicit.

### Audience test

> Would the intended reader understand this term, assumption, or level of detail?

Use the actual audience, not a hypothetical general reader.

These are diagnostic tools, not automatic rules.

---

# Relationship to other checks

## AI-writing / slop

Use `ai-writing.md` when the main defect is:

- generic language;
- formulaic writing;
- hollow prose;
- AI-associated mannerisms.

Use Readability when the main consequence is excessive reader effort or difficulty understanding the material.

Do not duplicate the same issue under both checks unless there are distinct defects.

## Consistency

Use `consistency.md` for conflicting terms, values, or claims.

Use Readability when the content is internally consistent but difficult to follow.

## Artifact integrity

Use `artifacts.md` for malformed or incomplete structure.

Use Readability when the structure is valid but poorly organized for comprehension.

## Factual accuracy

Use `factual-accuracy.md` for incorrect or unsupported claims.

Use Readability when a correct claim is expressed unclearly.

---

# Materiality

Do not flag every sentence that could theoretically be simpler.

A readability finding should identify a real reduction in:

- comprehension;
- navigation;
- interpretability;
- actionability;
- reader efficiency.

Stylistic alternatives with roughly equal clarity are not findings.

---

# Grading

## Aligned

Use `Aligned` when:

- the artifact is appropriately understandable for the intended audience;
- structure supports the reader's task;
- terminology is usable;
- consequential relationships are clear;
- density is proportionate;
- no material avoidable comprehension burden remains.

## Drift

Use `Drift` when readability is materially impaired.

### Blocker

Use when the intended reader cannot reliably understand or act on consequential parts of the artifact.

Examples:

- critical instructions are ambiguous;
- architecture is impossible to reconstruct;
- decision ask is buried or unclear;
- severe organization problems change interpretation.

### Should fix

Use for meaningful reader-effort problems.

Examples:

- dense paragraph obscures a major argument;
- unexplained terminology blocks understanding;
- critical information appears too late;
- several complex ideas are tangled in one sentence.

### Polish

Use for low-impact readability improvements.

Examples:

- one unnecessarily dense sentence;
- minor heading improvement;
- isolated unnecessary wording.

## Not applicable

Use `Not applicable` when there is no meaningful reader-facing prose or structured communication to evaluate.

## Not reviewed

Use `Not reviewed` only when the relevant artifact content was unavailable.

---

# Reviewer output

For each finding, populate the canonical `review.md` fields:

- `Check`: `Readability`
- `Status`: `Drift`
- `Severity`: `Blocker`, `Should fix`, or `Polish`
- `Finding`: explain the specific reader-effort problem
- `Affected span / element`: identify the exact sentence, paragraph, section, table, or structural element
- `Governing requirement or standard`: `readability.md` plus the relevant rule ID
- `Suggested direction`: explain whether the Writer should simplify, reorder, split, clarify, define, remove, or restructure

Do not rewrite the full passage.

A readable artifact should be recorded as `Aligned`.
