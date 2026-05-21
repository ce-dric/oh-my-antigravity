---
name: release
description: Manager-focused skill for managing project versioning and the release lifecycle.
orchestration:
  agent: manager
---

# Skill: Release

This skill enables the Manager (Ralph) to manage the end-to-end release process, including version bumping, changelog generation, and final deployment checks.

## Instructions

1.  **Version Management:** Increment the project version based on semantic versioning rules (major, minor, patch).
2.  **Changelog Generation:** Aggregate all MEMORY.md history and commit messages into a structured CHANGELOG.md.
3.  **Pre-Release Audit:** Run all verification scripts to ensure the project is in a stable state.
4.  **Lifecycle Management:** Tag the release in version control and prepare the distribution assets.

## Responsibility
The Manager must ensure that no release is finalized without a 100% pass rate from the Verifier agent.
