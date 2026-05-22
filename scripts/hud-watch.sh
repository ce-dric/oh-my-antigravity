#!/bin/bash
# OMA HUD Monitor Script
# Dependencies: jq

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STATE_FILE="$SCRIPT_DIR/../.antigravity/hud_state.json"

if ! command -v jq &> /dev/null; then
    echo "Error: jq is not installed. Please install it to use the HUD."
    exit 1
fi

# Parsing arguments
PRESET="focused"
WATCH=false
JSON=false

for arg in "$@"; do
    case $arg in
        --watch|-w)
            WATCH=true
            ;;
        --json)
            JSON=true
            ;;
        --preset=*)
            PRESET="${arg#*=}"
            ;;
        *)
            ;;
    esac
done

if [ "$JSON" = true ]; then
    if [ -f "$STATE_FILE" ]; then
        cat "$STATE_FILE"
    else
        echo "{}"
    fi
    exit 0
fi

# ANSI Colors
BOLD="\033[1m"
GREEN="\033[32m"
YELLOW="\033[33m"
CYAN="\033[36m"
DIM="\033[2m"
RESET="\033[0m"

render_once() {
    if [ ! -f "$STATE_FILE" ]; then
        echo -e "${BOLD}[OMA]${RESET} ${DIM}Waiting for HUD state file...${RESET}"
        return
    fi

    # Validate JSON state file
    if ! jq -e '.' "$STATE_FILE" >/dev/null 2>&1; then
        echo -e "${BOLD}[OMA]${RESET} ${YELLOW}⚠️ Warning: HUD state file is malformed or invalid JSON. Retrying...${RESET}"
        return
    fi

    # Read state with default fallback logic
    AGENT=$(jq -r '.status.active_agent // "unknown"' "$STATE_FILE")
    PHASE=$(jq -r '.status.phase // "UNKNOWN"' "$STATE_FILE")
    IN=$(jq -r '.tokens.input // 0' "$STATE_FILE")
    OUT=$(jq -r '.tokens.output // 0' "$STATE_FILE")
    TOTAL=$(jq -r '.tokens.total // 0' "$STATE_FILE")
    COST=$(jq -r '.cost.session_usd // 0.0' "$STATE_FILE")
    RESET_MIN=$(jq -r '.tokens.limit_reset_minutes // 0' "$STATE_FILE")
    AUTO=$(jq -r '.status.autopilot // false' "$STATE_FILE")
    LAST_UPDATE=$(jq -r '.status.last_update // ""' "$STATE_FILE")

    # Replace null output strings from jq
    [ "$AGENT" = "null" ] && AGENT="unknown"
    [ "$PHASE" = "null" ] && PHASE="UNKNOWN"
    [ "$IN" = "null" ] && IN=0
    [ "$OUT" = "null" ] && OUT=0
    [ "$TOTAL" = "null" ] && TOTAL=0
    [ "$COST" = "null" ] && COST="0.0"
    [ "$RESET_MIN" = "null" ] && RESET_MIN=0
    [ "$AUTO" = "null" ] && AUTO="false"
    [ "$LAST_UPDATE" = "null" ] && LAST_UPDATE=""

    # Git details
    REPO_NAME=$(basename "$(git -C "$SCRIPT_DIR" rev-parse --show-toplevel 2>/dev/null || echo "oh-my-antigravity")")
    BRANCH_NAME=$(git -C "$SCRIPT_DIR" rev-parse --abbrev-ref HEAD 2>/dev/null || echo "main")
    GIT_LABEL="${REPO_NAME}/${BRANCH_NAME}"

    VERSION=$(jq -r '.version // "0.4.0"' "$SCRIPT_DIR/../package.json" 2>/dev/null || echo "0.4.0")
    PREFIX="${BOLD}[OMA#${VERSION}]${RESET}"

    # Format tokens
    TOTAL_K=$(awk "BEGIN {printf \"%.1fk\", $TOTAL/1000}")
    IN_K=$(awk "BEGIN {printf \"%.1fk\", $IN/1000}")
    OUT_K=$(awk "BEGIN {printf \"%.1fk\", $OUT/1000}")

    # Active status coloring
    STATUS_COLOR="${CYAN}"
    if [ "$PHASE" = "FAILED" ]; then
        STATUS_COLOR="${YELLOW}"
    elif [ "$PHASE" = "COMPLETED" ]; then
        STATUS_COLOR="${GREEN}"
    fi
    RALPH_LABEL="${STATUS_COLOR}${AGENT}:${PHASE}${RESET}"
    AUTO_LABEL="${CYAN}autopilot:${AUTO}${RESET}"

    # Calculate last activity
    if [ -n "$LAST_UPDATE" ]; then
        CURRENT_EPOCH=$(date +%s)
        LAST_EPOCH=""
        if date -j -f "%Y-%m-%d %H:%M:%S" "$LAST_UPDATE" +%s >/dev/null 2>&1; then
            LAST_EPOCH=$(date -j -f "%Y-%m-%d %H:%M:%S" "$LAST_UPDATE" +%s)
        elif date -d "$LAST_UPDATE" +%s >/dev/null 2>&1; then
            LAST_EPOCH=$(date -d "$LAST_UPDATE" +%s)
        fi

        if [ -n "$LAST_EPOCH" ]; then
            DIFF=$((CURRENT_EPOCH - LAST_EPOCH))
            if [ $DIFF -lt 0 ]; then DIFF=0; fi
            if [ $DIFF -lt 60 ]; then
                LAST_LABEL="${DIM}last:${DIFF}s ago${RESET}"
            elif [ $DIFF -lt 3600 ]; then
                LAST_LABEL="${DIM}last:$((DIFF / 60))m ago${RESET}"
            else
                LAST_LABEL="${DIM}last:$((DIFF / 3600))h ago${RESET}"
            fi
        else
            LAST_LABEL="${DIM}last:${LAST_UPDATE}${RESET}"
        fi
    else
        LAST_LABEL="${DIM}last:never${RESET}"
    fi

    # Render based on preset
    case "$PRESET" in
        minimal)
            echo -e "${PREFIX} ${GIT_LABEL} | ${RALPH_LABEL} | ${DIM}tokens:${TOTAL_K}${RESET}"
            ;;
        full)
            echo -e "${PREFIX} ${GIT_LABEL} | ${RALPH_LABEL} | ${AUTO_LABEL} | ${GREEN}cost:\$${COST}${RESET} | ${DIM}tokens:${IN_K}/${OUT_K} (total:${TOTAL_K})${RESET} | ${DIM}reset:${RESET_MIN}m${RESET} | ${DIM}last:${LAST_UPDATE}${RESET}"
            ;;
        focused|*)
            echo -e "${PREFIX} ${GIT_LABEL} | ${RALPH_LABEL} | ${AUTO_LABEL} | ${GREEN}cost:\$${COST}${RESET} | ${DIM}tokens:${TOTAL_K}${RESET} | ${DIM}reset:${RESET_MIN}m${RESET} | ${LAST_LABEL}"
            ;;
    esac
}

if [ "$WATCH" = true ]; then
    clear
    while true; do
        clear
        render_once
        echo -e "\nPress Ctrl+C to exit."
        sleep 2
    done
else
    render_once
fi
