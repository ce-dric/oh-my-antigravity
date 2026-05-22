#!/bin/bash
# OMA HUD Monitor Script
# Dependencies: jq

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STATE_FILE="$SCRIPT_DIR/../.antigravity/hud_state.json"

if ! command -v jq &> /dev/null; then
    echo "Error: jq is not installed. Please install it to use the HUD."
    exit 1
fi

clear
while true; do
    if [ ! -f "$STATE_FILE" ]; then
        echo "Waiting for HUD state file..."
        sleep 2
        continue
    fi

    # Validate JSON state file
    if ! jq -e '.' "$STATE_FILE" >/dev/null 2>&1; then
        echo "⚠️ Warning: HUD state file is malformed or invalid JSON. Retrying..."
        sleep 2
        continue
    fi

    # Read state with default fallback logic
    AGENT=$(jq -r '.status.active_agent // "unknown"' "$STATE_FILE")
    PHASE=$(jq -r '.status.phase // "UNKNOWN"' "$STATE_FILE")
    IN=$(jq -r '.tokens.input // 0' "$STATE_FILE")
    OUT=$(jq -r '.tokens.output // 0' "$STATE_FILE")
    TOTAL=$(jq -r '.tokens.total // 0' "$STATE_FILE")
    COST=$(jq -r '.cost.session_usd // 0.0' "$STATE_FILE")
    RESET=$(jq -r '.tokens.limit_reset_minutes // 0' "$STATE_FILE")
    AUTO=$(jq -r '.status.autopilot // false' "$STATE_FILE")
    LAST=$(jq -r '.status.last_update // "never"' "$STATE_FILE")

    # Replace null output strings from jq
    [ "$AGENT" = "null" ] && AGENT="unknown"
    [ "$PHASE" = "null" ] && PHASE="UNKNOWN"
    [ "$IN" = "null" ] && IN=0
    [ "$OUT" = "null" ] && OUT=0
    [ "$TOTAL" = "null" ] && TOTAL=0
    [ "$COST" = "null" ] && COST="0.0"
    [ "$RESET" = "null" ] && RESET=0
    [ "$AUTO" = "null" ] && AUTO="false"
    [ "$LAST" = "null" ] && LAST="never"

    clear
    echo "┌───────────────────────────────────────────────────────────┐"
    echo "│ OMA ORCHESTRATION HUD | PHASE: $PHASE | AGENT: $AGENT │"
    echo "├───────────────────────┬───────────────────────────────────┤"
    echo "│ TOKENS: IN: $IN    │ OUT: $OUT   │ TOTAL: $TOTAL │"
    echo "│ COST: \$$COST       │ RESET: ${RESET}m │ AUTO: $AUTO   │"
    echo "├───────────────────────┴───────────────────────────────────┤"
    echo "│ LAST UPDATE: $LAST                         │"
    echo "└───────────────────────────────────────────────────────────┘"
    echo "Press Ctrl+C to exit."
    
    sleep 2
done
