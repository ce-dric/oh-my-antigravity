---
name: plan
description: Architect-focused skill for generating surgical execution plans.
orchestration:
  agent: architect
---

# Skill: Plan

This skill enables the Architect to decompose high-level requirements into a series of surgical, atomic implementation steps.

## Instructions

1.  **Analyze Context:** Review the codebase and current project state in `MEMORY.md`.
2.  **Define Batches:** Break down the task into logical batches of work.
3.  **Surgical Steps:** For each batch, define exact files to be modified and the logic of the change.
4.  **Dependencies:** Identify any dependencies between steps or batches.
5.  **Risk Assessment:** Flag potential side effects or breaking changes.

## Output Format
The output should be a structured "Architect's Blueprint" or "Execution Plan" that the Developer can follow precisely.
