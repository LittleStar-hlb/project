#!/usr/bin/env bash
set -euo pipefail
count=$(grep -c "NOT RESOLVED HERE" intent/spec.md)
[ "$count" -ge 2 ] || { echo "FAIL: spec 未保留两个未解决关切"; exit 1; }
echo "PASS: 两个关切未解决"
