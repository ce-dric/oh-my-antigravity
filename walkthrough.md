# Walkthrough - OMA Autopilot & HUD Enhancements

This walkthrough summarizes the changes implemented to address all CodeRabbit PR reviews and establish new feature parity with OMC/OMX.

## Changes Made

### 1. CodeRabbit Review Resolutions
- **Doc Placement Policy Clarification**: Updated `.antigravity.md` and the template `templates/docs/GEMINI.md` to specify that operational/internal markdown files (agent specs, templates, and skill specs) are exempt from the root-level markdown restriction.
- **Dynamic pricing lookup**: Created `.antigravity/pricing.json` storing input/output rates per token for different models. Updated `usage-tracker/SKILL.md` to extract the model identifier from `/stats model` and query `pricing.json` with an `unknown-model` fallback.
- **Folder and Overwrite guards**: Enhanced `templates/scripts/scaffold.sh` to check for pre-existing configuration files (`.antigravity.md`, `VISION.md`, `MEMORY.md`) and directory presence before copying. Added glob existence guards for agent markdown files.
- **HUD Watcher Robustness**: Updated `scripts/hud-watch.sh` to resolve the `STATE_FILE` path relative to the script location, validate state with `jq`, and default any null/missing keys to safe fallbacks.
- **Version alignment**: Verified exported metadata in `index.js` matches `0.4.0` defined in `package.json`.
- **State Management definition**: Clarified in `ralph.md` and template `templates/agents/ralph.md` that `MEMORY.md` is the canonical source of truth for project state, while `.antigravity.md` acts as orchestration/policy.
- **Error patterns references**: Created `.agents/skills/auto-fixer/references/error-patterns.md` to fix the broken link in the `auto-fixer` skill.
- **Deep Interview formatting**: Normalized YAML frontmatter for `deep-interview` to specify `orchestration: manager: ralph` and updated relative paths to plain prose.
- **Reusable Mini-PRD**: Converted `deep-interview/templates/mini-prd.md` to a neutral, placeholder-based template, saving the original content as `mini-prd-example.md`.
- **Markdown placement alignment**:
  - Moved `.agents/skills/repo-mapper/references/patterns.md` to root as `architectural-patterns.md`, adjusting line-limit policies to be language and responsibility-aware.
  - Moved `.agents/skills/repo-mapper/templates/structure-map.md` to root as `structure-map.md`.
  - Updated `repo-mapper/SKILL.md` links and frontmatter casing.

### 2. OMC & OMX-Inspired New Features
- **Eco Mode (`ecomode` skill)**: Adds a token-saving directive that tells OMA agents to abbreviate prompts, restrict file reading limits to 200 lines, and reduce summaries when `Ecomode: ON` is configured in `MEMORY.md`.
- **Sandbox Safety Checker (`sandbox-check` skill)**: Automates checks for Docker containers, virtual environments, or GitHub Codespaces prior to running raw shell commands to prevent damage on host operating systems.

---

## Verification Results

### 1. Scaffolding Script Test
Ran scaffold validation check using a temporary directory:
```bash
bash templates/scripts/scaffold.sh test_scaffold
```
- First run: Deployed directory structures, copied agents and skills successfully.
- Second run: Correctly identified existing folders/files and aborted execution.

### 2. HUD State JSON Validation
Ran:
```bash
jq -e '.' .antigravity/hud_state.json
```
- Successfully returned standard JSON structure.
- Verification script `scripts/hud-watch.sh` passed shell syntax checks (`bash -n`).
