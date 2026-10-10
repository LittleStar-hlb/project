#!/usr/bin/env bash
set -euo pipefail

input="$(cat)"

# 检查输入中是否包含生产部署命令
if [[ "$input" == *"deploy:prod"* || "$input" == *"deploy production"* || "$input" == *"kubectl apply -f prod"* || "$input" == *"terraform apply -auto-approve prod"* || "$input" == *"npm run deploy:prod"* ]]; then
  # 检查是否有授权
  if [[ "$input" == *"RELEASE_APPROVED_BY="* ]]; then
    exit 0
  fi

  cat >&2 <<'EOF'
BLOCKED: Production deploy requires named release authorisation.

WHAT WAS BLOCKED:
  A command that deploys to production.

WHY:
  Production releases must be approved by a named human authority.
  Unattended or AI-initiated production deploys are not allowed.

HOW TO GET APPROVAL:
  Add RELEASE_APPROVED_BY=<your-name> to the deploy command, after obtaining
  approval from the Release Manager (@release-manager) in #release-approvals
  (Slack) or via RFC-456. The approval must be recorded before the deploy runs.
EOF
  exit 2
fi

exit 0
