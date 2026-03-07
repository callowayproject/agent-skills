---
name: research-coordinator
description: Runs all research subtasks in parallel and synthesizes findings into a final report. Use this skill after the research-task-splitter has produced a subtasks JSON file — when the user wants to execute the research, run the subtasks, start the research agents, or coordinate the research. Trigger when someone says "run the research", "execute the subtasks", "start the research", "coordinate the research", or after the research-task-splitter skill has produced a subtasks file and the user wants to proceed.
---

You are the research coordinator. Your job is to execute all subtasks in parallel, save individual reports, then synthesize everything into a single final report.

## Step 1: Find the required files

**Subtasks JSON:** Look for a subtasks file using the pattern `research/**/*-subtasks.json`.

- If **exactly one** file is found, use it.
- If **multiple** files are found, list them and ask the user which one to use.
- If **none** is found, ask the user to provide the path or run the task-splitter skill first.

**Research plan:** Using the `slug` from the subtasks JSON, load the corresponding plan file at:

```
research/<slug>/<slug>-research-plan.md
```

Read both files. Extract from the research plan's YAML frontmatter:
- `topic` — this is the `user_query` you will pass to each sub-agent

## Step 2: Run all subtasks in parallel

For each subtask in the `subtasks` array, spawn an independent Agent with the following prompt (substitute all `{placeholders}` with actual values):

---

```
You are a specialized research sub-agent.

Global user query:
{topic}

Overall research plan:
{full_text_of_research_plan}

Your specific subtask (ID: {subtask.id}, Title: {subtask.title}) is:

"""{subtask.description}"""

Instructions:
- Focus ONLY on this subtask, but keep the global query in mind for context.
- Use the available tools to search for up-to-date, high-quality sources.
- Prioritize primary and official sources when possible.
- Be explicit about uncertainties, disagreements in the literature, and gaps.
- Return your results as a MARKDOWN report with this structure:

# {subtask.id} {subtask.title}

## Summary
Short overview of the main findings.

## Detailed Analysis
Well-structured explanation with subsections as needed.

## Key Points
- Bullet point
- Bullet point

## Sources
- [Title](url) - short comment on why this source is relevant

Now perform the research and return ONLY the markdown report.
```

---

Launch all Agent calls simultaneously (in parallel). Do not wait for one to finish before starting the next.

## Step 3: Save individual subtask reports

As each Agent returns its markdown report, save it to:

```
research/<slug>/reports/<subtask-id>.md
```

Wait until all subtask reports have been received and saved before proceeding.

## Step 4: Synthesize into a final report

Read all saved report files from `research/<slug>/reports/`. Then produce a single, cohesive final report that:

- Addresses the original `topic` / `user_query` as the central question
- Integrates findings from all subtask reports without redundancy
- Uses clear headings and subheadings
- Ends with these two sections:
  - **Open Questions and Further Research** — unresolved issues, gaps, or areas worth exploring further
  - **Bibliography / Sources** — merge and deduplicate all sources cited across subtask reports; use `[Title](url)` format

## Step 5: Save the final report

Save the final report to:

```
research/<slug>/<slug>-final-report.md
```

Use this frontmatter at the top of the file:

```markdown
---
topic: "<original topic, verbatim>"
slug: "<slug>"
date_created: "<ISO 8601 date>"
status: "complete"
source_skill: "research-coordinator"
subtasks_completed: <number of subtasks>
---
```

After saving, tell the user where the final report was saved and give a one-sentence summary of the overall findings.
