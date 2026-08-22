# README Standard

Apply this standard when writing or reviewing:

- a repository-level `README.md`;
- a package, component, or subproject README;
- a README intended to be the primary entry point for understanding or using a code, data, research, or software repository.

A README is the front door to the repository.

Its purpose is to help the intended reader understand what the repository is, determine whether it is relevant to them, and reach the next useful action with minimal unnecessary effort.

This standard does not prescribe one mandatory README template.

The appropriate content and depth depend on:

- the requester's explicit instructions;
- the repository itself;
- the repository type;
- the project's current maturity;
- the intended reader;
- what the reader can actually do with the project;
- what information is important at the README level.

Do not add conventional README sections merely to make the document appear complete.

## 1. Understand the repository before writing

### RM-01 — Treat the repository as a primary source

Do not treat the requester's prompt as the complete source of README content.

Unless the requester explicitly constrains exploration, inspect the repository sufficiently to understand:

- what the project is;
- what it currently contains;
- what it currently supports;
- how it is installed, run, used, reproduced, or inspected;
- what stage of development it appears to be in;
- which files or commands are authoritative for consequential claims.

The requester should not have to restate information that can be reliably established from the repository.

### RM-02 — Respect explicit requester constraints

Explicit instructions about:

- audience;
- scope;
- length;
- emphasis;
- required sections;
- excluded material;
- intended use;
- tone;
- publication context

constrain the README.

Repository exploration should establish the facts needed to satisfy those instructions.

Do not use exploration as permission to override an explicit requester decision.

Absence of an instruction, however, does not mean that useful repository information must be ignored.

### RM-03 — Explore progressively

Do not blindly read every file in a large repository.

Start with the highest-signal sources, such as:

- repository root;
- package or project manifests;
- build and dependency files;
- installation scripts;
- executable or application entry points;
- examples;
- existing documentation;
- configuration;
- tests;
- CI or development scripts;
- important source directories.

Inspect implementation details only when they are needed to understand or verify a consequential README claim.

Prefer the smallest amount of exploration that produces a reliable understanding of the project.

### RM-04 — Do not over-interpret the repository

Repository exploration establishes evidence. It does not grant permission to invent product intent.

Do not infer unsupported:

- product vision;
- roadmap;
- production readiness;
- target customer;
- performance claims;
- stability guarantees;
- organizational decisions;
- support commitments;
- licensing terms.

If a consequential point cannot be established from the repository or existing context, handle it according to the Writing Suite's grounding and authoring rules.

## 2. Determine what kind of README this repository needs

### RM-05 — Identify the repository's practical type

Determine the repository's functional shape when it materially affects what readers need.

Examples include:

- library or SDK;
- command-line tool;
- application;
- service;
- framework or platform;
- research code;
- experiment;
- dataset;
- prototype or demonstration;
- infrastructure repository;
- monorepo;
- internal engineering repository.

Do not force the repository into a category merely to select a template.

Use the classification only to decide what information is useful.

### RM-06 — Account for project maturity

Match the README to what the project actually is today.

A prototype may need:

- purpose;
- current capability;
- setup;
- how to run it;
- limitations.

A mature reusable library may need:

- installation;
- minimal usage;
- configuration;
- compatibility;
- documentation links;
- contribution or support information where established.

A research repository may need:

- research purpose;
- environment;
- reproduction procedure;
- data or model dependencies;
- results or evaluation context;
- limitations.

Do not give an experimental repository the documentation shape of a mature production product.

Do not hide an important maturity limitation merely to make the project appear polished.

### RM-07 — Identify the intended reader

Determine who needs the README and what they are likely trying to accomplish.

Possible readers include:

- prospective users;
- developers;
- researchers;
- contributors;
- operators;
- evaluators;
- maintainers;
- collaborators.

A README may serve more than one audience, but the opening and quick-start path should optimize for the primary reader.

Do not add material for hypothetical audiences that the repository does not meaningfully serve.

### RM-08 — Identify the first meaningful action

Determine what the intended reader should reasonably be able to do after reading the README.

Depending on the project, that may be:

- install it;
- run it;
- invoke a command;
- use an API;
- reproduce an experiment;
- inspect a dataset;
- launch an application;
- understand the repository structure;
- navigate to deeper documentation.

The README should make that path easy to find.

## 3. Make the project understandable early

### RM-09 — Explain what the project is immediately

