---
name: usage-tracker
description: A specialized skill for tracking and reporting token usage and session costs.
orchestration:
  manager: ralph
---

# Skill: Usage Tracker

This skill monitors the token consumption of the "Team Antigravity" session and updates the HUD state.

## Instructions

When activated, you must:

1.  **Retrieve Stats:** Execute the `/stats model` command to get the current session's token usage.
2.  **Calculate Costs:**
    - Use pricing information provided in the `/stats model` output (dynamic pricing) to calculate current session costs.
    - If prices are unavailable, use current Gemini 1.5 Pro standard rates.
3.  **Update State:** Use `jq` to update `.antigravity/hud_state.json`:
    - `tokens.input`, `tokens.output`, `tokens.total`
    - `cost.session_usd`
    - `status.last_update` (Current timestamp)
4.  **Log to Memory:** Append usage to `MEMORY.md`.

## Orchestration
This skill is invoked by **Ralph** after each major task completion or sub-agent return.
