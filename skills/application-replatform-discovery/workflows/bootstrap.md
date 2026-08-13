# Bootstrap workflow

Use this workflow when a TLA does not yet have discovery files.

## Goal

Create a consistent first-run folder and starter files so discovery can begin immediately and be resumed later.

## Inputs

- `tla` (required)
- `apm_id` (optional at bootstrap)
- `application_repos` (optional list of URLs at bootstrap)
- `infrastructure_repos` (optional list of URLs at bootstrap)
- `isolation_zone_repo` (optional single URL at bootstrap)
- `discovery_date` (optional, defaults to today)

## Steps

1. Normalize the TLA key:
- lowercase
- replace spaces with hyphen
- remove characters outside `[a-z0-9-]`

2. Create folder:

`discovery-data/<tla>/`

3. Create starter files if missing:
- `discovery-data/<tla>/discovery.yaml` from [../templates/discovery-starter.yaml](../templates/discovery-starter.yaml)
- `discovery-data/<tla>/discovery-summary.md` from [../templates/discovery-template.md](../templates/discovery-template.md)
- `discovery-data/<tla>/notes.md` with an empty notes header

4. Seed required metadata in `discovery.yaml`:
- `meta.tla`
- `meta.apm_id` (if known)
- `meta.application_repos` (if known)
- `meta.infrastructure_repos` (if known)
- `meta.isolation_zone_repo` (if known)
- `meta.discovery_date`
- `meta.last_updated`
- `meta.session_count = 1`
- add a `history` event with action `bootstrap-created`

5. Upsert global index:

`discovery-data/index.yaml`

Add row with:
- `tla`
- `apm_id`
- `status` = `planned`
- `current_size` = `XS`
- `confidence` = `low`
- `last_updated`
- `open_question_count`
- `next_action` = `run discovery interview`

## Expected result

The skill can immediately proceed to interview mode with durable files in place.

## Idempotency rules

- Do not overwrite existing `discovery.yaml`.
- If files already exist, keep content and only append a history event (`bootstrap-checked`).
- Always refresh `index.yaml` last_updated and next_action.
