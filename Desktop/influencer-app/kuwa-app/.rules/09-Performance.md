# Performance

- Use `const` constructors where possible.
- Memoize expensive work; prefer selectors to limit rebuilds.
- Profile with Flutter DevTools for jank/raster time.
- Image optimization: use correct sizes, caching, `cacheWidth`.
- Avoid unnecessary `ListView.builder` inside `SingleChildScrollView`.
