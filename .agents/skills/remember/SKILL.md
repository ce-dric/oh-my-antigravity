---
name: remember
description: Ralph-focused skill for updating MEMORY.md and syncing state to HUD.
orchestration:
  agent: ralph
---

# Skill: Remember

This skill ensures project persistence by maintaining the source of truth and syncing it with the visual HUD.

## Instructions

1.  **Update MEMORY.md:** Reflect the latest changes, current phase, and next steps in `MEMORY.md`.
2.  **Update HUD State:** Sync the internal state to `.antigravity/hud_state.json` using `jq`.
3.  **Persistence:** Ensure all critical decisions and context are captured for future sessions.

## HUD Sync Logic
Use `jq` to update `.antigravity/hud_state.json`. Example command:
```bash
jq '.current_phase = "Implementation" | .last_update = "'"$(date)"'"' .antigravity/hud_state.json > .antigravity/hud_state.json.tmp && mv .antigravity/hud_state.json.tmp .antigravity/hud_state.json
```
