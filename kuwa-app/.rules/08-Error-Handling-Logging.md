# Error Handling & Logging

- Use `Result<T, Failure>` or `Either<Failure, T>`.
- Distinguish: `NetworkFailure`, `AuthFailure`, `ValidationFailure`.
- Show friendly messages; capture tech details in logs only.
- Global error handler for Flutter errors + `runZonedGuarded`.
- Crash + analytics (e.g., Sentry/Firebase) with PII minimized.
