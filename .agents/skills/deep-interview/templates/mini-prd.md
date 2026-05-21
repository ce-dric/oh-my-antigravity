# Mini-PRD: OMA Core Enhancements (HUD & Autopilot)

## 1. Executive Summary
- **Goal:** Port core features from OMC/OMX (`hud`, `autopilot`) to the OMA framework as native Antigravity Skills.
- **Stakeholders:** Users wanting professional, persistent, and visually monitored AI orchestration.
- **Priority:** P0 (Core parity mandate)

## 2. Functional Requirements
- **FR1: Token Usage HUD:** A skill that tracks input/output tokens, estimates costs, and identifies token limit reset times (based on model-specific tiers).
- **FR2: Live Orchestration HUD:** A visual interface showing current agent status, phase, and progress. If native CLI visualization is insufficient, it should utilize `tmux` (macOS/Linux) or a similar multiplexer for a "live dashboard" feel.
- **FR3: Autopilot Mode:** A persistent loop managed by the `Ralph` agent that automatically transitions between Research, Strategy, Implementation, and Validation until the task is complete.
- **FR4: Structured Responses:** Standardized output templates for each agent to ensure consistency and readability (more structured than vanilla CLI).

## 3. Technical Constraints
- **Tech Stack:** Bash, Markdown, Antigravity CLI Sub-agents & Skills.
- **Dependencies:** `tmux` (optional but recommended for visual HUD), `git`.
- **Architecture:** Multi-agent orchestration (Ralph as Manager). HUD data should be persisted in `.antigravity/hud_state.json` or similar for real-time updates.

## 4. Definition of Done (DoD)
- [ ] `usage-tracker` updated to include reset time and cost estimation.
- [ ] `hud` updated to support visual status reporting (Phase/Agent/Usage).
- [ ] `Ralph` logic updated to support a "no-interruption" autopilot loop.
- [ ] `verifier` confirms behavioral correctness of the new skills.
- [ ] Documentation (README/.antigravity.md) updated with usage instructions.