The opening should let a reader quickly understand:

- what the project is;
- what problem or use case it addresses;
- what it enables, when that is not obvious.

Prefer concrete descriptions over slogans.

Do not begin with a long history, architecture explanation, or feature inventory before establishing the project's identity.

### RM-10 — Explain value without marketing filler

Describe why the project is useful when that information helps the reader decide whether to continue.

Prefer concrete capability statements.

Avoid unsupported or low-information adjectives such as:

- powerful;
- revolutionary;
- seamless;
- cutting-edge;
- enterprise-grade;
- robust;
- flexible;
- blazing fast;
- easy to use.

If a property matters, explain what the project actually does that establishes it.

### RM-11 — Surface consequential project status

When project status materially affects the reader's decision or ability to use the repository, make it visible.

Examples include:

- experimental;
- proof of concept;
- actively developed;
- incomplete;
- deprecated;
- archived;
- not intended for production use;
- API unstable.

Do not add status language merely because the project lacks a release.

Do not claim stability or readiness without evidence.

## 4. Optimize the reader's path

### RM-12 — Use a broad-to-specific information order

Organize the README as a cognitive funnel.

A typical reader should encounter information roughly in this order when applicable:

1. what the project is;
2. why or when it is useful;
3. how to get started;
4. how to use it;
5. important configuration, limitations, or concepts;
6. deeper technical, development, or project information.

The exact sections may differ.

Do not make readers consume internal implementation detail before they can understand or try the project.

### RM-13 — Put the shortest successful path early

When the project can be installed, run, used, or reproduced, provide the shortest reliable path to a meaningful result.

A quick start should contain only the steps required for that first success.

Move optional configuration, alternatives, and advanced cases later.

### RM-14 — Separate orientation from reference documentation

A README should be sufficient to orient the reader and enable the first useful actions.

It does not need to contain every detail about the system.

When deeper documentation exists, link to it rather than duplicating:

- complete API reference;
- detailed architecture;
- exhaustive configuration;
- contributor procedures;
- operational runbooks;
- tutorials;
- internal design decisions.

Do not make the README a replacement for the entire documentation system.

## 5. Select sections from the repository's needs

### RM-15 — Treat README sections as conditional modules

Do not include a section because READMEs commonly contain it.

Select sections because the intended reader needs the information and the repository provides enough evidence to support it.

Potential modules include:

- overview;
- quick start;
- installation;
- prerequisites;
- usage;
- examples;
- features or capabilities;
- configuration;
- project status;
- limitations;
- architecture;
- repository structure;
- development setup;
- testing;
- reproduction;
- results;
- data description;
- API or documentation links;
- contributing;
- support;
- security;
- citation;
- license;
- acknowledgements.

None of these is universally mandatory except the information needed to identify and understand the project.

### RM-16 — Do not create empty or speculative sections

Avoid sections whose only content is equivalent to:

- Coming soon.
- TBD.
- Contributions welcome.
- More documentation later.
- Roadmap coming soon.

unless that status itself is intentionally important to the requester.

Do not manufacture content merely to satisfy a conventional README outline.

### RM-17 — Keep project-specific information proportional

A small utility may need only a short README.

A substantial framework may require a longer one.

The amount of documentation should scale with:

- complexity;
- setup cost;
- number of important concepts;
- risk of misuse;
- diversity of users;
- difficulty of reaching a successful first use.

Do not optimize for README length independently of reader need.

## 6. Make operational instructions trustworthy

### RM-18 — Ground commands and paths in repository evidence

Installation and usage instructions are executable claims.

Verify consequential details such as:

- commands;
- script names;
- package names;
- paths;
- CLI arguments;
- environment variables;
- configuration keys;
- ports;
- supported platforms;
- dependencies;
- required runtimes;
- versions;
- expected files.

Do not invent plausible commands.

Do not infer installation behavior merely from the project's programming language.

### RM-19 — Prefer authoritative execution paths

When multiple possible ways of running something exist, prefer the path established by repository evidence.

Useful evidence can include:

- installer scripts;
- package metadata;
- task runners;
- Makefiles;
- examples;
- CI workflows;
- tests;
- existing documentation;
- actual CLI entry points.

Do not document an accidental implementation path as the recommended user workflow without evidence that it is intended.

### RM-20 — Make prerequisites visible before dependent commands

