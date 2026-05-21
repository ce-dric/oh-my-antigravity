# Error Patterns & Resolutions

## 🟢 Lint Errors
- **Unused Variable:** Remove the variable or prefix it with an underscore (if applicable).
- **Missing Semicolon:** Add the semicolon.
- **Formatting Issues:** Run the project's formatter (e.g., `prettier`, `black`).

## 🔵 Type Errors (TypeScript)
- **Property Missing:** Check if the object matches the interface; update the interface or the object.
- **Type Mismatch:** Use type guards or explicit casting (only as a last resort).
- **Module Not Found:** Check `package.json` and imports; run `npm install`.

## 🔴 Test Failures
- **Assertion Error:** Compare expected vs. actual values; fix logic or update test if requirements changed.
- **Timeout:** Check for async issues or increase timeout.
- **Environment Failure:** Check for missing env variables or mock external services.
