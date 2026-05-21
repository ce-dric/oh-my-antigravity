---
name: usage-tracker
description: A specialized skill for tracking and reporting token usage and session costs.
orchestration:
  manager: ralph
---

# Skill: Usage Tracker

This skill monitors the token consumption of the "Team Gemini" session to ensure resource transparency.

## Instructions

When activated, you must:

1.  **Retrieve Stats:** Execute the `/stats model` command to get the current session's token usage.
2.  **Parse Usage:** Extract `Input Tokens`, `Output Tokens`, and `Total Tokens`.
3.  **Update HUD:** Feed these numbers into the `hud` skill to update the visual report.
4.  **Log to Memory:** Append the cumulative usage to `MEMORY.md` under a dedicated "Usage History" section.
5.  **Cost Estimation (Optional):** Based on current Gemini pricing models, provide a rough estimate of the session cost if requested.

## Orchestration
This skill is invoked by **Ralph** after each major task completion or sub-agent return.
