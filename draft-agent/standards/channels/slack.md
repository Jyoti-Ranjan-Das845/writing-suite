# Slack Standard

Apply this standard when the final artifact will be delivered through Slack or a similar workplace messaging channel.

This standard governs how information should be adapted to fast, asynchronous workplace communication.

It does not define one universal Slack voice.

Tone and formality should follow the audience, relationship, workspace culture, and writing requirements.

The primary goal is to let the reader quickly understand:

- why the message matters;
- what changed or needs attention;
- whether they need to respond or act;
- where deeper context lives.

## 1. Lead with the point

### SL-01 — Put the important information first

Start with the request, result, decision, issue, or update that caused the message.

Do not begin with several sentences of setup before reaching the point.

Prefer:

`The router POC is ready for review. I need feedback on the fallback behavior before Friday.`

over:

`Just wanted to share a quick update on where things currently stand with the router POC.`

### SL-02 — Make the message understandable from its opening

For messages longer than a few lines, the opening should establish enough context that a reader can decide whether the rest requires attention.

Do not use a vague opener that requires reading the entire message to understand its relevance.

## 2. Keep one message focused

### SL-03 — Give the message one primary purpose

A message may contain several related details, but they should support one main:

- update;
- question;
- request;
- decision;
- announcement;
- problem.

Do not combine unrelated topics merely because they involve the same people.

### SL-04 — Separate distinct questions or actions

When several actions are required, make them individually visible.

For example:

1. Confirm the model pool.
2. Review the fallback behavior.
3. Flag any deployment blockers.

Do not turn a single straightforward request into an unnecessary list.

## 3. Give enough context

### SL-05 — Make the message locally understandable

Provide enough context that the intended reader can understand the message without searching through unrelated history.

Relevant context may include:

- what this refers to;
- what changed;
- why the issue exists;
- the current decision or constraint.

### SL-06 — Do not retell the entire history

If deeper context already exists in:

- a document;
- issue;
- thread;
- pull request;
- design;
- experiment report;

summarize only what is necessary and point to the durable source.

Slack should not become an accidental duplicate of the project's documentation.

## 4. Make requests explicit

### SL-07 — State what response or action is needed

When asking for something, make the requested action clear.

Prefer:

`Could you confirm whether the Platform team owns the Redis deployment?`

over:

`Any thoughts on Redis?`

when ownership confirmation is the actual need.

### SL-08 — Identify the owner when necessary

If the request is directed to one person within a larger channel, make that ownership clear.

Do not leave important actions addressed ambiguously to everyone.

### SL-09 — Include timing when timing matters

When the action has a meaningful deadline, state it.

Use a concrete date or time when relative wording could be ambiguous.

Do not introduce artificial urgency.

### SL-10 — Separate FYI from action required

If no response is expected, make that clear when ambiguity is likely.

If a response is expected, make the request visible.

Do not force readers to determine whether an informational update secretly requires action.

## 5. Write for asynchronous reading

### SL-11 — Do not assume immediate availability

Write messages so they can be understood and acted on when the recipient reads them.

Avoid sending:

`Hi`

and waiting for a response before sending the actual question.

Send the useful context and request together when practical.

### SL-12 — Include the information needed for the next step

A good asynchronous message should reduce unnecessary back-and-forth.

If the reader will predictably need:

- a link;
- decision context;
- relevant result;
- file;
- error message;
- deadline;

include it with the initial message.

### SL-13 — Do not overload the message merely to avoid follow-up

Asynchronous completeness does not mean including every related detail.

Include what enables the next useful action.

## 6. Use channels and DMs according to context

### SL-14 — Prefer shared context when the work is shared

Use an appropriate channel when the discussion:

- affects a team or project;
- should remain discoverable;
- may help future participants;
- represents a durable work decision.

Do not move shared project knowledge into private messages without a reason.

### SL-15 — Use direct messages for appropriately private or narrow communication

A DM can be appropriate for:

- personal or sensitive matters;
- a narrow one-to-one question;
- communication that has no value to the wider project context.

If a DM produces a decision or information the broader team needs, preserve that outcome in the appropriate shared location.

### SL-16 — Match the channel to the audience

Post in the most specific channel whose audience reasonably needs the information.

Do not broadcast narrow updates to large channels merely for visibility.

## 7. Use threads deliberately

### SL-17 — Keep follow-up discussion attached to its context

Use a thread when responding to or extending a specific channel message.

This helps keep the primary channel readable while preserving the discussion with its originating context.

### SL-18 — Bring consequential outcomes back into view

If a thread produces an important:

- decision;
- resolution;
- changed requirement;
- action;
- conclusion;

make that outcome visible to the people who need it.

Do not leave consequential project state buried deep in a thread.

### SL-19 — Do not fragment one discussion unnecessarily

Avoid starting several parallel threads for the same unresolved issue when one coherent discussion would be easier to follow.

## 8. Use mentions intentionally

### SL-20 — Mention people when their attention is specifically needed

Use a direct mention when a particular person:

- owns an action;
- needs to answer;
- must review something;
- is directly affected.

Do not mention people merely to increase visibility.

### SL-21 — Use broad notifications sparingly

Use channel-wide notifications only when the information genuinely requires broad immediate attention according to workspace conventions.

Do not escalate ordinary updates into interruptions.

## 9. Make updates scannable

### SL-22 — Lead status updates with the current state

For a project or workstream update, prioritize:

- current state;
- meaningful change;
- blocker or risk;
- next step;
- required help or decision.

Do not narrate every action performed since the previous update.

### SL-23 — Highlight blockers clearly

If progress is blocked, state:

