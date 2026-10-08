#!/usr/bin/env bash
set -euo pipefail
grep -q "409" tests/auth.test.ts || { echo "FAIL: 未测重复邮箱 409"; exit 1; }
echo "PASS: 重复邮箱 409 已测"
