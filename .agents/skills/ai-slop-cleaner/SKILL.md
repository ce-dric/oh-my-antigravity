---
name: ai-slop-cleaner
description: Developer-focused skill for removing AI-generated bloat and ensuring code conciseness while maintaining behavioral integrity.
orchestration:
  agent: [developer, verifier]
---

# Skill: AI Slop Cleaner

This skill enables the Developer and Verifier to identify and remove redundant, verbose, or "hallucinated" code patterns often introduced by LLMs, ensuring the codebase remains lean and maintainable.

## Instructions

1.  **Identify Bloat:** Look for repetitive comments, over-engineered logic, or redundant checks that don't add value.
2.  **Surgical Removal:** Delete unnecessary code without affecting the core functionality.
3.  **Behavioral Integrity:** Ensure that the removal of code does not alter the intended behavior of the system.
4.  **Mandatory Regression Checks:** After cleaning, verify the code to ensure no functional regressions were introduced.
5.  **Refactor for Conciseness:** Replace verbose LLM-typical patterns with idiomatic and concise alternatives.

## Execution Guardrail
Never delete code that is part of a required verification loop or safety check. Always prioritize correctness over brevity.
