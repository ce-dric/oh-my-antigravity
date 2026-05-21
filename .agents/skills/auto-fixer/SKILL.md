---
name: auto-fixer
description: A specialized skill for automatically diagnosing and resolving lint errors, type errors, and test failures.
orchestration:
  manager: ralph
---

# Skill: Auto-Fixer

This skill automates the "Fix-Verify" loop, allowing the team to resolve technical errors without manual intervention.

## Instructions

When activated, you must:

1.  **Diagnose Error:** Analyze terminal output (stdout/stderr) to identify the exact cause of the failure.
2.  **Locate Source:** Pinpoint the file and line number responsible for the error.
3.  **Propose Fix:** Generate a surgical fix based on common resolution patterns.
4.  **Verify Resolution:** Run the relevant command (e.g., `npm run lint`, `tsc`, `pytest`) to confirm the fix.
5.  **Iterate:** If the error persists or a new one appears, repeat the cycle until the command exits with code 0.

## Resources
- **references/error-patterns.md**: Common errors and their typical resolutions.
- **templates/fix-report.md**: A template for reporting the resolution steps.

## Orchestration
This skill is primarily used by the **Developer** and **Verifier** under the guidance of **Ralph**.
