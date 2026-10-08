#!/usr/bin/env bash
set -euo pipefail
grep -q "error.*code.*message" src/api/auth.ts || { echo "FAIL: 错误格式不对"; exit 1; }
echo "PASS: 错误格式统一"
