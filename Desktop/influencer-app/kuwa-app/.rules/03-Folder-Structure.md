# Folder Structure (example)

```
lib/
  app/
    bootstrap.dart
    env.dart
    router.dart
  presentation/
    features/
      login/
        view/login_screen.dart
        widgets/login_form.dart
        controller/login_controller.dart
      home/
        view/home_screen.dart
    shared/
      widgets/
      extensions/
  application/
    usecases/
      login_usecase.dart
  domain/
    entities/
    repositories/
    value_objects/
  infrastructure/
    http/
      dio_client.dart
    datasources/
      auth_remote_ds.dart
    mappers/
    storage/
  shared/
    errors/
    result/result.dart
    utils/
  config/
    flavor_config.dart
  l10n/
    intl_en.arb
    intl_tr.arb
main_dev.dart
main_stg.dart
main_prod.dart
```

- Keep feature folders self-contained (`view`, `widgets`, `controller`/`provider`). 
- Cross-cutting code goes in `shared/`.
