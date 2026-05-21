#!/bin/bash

# Configuration
PR_IDS="1 2 3"
SLEEP_SECONDS=300
KEEP_RUNNING=true

# Graceful shutdown handler
trap 'KEEP_RUNNING=false; echo "Shutting down PR Finalizer..."; exit 0' SIGTERM SIGINT

check_pr_approval_status() {
  local PR_ID="$1"
  echo "Checking PR #$PR_ID for approval status..."
  
  local STATUS
  STATUS=$(gh pr view "$PR_ID" --json reviewDecision -q .reviewDecision 2>/dev/null)
  local EXIT_CODE=$?
  
  if [ $EXIT_CODE -ne 0 ]; then
    echo "Error fetching PR #$PR_ID"
    return 1
  fi
  
  if [ "$STATUS" = "APPROVED" ]; then
    echo "PR #$PR_ID is APPROVED."
  fi
  return 0
}

echo "Starting PR Monitor for PRs: $PR_IDS"
while [ "$KEEP_RUNNING" = "true" ]; do
  for id in $PR_IDS; do
    check_pr_approval_status "$id"
  done
  
  echo "Sleeping for $SLEEP_SECONDS seconds..."
  sleep "$SLEEP_SECONDS" &
  wait $!
done
