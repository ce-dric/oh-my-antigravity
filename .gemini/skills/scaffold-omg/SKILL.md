---
name: scaffold-omg
description: A skill to automatically set up the oh-my-gemini (OMG) infrastructure in a new or existing repository.
orchestration:
  manager: ralph
---

# Skill: Scaffold OMG

This skill automates the setup process for the OMG framework. It must be coordinated by the Ralph manager agent as part of the OMG Orchestration Model.

## Instructions

When activated, you must:

1.  **Detect Environment:** Identify the target project path.
2.  **Execute Scaffolding:** Run the helper script located at `templates/scripts/scaffold.sh [target_path]`.
3.  **Customize:** After the script runs, customize the generated `GEMINI.md` and `VISION.md` to match the target project's specific context.

## Orchestration
All setup tasks must be coordinated by Ralph. Other agents should execute delegated tasks only through Ralph-managed plans.
