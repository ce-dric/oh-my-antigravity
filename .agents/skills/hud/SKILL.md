---
name: hud
description: A specialized skill for displaying the current state and progress of the OMA Orchestration team.
orchestration:
  manager: ralph
---

# Skill: Orchestration HUD

The OMA HUD uses a two-layer architecture matching `oh-my-claudecode` (OMC) and `oh-my-codex` (OMX):

1. **Layer 1 - Antigravity built-in statusLine**: Real-time TUI footer or status line. Configured via the `update_topic` tool to show OMA-specific orchestration state.
2. **Layer 2 - `scripts/hud-watch.sh` command**: Live-updating terminal display reading `.antigravity/hud_state.json`.

## Quick Commands

| Command | Description |
|---------|-------------|
| `./scripts/hud-watch.sh` | Show current HUD once (modes, tokens, activity) |
| `./scripts/hud-watch.sh --watch` | Live-updating display (polls every 2s) |
| `./scripts/hud-watch.sh --json` | Raw state output for scripting |
| `./scripts/hud-watch.sh --preset=minimal` | Minimal display |
| `./scripts/hud-watch.sh --preset=focused` | Default display |
| `./scripts/hud-watch.sh --preset=full` | All elements |

## Presets

### minimal
`[OMA#0.4.0] oh-my-gemini/main | ralph:COMPLETED | tokens:59.5k`

### focused (default)
`[OMA#0.4.0] oh-my-gemini/main | ralph:COMPLETED | autopilot:false | cost:$0.235 | tokens:59.5k | reset:10m | last:5s ago`

### full
`[OMA#0.4.0] oh-my-gemini/main | ralph:COMPLETED | autopilot:false | cost:$0.235 | tokens:55.8k/3.6k (total:59.5k) | reset:10m | last:2026-05-22 18:41:00`

## Instructions

When activated, you must:

1.  **Read Config:** Check `MEMORY.md` to ensure `HUD: ON`.
2.  **Update State:** Update `.antigravity/hud_state.json` with the current phase and active agent using `jq`.
3.  **Visual Update (Native):** Call the built-in `update_topic` tool. Use the **focused** single-line format as the `summary` parameter to provide a persistent statusbar directly in the CLI UI.
4.  **Log Milestones:** Update `MEMORY.md` status section with the transition.
