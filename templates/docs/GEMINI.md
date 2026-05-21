# .antigravity.md - Project Instructions

This project follows the **OMA Orchestration Model**. All development must be coordinated by the **Ralph** manager agent and executed by the specialized agent team.

## 👥 The Team
- **Ralph (Manager):** Orchestrates and ensures persistence.
- **Architect:** Maps codebase and plans strategy.
- **Developer:** Implements surgical changes.
- **Verifier:** Ensures quality and behavioral correctness.

## 🔄 The Pipeline
1. **Interview Phase:** (Optional) Use `deep-interview` for vague requests.
2. **Research & Strategy:** Architect analyzes the codebase and provides a blueprint.
3. **Implementation:** Developer applies the blueprint.
4. **Validation:** Verifier runs tests and linters.
5. **Persistence Loop:** If Validation fails, go back to Research or Implementation.

## 🛠 Standards
- **Language:** English for documentation, code comments, and commit messages.
- **Commits:** Conventional Commits (e.g., `feat:`, `fix:`, `docs:`).
- **Structure:** 
  - Sub-agents: Root directory (e.g., `ralph.md`)
  - Skills: `.agents/skills/`
  - Documentation: Root `.md` files.

## 🧠 Memory Management
- Maintain `MEMORY.md` as the source of truth for project state and history.
- Use `VISION.md` for long-term goals and architectural philosophy.
