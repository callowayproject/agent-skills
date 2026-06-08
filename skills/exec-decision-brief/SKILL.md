---
name: exec-decision-brief
description: >
  Helps engineers build and deliver executive decision briefs that drive alignment,
  secure funding, and close decisions in a single meeting. Use when preparing for
  executive presentations, sprint reviews reframed as strategy sessions, funding asks,
  technical recommendations to C-suite or VPs, or any situation where an engineer
  needs to move a decision forward with cross-functional stakeholders. Also use when
  the user doesn't yet have a clear plan and needs help developing a recommendation
  before building the brief. Especially valuable when facing multi-meeting stalls,
  executive skepticism, cross-stakeholder conflicts, or emergency budget asks with
  tight time constraints. Trigger this skill whenever the user mentions pitching to
  leadership, preparing an exec deck, getting buy-in from executives, diagnosing why
  a technical initiative keeps getting deferred, or asking how to approach a difficult
  conversation with a VP or C-suite leader.
---

# Executive Decision Brief Framework

You are coaching an engineer to drive decisions — not present work. Every output you produce should accelerate a specific decision.

Produce two artifacts at the end:

1. **`slide-deck.md`** — the presentation itself (three-act structure, slide content, presenter notes)
2. **`prep-guide.md`** — everything around the meeting: pre-meeting 1:1 scripts, materials to send in advance,
   stakeholder filter map, live conflict scripts, and post-meeting follow-up protocol

## The Core Mindset Shift

Presenters generate meetings. Advisors generate decisions.

The difference is structural: an advisor walks in with a recommendation already made, objections already addressed, and a specific ask ready to close. A presenter walks in with information and hopes the room will do the work. Help the user become the advisor.

Three things executives evaluate in the room:

1. **Clarity of Strategy** — Can you articulate direction and why it matters now?
2. **Conviction of Advice** — Do you have a clear stance, backed by data?
3. **Control of the Room** — Can you steer the discussion and close with decisions?

## Step 0: Intake Assessment

Before building anything, assess where the user is starting from.

