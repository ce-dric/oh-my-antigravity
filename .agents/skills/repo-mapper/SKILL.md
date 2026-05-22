---
name: repo-mapper
description: A specialized skill for advanced codebase analysis, dependency mapping, and structural visualization.
orchestration:
  manager: ralph
---

# Skill: Repo-Mapper

This skill empowers the **Architect** to understand complex project structures beyond simple file searching.

## Instructions

When activated, you must:

1.  **Map Dependencies:** Identify how files import/export from each other.
2.  **Rank Context:** Determine which files are most critical to a specific change request.
3.  **Visualize Structure:** Generate a text-based or Mermaid-based diagram of the project's architecture.
4.  **Identify Bottlenecks:** Highlight areas with high circular dependency or excessive complexity.

## Resources
- `architectural-patterns.md`: Common architectural patterns to look for.
- `structure-map.md`: A template for reporting the codebase structure.

## Orchestration
This skill should be invoked by the **Architect** under the coordination of **Ralph**.
