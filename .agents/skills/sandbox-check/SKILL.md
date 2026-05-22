---
name: sandbox-check
description: Verification skill to check if OMA is running in a sandboxed/containerized environment prior to autonomous tool execution.
orchestration:
  manager: ralph
---

# Skill: Sandbox Safety Checker

This skill ensures that Autopilot/YOLO operations are executed safely. It checks if the current terminal workspace is inside a container, virtual machine, or sandbox to prevent accidental modifications to the host system.

## Instructions

When activated, you must:

1.  **Detect Environment:**
    - Check for environment variables typical of virtual environments (e.g., `CODESPACES=true`, `DEBIAN_FRONTEND=`, `CONTAINER_ID`).
    - Check for Docker indicators: Test if `/.dockerenv` file exists.
    - Check `/proc/self/cgroup` for docker, container, or kubernetes strings (on Linux).
2.  **Evaluate Safety:**
    - If a containerized environment is detected, mark the safety status as `SAFE` (Sandbox active).
    - If running directly on a host macOS, Windows, or Linux system, mark safety status as `WARNING` (Direct host execution).
3.  **Prompt/Warn User:**
    - If status is `WARNING` and the user requested Autopilot/YOLO mode, print a warning alert detailing the risks of host command execution and request confirmation or log a prominent alert in `MEMORY.md`.
