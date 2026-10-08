#!/usr/bin/env bash
set -euo pipefail
grep -rq 'localStorage.setItem("token"' src/ && { echo "FAIL: 客户端明文存 token"; exit 1; }
echo "PASS: 无明文 token"