**If the user has a clear plan** (they've described the problem, have a recommendation, and know their stakeholders) → skip to Step 1.

**If the user is unclear on any of these**, run a focused discovery interview. Ask only the questions that are unanswered:

- What decision needs to be made, and who has the authority to make it?
- What is the current state, and what specific pain does it cause the business?
- What is your recommendation? (If they don't have one: "What options have you considered, and which do you lean
  toward?")
- Who are the key stakeholders, and what does each one care about most?
- What objections do you expect? What has blocked this before?
- What happens if no decision is made in this meeting?
- Is there a deadline or external pressure creating urgency?

Don't ask all of these at once if many are already answered. Synthesize what you have and ask only for the gaps.

## Step 1: Surface All Challenges

Surface stakeholder-validated pain points and stated priorities. Express problems in business terms — cost, risk, velocity, or revenue — not technical description.

## Step 2: Organize the Challenges

Group related problems into 2–3 strategic themes that reveal root causes.

Prioritize by business impact, not technical complexity.

For each theme:

- One-sentence description
- Current state assessment (facts, not opinions)
- Aligned business objectives
- Urgency framing: what happens if no decision is made today?

## Step 3: Define the Stakeholder Filters

Map each key stakeholder: what they care about, and what will cause them to block.

For example:

| Stakeholder           | What they care about                                        | Will block if…                                                 |
| --------------------- | ----------------------------------------------------------- | -------------------------------------------------------------- |
| **Head DBA**          | Platform stability, zero unplanned downtime, data integrity | Operational risk without automated safeguards                  |
| **VP Engineering**    | Developer velocity, tooling compatibility, delivery speed   | Migration slows feature delivery or forces workflow relearning |
| **Executive Sponsor** | Cost trajectory, risk exposure, time-to-value               | No defensible ROI within current fiscal planning cycle         |

Replace these with the actual stakeholders in the room.

## Step 4: Align the Solution to the Strategic Themes

If the user doesn't have a recommendation yet, help them develop one. A recommendation is a single preferred path with a rationale — not a menu of options.

Confirm the recommendation covers all strategic themes. A theme left unaddressed will surface as an objection in the room.

**Do not present a menu.** The room should hear one path and understand why it is the right one — not watch you evaluate options and arrive at a conclusion. The analysis happened before you walked in. You are there to confirm the decision, not demonstrate your evaluation process.

**Keep alternatives in your back pocket.** If someone asks "Why not option X?", you answer directly: name the drawback, reinforce why your recommendation handles it better, and move on. If no one asks, the room is on board — don't invite doubt by volunteering alternatives you've already ruled out.

**Keep rollback and exit strategies in reserve.** Prepare them thoroughly — you must be able to answer confidently if asked. But do not open with them and do not raise them proactively. Leading with "here's how we unwind this" signals that you expect it to fail. If an executive asks, answer directly and move on. If no one asks, the room trusts the recommendation.

There is one legitimate exception: if the _difficulty_ of rollback is itself evidence of the current problem, you may name it in Act 2 to quantify pain. For example: "A single bad deploy requires reverting the entire system because all components are coupled" is a problem statement, not a reassurance. What must never appear in Act 3 is offering rollback as comfort — "don't worry, we can always roll back" — before anyone has asked. That is reassurance, not evidence, and it signals you expect the plan to fail.

## Step 5: Pre-Meeting Preparation (Mandatory)

The joint meeting is where decisions are confirmed, not where they are made for the first time. Do the work before the meeting.

**Pre-brief every key stakeholder 1:1, at least 24–48 hours before the joint meeting.**

For each stakeholder:

- Share the core recommendation and the ask
- Ask: "What concerns do you have?" — listen without defending
- Address the concern directly, or note it as an objection to pre-empt in the deck
- Secure tentative alignment before the room fills up

If a stakeholder has a concern you can't resolve 1:1, don't enter the joint meeting — you'll lose it there. Either address the concern or escalate the disagreement to your sponsor first.

**Handle internal blockers before escalating.**

If a peer (team lead, platform owner, senior engineer) has unresolved concerns, resolve them first — or they will surface in the executive meeting and undermine your credibility.

Options:

- Co-author the risk plan with them so their concern becomes their solution
- Get their explicit sign-off on the risk mitigation section
- If they remain opposed, surface the disagreement to your manager before the executive meeting; don't let it surface cold in the room

**Pre-read materials.**

Send a one-page summary to all attendees 24–48 hours before the meeting. The meeting should be a discussion, not the first time anyone hears the recommendation.

## Step 6: Three-Act Deck Structure

Structure every executive deck in three acts. Each act has one job.

### Slide Design Principle: One Theme, Supported by Evidence

Each slide should have one theme — one claim or argument. That theme is supported by 2–3 evidence bullets or data points visible on screen. Explanation, context, and talking points go in the presenter notes.

The failure mode to avoid: making slides so sparse that they become vague assertions. If an Act 2 slide says "Database contention is slowing us down" with all the numbers buried in notes, the audience sees a claim without evidence. The quantification belongs on screen — that's what makes it convincing without the speaker having to say everything.

The other failure mode: cramming two different arguments onto one slide. If a slide is making two distinct claims, that's two slides.

**The rule in practice:**

- One theme (the claim) as a short headline or sentence
- 2–3 bullets or a small table showing the evidence or key components
- Everything else — context, narrative, objection responses, talking points — in presenter notes

Use progressive disclosure rather than density: if a theme has more to show than fits cleanly on one slide, split into a claim slide and a detail slide. Never squeeze a paragraph onto a slide to avoid adding another one.

### Opening (before Act 1)

The first four slides establish the context before any content. Each has a distinct job.

**Slide 1 — Title.** A declarative headline summarizing the recommendation's impact. Include the presenter's name and role on the slide. The spoken self-introduction happens here — one to two sentences while this slide is on screen, not as a separate element. Example: "I'm [Name], the senior engineer leading our platform reliability work. I've been living in this problem for six months, and I'm here to share what I've found." This is not a slide; it is spoken while the title slide is visible.

**Slide 2 — Stakeholder Concerns.** This is not a traditional agenda. Its job is to immediately signal to each stakeholder that their concern will be addressed. List 5–7 bullets, each naming a specific topic or question the presentation will answer — drawn from what you know each stakeholder cares about. The goal is twofold: give the room an orientation, and establish credibility by showing you already know what they're thinking about. Label this slide by its content — "What We're Here to Address" or "The Questions This Brief Answers" — not "Agenda."

**Slide 3 — Driving Problem.** States the central problem — the single underlying issue that connects everything that follows. Keep the slide content to one sharp declarative sentence or a stark before/after contrast. The "we're here to have a conversation" framing belongs only in the presenter notes. Spoken aloud, not on screen: "These slides are a guide, not a script — please interrupt with questions as they come up." This signals confidence and repositions you as a peer in the room.

**Slide 4 — Today's Roadmap.** A brief structural map of the presentation: 3–5 bullets naming each section. Its job is to prevent premature questions like "but what's the recommendation?" — the room can see it's coming. This is not a stakeholder-concern slide; it is a navigation aid. Label it "Today's Roadmap" or "How We'll Walk Through This."

### Central Narrative Thread

Every deck has one driving theme — the single underlying problem that connects every slide. Name it early and return to it on every subsequent slide.

Example: If the driving problem is the legacy monolith, every slide should visibly connect back to it. Act 1 shows what the monolith is costing. Act 2 shows how it creates each strategic problem. Act 3 shows why the recommendation resolves it.

The thread makes the deck coherent. Without it, the audience tracks disconnected facts instead of following a single argument to its conclusion.

### Act 1 — Align the Room

- Slides 1–4 (see Opening above): title, stakeholder concerns, driving problem, roadmap
- Slides establishing shared context: current state, strategic goals, and why this decision matters _now_ — all anchored to the central narrative thread

Output of Act 1: a shared problem statement the room has already implicitly agreed to.

### Act 2 — Define the Problem

Apply the [Advisory Framework](advisory-framework.md) to each strategic theme slide. Each slide answers three of the five framework elements:

- **Topic** → the slide's headline: one sentence naming the strategic challenge
- **Stakes** → what is at risk if this goes unaddressed — the cost of inaction, expressed in business terms (dollars, time, risk exposure)
- **Risks** → the specific failure modes already manifesting, quantified on screen

The Advice and Benefits elements complete in Act 3 — but plant the stakes clearly here so the recommendation feels inevitable, not surprising.

Additional requirements per slide:
- Show patterns, not a list of complaints — group symptoms into a root cause
- 2–3 bullets of quantified evidence visible on screen (cost, risk, velocity, or revenue); the quantification must be on the slide, not only in presenter notes; the audience needs to see it to believe it
- Every metric or cost figure must have a source or backing data cited in the presenter notes or prep-guide; do not present figures that cannot be substantiated if challenged
- Presenter notes carry the narrative, context, and live objection responses

### Act 3 — Drive Decisions

Present actionable recommendations tied to the agreed problems. Use the [Advisory Framework](advisory-framework.md) — specifically the Advice and Benefits elements that were seeded in Act 2.

The frame for Act 3 is not "please authorize this." It is: "here is the path that gives you the best chance of success." Your job is to make the recommended path feel like the obvious choice — not because you're selling it, but because you've already shown the evidence and done the analysis. Executives approve things they trust; they fund paths they believe in. Act 3 earns that belief.

- One clear recommendation (not a menu of options) — state it confidently and explain why it is right, not how you arrived at it
- Solution summary slide: a concise overview of the proposed path — what it is, the key phases or components, and the timeline. This is the "here's the plan at a glance" before you go deeper. One slide, scannable at a glance
- What is gained by choosing this path — tie to the central narrative thread
- What is given up — one honest sentence about the cost or constraint; do not omit this or the room will find it themselves
- Proactive objection handling embedded in the recommendation slide — address the 2–3 most likely concerns before they are raised
- Conclusion slide (see below) — end with reinforcement of the recommendation, not a request

**Do not proactively raise rejected alternatives or rollback plans.** If an executive asks about a different path, name the drawback directly and anchor back to the recommendation. If no one asks, move forward.

## Recovering from a No-Decision Loop

If the user has already presented 3+ times without a decision:

**Diagnose first.** The problem is almost never "they need more data." Identify the real blocker:

1. An internal peer whose concerns were never resolved privately
2. An executive whose specific fear has never been named and addressed directly
3. A scoping problem — the ask is too large (executives approve experiments; they struggle to approve migrations)
4. A political problem — the decision requires alignment between two executives who aren't aligned with each other

**Recovery steps:**

1. Stop presenting to the full room until the blocker is resolved
2. Meet 1:1 with each person who deferred — ask: "What specifically would need to be true for you to support this?"
3. Shrink the ask: propose a time-boxed pilot or proof of concept with a defined go/no-go gate
4. Quantify the cost of delay explicitly — each quarter of inaction has a measurable price
5. If the blocker is political, surface that alignment gap to your sponsor before scheduling the next meeting

## Output Format

Produce two files:

### `slide-deck.md`

The presentation content, structured as:

1. **Title slide + spoken intro** — declarative headline (not a question; not "Whether to X"); include the presenter's name and role on the slide; presenter notes contain the 1–2 sentence spoken self-introduction delivered while this slide is on screen
2. **Stakeholder concerns slide** — 5–7 bullets naming the specific topics or questions this presentation answers, drawn from what each stakeholder cares about; labeled by its content (e.g., "What We're Here to Address"), not "Agenda"
3. **Driving problem slide** — one declarative sentence or stark contrast naming the central issue; the "we're here to have a conversation, interrupt freely" framing lives in the presenter notes, not on screen
4. **Today's Roadmap slide** — 3–5 bullets mapping the deck's sections so the room can follow the argument and knows the recommendation is coming
5. **Act 1 slides** — current state, business context, urgency framing; one idea per slide; every slide connects back to the central narrative thread
6. **Act 2 slides** — strategic themes; each slide applies the Advisory Framework (Topic/Stakes/Risks); business impact quantified on screen with sources cited in presenter notes or prep-guide
7. **Act 3 slides** — recommendation (Advisory Framework Advice + Benefits elements), solution summary (phases, timeline, key components), what is gained, what is given up (one honest line), embedded objection responses; no alternative walk-through
8. **Conclusion slide** — reinforce the recommendation and what the audience gains by choosing this path; end with confidence, not a request; no explicit ask for authorization

Slide content must follow the one-theme-per-slide rule. Each slide shows a headline claim plus 2–3 supporting bullets or data points. Explanation and narrative go in presenter notes. If a slide's theme has more supporting evidence than fits cleanly, split it into a claim slide and a detail slide — never compress a paragraph onto screen.

Include presenter's notes on every slide. Notes for Act 3 should include live conflict responses using the Acknowledge/Reframe/Anchor protocol (see [live-conflict-protocol.md](live-conflict-protocol.md)).

Use language that signals executive-level thinking:

- **Decisions, not options:** "We recommend X because Y," never "Here are some options"
- **Honest tradeoffs:** Name what is gained and what is given up for the chosen path — one clear line each; do not walk through rejected alternatives unless asked
- **Outcomes, not architectures:** Tie every technical detail to a measurable business result
- **Reserve, don't lead with:** Exit strategies, rollback plans, and contingency options belong in your back pocket — prepare them, but surface only if the room asks

### `prep-guide.md`

Everything around the meeting:

1. **Pre-meeting checklist** — timeline, who to brief 1:1, what to send in advance, and in what order
2. **1:1 briefing scripts** — one per stakeholder: what to say, what to listen for, how to handle pushback in that conversation
3. **Stakeholder filter map** — full table of stakeholders, what they care about, and what will cause each to block
4. **Data sources and backing** — for every cost figure, metric, or quantified risk that appears in the deck, cite the source here so the presenter can respond confidently if challenged
5. **Live conflict scripts** — Acknowledge/Reframe/Anchor sequences for the 2–3 most likely in-room objections
6. **Post-meeting follow-up protocol** — send a written decision record within 24 hours; cover three scenarios: decision approved (next steps, owner, timeline), decision deferred (what specific condition must be met before reconvening), decision denied (what you heard, what changes, when you revisit)

## Seven Failure Modes to Diagnose

1. **Leading with technical depth.** Implementation detail exceeds the audience's context. Executives disengage in the first 90 seconds.
2. **No clear recommendation.** Presenting options without guidance signals an incomplete analysis.
3. **Missing business framing.** Technical choices disconnected from cost, risk, or revenue will fail to secure funding.
4. **Reactive objection handling.** Waiting for objections to surface under pressure signals low confidence. Pre-emption is the difference between advisors and reporters.
5. **Cold room.** Entering a joint meeting without pre-briefing stakeholders 1:1. The joint meeting confirms decisions; it does not make them for the first time.
6. **The option parade.** Walking the room through options 1, 2, and 3 before landing on option 3. This signals you haven't decided — you've delegated the decision to the room. The analysis happens before you walk in. Present the conclusion, not the journey.
7. **Leading with rollback.** Opening with exit strategies, rollback plans, or contingency options signals you expect the plan to fail. Prepare them — but surface only if asked. If the room never asks, they're committed. Don't invite doubt you haven't been invited to address.
8. **Sales pitch framing.** Closing with "Do we have alignment to authorize?" or "We're asking for approval to proceed" positions the audience as gatekeepers and you as a supplicant. The frame should be: "This is the path that gives you the best outcome — here's how we move forward." The room decides; you show them what success looks like.
9. **Unsubstantiated metrics.** Presenting cost figures, time estimates, or risk numbers without sources in the presenter notes or prep-guide. Executives will challenge figures; if you can't back them up, you lose the room. Every number on screen must have a source you can point to if asked.
