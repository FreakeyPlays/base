#!/bin/bash

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // ""')
FILENAME=$(basename "$FILE_PATH")

if [[ "$FILENAME" == "eslint.config.js" ]]; then
  jq -n '{
    decision: "block",
    reason: "Modifying eslint.config.mjs is forbidden.

    If you believe a rule makes your task impossible,
    report this to the user and explain why."
  }'
  exit 0
fi
echo '{"decision": "approve"}'
