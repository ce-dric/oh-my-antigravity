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
    - Extract the model name from `/stats model` response (e.g., the returned model name).
    - Query `.antigravity/pricing.json` to lookup the corresponding `input_cost_per_token` and `output_cost_per_token` rates.
    - If the model is not found in the pricing file, fall back to the rates specified under the `"unknown-model"` key.
    - Multiply input/output token counts by their respective rates to calculate `cost.session_usd`.
3.  **Update State:** Use `jq` to update `.antigravity/hud_state.json`:
    - `tokens.input`, `tokens.output`, `tokens.total`
    - `cost.session_usd`
    - `status.last_update` (Current timestamp)
4.  **Log to Memory:** Append usage to `MEMORY.md`.

## Orchestration
This skill is invoked by **Ralph** after each major task completion or sub-agent return.
