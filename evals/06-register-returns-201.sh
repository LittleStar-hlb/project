#!/usr/bin/env bash
set -euo pipefail
grep -q "201" src/api/auth.ts || { echo "FAIL: 注册未返回 201"; exit 1; }
grep -q "user_id" src/api/auth.ts || { echo "FAIL: 缺 user_id"; exit 1; }
echo "PASS: 注册返回 201 + user_id"
