# Data model

This skill stores one canonical YAML file per TLA at:

`discovery-data/<tla>/discovery.yaml`

## Controlled vocabularies

- `status`: `in-azure`, `partial`, `on-prem-pcf`, `planned`, `shared`, `na`
- `confidence`: `low`, `medium`, `high`
- `dr_tier`: integer `0` to `4`
- module decision: `needed`, `shared`, `tbd`, `not-needed`
- yes/no/not-sure values: `yes`, `no`, `not-sure`

## YAML shape

```yaml
meta:
  tla: ""
  apm_id: ""
  business_unit: ""
  current_platform: ""
  target_compute: ""
  target_api_gateway: ""
  application_repos: []     # list of URLs
  infrastructure_repos: []  # list of URLs
  isolation_zone_repo: ""  # single URL
  dr_tier: 0
  app_owner: ""
  app_architect: ""
  discovery_date: ""      # YYYY-MM-DD
  status: "planned"
  last_updated: ""        # ISO 8601
  session_count: 0

summary:
  recommendation: ""
  size: "XS"
  effort_person_weeks: ""
  duration: ""
  target_start: ""
  target_finish: ""
  confidence: "low"
  size_reasons: []
  top_risks: []

scope:
  foundation:
    subscriptions: { in_place: "not-sure", owner: "", notes: "" }
    vnet_subnets: { in_place: "not-sure", owner: "", notes: "" }
    connectivity: { in_place: "not-sure", owner: "", notes: "" }
    compute_env: { in_place: "not-sure", owner: "", notes: "" }
    data_platform: { in_place: "not-sure", owner: "", notes: "" }
    keyvault_monitoring: { in_place: "not-sure", owner: "", notes: "" }
    cicd: { in_place: "not-sure", owner: "", notes: "" }
  apps_in_scope: []
  shared_services: []

container_readiness:
  services: []
  checklist:
    stateless: "not-sure"
    config_externalized: "not-sure"
    stdout_logging: "not-sure"
    graceful_sigterm: "not-sure"
    probes_defined: "not-sure"
    resources_sized: "not-sure"
    non_root_readonly: "not-sure"
    image_scanned: "not-sure"
  pcf_gotchas: []

eol:
  components: []

non_lift_shift:
  networking: { applies: "not-sure", notes: "" }
  identity_secrets: { applies: "not-sure", notes: "" }
  apim: { applies: "not-sure", notes: "" }
  observability: { applies: "not-sure", notes: "" }
  cicd: { applies: "not-sure", notes: "" }
  data_migration: { applies: "not-sure", notes: "" }
  resiliency_dr: { applies: "not-sure", notes: "" }
  governance: { applies: "not-sure", notes: "" }

modules:
  decisions: []

sizing:
  tshirt: "XS"
  weighted:
    total_score: 0
    weighted_size: "XS"
    drivers:
      storage_only: 0
      upgrades_required: 0
      stored_proc_conversion: 0
      rearchitecture_required: 0
      eol_remediation: 0
      foundation_gaps: 0
      container_readiness_gaps: 0
      integration_rewire: 0
      dr_complexity: 0
      governance_overhead: 0
    notes: []
  assumptions_exclusions: []

out_of_scope:
  common_exclusions: []
  tla_specific: []

open_questions: []
history: []
```

## Notes on arrays

- `meta.application_repos` should be a list of repository URLs
- `meta.infrastructure_repos` should be a list of repository URLs
- `meta.isolation_zone_repo` should be a single repository URL
- `apps_in_scope` items should include: `name`, `type`, `runtime_engine`, `current_location`, `target`, `status`, `notes`
- `container_readiness.services` items should include: `service`, `dockerfile`, `acr_image`, `effort`, `blocker`
- `eol.components` items should include: `component`, `current`, `eol_date`, `target`, `status`, `notes`
- `modules.decisions` items should include: `module`, `purpose`, `decision`, `notes`
- `open_questions` items should include: `id`, `question`, `priority`, `owner`, `status`, `created_at`, `resolved_at`
- `history` items should include: `timestamp`, `session_id`, `action`, `details`