If a user must first have a runtime, tool, service, credential, platform capability, or dependency, state that before presenting commands that require it.

Do not bury a prerequisite after the failure point.

Include only prerequisites that materially affect the documented path.

### RM-21 — Keep commands copyable

Command examples should be:

- syntactically complete;
- ordered correctly;
- minimal;
- safe for the intended context;
- clear about placeholders.

Do not mix commands and explanatory text in a way that makes copying unreliable.

Do not include long command sequences when a shorter supported path exists.

### RM-22 — Do not fabricate expected output

Show output only when it helps the reader understand successful execution and the output can be supported reliably.

Do not invent terminal output, benchmark numbers, generated files, or responses merely to make an example feel complete.

## 7. Prefer demonstrations over generic feature claims

### RM-23 — Use a minimal working example when useful

For usable software, a small real example often communicates more than a long feature list.

Where appropriate, show:

- one command;
- one API call;
- one configuration fragment;
- one short workflow

that demonstrates the project's central capability.

Keep advanced examples elsewhere when they would obscure the first-use path.

### RM-24 — Make capabilities concrete

A feature or capability description should tell the reader what the project actually enables.

Prefer:

> Routes requests between supported models using configurable selection rules.

over:

> Powerful and flexible intelligent routing.

Do not inflate ordinary implementation properties into marketing claims.

### RM-25 — Distinguish capability from aspiration

Describe what exists today separately from:

- planned work;
- possible extensions;
- research questions;
- future ideas.

Do not present roadmap intentions as implemented features.

## 8. Explain structure and architecture only when useful

### RM-26 — Include a repository map when it reduces navigation cost

A repository structure section is useful when readers need help locating important components.

Show only consequential files or directories.

Do not reproduce the entire filesystem tree merely because one can be generated.

### RM-27 — Include architecture only when it improves use or understanding

Architecture belongs in the README when understanding the system's major components or workflow is important for:

- using it correctly;
- extending it;
- evaluating it;
- contributing to it.

Keep architecture at README-level abstraction.

Link to detailed design documentation when available.

### RM-28 — Explain internal concepts only when readers need them

Introduce project-specific terminology, mental models, or concepts before requiring readers to understand commands or behavior that depend on them.

Do not expose implementation terminology that provides no value to the README audience.

## 9. Handle research and data repositories appropriately

### RM-29 — Make reproduction the practical path for research code

When the repository primarily supports experiments or research, prioritize information needed to understand and reproduce the work.

When applicable, establish:

- research purpose;
- environment;
- dependencies;
- data or model requirements;
- execution procedure;
- evaluation entry point;
- relevant outputs;
- known limitations.

Do not force research repositories into product-oriented feature marketing.

### RM-30 — Explain data sufficiently for responsible interpretation

For repositories centered on data, readers may need to understand:

- what the data represents;
- organization and format;
- provenance;
- collection or generation process;
- important transformations;
- constraints or limitations;
- reuse conditions.

Include only the level necessary for the repository and point to dedicated data documentation when it exists.

## 10. Handle project governance truthfully

### RM-31 — Do not invent a license

License information must come from an authoritative project source such as:

- a `LICENSE` file;
- explicit package metadata;
- an established requester instruction.

Do not choose a license because the repository is public.

If reuse rights are consequential and no license has been established, surface the gap rather than inventing one.

### RM-32 — Include contribution guidance only when established

A `Contributing` section should reflect the repository's actual contribution process.

It may point to a dedicated `CONTRIBUTING.md`.

Do not promise that contributions are accepted or describe an imagined workflow without evidence.

### RM-33 — Include support information only when a support path exists

Document:

- issues;
- discussions;
- support channels;
- contact routes

only when they are established and appropriate.

Do not invent support commitments.

### RM-34 — Keep security guidance tied to an actual policy or risk

Link to a security policy when one exists.

Surface security-sensitive setup or handling requirements when they materially affect use.

Do not add generic security boilerplate merely to make the project appear mature.

### RM-35 — Include citation information when the project requires it

Research repositories, datasets, academic software, or other scholarly artifacts may require citation guidance.

Use established citation metadata or requester-provided instructions.

Do not invent publication details or citations.

## 11. Use visuals and repository metadata deliberately

### RM-36 — Use visuals when they reduce explanation cost

Screenshots, diagrams, demonstrations, and other visuals are useful when they help readers understand:

