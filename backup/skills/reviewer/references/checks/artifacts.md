---
type: reviewer-check
name: artifacts
applies-when: The artifact contains rendered structure, links, references, placeholders, code blocks, tables, figures, attachments, or generated output that can fail mechanically.
---

# Check: Artifact integrity

Evaluate whether the artifact is mechanically complete, valid, and ready to deliver.

This check is not about prose quality.

It asks whether the artifact contains broken, unfinished, malformed, inconsistent, or generation-residue elements that would make it appear incomplete or unusable.

## Core principle

A document can be factually correct and well written while still failing as an artifact.

Examples include:

- unresolved placeholders;
- broken links;
- malformed tables;
- unfinished sections;
- missing referenced attachments;
- invalid code blocks;
- generation instructions accidentally left in the output.

The Reviewer should detect these issues before delivery.

---

# What to check

## AR-01 — Unresolved placeholders

Flag placeholders that were not intentionally preserved.

Common examples:

- `TODO`
- `TBD`
- `XXX`
- `[insert ...]`
- `<name>`
- `<date>`
- `<link>`
- `{placeholder}`
- `Lorem ipsum`

Do not flag placeholders when the artifact intentionally serves as a template.

If a placeholder is intentionally unresolved, that should be explicit from the requirements or surrounding context.

---

## AR-02 — Draft residue

Flag internal drafting or generation residue that should not appear in the final artifact.

Examples:

- `Need to verify this`
- `Add citation here`
- `Maybe mention...`
- `Writer note:`
- `Reviewer comment:`
- internal prompt instructions
- planning notes
- hidden workflow language accidentally copied into the deliverable

Do not flag legitimate editorial annotations when the requested artifact is itself a review or annotated draft.

---

## AR-03 — Incomplete sections

Flag sections that appear structurally present but contain no meaningful content.

Examples:

```text
## Risks

TBD
```

or a heading such as:

```text
## Conclusion
```

with no content when a conclusion is required.

Do not require every possible conventional section to exist.

Only evaluate sections actually present or required.

---

## AR-04 — Broken internal references

Check references such as:

- `see Section 4`;
- `as shown below`;
- `see Appendix A`;
- `see Figure 2`;
- `see the table above`.

Flag references when the referenced element:

- does not exist;
- has been renumbered;
- points to the wrong section;
- is materially ambiguous.

---

## AR-05 — Broken external links

When links are part of the artifact and can be checked, verify that:

- the URL is syntactically valid;
- the intended target exists;
- the visible label is not misleading.

Do not require every external link to be opened when link validity is not consequential or cannot be checked.

A link that cannot be verified should not automatically be called broken.

---

## AR-06 — Missing attachments or referenced files

Flag statements such as:

- `see attached report`;
- `the spreadsheet is attached`;
- `refer to the included diagram`;

when the required attachment or file is absent from the deliverable context.

Do not flag if the delivery system handles the attachment separately and its presence is known.

---

# Tables

## AR-07 — Table structure is valid

Check that tables have:

- coherent headers;
- the expected number of columns;
- rows aligned to the correct columns;
- no accidental truncation or malformed Markdown.

Flag rendering-breaking syntax.

---

## AR-08 — Table cells are complete

Flag cells containing accidental blanks, placeholders, or truncated content when the table implies a complete record.

Do not require every optional cell to contain content.

---

## AR-09 — Table labels are understandable

A reader should be able to understand what each column represents.

Flag ambiguous headers when they materially impair interpretation.

This is artifact integrity when the problem arises from the table structure itself.

Broader terminology issues belong to Consistency or Readability.

---

# Lists and numbering

## AR-10 — Numbering is coherent

Check numbered lists and explicitly numbered sections for:

- duplicate numbers;
- skipped numbers that appear accidental;
- broken nested numbering;
- stale references after editing.

Do not flag intentional numbering schemes.

---

## AR-11 — List structure is complete

Flag list items that are:

- accidentally empty;
- cut off;
- malformed;
- structurally detached from their parent item.

---

# Headings and document structure

## AR-12 — Heading hierarchy is mechanically valid

Check for obvious structural mistakes such as:

- jumping from `#` directly to `####` without intentional reason;
- duplicate heading labels that cause ambiguous references;
- headings accidentally embedded in code blocks;
- malformed Markdown heading syntax.

Do not impose a particular heading hierarchy when the artifact's format permits alternatives.

---

## AR-13 — Heading and content attachment is clear

Flag cases where content appears under the wrong heading because of a formatting or generation error.

Example:

A `Risks` heading is followed by deployment instructions that clearly belong to `Rollout`.

If the issue is conceptual rather than mechanical, use the more appropriate review check.

---

# Code and technical literals

## AR-14 — Code fences are balanced

Check that fenced code blocks:

- open and close correctly;
- do not accidentally absorb following prose;
- use appropriate language tags when useful.

---

## AR-15 — Inline code is mechanically intact

Flag broken inline code markers or formatting that obscures technical literals.

Examples:

- unmatched backticks;
- paths split incorrectly;
- commands unintentionally formatted as prose.

---

## AR-16 — Example code is complete enough for its purpose

If the artifact presents code as executable or copyable, flag obvious truncation or placeholder fragments that make it unusable.

If the code is intentionally illustrative, do not require production completeness.

Whether the code is technically correct belongs to the appropriate factual or technical review process.

---

# Figures, images, and diagrams

## AR-17 — Referenced figures exist

If prose refers to:

- a diagram;
- chart;
- screenshot;
- image;
- figure;

