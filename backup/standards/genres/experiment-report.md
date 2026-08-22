# Experiment Report Standard

Apply this standard when writing or reviewing:

- ML or AI experiment reports;
- benchmark reports;
- evaluation reports;
- POC results;
- ablation studies;
- model comparisons;
- engineering experiments;
- empirical validation documents.

The purpose of an experiment report is to explain:

- what was tested;
- why it was tested;
- how it was tested;
- what happened;
- what can legitimately be concluded;
- what remains uncertain.

Do not treat this as a mandatory section template.

The structure should follow the experiment and the decisions the results are meant to inform.

## 1. Make the experiment understandable early

### ER-01 — State the question

The reader should understand what question the experiment was designed to answer.

Prefer a concrete question such as:

`Does the learned router improve task success over the static baseline at comparable cost?`

over:

`Evaluate the new router.`

### ER-02 — State the purpose

Explain why answering the experiment question matters.

Connect the experiment to the relevant:

- hypothesis;
- engineering decision;
- research question;
- product decision;
- design uncertainty.

Do not add generic statements about the importance of experimentation.

### ER-03 — State the result early when appropriate

For decision-oriented reports, summarize the most important result near the beginning.

Do not force the reader through implementation details before revealing the experimental outcome.

For exploratory research where the result requires substantial qualification, establish enough context first to avoid misleading simplification.

## 2. Define the hypothesis or expectation

### ER-04 — State the hypothesis when one exists

If the experiment tests an expected relationship or improvement, state it explicitly.

Example:

`The hypothesis is that retrieval-based routing will improve task success on specialized coding tasks without increasing median model cost by more than 10%.`

Do not invent a retrospective hypothesis after seeing the results.

### ER-05 — Distinguish confirmatory and exploratory work

Make clear when an experiment:

- tests a predefined hypothesis;
- explores behavior without a predefined expected result;
- diagnoses an observed problem.

Do not present exploratory observations as though they were pre-specified hypotheses.

## 3. Define what changed

### ER-06 — Identify the experimental variable

State what differs between the compared conditions.

Examples:

- model;
- router;
- prompt;
- training method;
- dataset;
- feature set;
- configuration;
- system component.

The reader should be able to identify the intervention being evaluated.

### ER-07 — Keep comparisons interpretable

When claiming that one condition outperforms another, make clear what remained constant.

Where relevant, control:

- dataset;
- task set;
- evaluation method;
- inference configuration;
- environment;
- budget;
- preprocessing;
- sampling conditions.

Do not attribute an observed difference to one change when several consequential variables changed simultaneously without acknowledging the confound.

## 4. Describe the experimental setup

### ER-08 — Include enough setup detail to interpret the result

Describe the experimental conditions that materially affect the outcome.

Depending on the experiment, this may include:

- models and versions;
- datasets;
- data splits;
- prompts;
- hyperparameters;
- hardware;
- software versions;
- inference settings;
- sampling configuration;
- seeds;
- evaluation harness;
- external services;
- resource limits.

Do not dump configuration details that have no meaningful effect on interpretation or reproducibility.

### ER-09 — Identify evaluation data clearly

State:

- what data or task set was used;
- how it was selected;
- relevant size;
- important composition;
- relevant exclusions.

If train, validation, and test data are involved, distinguish them clearly.

Do not imply generalization beyond what the evaluation data supports.

### ER-10 — Describe sampling when it matters

If only part of a larger dataset or workload was evaluated, explain how the sample was selected.

Call out sampling choices that could bias the result.

## 5. Define metrics before interpreting them

### ER-11 — Define each consequential metric

The reader should understand what each reported metric measures.

Where needed, include:

- formula;
- unit;
- direction of improvement;
- aggregation method;
- denominator;
- threshold.

Do not rely on a metric name alone when its meaning is ambiguous.

### ER-12 — Separate primary and secondary metrics

Identify the metric or metrics that directly answer the experiment question.

Treat supporting metrics as secondary.

Do not present a large metric dashboard without identifying which measurements determine the conclusion.

### ER-13 — Explain derived metrics

If a metric combines multiple signals, explain how.

Examples:

- weighted quality score;
- cost-adjusted success;
- composite benchmark score;
- normalized latency.

Do not obscure judgment inside an unexplained composite score.

## 6. Establish baselines

### ER-14 — Compare against meaningful baselines

Use baselines that help answer the actual experimental question.

Depending on the experiment, these may include:

- current production behavior;
- previous system;
- simple heuristic;
- best fixed model;
- random strategy;
- oracle;
- established external method.

Do not add weak baselines solely to make the proposed method appear stronger.