- a user interface;
- workflow;
- architecture;
- result;
- output;
- interaction

more efficiently than prose alone.

Do not add decorative visuals that do not improve understanding.

### RM-37 — Use badges sparingly

Badges should communicate useful, current project information such as an established:

- build status;
- published version;
- test status;
- package status;
- license.

Do not add badges merely to make the README appear professional.

Avoid badge collections that dominate the opening.

### RM-38 — Keep links useful and maintainable

Prefer repository-relative links for repository files when practical.

Use descriptive link text.

Verify important links and referenced paths.

Do not add links merely to create an appearance of extensive documentation.

## 12. Keep the README maintainable

### RM-39 — Prefer durable information

Avoid unnecessary details that are likely to become stale.

When a volatile fact is not important to the reader, omit it.

When a changing value is important, prefer linking to or deriving it from an authoritative maintained source rather than duplicating it manually.

### RM-40 — Avoid duplicating authoritative project information

If detailed information already has a canonical location, summarize what the reader needs and link to that source.

Repeated documentation creates conflicting sources of truth.

### RM-41 — Keep terminology aligned with the repository

Use the actual names of:

- packages;
- components;
- commands;
- products;
- configuration;
- concepts.

Do not rename concepts for stylistic variety.

### RM-42 — Update the README when the reader contract changes

A README becomes misleading when the project's:

- installation;
- usage;
- prerequisites;
- compatibility;
- status;
- major capabilities

change without the README changing.

Prefer a smaller README whose important claims can realistically remain current over a large one that quickly becomes stale.

## 13. Optimize readability without removing substance

### RM-43 — Make the README scannable

Use meaningful headings and short sections so readers can locate:

- what the project is;
- installation or setup;
- usage;
- important limitations;
- deeper information.

Do not fragment a short README into unnecessary headings.

### RM-44 — Use formatting for information structure

Use:

- lists for parallel items;
- tables for compact comparisons or mappings;
- code blocks for commands and code;
- diagrams for relationships or flow.

Do not use formatting decoratively.

### RM-45 — Keep prose direct

Prefer:

- concrete nouns;
- active constructions;
- specific claims;
- consistent terminology.

Remove:

- generic introductions;
- repeated summaries;
- filler transitions;
- promotional language;
- explanations that do not help the reader understand or act.

### RM-46 — Do not optimize for apparent completeness

A README is not better because it is longer or contains more standard sections.

Include information when it:

- establishes what the project is;
- helps the intended reader decide whether it is relevant;
- enables a useful action;
- prevents consequential misunderstanding;
- explains an important limitation;
- routes the reader to necessary deeper information.

Remove material that does none of these.

## 14. Preserve truth under compression

### RM-47 — Do not omit evidence that changes how the project should be understood

Conciseness must not remove information that materially changes:

- capability;
- limitations;
- setup;
- compatibility;
- project status;
- safety;
- reproducibility;
- expected behavior.

A short README that creates the wrong mental model is not successful compression.

### RM-48 — Preserve important uncertainty

If behavior, support, compatibility, or results are uncertain or conditional, preserve that qualification when it matters.

Do not convert uncertainty into a clean absolute claim simply to make the README read more confidently.

### RM-49 — Separate facts from recommendations

When the README recommends one way of using the project among several supported options, make the recommendation understandable as a recommendation rather than an inherent technical requirement.

Do not turn a preference into a false project constraint.

## Review expectation

When reviewing a README, prioritize whether an intended reader can:

1. understand what the repository is;
2. understand why or when it is relevant;
3. reach the first meaningful action without unnecessary friction;
4. trust the commands, paths, prerequisites, and capability claims;
5. understand consequential status, limitations, and boundaries;
6. find deeper information where necessary.

Also verify that:

- the README reflects the repository that actually exists;
- explicit requester constraints were followed;
- repository exploration was sufficient for consequential claims;
- no project capabilities, commands, policies, results, or decisions were invented;
- structure matches the repository type and maturity;
- important information was not lost merely for brevity;
- conventional sections were not added without a reason;
- detailed documentation was not unnecessarily duplicated;
- headings and examples make the document easy to navigate;
- links and repository paths are valid where consequential;
- license, contribution, support, security, and citation information is grounded when included.

Do not flag a missing conventional README section merely because another repository contains one.

The question is whether this README gives the intended reader the smallest reliable set of information needed to understand the repository and proceed correctly.
