# Common Error Patterns and Resolutions

This document lists common development errors and recommendations for resolving them systematically.

## 1. Syntax & Formatting Errors

### ESLint / Prettier Violations
*   **Symptom:** Command `npm run lint` or similar fails with style errors (trailing spaces, semi-colons, quote types).
*   **Resolution:**
    *   If available, run `npm run lint -- --fix` or `npx prettier --write .`.
    *   Otherwise, make manual edits to match formatting.

## 2. Type Errors (TypeScript)

### Type Mismatch / Missing Types
*   **Symptom:** Compile-time type errors from `tsc`.
*   **Resolution:**
    *   Check imported types.
    *   Ensure proper type casting or interface implementation.
    *   Add null/undefined guards if checking nullable values.

## 3. Shell / Script Errors

### Command Not Found
*   **Symptom:** Command fails with `command not found: jq` or similar.
*   **Resolution:**
    *   Add validation/pre-flight check to see if the command exists (`command -v jq &> /dev/null`).
    *   Fail gracefully with a clear setup message instead of crashing.
