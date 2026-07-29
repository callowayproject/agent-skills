# PR workflow, CI drift gate, and revisions

## Opening the PR

- Branch, commit `design/model.yaml` + regenerated `design/views/*.md` + `design/README.md` together as one PR.
- PR description should state: source doc reference/version, a one-line summary of what's confirmed, and a count
  of open items (if any), each linked once its Issue exists (see "Open items" below).
- Request review explicitly from the app team's stakeholder(s) — this PR is *for them*, not a formality.

## CI drift gate

The model is the only file anyone should hand-edit. To make that a guarantee rather than a convention, the first
time this skill runs in a target repo, copy two files from this skill into it:

- [scripts/arch-confirm-check.sh](scripts/arch-confirm-check.sh) → `design/.arch-confirm/arch-confirm-check.sh`
  in the target repo
- [scripts/arch-confirm-ci.yml](scripts/arch-confirm-ci.yml) → `.github/workflows/arch-confirm-check.yml` in the
  target repo

The check:

1. Regenerates `design/views/*.md` and `design/README.md` from `design/model.yaml` into a temp location.
2. Diffs the regenerated output against what's committed.
3. Fails the PR check if they differ, with a message telling the author to re-run the skill's view generation
   step rather than hand-editing a view file.

This catches drift regardless of *how* it happened — a hand-edit, a stale regeneration, or a different tool
touching the model without going through this skill.

## Approval gate

Merge requires a **required reviewer approval** from the app team's stakeholder — configure this as a required
review on the PR (via branch protection or the repo's equivalent) rather than relying on someone remembering to
wait for it. This is the go/no-go gate: Terraform work does not start until this PR is merged.

## Open items — don't block merge, don't let them rot

The PR **can merge with open items still unresolved**, as long as every item in `model.yaml`'s `open_items` list
has a filed, linked GitHub Issue by merge time:

1. For each `open_items` entry without an `issue_url`, file a GitHub Issue in the target repo. Title: the
   `question` field. Body: which resource/field it's on, and a link back to the PR/commit for context.
2. Write the resulting issue URL back into `open_items[].issue_url` in `model.yaml` before merging.
3. `design/README.md`'s open-items section links each one.

Default to GitHub Issues because this skill can't assume access to a company tracker (e.g., Jira) from wherever
it's running. If the target repo already has a working Jira/other integration that auto-creates linked tickets
from a label or template, prefer that instead — the goal is "tracked and assigned somewhere real," not
specifically GitHub.

Resolving an open item later is a normal PR: update the resource's field in `model.yaml`, close the linked issue,
regenerate views, merge.

## Handling revisions

When the app team sends a revised doc after a review round:

1. Re-run extraction on the new doc into a **new draft model**, not by hand-patching the existing
   `design/model.yaml`.
2. Diff the new draft against the current `design/model.yaml` (resource-by-resource, field-by-field — a plain
   YAML/text diff is fine since both are structured the same way).
3. Present the diff, not the full model, as the thing to review — the app team already confirmed everything
   that didn't change; re-reviewing the whole document from scratch wastes their time and buries the actual
   changes.
4. Bump `metadata.source_doc_version` and open a new PR (or push to the existing one if the review round is
   still open) containing only the merged, corrected model plus regenerated views.
5. Any `open_items` the revision resolves get closed (and their Issues closed) as part of this PR; any new gaps
   the revision introduces follow the same open-item process as the initial round.
