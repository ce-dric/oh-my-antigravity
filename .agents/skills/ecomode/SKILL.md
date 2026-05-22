---
name: ecomode
description: Specialized skill for reducing token consumption and session cost in OMA development cycles.
orchestration:
  manager: ralph
---

# Skill: Eco Mode (Ecomode)

This skill optimizes the token footprint of the active OMA session. When `Ecomode: ON` is configured in `MEMORY.md`, Ralph and the sub-agents must adhere to token-saving practices to minimize costs.

## Instructions

When Eco Mode is active, you must:

1.  **Check Configuration:** Verify if `Ecomode: ON` is defined in `MEMORY.md`. If it is `OFF`, resume standard operational fidelity.
2.  **Abbreviate Prompts:** Skip long conversational preambles or verbose explanations. Use highly condensed instructions for sub-agents.
3.  **Restrict File Reading:** Limit file viewing to a maximum of 200 lines around the target edits. Avoid viewing entire files unless absolutely necessary.
4.  **Shorten Summaries:** Replace long markdown summaries or detailed post-mortems with one-sentence status logs in `MEMORY.md`.
5.  **Context Truncation:** Proactively clean up conversation history and keep context compact.
