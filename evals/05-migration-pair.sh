#!/usr/bin/env bash
set -euo pipefail
grep -qi "up" migrations/001_create_users.sql || { echo "FAIL: 缺 up"; exit 1; }
grep -qi "down" migrations/001_create_users.sql || { echo "FAIL: 缺 down"; exit 1; }
echo "PASS: 迁移含 up/down"
