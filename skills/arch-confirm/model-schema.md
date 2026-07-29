# `design/model.yaml` schema

The model is the single source of truth. Every view is generated from it; nothing else is hand-edited (see
[pr-workflow.md](pr-workflow.md) for the CI check that enforces this).

## Top-level shape

```yaml
metadata:
  source_doc: "link or filename of the app team's doc"
  source_doc_version: "2026-07-29"       # bump this on every re-extraction from a revised doc
  confirmed_by: null                      # filled in once the PR is approved
  confirmed_at: null

resources:
  - id: web-app-primary
    type: aws_lambda_function            # Terraform resource type, not an abstract label
    view: compute                        # which of the six fixed views this belongs to (see view-generation.md)
    attributes:
      runtime: "python3.12"
      memory_size: MISSING               # see "Placeholders" below
      timeout: 30
    relationships:
      - target: api-gateway-primary
        kind: invoked_by
      - target: orders-table
        kind: reads_writes
    notes: "Confirmed with app team's Slack thread 2026-07-12"

open_items:
  - id: OPEN-1
    resource: web-app-primary
    field: attributes.memory_size
    question: "Doc doesn't specify Lambda memory sizing — need app team input"
    issue_url: null                      # filled in once the GitHub Issue is filed
```

A resource can belong to more than one view (e.g., a database might show up in both `data` and `security` if it
has a notable encryption/access-control angle) — put the primary rendering in one view and cross-reference in
notes rather than duplicating the full resource block.

## Resource types

Use the actual Terraform resource type as `type` (e.g. `aws_db_instance`, `azurerm_app_service`,
`google_compute_instance`), not a paraphrase. If the target provider isn't obvious from the doc, ask the engineer
running the extraction rather than guessing — a wrong provider assumption propagates into every downstream view.

## Placeholders

Anything the source doc doesn't specify becomes an inline placeholder on the exact field that's missing —
never a separate "TBD" list disconnected from the resource:

```yaml
attributes:
  memory_size: MISSING
  vpc_id: "AMBIGUOUS — doc says 'the shared VPC' but two VPCs exist in this account"
```

Two placeholder flavors:

- `MISSING` — the doc simply doesn't say. Use the literal string `MISSING` so it's trivially greppable.
- A free-text string starting with `AMBIGUOUS —` — the doc says *something*, but it's not resolvable without
  asking (e.g., refers to a resource that could mean more than one thing).

Every placeholder gets a corresponding entry in `open_items` with a `question` field phrased so the app team can
answer it directly in a PR comment. Views render placeholders as a visible flag (see
[view-generation.md](view-generation.md)) — don't let them disappear into a wall of YAML the app team never opens.

## Extraction rules

- Prefer more, smaller resource entries over one resource block with a dozen loosely-related attributes — it
  keeps diffs (on revision) and view rendering legible.
- Every relationship should be directional and named with a real verb (`invoked_by`, `reads_writes`,
  `routes_to`, `assumes_role`) — not a generic `connects_to`. The verb is what makes the Integration and
  Networking views useful instead of just "boxes with lines."
- Don't infer defaults the doc doesn't state (e.g., don't assume a database is encrypted at rest just because
  that's best practice) — flag it as `MISSING` instead. The whole point is catching what the doc *didn't* say.
