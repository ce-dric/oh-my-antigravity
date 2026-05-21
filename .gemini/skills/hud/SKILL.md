---
name: hud
description: A specialized skill for displaying the current state and progress of the OMG Orchestration team.
orchestration:
  manager: ralph
---

# Skill: Orchestration HUD

This skill provides a visual status report of the entire "Team Gemini" development lifecycle.

## Instructions

When activated, you must:

1.  **Read Current State:** Identify the active phase (Interview, Research, Sprint, Audit) and the currently active sub-agent.
2.  **Generate HUD Report:** Use `templates/hud-report.md` to create a structured visual summary.
3.  **Update Topic:** Call `update_topic` with the generated summary to ensure the user sees the latest status in the CLI.
4.  **Log Milestones:** Record the completion of key tasks (e.g., "Architect completed blueprint") in the `MEMORY.md` under the Status section.

## Resources
- **templates/hud-report.md**: The visual layout for the HUD.

## Orchestration
This skill is used by **Ralph** to provide high-signal updates to the user during long-running tasks.
