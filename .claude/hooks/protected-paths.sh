#!/bin/bash
# PreToolUse hook — deny edits to generated / frozen paths.
# Register in .claude/settings.json:
#   {"hooks":{"PreToolUse":[{"matcher":"Edit|Write",
#     "hooks":[{"type":"command","command":"${CLAUDE_PROJECT_DIR}/.claude/hooks/protected-paths.sh"}]}]}}

input="$(cat)"

# 不依赖 jq，从 JSON 里抓 file_path
path=$(printf '%s' "$input" \
  | grep -o '"file_path"[[:space:]]*:[[:space:]]*"[^"]*"' \
  | sed 's/.*"file_path"[[:space:]]*:[[:space:]]*"\([^"]*\)"/\1/')

case "$path" in
  */migrations/*|migrations/*|*/src/gen/*|*/internal/gen/*|*/v1/*|*/legacy/*)
    echo "Blocked: $path is generated or frozen and must not be hand-edited." >&2
    echo "Route: edit schemas/ and run 'make generate', or open a migration PR." >&2
    echo "Exception: DBA team (#db-approvals) owns migrations and can approve one." >&2
    exit 2
    ;;
esac
exit 0
