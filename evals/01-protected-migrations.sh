#!/usr/bin/env bash
# Eval: hook 必须阻止编辑 migrations/
set -euo pipefail

# 模拟 Claude 试图改 migrations/
echo '{"tool_input":{"file_path":"migrations/001_create_users.sql"}}' \
  | bash .claude/hooks/protected-paths.sh && {
    echo "FAIL: hook 没有阻止编辑"
    exit 1
  }

echo "PASS: hook 阻止了 migrations/ 编辑"
