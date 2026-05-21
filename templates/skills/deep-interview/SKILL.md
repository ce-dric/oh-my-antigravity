---
name: deep-interview
description: A specialized skill for gathering and clarifying requirements through Socratic questioning.
---

# Skill: Deep Interview

This skill is designed to prevent "context drift" and "assumption failure" by forcing a rigorous clarification phase before any code is written.

## Instructions

When activated, you must:

1.  **Analyze Intent:** Identify the core goal of the user's request.
2.  **Identify Ambiguities:** Look for missing technical details (e.g., error handling, edge cases, tech stack preferences, performance requirements).
3.  **Ask Targeted Questions:** Present a concise list of 3-5 high-impact questions to the user.
4.  **Draft a PRD:** Once questions are answered, synthesize the information into a brief "Mini-PRD" that the `architect` can use as a blueprint.

## Resources

-   **references/questions.md:** A catalog of common clarification questions for different domains (API, UI, DevOps).
-   **templates/mini-prd.md:** A template for the synthesized requirement document.
