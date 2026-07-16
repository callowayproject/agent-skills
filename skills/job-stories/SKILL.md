---
name: job-stories
description: Write and convert Job Stories, the Jobs-to-be-Done format from Alan Klement that replaces "As a [persona], I want..." user stories with situation/motivation/outcome causality ("When ... I want to ... so I can ..."). Use whenever the user explicitly asks for job stories, job-to-be-done stories, JTBD stories, or asks to convert existing user stories into job story format.
---

Job Stories replace a persona-and-action structure with causality: the situation that triggers a need, the motivation and forces behind it, and the expected outcome. This surfaces the "why" behind a request and keeps the story independent of any particular solution.

## The core format

- **Situation:** When ...
- **Motivation and Forces:** I want to ...
- **Expected Outcome:** so I can ...

Example: *When an important new customer signs up, I want to be notified, so I can start a conversation with them.*

## Writing a job story

1. **Ground the situation in real context.** A vague trigger produces a vague story. Push past the first draft:
   - When I want something to eat...
   - When I'm in a rush and want something to eat...
   - When I'm in a rush, starving, and need something I can eat with one hand...

2. **Pull from real people, not personas.** If the user gives you a persona label ("as an admin..."), ask what actually triggers the need for that specific person, or infer it from any interview notes, tickets, or context they've shared. Personas smuggle in assumed motivations that may not hold.

3. **Keep the story separate from the solution.** Don't let a specific feature leak into the situation or motivation. "When I want to find a document I edited recently" is a job story; "When I click the recent-files button" is a solution wearing a job-story costume.

4. **Add forces when they matter.** Anxieties, habits, and social pressures push and pull on behavior. If the user's context implies a force (fear of missing a bid, embarrassment about a mistake), name it in the motivation — it helps the eventual solution reduce friction instead of just adding a feature.

5. **Use roles or events, whichever fits.** Use a role (Buyer, Seller, Admin) when the product has genuinely distinct roles and the trigger differs by role. Use an event framing instead when the trigger affects everyone the same way, regardless of role. Multi-party stories (one role's action triggering another role's job) are fine — write them in third person when that's clearer than forcing a single point of view.

## Converting a user story to a job story

When given a user story ("As a [persona], I want [feature], so that [benefit]"), don't just reshuffle the clauses — find the actual trigger:

- Ask what situation causes this persona to want the feature in the first place. The "as a" clause usually hides this.
- Drop the persona label unless a role framing is genuinely needed (see point 5 above).
- Rewrite the "I want" clause as a need or outcome, not the specific feature named in the original story — that's the solution, and job stories should stay solution-agnostic when possible. If the original story's benefit clause is really just a restatement of the feature, dig for the deeper motivation.

Example conversion:

> User Story: As a moderator, I want to create a new game by entering a name and an optional description, so that I can start inviting estimators.

> Job Story: When I'm ready to have estimators bid on my game, I want to create a game in a format estimators can understand, so that the estimators can find my game and know what they are about to bid on.

## Before finalizing, check

- Is the situation concrete and grounded in real context, not generic?
- Is the motivation about *why*, not *how* (no feature name baked in)?
- Are forces (pushes and pulls) named when they matter?
- Is the outcome clear and testable?
- Could this story support more than one possible solution?

## Sources

- https://jtbd.info/replacing-the-user-story-with-the-job-story-af7cdee10c27
- https://jtbd.info/5-tips-for-writing-a-job-story-7c9092911fc9
