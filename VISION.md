# VISION.md - oh-my-antigravity (OMA) Planning Document

## 0. The OMC/OMX Mandate
`oh-my-antigravity` is committed to maintaining feature parity with `oh-my-claudecode` (OMC) and `oh-my-codex` (OMX).
- **Rule:** If a feature exists in OMC or OMX, it must exist in OMA.
- **Exceptions:** Any omission must be backed by a clear technical explanation (e.g., "Antigravity CLI lacks X primitive").
- **Innovation:** Modifications and additional features are encouraged as long as the base functionality is preserved.

## 1. Project Overview
`oh-my-antigravity` is an orchestration layer built on top of the Google Antigravity CLI. It aims to implement the "Team-based" development model popularized by `oh-my-claudecode`, optimized for the Antigravity ecosystem (Sub-agents and Skills).

## 2. Architectural Goals
- **Modularity:** Every role (Architect, Developer, Tester) should be a standalone Sub-agent.
- **Standardization:** Establish a common language and folder structure for Antigravity-powered projects.
- **Reliability:** Implement mandatory verification loops to ensure code quality and functional correctness.

## 3. Core Components

### 3.1 Sub-agents (Repository Root)
- **ralph.md:** The "Manager". Focuses on state management, delegation, and "never-give-up" loops.
- **architect.md:** Responsible for system design, file structure, and technical debt assessment.
- **developer.md:** Focused on surgical code implementation and adhering to local conventions.
- **verifier.md:** Dedicated to testing, linting, and runtime verification.

### 3.2 Skills (`.agents/skills/`)
- **deep-interview:** A tool-set for requirement gathering.
- **repo-mapper:** Advanced codebase analysis and dependency graphing.
- **auto-fixer:** A specialized loop for resolving lint and type errors.

## 4. Workflow (The OMA Pipeline)
1. **Interview:** Clarify intent and edge cases.
2. **Research:** Map affected files and dependencies.
3. **Blueprint:** Create a detailed execution strategy.
4. **Sprint:** Sub-agents execute the strategy in parallel (where possible).
5. **Audit:** Mandatory verification by the `verifier` agent.
6. **Deploy/Finalize:** Update documentation and project memory.

## 5. Success Metrics
- Reduction in "agent hallucinations" through multi-agent cross-verification.
- Increased success rate for complex, multi-file refactoring tasks.
- Faster onboarding for new projects through standardized `.antigravity.md` setups.
