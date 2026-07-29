---
name: arch-confirm
description: >
  Turns an application team's cloud architecture doc into a structured, reviewable
  model and a fixed set of diagrams/tables *before* any Terraform is written, so the
  infra team can show the app team "is this what you said?" and catch misreadings
  early. Use when a new architecture doc arrives from an app team and needs
  translation into Terraform, when starting a new infra/Terraform project from a
  design doc, when the user says "confirm this architecture doc," "is this what you
  said," "generate architecture views for review," or wants a PR-based sign-off step
  before writing infrastructure-as-code. Also use when an app team sends a *revised*
  doc after an earlier confirmation round — this skill re-extracts and diffs against
  the existing model instead of starting over. Explicitly out of scope: generating the
  actual Terraform — this skill stops at a confirmed, approved model.
---

# arch-confirm

Confirm an application team's understanding of their own architecture *before* writing Terraform, by translating
their doc into a structured model and a fixed set of reviewable views, then routing that through a PR the app team
signs off on.

## Why this exists

Cloud architecture docs from app teams are prose. Reading prose, mentally building a mental model, and going
straight to Terraform means any misreading isn't caught until the infra is built (or worse, in production). This
skill inserts a cheap, fast checkpoint: turn the doc into something concrete and reviewable, and get the app team to
say "yes, that's it" — or correct it — before a single `.tf` file exists.

## Pipeline

1. **Extract** — draft a structured YAML model from the source doc (see [model-schema.md](model-schema.md)).
   Use Terraform/cloud-provider-native resource types, not abstracted terms — app teams often have members who
   know the resources, and specific types are what let you spot missing information.
2. **Flag gaps inline** — anything the doc doesn't specify becomes an inline placeholder directly on the resource
   in the model (see the "Placeholders" section of [model-schema.md](model-schema.md)), not a separate list.
3. **Human review gate** — before anything goes to the app team, the engineer running this skill reviews and
   corrects the AI-drafted model. Never send a raw, unreviewed draft to the app team.
4. **Generate views** — from the reviewed model, generate the fixed set of six views (see
   [view-generation.md](view-generation.md)): Networking, Security/IAM, Compute/Application, Data/Storage,
   Integration/Messaging, Observability/Ops. Always generate all six, even if a view ends up sparse — a sparse
   Security view is itself a signal, not something to skip.
5. **Lay out the files** in `design/` in the same repo the Terraform will eventually live in (see "File layout"
   below).
6. **Open a PR** against the repo containing `design/`. This is how the app team reviews and comments — see
   [pr-workflow.md](pr-workflow.md) for PR structure, the CI drift gate, the approval gate, and how open
   placeholders become tracked GitHub Issues instead of merge blockers.
7. **On a revised doc**, don't restart — re-extract into a new draft and diff it against the current `model.yaml`
   (see "Handling revisions" in [pr-workflow.md](pr-workflow.md)).

## File layout

```
design/
├── model.yaml              # single source of truth — the ONLY file anyone hand-edits
├── views/
│   ├── networking.md       # Mermaid diagram
│   ├── security.md         # table
│   ├── compute.md          # Mermaid diagram
│   ├── data.md             # table
│   ├── integration.md      # Mermaid diagram
│   └── observability.md    # table (usually sparse)
└── README.md                # short index: what this is, how to review, links to open issues
```

`design/views/*.md` are **always generated from `design/model.yaml`, never hand-edited.** See
[view-generation.md](view-generation.md) for the generation rules and [pr-workflow.md](pr-workflow.md) for the CI
check that enforces this.

## What this skill does NOT do

- It does not generate Terraform. Once `design/model.yaml` is approved and merged, translating it into `.tf` files
  is a separate, later step (a different skill/session).
- It does not choose an issue tracker for you. Open items become GitHub Issues by default (see
  [pr-workflow.md](pr-workflow.md)) because this skill can't assume access to Jira or another company tracker. If
  the target repo has a different tracker integration, adapt the open-items step accordingly rather than forcing
  GitHub Issues where they don't fit.

## Quick start for the engineer running this

1. Get the app team's doc into the repo where the Terraform will eventually live (paste text, attach a file, or
   point at a URL/location).
2. Invoke this skill. It drafts `design/model.yaml` and asks you to review the placeholders and resource choices
   before generating views.
3. Review the draft. Correct anything the extraction got wrong — this is the mandatory human gate, not optional.
4. Once you approve, it generates `design/views/*.md` and `design/README.md`, and (if not already present) adds the
   CI drift-check workflow from [pr-workflow.md](pr-workflow.md).
5. Open the PR, request review from the app team's stakeholder, and let the review cycle run.
6. On merge (with or without open items, as long as they're tracked as Issues), the confirmation step is done —
   Terraform work can begin.
