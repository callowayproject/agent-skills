---
name: research-planner
description: Converts a research task into detailed, actionable instructions for a researcher to follow. Use this skill whenever the user has a research topic, question, or task and wants a structured plan or brief for how to conduct the research — not the research itself, but instructions a researcher can act on. Trigger this whenever someone provides a research topic and asks to plan it out, draft a research brief, outline a research approach, or generate instructions for investigating something, even if they don't explicitly say "plan" or "instructions." Also trigger when someone asks "how should I research X" or "what should a researcher look into for Y."
---

You will be given a research task. Your job is to produce detailed instructions that a researcher can follow to complete it. Do NOT conduct the research yourself — only produce the instructions.

## Step 1: Assess the topic

Before writing instructions, quickly assess whether the topic is clear enough to scope meaningfully.

**Ask 1–2 targeted clarifying questions if:**
- The topic is too broad to scope without guessing (e.g., "research AI" or "look into climate")
- A missing dimension would fundamentally change the output (e.g., you don't know if this is for a technical audience or an executive, or whether it's a competitive analysis vs. an academic overview)

**Proceed directly if:**
- The topic is reasonably specific, even if some details are open-ended
- You can flag the uncertain dimensions in the instructions themselves

When in doubt, proceed and flag — one well-placed note ("No geographic scope was specified; cover globally unless a narrower focus makes more sense") is better than an unnecessary back-and-forth.

Limit yourself to at most 2 questions, and only ask what you genuinely can't infer or flag.

## Step 2: Write the research instructions

Think of yourself as a project manager briefing a skilled but uninformed researcher. They know how to research, but they don't know your topic, goals, or preferences. Your instructions should tell them:

- **What to find out** — the specific questions to answer, dimensions to explore, or facts to gather
- **How to structure the output** — what sections, what format (report, table, bullet list, executive summary, etc.)
- **What sources to prioritize** — prefer primary, official, or original sources over secondary summaries
- **What level of detail is expected** — surface overview vs. deep-dive analysis

## Guidelines

1. **Be specific.** Include all known user preferences and list every dimension to investigate. Don't leave the researcher guessing about scope.

2. **Flag open-ended dimensions.** If important attributes are missing from the task, say so explicitly: "The time period is open-ended — use your judgment" or "No geographic scope was specified; cover globally unless a narrower focus makes more sense."

3. **Don't assume.** Treat dimensions the user hasn't specified as flexible. Don't invent constraints that weren't given.

4. **Write in first person** from the user's perspective — the instructions should read as if the user is addressing the researcher directly (e.g., "I need you to find...", "Please include a table comparing...").

5. **Request tables where they add value.** Comparison tables, feature matrices, and timelines are often clearer than prose. If the topic involves comparing multiple options or tracking changes over time, explicitly ask for a table.

6. **Specify the output format.** Tell the researcher exactly what to deliver: a structured report with specific section headers, an executive summary followed by detail sections, a bullet list with citations, etc.

7. **Preserve input language.** Write the instructions in the same language as the research task unless the user asks otherwise.

8. **Prefer primary sources.** Instruct the researcher to prioritize official documentation, original studies, government data, company announcements, and firsthand accounts over secondary aggregators or opinion pieces.

9. **Include recency guidance.** Specify how current the sources need to be — "prioritize sources from the last 2 years" or "ensure key facts are current as of [year]." If the user didn't specify a timeframe, note this and suggest a reasonable default based on the topic (fast-moving topics like AI or policy warrant fresher sources than historical or stable topics).

## Step 3: Write the research plan to a file

After producing the research instructions, save them to a Markdown file so downstream skills (such as a task-splitter) can read and act on the plan.

**Slugify the topic title:**
- Lowercase the research topic
- Replace spaces and non-alphanumeric characters with hyphens
- Collapse consecutive hyphens into one and strip leading/trailing hyphens
- Example: "AI in Healthcare (2024)" → `ai-in-healthcare-2024`

**File location:**
```
research/<slug>/<slug>-research-plan.md
```
relative to the current working directory. Create the directory if it does not exist.

**File format:**

The file must begin with a YAML frontmatter block, followed by the full research instructions produced in Step 2.

```markdown
---
topic: "<original research topic, verbatim>"
slug: "<slugified-title>"
date_created: "<ISO 8601 date, e.g. 2026-03-07>"
status: "ready"
source_skill: "research-planner"
---

<research instructions from Step 2>
```

After writing the file, tell the user where it was saved.
