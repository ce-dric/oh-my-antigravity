# OMA Autopilot & HUD Enhancements: Resolving CodeRabbit Feedback and Proposing New Features

This plan addresses all outstanding PR comments on `feature/autopilot-mode` and introduces new features inspired by `oh-my-claudecode` (OMC) and `oh-my-codex` (OMX) to improve safety and cost efficiency.

## User Review Required

> [!IMPORTANT]
> 1. **Doc Placement Policy**: We are updating `.antigravity.md` to clarify that `SKILL.md` files within `.agents/skills/` and agent specifications in the root (like `ralph.md`) are exempt from the root-level markdown placement constraint.
> 2. **Pricing Configuration**: We are introducing `.antigravity/pricing.json` as a local pricing database to avoid hardcoding prices in `usage-tracker/SKILL.md`.
> 3. **Ecomode & Sandbox Safety**: We are proposing two new skills (`ecomode` and `sandbox-check`) to align OMA with the safety and efficiency features of OMC and OMX.

## Proposed Changes

### Component 1: Resolving CodeRabbit Feedback

#### [MODIFY] [.antigravity.md](file:///Users/cedric/Library/Mobile%20Documents/com~apple~CloudDocs/oh-my-gemini/.antigravity.md)
- Clarify that root-level markdown rules only apply to user-facing or project-level documentation, and exclude operational/internal files like templates, agent specifications, and skill docs.

#### [NEW] [pricing.json](file:///Users/cedric/Library/Mobile%20Documents/com~apple~CloudDocs/oh-my-gemini/.antigravity/pricing.json)
- Create a JSON database of token pricing for different models (e.g., Gemini 1.5 Pro, Flash, Unknown) to keep rate calculations dynamic.

#### [MODIFY] [usage-tracker/SKILL.md](file:///Users/cedric/Library/Mobile%20Documents/com~apple~CloudDocs/oh-my-gemini/.agents/skills/usage-tracker/SKILL.md)
- Remove hardcoded rates. Specify extracting the model identifier from `/stats model` and querying `.antigravity/pricing.json` with an `"unknown-model"` fallback.

#### [MODIFY] [templates/scripts/scaffold.sh](file:///Users/cedric/Library/Mobile%20Documents/com~apple~CloudDocs/oh-my-gemini/templates/scripts/scaffold.sh)
- Add verification that `.agents/skills/` is non-empty before copying skills.
- Add verification that `templates/agents/` contains `.md` files.
- Add file-level checks for `.antigravity.md`, `VISION.md`, and `MEMORY.md` in `TARGET_DIR` to prevent accidental overwrites.

#### [MODIFY] [scripts/hud-watch.sh](file:///Users/cedric/Library/Mobile%20Documents/com~apple~CloudDocs/oh-my-gemini/scripts/hud-watch.sh)
- Resolve `STATE_FILE` relative to the script's directory using `BASH_SOURCE[0]`.
- Add `jq` parsing validation (`jq -e '.'`) and defaults for missing fields to avoid showing garbage output on malformed state.

#### [MODIFY] [index.js](file:///Users/cedric/Library/Mobile%20Documents/com~apple~CloudDocs/oh-my-gemini/index.js)
- Update exported version to `"0.4.0"` to match `package.json`.

#### [MODIFY] [ralph.md](file:///Users/cedric/Library/Mobile%20Documents/com~apple~CloudDocs/oh-my-gemini/ralph.md) and [templates/agents/ralph.md](file:///Users/cedric/Library/Mobile%20Documents/com~apple~CloudDocs/oh-my-gemini/templates/agents/ralph.md)
- Update "State Management" to mark `MEMORY.md` as the unique canonical source of truth for project state, while treating `.antigravity.md` as orchestration/policy.

#### [NEW] [error-patterns.md](file:///Users/cedric/Library/Mobile%20Documents/com~apple~CloudDocs/oh-my-gemini/.agents/skills/auto-fixer/references/error-patterns.md)
- Create the referenced error patterns database to resolve the broken link in `auto-fixer/SKILL.md`.

#### [MODIFY] [deep-interview/SKILL.md](file:///Users/cedric/Library/Mobile%20Documents/com~apple~CloudDocs/oh-my-gemini/.agents/skills/deep-interview/SKILL.md)
- Add `orchestration: manager: ralph` to frontmatter.
- Emphasize paths as regular italicized text instead of backticks.

#### [MODIFY] [deep-interview/templates/mini-prd.md](file:///Users/cedric/Library/Mobile%20Documents/com~apple~CloudDocs/oh-my-gemini/.agents/skills/deep-interview/templates/mini-prd.md)
- Convert the hardcoded PRD content into a neutral, reusable template with placeholders like `{{PROJECT_NAME}}`.

#### [MOVE] [architectural-patterns.md](file:///Users/cedric/Library/Mobile%20Documents/com~apple~CloudDocs/oh-my-gemini/architectural-patterns.md) (from `.agents/skills/repo-mapper/references/patterns.md`)
- Move patterns file to root and adjust rule text to make line-limit recommendations language-aware.

#### [MOVE] [structure-map.md](file:///Users/cedric/Library/Mobile%20Documents/com~apple~CloudDocs/oh-my-gemini/structure-map.md) (from `.agents/skills/repo-mapper/templates/structure-map.md`)
- Move structure template to root to satisfy doc placement guidelines.

#### [MODIFY] [repo-mapper/SKILL.md](file:///Users/cedric/Library/Mobile%20Documents/com~apple~CloudDocs/oh-my-gemini/.agents/skills/repo-mapper/SKILL.md)
- Normalize manager identifier casing to `ralph`.
- Update references to point to the new root locations of `architectural-patterns.md` and `structure-map.md`.

---

### Component 2: OMC & OMX-Inspired New Features

We propose implementing the following new skills to improve efficiency and safety:

#### [NEW] [ecomode/SKILL.md](file:///Users/cedric/Library/Mobile%20Documents/com~apple~CloudDocs/oh-my-gemini/.agents/skills/ecomode/SKILL.md)
- Introduce **Eco Mode (Ecomode)**:
  - Adds `Ecomode: ON/OFF` parameter in `MEMORY.md`.
  - When enabled, Ralph and sub-agents skip generating detailed summaries, restrict file view limits to a maximum of 200 lines, use shorter planning cycles, and optimize context to save token costs.

#### [NEW] [sandbox-check/SKILL.md](file:///Users/cedric/Library/Mobile%20Documents/com~apple~CloudDocs/oh-my-gemini/.agents/skills/sandbox-check/SKILL.md)
- Introduce **Sandbox Safety Checker**:
  - Run prior to enabling Autopilot or executing commands in YOLO mode.
  - Checks if the script is running inside a Docker container, GitHub Codespaces, or other virtual environments (e.g., checking `/proc/self/cgroup`, checking environment variables like `CODESPACES=true` or `.dockerenv`).
  - Warns the user and requests explicit permission if running directly on host mac/Windows/Linux environments.

---

## Verification Plan

### Automated Tests
- Run `templates/scripts/scaffold.sh` in a temporary test directory within the workspace to verify it executes safely without errors or overwrites.

### Manual Verification
- Run `scripts/hud-watch.sh` to ensure the HUD updates correctly without rendering errors.
- Inspect the modified `deep-interview/templates/mini-prd.md` and root markdown files to confirm correct formatting and paths.
