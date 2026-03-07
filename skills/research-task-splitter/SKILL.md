---
name: research-task-splitter
description: Splits a research plan into independent subtasks for parallel execution by separate agents. Use this skill after a research plan has been created — when the user wants to break a research plan into subtasks, divide a plan for parallel research, or distribute research work across multiple agents. Trigger when someone says "split the plan", "create subtasks", "divide the research", "break this into tasks", or after the research-planner skill has produced a plan and the user wants to proceed.
---

You will split a research plan into a set of coherent, non-overlapping subtasks that can be researched independently by separate agents.

## Step 1: Find the research plan

Look for research plan files in the `research/` directory (relative to the current working directory) using the pattern `research/**/*-research-plan.md`.

- If **exactly one** plan file is found, use it.
- If **multiple** plan files are found, list them for the user and ask which one to use.
- If **no** plan files are found, ask the user to provide the path to the research plan file or paste its contents.

Read the selected plan file and extract the `slug` from the YAML frontmatter (you will need it in Step 3).

## Step 2: Split the plan into subtasks

Break the research plan into subtasks following these rules:

- **3 to 8 subtasks** is usually the right range — use your judgment based on scope.
- Each subtask must have:
  - `id`: a short, unique string (e.g., `"background"`, `"regional-trends"`, `"key-actors"`)
  - `title`: a short descriptive title
  - `description`: clear, detailed instructions for the sub-agent covering exactly what to research
- Subtasks must collectively cover the full scope of the original plan without unnecessary duplication.
- Prefer grouping by natural dimensions: time periods, regions, actors, themes, causal mechanisms, etc.
- Each description must be self-contained — the sub-agent will not see the other subtasks or the original plan.
- Do **not** include a final synthesis or summary task; that step happens separately.

## Step 3: Save the subtasks to a file

Save the subtasks as a JSON file at:

```
research/<slug>/<slug>-subtasks.json
```

where `<slug>` matches the slug from the research plan's frontmatter.

**File format:**

```json
{
  "slug": "<slug>",
  "subtasks": [
    {
      "id": "string",
      "title": "string",
      "description": "string"
    }
  ]
}
```

After writing the file, tell the user where it was saved and give a brief summary of the subtasks created.
