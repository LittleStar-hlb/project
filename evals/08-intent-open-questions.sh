#!/usr/bin/env bash
set -euo pipefail
grep -q "## Open questions" intent/intent.md || { echo "FAIL: 缺 Open questions"; exit 1; }
lines=$(awk '/## Open questions/{f=1;next}/^## /{f=0}f' intent/intent.md | grep -c '^[0-9]')
[ "$lines" -ge 2 ] || { echo "FAIL: 开放问题少于 2"; exit 1; }
echo "PASS: 开放问题存在"
