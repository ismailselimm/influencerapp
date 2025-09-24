# Networking & Data

- HTTP: **dio** with interceptors for auth, logging, retry/backoff.
- Serialization: **freezed** + **json_serializable** (immutable models).
- Caching: local store (Hive/Isar/SQflite) via repository abstraction.
- Timeouts: set sensible connect/receive timeouts (e.g., 10s/20s).
- Do not leak DTOs into `domain/`—map in `infrastructure/mappers`.