### ER-15 — Explain what each baseline represents

A baseline should have a clear interpretive purpose.

For example:

- `Best fixed model` measures whether routing creates value over always selecting one model.
- `Oracle` estimates the upper-bound routing opportunity.

Do not list baselines without explaining why they matter when that relationship is not obvious.

## 7. Report results directly

### ER-16 — Separate results from interpretation

First establish what was observed.

Then explain what the observation means.

Prefer:

`Task success increased from 68.4% to 72.1%.`

followed by:

`This supports the hypothesis that the learned router improves selection quality on this evaluation set.`

Do not compress observation and causal interpretation into one unsupported statement.

### ER-17 — Report absolute values

When reporting improvements, include the underlying values when practical.

Prefer:

`Success increased from 60% to 66%, a 6 percentage-point increase.`

over:

`Performance improved by 10%.`

unless the relative change is itself the relevant quantity.

### ER-18 — Use consistent denominators

Make clear whether results represent:

- tasks;
- requests;
- users;
- trials;
- tokens;
- models;
- runs.

Do not compare percentages calculated over materially different populations without explaining the difference.

## 8. Report variability and uncertainty

### ER-19 — Report uncertainty when repeated variation matters

For experiments affected by randomness or sampling variability, report appropriate uncertainty where feasible.

Depending on the experiment, this can include:

- multiple runs;
- standard deviation;
- confidence intervals;
- error bars;
- statistical tests.

Do not report a single number as precise evidence when run-to-run variation could materially change the interpretation.

### ER-20 — Define uncertainty measures

When reporting an error bar or interval, state what it represents.

Examples:

- standard deviation across five seeds;
- 95% confidence interval;
- bootstrap interval across tasks.

Do not show unlabeled error bars.

### ER-21 — Avoid false statistical certainty

Statistical significance does not automatically imply practical significance.

A non-significant result does not automatically prove that two methods are equivalent.

Interpret statistical evidence in the context of:

- effect size;
- sample size;
- evaluation design;
- decision threshold.

## 9. Analyze important slices

### ER-22 — Inspect aggregate results for hidden variation

When aggregate performance may hide meaningful differences, examine relevant slices.

Examples:

- task type;
- difficulty;
- customer segment;
- model;
- language;
- data source;
- latency range;
- cost range.

Do not perform arbitrary slicing merely to find favorable results.

### ER-23 — Explain why a slice matters

Include a slice when it:

- tests a hypothesis;
- diagnoses an observed effect;
- exposes a risk;
- represents an important operating condition.

Avoid exhaustive segmentation without an analytical purpose.

## 10. Report negative and unexpected results

### ER-24 — Preserve unfavorable results

Do not omit valid results because they weaken the preferred conclusion.

Report material regressions, failures, and neutral outcomes.

### ER-25 — Highlight unexpected behavior

Unexpected results may reveal:

- confounding variables;
- evaluation defects;
- model behavior;
- implementation issues;
- new hypotheses.

Distinguish observed unexpected behavior from explanations that are still speculative.

### ER-26 — Do not rationalize after the fact

If an explanation was developed after observing the result, present it as a possible explanation or new hypothesis.

Do not present post-hoc reasoning as pre-existing experimental intent.

## 11. Handle ablations carefully

### ER-27 — State what each ablation tests

An ablation should isolate the contribution of a component, feature, or decision.

Explain the question that removing or changing the component answers.

### ER-28 — Preserve comparability

Where possible, change only the component being tested.

If other conditions necessarily change, state that explicitly.

### ER-29 — Do not infer contribution beyond the ablation

An ablation shows behavior under the tested removal or modification.

Do not automatically infer that the measured difference is the component's universal independent contribution.

## 12. Distinguish correlation from causation

### ER-30 — Match causal language to the experiment design

Use causal claims only when the experimental design supports them.

Prefer:

`The configuration was associated with lower latency in this evaluation.`

when the experiment cannot isolate causation.

Do not use words such as:

- caused;
- led to;
- resulted in;

solely because two measurements changed together.

## 13. Explain practical significance

### ER-31 — Connect results to the decision

Explain whether the observed difference is large enough to matter.

A statistically or numerically measurable improvement may still be operationally irrelevant.

Conversely, a small aggregate change may matter substantially for an important slice or failure mode.

### ER-32 — State the decision threshold when one exists

If the experiment was intended to establish a go/no-go threshold, define that threshold.

Examples:

- quality must not regress by more than 1 percentage point;
- P95 latency must remain below 500 ms;
- cost must decrease by at least 15%.

Do not move the threshold after seeing the result without explicitly recording the change.

