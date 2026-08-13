# Session loop workflow

Use this workflow each time the skill is invoked.

## 1) Identify and load

1. Resolve TLA.
2. Ensure path exists: `discovery-data/<tla>/`.
3. If `discovery.yaml` exists, load it and summarize:
- completed sections
- missing critical fields
- open questions by priority
4. If it does not exist, run [bootstrap.md](bootstrap.md) to initialize from [../templates/discovery-starter.yaml](../templates/discovery-starter.yaml).

## 2) Interview in short cycles

1. Ask 3-7 targeted questions focused on highest-impact unknowns.
2. After each answer batch:
- update YAML
- append history event
- recompute weighted score
- refresh summary markdown
3. Continue until user pauses or required fields are complete.

## 3) Save partial by default

Never wait for full completion.

Always save after each batch of answers, even if most fields are unknown.

## 4) Recompute effort and recommendation

Each cycle, update:
- `summary.recommendation`
- `summary.size`
- `summary.confidence`
- `sizing.tshirt`
- `sizing.weighted.*`

Explain any increase/decrease in size.

## 5) Regenerate summary output

Write `discovery-summary.md` with these sections:

1. Discovery info
2. Recommendation
3. Size, effort, timing, confidence
4. Top drivers and risks
5. Foundation and scope readiness snapshot
6. Container readiness snapshot
7. EOL remediation snapshot
8. Non-lift-and-shift work snapshot
9. Module decision snapshot
10. Open questions and next session plan

## 6) Update global index

Upsert `discovery-data/index.yaml` with:
- `tla`
- `apm_id`
- `status`
- `current_size`
- `confidence`
- `last_updated`
- `open_question_count`
- `next_action`

## 7) Finalization criteria

A TLA can be marked ready-for-estimate when:

1. Discovery info is complete.
2. Scope table has no critical unknowns.
3. Core container readiness and EOL gaps are known.
4. Non-lift-and-shift applicability is assessed.
5. Required module decisions are at least `needed/shared/tbd`.
6. Assumptions, exclusions, and risks are documented.

If criteria are not met, keep status as `in-progress` and list exactly what remains.
