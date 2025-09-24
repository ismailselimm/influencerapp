# State Management

- Prefer **Riverpod** (or Bloc if team standardized).
- For async data: `AsyncValue<T>` patterns (loading/data/error).
- Split UI state vs domain state.
- Do not put networking in widgets; call use-cases/providers.
- Keep providers small; derived providers for computed values.