## 14. Report cost and resource use when relevant

### ER-33 — Include resource dimensions that affect the conclusion

Depending on the experiment, these can include:

- monetary cost;
- token usage;
- compute;
- latency;
- memory;
- storage;
- human effort.

Do not report quality alone when the decision explicitly concerns a quality-cost or quality-latency tradeoff.

### ER-34 — Define cost calculations

Explain consequential assumptions such as:

- pricing basis;
- token accounting;
- amortization;
- infrastructure allocation;
- excluded costs.

Do not report cost comparisons built on inconsistent accounting.

## 15. Preserve reproducibility

### ER-35 — Record consequential experimental configuration

The report or its linked artifacts should make it possible to identify the exact conditions that produced the result.

Where relevant, preserve references to:

- code revision;
- dataset version;
- model version;
- configuration;
- prompts;
- random seeds;
- environment;
- evaluation scripts.

### ER-36 — Point to reproducibility artifacts

Do not paste large configurations or code into the main narrative when stable project artifacts already contain them.

Reference the relevant:

- repository;
- commit;
- experiment run;
- configuration file;
- dataset;
- notebook;
- evaluation output.

### ER-37 — Distinguish reproducible from merely repeatable

Do not claim that results are reproducible merely because one run completed successfully.

Use stronger reproducibility language only when the evidence supports it.

## 16. State limitations

### ER-38 — Report limitations that affect interpretation

Include limitations when they constrain what can be concluded.

Examples:

- small sample size;
- limited task coverage;
- synthetic data;
- evaluator weakness;
- contamination risk;
- untested operating conditions;
- incomplete baselines;
- limited model pool.

Do not create a generic limitation section containing low-impact caveats.

### ER-39 — Define the boundary of the conclusion

State what population, workload, environment, or conditions the evidence supports.

Do not generalize from:

`This router outperformed the baseline on 500 SWE-bench tasks.`

to:

`This router is better for software engineering.`

without additional evidence.

## 17. Separate findings, conclusions, and next actions

### ER-40 — Findings describe observations

A finding states what the experiment showed.

### ER-41 — Conclusions state what the evidence supports

A conclusion interprets one or more findings relative to the experiment question.

### ER-42 — Recommendations add judgment

A recommendation states what should be done based on:

- results;
- constraints;
- risk;
- practical priorities.

Do not blur these three layers.

## 18. End with the decision-relevant takeaway

### ER-43 — State what was learned

The reader should leave knowing whether the experiment:

- supported the hypothesis;
- rejected it;
- produced mixed evidence;
- remained inconclusive;
- revealed a new question.

### ER-44 — State the next action when relevant

For engineering experiments, make clear what the evidence justifies next.

Examples:

- proceed to canary;
- reject the approach;
- run a larger evaluation;
- test a specific unresolved slice;
- change the experimental design.

Do not automatically add a generic `Future Work` section.

## 19. Use tables and figures deliberately

### ER-45 — Use tables for exact comparison

Tables are useful when readers need to compare exact values across parallel conditions.

Keep the important comparison easy to locate.

### ER-46 — Use figures for patterns

Use plots when trends, distributions, tradeoffs, or variability are easier to understand visually.

Every figure should communicate a specific experimental point.

### ER-47 — Explain the takeaway

Do not present a table or figure without explaining the important observation.

Do not narrate every value already visible in the visual.

## 20. Optimize for auditability

### ER-48 — Make the reasoning inspectable

A reviewer should be able to trace:

`question → setup → evidence → finding → conclusion → recommendation`

Do not make consequential conclusions depend on unstated analysis.

### ER-49 — Preserve failed or inconclusive experiments when consequential

If a failed experiment changes understanding or prevents repetition of the same work, record the relevant result.

Do not preserve every exploratory run in the main report.

### ER-50 — Do not optimize for a positive result

The quality of an experiment report is determined by the credibility of the evidence and interpretation, not whether the experiment succeeded.

An inconclusive or negative result can be a valid outcome.

## Review expectation

When reviewing an experiment report, prioritize whether the reader can answer:

1. What question was tested?
2. Why was the experiment run?
3. What changed between conditions?
4. What data and setup were used?
5. What metrics determined success?
6. What baselines were used?
7. What actually happened?
8. How uncertain are the results?
9. Are the conclusions supported by the evidence?
10. What limitations constrain the conclusion?
11. Is the experiment sufficiently reproducible or traceable?
12. What decision or next action does the evidence justify?

Do not require every report to contain sections with these exact names.

Evaluate whether the experimental argument is complete, credible, reproducible enough for its purpose, and appropriately bounded by the available evidence.