- what is blocked;
- why;
- impact;
- what is needed to unblock it.

Do not hide a blocker inside a long progress paragraph.

### SL-24 — Separate completed work from next work

When useful, distinguish what is done from what happens next.

Do not create repetitive status categories when the message is simple enough to state naturally.

## 10. Communicate decisions clearly

### SL-25 — State the decision directly

When communicating a decision, say what was decided.

Do not make readers infer the outcome from a discussion summary.

### SL-26 — Include consequential rationale

Provide enough reasoning that readers understand why the decision was made when that context matters.

Do not copy an entire decision memo into Slack.

Link to the durable decision artifact when deeper reasoning is required.

### SL-27 — Make resulting actions explicit

If the decision changes what people should do, state those changes.

Include ownership and timing when consequential.

## 11. Ask technical questions effectively

### SL-28 — State the problem before dumping evidence

For a technical question, establish:

- what you are trying to do;
- what happened;
- what you expected;
- the specific question.

Then provide relevant logs, code, screenshots, or links.

Do not send an unexplained error trace and expect the reader to reconstruct the problem.

### SL-29 — Include relevant evidence

Provide the evidence needed to investigate the question.

Examples:

- exact error;
- relevant configuration;
- reproduction conditions;
- code location;
- experiment result;
- link to issue or PR.

Do not include unrelated diagnostic output.

### SL-30 — Say what has already been tried when useful

If knowing previous attempts prevents duplicated work, state them concisely.

Do not produce a chronological debugging diary unless the history itself matters.

## 12. Use formatting for comprehension

### SL-31 — Use paragraphs for connected reasoning

Use short paragraphs for explanation and reasoning.

Do not convert every sentence into a bullet.

### SL-32 — Use bullets for parallel information

Bullets are useful for:

- options;
- actions;
- findings;
- blockers;
- questions;
- short status items.

Keep them parallel and easy to scan.

### SL-33 — Use code formatting for technical literals

Use code formatting when distinguishing:

- commands;
- paths;
- configuration values;
- identifiers;
- error strings;
- code symbols.

Do not apply code formatting merely for emphasis.

### SL-34 — Avoid excessive visual decoration

Do not overuse:

- emoji;
- bold;
- headings;
- capitalization;
- punctuation;

to manufacture importance.

Use visual emphasis only when it improves navigation or meaning.

## 13. Keep tone natural

### SL-35 — Write conversationally without becoming vague

Slack can be less formal than many durable documents.

Natural contractions, short sentences, and direct questions are appropriate when they fit the relationship.

Informality does not justify ambiguous communication.

### SL-36 — Avoid unnecessary corporate phrasing

Prefer the actual action over phrases such as:

- `circle back`;
- `touch base`;
- `sync up`;
- `align on this`;
- `connect offline`;

when those phrases obscure what needs to happen.

Use them when they naturally and precisely describe the intended action.

### SL-37 — Do not manufacture enthusiasm

Avoid automatic language such as:

`Great news!`

`Super excited to share...`

`Amazing progress...`

unless the enthusiasm is genuine and appropriate.

State the substantive development first.

## 14. Avoid Slack-specific slop

### SL-38 — Remove conversational throat-clearing

Avoid default openings such as:

`Just wanted to...`

`Quick update...`

`A quick thought here...`

`Not sure if this is the right place, but...`

when they delay useful information.

They are not forbidden when they convey meaningful context.

### SL-39 — Do not repeat the same request

State the request clearly once.

Avoid ending with several versions such as:

`Let me know what you think.`

`Would love your thoughts.`

`Happy to discuss.`

when they add no distinct meaning.

### SL-40 — Avoid unnecessary meta-commentary

Do not narrate the act of communicating.

Prefer:

`The benchmark results are ready.`

over:

`I wanted to share that we now have the benchmark results ready.`

when the extra framing serves no purpose.

## 15. Know when Slack is the wrong medium

### SL-41 — Move complex durable reasoning to an artifact

Use a design document, memo, report, issue, or other durable artifact when the content requires:

- substantial reasoning;
- structured evidence;
- long-term reference;
- formal approval;
- extensive technical detail.

Use Slack to communicate the relevant takeaway and point to the artifact.

### SL-42 — Move rapidly interactive problems to synchronous communication when useful

A call or huddle may be more effective when resolution requires:

- rapid clarification;
- complex back-and-forth;
- collaborative debugging;
- sensitive discussion;
- prolonged disagreement.

Do not switch mediums merely because a thread contains several messages.

### SL-43 — Preserve consequential outcomes after synchronous discussion

If a synchronous conversation produces an important decision or changed project state, record the outcome in the appropriate durable or shared location.

## 16. Check before sending

### SL-44 — Apply the reader-effort test

Before sending, verify that the intended reader can quickly determine:

1. What is this about?
2. Why does it matter?
3. Do I need to do anything?
4. What exactly is needed?
5. Where do I find deeper context if necessary?

### SL-45 — Remove information that does not help the next action

A Slack message should contain enough information for its purpose, not everything the sender knows.

Remove details that do not help the reader:

- understand;
- decide;
- respond;
- act;
- locate deeper context.

## Review expectation

When reviewing Slack writing, prioritize:

1. purpose clarity;
2. useful context;
3. action or question clarity;
4. correct audience and ownership;
5. asynchronous usability;
6. scannability;
7. information density;
8. natural tone;
9. preservation of consequential decisions;
10. appropriate use of the Slack medium.

Do not penalize a message merely because it is informal, brief, or conversational.

The strongest Slack message communicates the necessary information with enough context for the work to continue without creating unnecessary reader effort or fragmented project knowledge.
