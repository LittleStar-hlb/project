#!/usr/bin/env bash
set -euo pipefail
grep -q "## Proof" plan.md || { echo "FAIL: plan 缺 Proof"; exit 1; }
grep -q "npm test" plan.md || { echo "FAIL: Proof 不可机器检查"; exit 1; }
echo "PASS: plan Proof 机器可检查"
