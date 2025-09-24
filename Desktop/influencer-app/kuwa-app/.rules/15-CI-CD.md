# CI/CD

- Minimum pipeline:
  1. `flutter pub get`
  2. `flutter analyze`
  3. `flutter test --coverage`
  4. Build flavors: `dev`, `stg`, `prod`
- Optional: codecov upload; Fastlane for store deployment.
- Cache pub cache between runs for speed.
