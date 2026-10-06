#!/bin/bash
# PreToolUse hook — deny edits to generated / frozen paths.
# Register in .claude/settings.json (or managed settings):
#   {"hooks":{"PreToolUse":[{"matcher":"Edit|Write",
#     "hooks":[{"type":"command","command":"${CLAUDE_PROJECT_DIR}/.claude/hooks/protected-paths.sh"}]}]}}
path=$(jq -r '.tool_input.file_path' < /dev/stdin)
case "$path" in
  */src/gen/*|*/internal/gen/*|*/v1/*|*/legacy/*)
    # A block MUST explain itself and name the route to approval.
    echo "Blocked: $path is generated or frozen and must not be hand-edited." >&2
    echo "Route: edit schemas/ and run 'make generate'." >&2
    echo "Exception: #platform-<team> owns this path and can approve one." >&2
    exit 2   # 2 = block the action; stdout/stderr goes to Claude
    ;;
esac
exit 0
