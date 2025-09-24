# Flavors & Env

- Three flavors: `dev`, `stg`, `prod`. Separate bundle ids.
- Entry points: `main_dev.dart`, `main_stg.dart`, `main_prod.dart`.
- Load base URLs & feature flags from flavor config.
- Keep QA toggles (e.g., mock mode) out of prod builds.
