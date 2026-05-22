---
name: hud
description: A specialized skill for displaying the current state and progress of the OMA Orchestration team.
orchestration:
  manager: ralph
---

# Skill: Orchestration HUD

This skill provides a **native visual status report** using the Antigravity CLI's `update_topic` tool and synchronizes with the optional background monitor.

## Instructions

When activated, you must:

1.  **Read Config:** Check `MEMORY.md` to ensure `HUD: ON`.
2.  **Update State:** Update `.antigravity/hud_state.json` with the current phase and active agent using `jq`.
3.  **Visual Update (Native):** Call the built-in `update_topic` tool. Use the **HUD Template** below for the `summary` parameter. This ensures a persistent, live dashboard experience directly within the CLI.
4.  **Log Milestones:** Update `MEMORY.md` status section with the transition.

## HUD Template
```markdown
┌───────────────────────────────────────────────────────────┐
│ OMA ORCHESTRATION HUD | PHASE: {{phase}} | AGENT: {{agent}} │
├───────────────────────┬───────────────────────────────────┤
│ TOKENS: IN: {{in}}    │ OUT: {{out}}   │ TOTAL: {{total}} │
│ COST: ${{cost}}       │ RESET: {{reset}}m │ AUTO: {{auto}}   │
└───────────────────────┴───────────────────────────────────┘
```
*(Note: Replace placeholders with real values from .antigravity/hud_state.json)*

## Orchestration
This skill is the **official visual interface** for OMA. It is invoked by **Ralph** at every major state change.
