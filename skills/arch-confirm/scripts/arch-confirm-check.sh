#!/usr/bin/env bash
# Fails if design/views/*.md or design/README.md are stale relative to design/model.yaml.
#
# Enforcement is hash-based, not regeneration-based: arch-confirm (the AI skill) embeds
# `<!-- generated-from-model-sha256: <hash> -->` as the first line of every file it generates from
# design/model.yaml. This script recomputes the current model's hash and checks every generated
# file's marker matches. It does not (and cannot) regenerate content itself — that step requires
# the skill to run.
set -euo pipefail

DESIGN_DIR="${1:-design}"
MODEL_FILE="$DESIGN_DIR/model.yaml"

if [[ ! -f "$MODEL_FILE" ]]; then
  echo "No $MODEL_FILE found — nothing to check."
  exit 0
fi

current_hash="$(sha256sum "$MODEL_FILE" | awk '{print $1}')"
fail=0

check_file() {
  local f="$1"
  if [[ ! -f "$f" ]]; then
    echo "MISSING: $f does not exist but is required alongside $MODEL_FILE"
    fail=1
    return
  fi
  local marker
  marker="$(head -n 1 "$f" | sed -n 's/^<!-- generated-from-model-sha256: \([a-f0-9]*\) -->$/\1/p')"
  if [[ -z "$marker" ]]; then
    echo "STALE/UNMARKED: $f has no generated-from-model-sha256 marker on its first line."
    fail=1
  elif [[ "$marker" != "$current_hash" ]]; then
    echo "STALE: $f was generated from a different model.yaml (marker $marker, current $current_hash)."
    fail=1
  fi
}

check_file "$DESIGN_DIR/README.md"
for view in networking security compute data integration observability; do
  check_file "$DESIGN_DIR/views/$view.md"
done

if [[ "$fail" -ne 0 ]]; then
  echo
  echo "One or more generated files are stale relative to $MODEL_FILE."
  echo "Re-run the arch-confirm skill's view-generation step — do not hand-edit files under $DESIGN_DIR/views/."
  exit 1
fi

echo "All generated views are current with $MODEL_FILE."
