# Architecture

**Goals:** Predictable, testable, modular.

- **Layers**
  - `presentation/` (Widgets, screens, view models)
  - `application/` (use-cases/services orchestrating domain + infra)
  - `domain/` (entities, value objects, repositories interfaces)
  - `infrastructure/` (DIO/HTTP clients, data sources, mappers, storage)
  - `shared/` (design tokens, utils, result/error types)
- **Principles**
  - Clean Architecture + SOLID.
  - Dependencies flow inward: UI → app → domain ← infra.
  - All IO behind abstractions; pure domain where possible.
- **Packages**
  - Prefer **go_router** for navigation, **riverpod**/**bloc** for state, **dio** for HTTP, **freezed** + **json_serializable** for models.
- **Null-safety & immutability**: default to `final` + immutable models.
- **Result types**: Use `Either/Result` style for failures vs success.
