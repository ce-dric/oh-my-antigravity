#!/bin/bash
# OMA HUD Monitor Script
# Dependencies: jq

STATE_FILE=".antigravity/hud_state.json"

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

    # Read state
    AGENT=$(jq -r '.status.active_agent' "$STATE_FILE")
    PHASE=$(jq -r '.status.phase' "$STATE_FILE")
    IN=$(jq -r '.tokens.input' "$STATE_FILE")
    OUT=$(jq -r '.tokens.output' "$STATE_FILE")
    TOTAL=$(jq -r '.tokens.total' "$STATE_FILE")
    COST=$(jq -r '.cost.session_usd' "$STATE_FILE")
    RESET=$(jq -r '.tokens.limit_reset_minutes' "$STATE_FILE")
    AUTO=$(jq -r '.status.autopilot' "$STATE_FILE")
    LAST=$(jq -r '.status.last_update' "$STATE_FILE")

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
