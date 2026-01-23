---
name: <skill-name, see README.md>
description: <description, see README.md>
---

## Overview

<2–5 sentences describing what this skill is for, at a conceptual level. 
Explain the mental model / methodology in human-friendly terms.>

This skill has multiple sub-workflows stored in:

- `skills/<skill-name>/workflows/`

Each workflow file contains instructions that YOU, the AI agent, should read and follow as an internal procedure to handle the user's request.

## Capability & Responsibilities

You are an AI assistant using the `<skill-name>` skill.

Your responsibilities when this skill is active:

1. Understand the user’s request and their underlying intent.
2. Decide whether this skill is appropriate to handle the request.
3. If appropriate, route to the best matching workflow in `workflows/`.
4. Read and apply the selected workflow’s instructions (steps or heuristics).
5. Produce a helpful, direct response to the user based on that workflow.

If the request is clearly outside this skill’s scope, you SHOULD NOT force-fit it. Briefly explain that this skill is not appropriate and allow other skills or general reasoning to handle it.

## When to Use This Skill

Use this skill when the user’s request matches one or more of the following:

- <Situation 1, plain language>
- <Situation 2, plain language>
- <Situation 3, plain language>

You should especially consider this skill when the user uses phrases like:

- "<user phrase / query pattern 1>"
- "<user phrase / query pattern 2>"
- "<user phrase / query pattern 3>"

Do **not** use this skill when:

- <Out-of-scope case 1>
- <Out-of-scope case 2>
- <Out-of-scope case 3>

## Inputs & Assumptions

When routing and responding, assume:

- Input: Free-form natural language from the user.
- Context: You may use prior conversation context to refine intent.
- Output: A single, coherent answer that applies the chosen workflow.

You SHOULD NOT return file paths or workflow names to the user. These are internal to your reasoning. Instead, you should respond with the final, user-facing result.

## Routing Logic (For the AI Agent)

You MUST use **intent classification via natural-language patterns** to select the best workflow.

Follow this procedure:

1. **Parse intent**
   - Read the user’s request and restate it internally in your own words.
   - Identify what the user is *trying to achieve*, not just the literal phrasing.

2. **Match against routing map**
   - Compare the inferred intent against the Routing Map below.
   - Look for the best conceptual match, not just keyword overlap.

3. **Select workflow**
   - If one workflow clearly matches, select it.
   - If multiple workflows could apply:
     - Prefer the one that is more specific to the user’s goal.
   - If none match well:
     - Either handle with general reasoning (if in-scope),
       or explain that this skill is not suitable.

4. **Apply workflow**
   - Internally "open" the referenced workflow file.
   - Follow its instructions (steps or heuristics) as your reasoning guide.
   - Use them to structure your analysis and your final answer.

5. **Respond to the user**
   - Do not mention workflow file names or internal routing.
   - Present only the resulting explanation/plan/answer.

## Routing Map

Use this table to map user intent to workflows. This is for YOUR internal use as the AI agent.

| Intent pattern / scenario       | Typical user language (examples)           | Workflow file path          | Notes for routing (internal only)              |
|---------------------------------|--------------------------------------------|-----------------------------|------------------------------------------------|
| <Short description of intent 1> | "<example phrase 1>", "<example phrase 2>" | `workflows/<workflow-1>.md` | <When to strongly prefer this workflow>        |
| <Short description of intent 2> | "<example phrase 1>", "<example phrase 2>" | `workflows/<workflow-2>.md` | <Disambiguation guidance vs similar workflows> |
| <Short description of intent 3> | "<example phrase 1>", "<example phrase 2>" | `workflows/<workflow-3>.md` | <Edge cases / fallbacks>                       |

You may use fuzzy matching. Exact keywords are NOT required; they are only hints.

## Workflow Types

Workflows in `skills/<skill-name>/workflows/` may use two styles:

1. **Step-by-step procedures**  
   - Follow the steps in sequence.
   - Use numbered steps to structure your reasoning and your answer.

2. **Heuristic / principle-based guides**  
   - Use the heuristics as constraints or lenses on your reasoning.
   - You may reorder or combine them as needed, but stay faithful to the intent.

When reading any workflow:

- Treat it as system-level instructions for how you should think.
- Use it to guide your internal reasoning before you generate the final answer.

---

## Examples (For the AI Agent)

These examples are to help you understand how to route. They are NOT to be shown verbatim to the user.

### Example A: Clear match to a specific workflow

**User:**  
"<example user request 1>"

**Your internal reasoning (not shown to user):**

- Intent: <short restatement>
- Skill: `<skill-name>` is appropriate because <reason>.
- Best workflow: `workflows/<workflow-1>.md` because <reason>.

Then you apply `workflows/<workflow-1>.md` and produce the final answer.

### Example B: Ambiguous between two workflows

**User:**  
"<example user request 2>"

**Your internal reasoning (not shown to user):**

- Intent: <short restatement>
- Possible workflows: `<workflow-1>.md`, `<workflow-2>.md`
- Choose `<workflow-2>.md` because it better fits <specific nuance>.

Then you apply `workflows/<workflow-2>.md` and respond accordingly.

---

## Implementation Notes (Internal Guidance)

- You are a single intelligent agent, not a dispatcher to other agents.
- “Routing” here means: choosing which internal workflow document to follow.
- Stay within this skill’s scope; do not over-extend it to irrelevant tasks.
- Keep your final response user-friendly, even though your reasoning is guided by these internal instructions.
