# Resume existing TLA workflow

Use this workflow when the user wants to continue discovery in a later session.

## Goal

Reload previous state, summarize what is known, and continue with only missing high-value questions.

## Detection

Resume mode is triggered when:
- the user says resume/continue/follow-up for a TLA
- `discovery-data/<tla>/discovery.yaml` already exists

## Steps

1. Load current state:
- `discovery-data/<tla>/discovery.yaml`
- `discovery-data/<tla>/discovery-summary.md` (if present)
- `discovery-data/index.yaml` entry

2. Produce a short checkpoint summary:
- what is complete
- what is partial
- open questions by priority
- last computed size and confidence

3. Ask the next batch (3-7) of highest-impact questions:
- prioritize unknowns that affect size, risk, and module decisions
- prioritize missing repository metadata early (`application_repos`, `infrastructure_repos`, `isolation_zone_repo`)
- avoid asking for already-complete fields

4. Save immediately after each answer batch:
- update YAML
- append `history`
- recalculate sizing
- regenerate summary
- update index

5. End each session with a next-session plan:
- top 3 unanswered questions
- who needs to provide each answer
- expected impact on estimate

## Explicit prompt wording (for Copilot chat)

Use these prompts to resume quickly.

Prompt A:

"Use the application-replatform-discovery skill to resume TLA <TLA>. Load discovery-data/<tla>/discovery.yaml, summarize what is complete vs missing, then ask me only the top 5 unanswered questions that most impact size and risk. Save updates after each answer batch."

Prompt B:

"Continue discovery for TLA <TLA> from saved state. Recompute T-shirt and weighted sizing using new answers, update the summary file, and show open questions for next session."

Prompt C:

"Resume the last discovery session for <TLA>. Do not restart the questionnaire. Ask only unresolved high-priority questions and update discovery-data/index.yaml at the end."
