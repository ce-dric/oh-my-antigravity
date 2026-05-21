---
name: cancel
description: A utility skill to safely terminate the current operation or session.
category: General
---

# Skill: Cancel

This skill provides a standard way to abort a process while ensuring that the system state remains consistent.

## Instructions

1. **Cleanup:** Ensure any temporary files or lock files are removed.
2. **Notify:** Provide a brief message explaining that the operation was cancelled.
3. **State Recovery:** Revert to the last known stable state if applicable.
