---
name: scaffold-omg
description: A skill to automatically set up the oh-my-gemini (OMG) infrastructure in a new or existing repository.
---

# Skill: Scaffold OMG

This skill automates the setup process for the OMG framework, ensuring that any repository can quickly adopt the "Team Gemini" workflow.

## Instructions

When activated, you must:

1.  **Detect Environment:** Identify the project type (Node, Python, Go, etc.) and current git status.
2.  **Initialize Folders:** Create `.gemini/agents/` and `.gemini/skills/` directories.
3.  **Deploy Core Agents:** Copy the standard `ralph.md`, `architect.md`, `developer.md`, and `verifier.md` templates into the project.
4.  **Setup Instructions:** Create a customized `GEMINI.md` based on the project's tech stack.
5.  **Initialize Memory:** Create the initial `MEMORY.md` and `VISION.md` files.

## Templates Location
-   `templates/agents/*.md`
-   `templates/docs/*.md`
-   `templates/skills/deep-interview/`
