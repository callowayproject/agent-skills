# Job Stories Guide

This guide combines two sources by Alan Klement into a single, structured reference for writing Job Stories.

## Why Job Stories

User stories often smuggle in assumptions by forcing a persona and an action before the context is clear. Job Stories
shift the focus to causality: the situation that triggers a need, the motivation (and forces), and the expected outcome.
This makes it easier to ask "why" and to explore better solutions.

## The Core Format

Use this as the default structure:

- Situation: When ...
- Motivation and Forces: I want to ...
- Expected Outcome: So I can ...

Example:

When an important new customer signs up, I want to be notified, so I can start a conversation with them.

## How Job Stories Improve Clarity

- They emphasize context (the triggering situation) rather than persona labels.
- They expose motivations, anxieties, and forces that affect adoption.
- They keep solutions modular, making it easier to test alternatives.

## Five Tips For Writing Strong Job Stories

1) Refine the situation with context
   - Add real-world details so the situation is specific and actionable.
   - Example progression:
     - When I want something to eat...
     - When I'm in a rush and want something to eat...
     - When I'm in a rush, starving, and need something I can eat with one hand...

2) Use real people, not personas
   - Stories should come from customer interviews.
   - Personas can hide anxieties and motivations that matter.

3) Keep stories modular and separate from solutions
   - Don't mix a situation with a specific feature.
   - Separate the job from the solution so you can test different approaches.

4) Add forces to motivations
   - Include pushes and pulls that affect behavior.
   - Forces help you design solutions that reduce friction and increase pull.

5) Don't require a single point of view
   - Multi-party stories can be helpful when multiple roles are involved.
   - Third-person framing is OK when it clarifies the situation.

## Roles, Events, and Multiple Parties

Use roles when they clarify a multi-role product (Admin, Manager, Contributor, Buyer, Seller). Use events instead of
roles when the trigger affects everyone.

Examples:

- Role-based:
  When a Buyer has already made a bid on an item, they are anxious about missing a counter bid and want to immediately
  receive counter bid notifications, so they can have enough time to evaluate and update their own bid.

- Cause and effect across roles:
  When a Seller pulls a product after receiving weak bids, Buyers who already bid want to be notified, so they can stop
  tracking the listing and look for a similar product.

- Event-based:
  When a customer is on their mobile device and forgets their password, they want to recover it in a mobile-friendly
  way, so they can continue to log in and access their news feed.

## User Story vs. Job Story Example

User Story:
As a moderator, I want to create a new game by entering a name and an optional description, so that I can start
inviting estimators.

Job Story:
When I'm ready to have estimators bid on my game, I want to create a game in a format estimators can understand, so
that the estimators can find my game and know what they are about to bid on.

## Quick Checklist

- Is the situation concrete and grounded in real context?
- Is the motivation about "why" rather than "how"?
- Are forces (pushes and pulls) present when they matter?
- Is the outcome clear and testable?
- Is the story independent of a specific solution?

## Sources

- https://jtbd.info/replacing-the-user-story-with-the-job-story-af7cdee10c27
- https://jtbd.info/5-tips-for-writing-a-job-story-7c9092911fc9
