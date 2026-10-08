#!/usr/bin/env bash
set -euo pipefail
grep -q "bcrypt" src/services/auth-service.ts || { echo "FAIL: 没有 bcrypt"; exit 1; }
grep -q "password: req.body.password" src/services/auth-service.ts && { echo "FAIL: 明文入库"; exit 1; }
echo "PASS: 密码 bcrypt 哈希"