verify that the artifact actually contains or links to it when required.

---

## AR-18 — Figure labels remain coherent

Check that:

- figure numbering is stable;
- captions correspond to the intended visual;
- prose references the correct figure.

---

## AR-19 — Visual placeholders are resolved

Flag instructions such as:

`[Insert architecture diagram here]`

when the final artifact requires the diagram and the placeholder was not intentionally retained.

---

# Citations and references

## AR-20 — Citation syntax is mechanically complete

Check for:

- unmatched citation markers;
- missing references;
- broken footnote numbering;
- references listed but never connected when the format requires explicit linkage.

Whether the cited source actually supports the claim belongs to Factual accuracy.

---

## AR-21 — Reference entries are complete enough to identify the source

When a bibliography or reference list is required, flag entries that are mechanically incomplete to the point that the source cannot be identified.

Do not impose a citation style unless one is required.

---

# Generated-output residue

## AR-22 — No prompt or tool residue remains

Flag content such as:

- tool invocation syntax;
- JSON arguments intended only for an agent;
- system instructions;
- internal file paths that should not appear;
- hidden workflow status;
- model reasoning;
- `sandbox:` links accidentally included in a normal document;
- temporary generation markers.

Only flag internal paths when they are not intentionally part of the deliverable.

---

## AR-23 — No accidental duplication remains

Flag repeated:

- paragraphs;
- sections;
- tables;
- headings;
- list blocks;

that appear to result from generation or revision errors.

Do not flag deliberate summary or repetition when it serves a real function.

---

## AR-24 — No truncated output remains

Look for signs that generation stopped unexpectedly.

Examples:

- sentence ends midway;
- list stops after a colon;
- table ends in the middle of a row;
- section starts but never develops;
- unmatched parenthesis caused by truncation.

---

# Delivery-specific checks

## AR-25 — Required format is satisfied

If the writing requirements specify a format such as:

- Markdown;
- plain text;
- email;
- document;
- README;
- specific heading structure;

verify that the output actually matches it.

Do not impose an unstated format.

---

## AR-26 — Required named elements exist

If the requirements explicitly call for:

- a title;
- executive summary;
- table;
- diagram;
- appendix;
- references;
- call to action;

verify that the required element is present and complete.

This check concerns the mechanical presence of the element.

Whether its content is adequate belongs to Requirement completeness or another relevant check.

---

## AR-27 — Deliverable does not expose runtime state

The final artifact should not accidentally include internal Writing Suite state such as:

- requirement IDs;
- grounding IDs;
- review status;
- internal Reviewer findings;

unless the user explicitly asked for them.

`.writing/` state belongs to the workflow, not normally to the deliverable.

---

# Materiality

Not every formatting imperfection warrants a finding.

Prioritize defects that:

- make the artifact look unfinished;
- prevent correct rendering;
- prevent navigation;
- break references;
- make copied commands or code unusable;
- expose internal workflow residue;
- violate an explicit output requirement.

A harmless formatting preference is not an artifact-integrity failure.

---

# Relationship to other checks

## Consistency

Use `consistency.md` when two valid-looking parts of the artifact disagree.

Use this check when the artifact is mechanically broken or incomplete.

## Factual accuracy

Use `factual-accuracy.md` when a source, citation, number, or claim is substantively wrong.

Use this check when the reference structure or citation mechanics are broken.

## Readability

Use `readability.md` when formatting is valid but makes the content difficult to consume.

Use this check when formatting itself is malformed or incomplete.

## AI-writing / slop

Use `ai-writing.md` for generic or generated prose patterns.

Use this check for literal generation residue such as prompt text, unfinished placeholders, or duplicated blocks.

---

# Grading

## Aligned

Use `Aligned` when:

- no unresolved placeholders remain unless intentional;
- the document is mechanically complete;
- links and references required for use are intact;
- tables, lists, headings, and code blocks are valid;
- no generation residue remains;
- required artifact elements exist.

## Drift

Use `Drift` when an artifact-integrity defect exists.

### Blocker

Use when the artifact cannot responsibly be delivered or used.

Examples:

- major required section missing;
- critical attachment absent;
- output truncated;
- broken structure makes the document unreadable;
- internal prompt or tool content exposed;
- executable instructions are materially incomplete.

### Should fix

Use when the artifact is usable but contains a meaningful defect.

Examples:

- broken section reference;
- unresolved non-critical placeholder;
- malformed table;
- incorrect figure number;
- accidental duplicate section.

### Polish

Use for minor mechanical defects that do not materially interfere with use.

Examples:

- low-impact numbering inconsistency;
- small formatting artifact.

## Not applicable

Use `Not applicable` only when the artifact has no meaningful structural or formatting surface to inspect.

For most written artifacts, this check will be applicable.

## Not reviewed

Use `Not reviewed` when the required artifact representation was unavailable or the relevant mechanical check could not be performed.

---

# Reviewer output

For each finding, populate the canonical `review.md` fields:

- `Check`: `Artifact integrity`
- `Status`: `Drift`
- `Severity`: `Blocker`, `Should fix`, or `Polish`
- `Finding`: identify the mechanical or completeness defect
- `Affected span / element`: identify the exact placeholder, section, link, table, figure, or malformed element
- `Governing requirement or standard`: `artifacts.md` plus the relevant rule ID
- `Suggested direction`: state what must be completed, removed, repaired, or reconciled

Do not rewrite substantive content.

A mechanically clean artifact should be recorded as `Aligned`.
