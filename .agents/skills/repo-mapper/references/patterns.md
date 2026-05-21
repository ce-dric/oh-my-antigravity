# Architectural Patterns Reference

## 1. Layered Architecture
- Files grouped by responsibility (e.g., `ui`, `domain`, `data`).
- Direction of dependency should be outward-in (UI → Domain ← Data).

## 2. Modular Architecture
- Files grouped by feature (e.g., `auth`, `billing`, `users`).
- Clear boundaries and public APIs for each module.

## 3. Clean Architecture
- Entities, Use Cases, Interface Adapters, Frameworks/Drivers.
- Dependency Rule: Dependencies only point inwards.

## 4. Spaghetti Code (Anti-pattern)
- Circular dependencies.
- No clear separation of concerns.
- Files that are too large (>500 lines).
