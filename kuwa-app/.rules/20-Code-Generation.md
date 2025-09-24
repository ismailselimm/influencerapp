# Code Generation

- Use build_runner:
  - `flutter pub run build_runner watch --delete-conflicting-outputs`
- Libraries:
  - `freezed`, `json_serializable`, `riverpod_generator` (if used)
- Commit generated code to avoid CI flakiness (team choice; be consistent).
