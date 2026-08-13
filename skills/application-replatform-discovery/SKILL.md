---
name: application-replatform-discovery
description: Estimate on-prem to Azure application conversion effort by running a structured discovery interview, saving partial findings across sessions, and producing a recommendation plus T-shirt size and weighted score. Use when a user wants to assess migration readiness, effort, risks, and required Azure modules for an application portfolio.
---

# application-replatform-discovery

You assess an on-prem application migration to Azure using a structured discovery process. You must gather required data, persist it for multi-session completion, and produce a recommendation and effort estimate.

## Primary outcomes

1. Collect required discovery information for one TLA/application.
2. Persist findings to workspace data files so later sessions can resume.
3. Maintain open questions and unknowns until resolved.
4. Produce both:
- T-shirt size (XS, S, M, L, XL)
- Weighted score with confidence and rationale
5. Produce a concise summary report for stakeholders.

## Source of truth

Use [templates/discovery-template.md](templates/discovery-template.md) as the section structure and required fields.
Use [templates/discovery-starter.yaml](templates/discovery-starter.yaml) as the first-run starter file.
Use [data-model.md](data-model.md) for storage schema and controlled values.
Use [workflows/bootstrap.md](workflows/bootstrap.md) for first-run initialization.
Use [workflows/resume-existing-tla.md](workflows/resume-existing-tla.md) for explicit resume behavior and prompt wording.
Use [workflows/session-loop.md](workflows/session-loop.md) for start/resume/update/finalize behavior.

## Session behavior

1. Detect target TLA:
- If not provided, ask for TLA first.

2. Load existing state:
- Check for `discovery-data/<tla>/discovery.yaml`.
- If present, summarize what is already known and what is missing.
- If not present, run the bootstrap workflow to create starter files.

3. Ask focused clarifying questions:
- Ask only for missing or low-confidence fields.
- Prefer small batches of high-value questions.
- Save partial answers immediately after each batch.

4. Keep a running backlog of unknowns:
- Update `open_questions` in `discovery.yaml`.
- Mark resolved questions with timestamps in `history`.

5. Recompute sizing when new data changes effort drivers:
- Update both `sizing.tshirt` and `sizing.weighted`.
- Explain what changed and why.

6. Regenerate summary artifacts:
- `discovery-data/<tla>/discovery-summary.md` for humans.
- Keep `discovery.yaml` as the machine-readable source of truth.

## Storage contract

For each TLA, store data here:

`discovery-data/<tla>/`
- `discovery.yaml` (required, canonical)
- `discovery-summary.md` (required, regenerated)
- `notes.md` (optional, raw interview notes)

Also maintain:

`discovery-data/index.yaml`
- Lists each TLA, status, confidence, last updated, and next action.

## Estimation rules

Use both methods and report both.

1. T-shirt size:
- XS: storage-only migration
- S: one upgrade
- M: two upgrades
- L: two or more upgrades plus stored procedure conversion
- XL: multiple upgrades plus stored procedure conversion plus major re-architecture

2. Weighted scoring rubric:
- Score each driver from 0 to 3 in `sizing.weighted.drivers`.
- Sum = `total_score`.
- Map score to size:
  - 0-6: XS
  - 7-11: S
  - 12-16: M
  - 17-22: L
  - 23-30: XL
- If T-shirt and weighted size disagree, report both and explain the delta.

## Controlled values

Use controlled values from `data-model.md`:
- Discovery status: `in-azure`, `partial`, `on-prem-pcf`, `planned`, `shared`, `na`
- Confidence: `low`, `medium`, `high`
- DR tier: `0`, `1`, `2`, `3`, `4`

## Quality bar

Before finalizing:

1. Confirm all required sections are either complete or explicitly marked unknown.
2. Confirm repository metadata is captured:
   - `meta.application_repos` (list of URLs)
   - `meta.infrastructure_repos` (list of URLs)
   - `meta.isolation_zone_repo` (single URL)
3. Ensure assumptions/exclusions are documented.
4. Ensure top risks have owners or follow-up actions where possible.
5. Ensure module decisions are captured as `needed`, `shared`, `tbd`, or `not-needed`.
6. Ensure summary matches YAML values exactly.

## Final deliverable per TLA

Produce:

1. Recommendation statement.
2. Current size (T-shirt and weighted) with confidence.
3. Top effort drivers and top risks.
4. Required Terraform module decisions.
5. Open questions and next interview focus.

If information is incomplete, do not block progress. Save partial state, show what remains, and continue in later sessions.
