---
name: writer-memory
description: Specialized skill for performing structured updates to MEMORY.md and other persistent logs.
category: Specialized
---

# Skill: Writer Memory

This skill is responsible for the "Persistence Loop" in the OMG model, ensuring that the project state is accurately recorded.

## Instructions

1. **Read-Modify-Write:** Always read the current memory before proposing changes.
2. **Structured Logging:** Use defined sections (Status, History, etc.) to maintain consistency.
3. **Atomic Updates:** Ensure that memory updates are atomic and do not overwrite concurrent changes.
