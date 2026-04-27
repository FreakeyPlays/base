#!/bin/bash

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command')

BLOCKED_TOOLS=(npm yarn pnpm)

for tool in "${BLOCKED_TOOLS[@]}"; do
  if echo "$COMMAND" | grep -qE "(^|[[:space:]]|[;&|()])$tool([[:space:]]|$)"; then
    jq -n '{
      decision: "block",
      reason: "Using '$tool' is forbidden, use bun instead."
    }'
    exit 2
  fi
done

exit 0
