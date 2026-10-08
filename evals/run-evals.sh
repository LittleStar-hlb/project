#!/usr/bin/env bash
set -uo pipefail

results="evals/results.txt"
: > "$results"

failed=0
for f in evals/[0-9][0-9]-*.sh; do
  name=$(basename "$f" .sh)
  if bash "$f" >> "$results" 2>&1; then
    echo "PASS $name" >> "$results"
  else
    echo "FAIL $name" >> "$results"
    failed=1
  fi
done

cat "$results"
exit "$failed"
