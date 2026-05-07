# DeckBuilder For L12 Client

Flutter client for `DeckBuilderForL12`, a local-first deck builder for L12 players.

## Current Status

- Flutter project scaffold is in place
- `go_router` is wired as the routing layer
- `flutter_riverpod` is wired as the state-management entry point
- Theme, app shell, and placeholder home page are implemented
- Card data normalization and real feature pages are the next implementation step

## Tech Baseline

- Flutter `3.41.5`
- Dart `3.11.3`
- Platforms: Android, iOS, macOS, Web

If you use FVM:

```bash
fvm install
fvm flutter pub get
```

If you do not use FVM, use a Flutter SDK compatible with `3.41.5`.

## Quick Start

```bash
flutter pub get
flutter analyze
flutter test
flutter run -d chrome
```

If Android tooling is not fully initialized on your machine yet, you may also need:

```bash
flutter doctor --android-licenses
```

## Project Structure

```text
lib/
  app/
    router/
    theme/
  core/
    constants/
  data/
  domain/
  features/
    home/
  shared/
    presentation/widgets/
assets/
  data/
  images/
```

Directory responsibilities:

- `app/`: app bootstrap, router, theme, shell-level composition
- `core/`: shared constants and infrastructure primitives
- `domain/`: business entities and rules
- `data/`: repositories, DTOs, and asset/database access
- `features/`: feature-oriented UI and state
- `shared/`: reusable presentation components

## Implemented Entry Points

- App bootstrap: [lib/main.dart](/Users/sherlock/Documents/workSpace/gameProject/DeckBuilderForL12/code/client/lib/main.dart:1)
- App widget: [lib/app/app.dart](/Users/sherlock/Documents/workSpace/gameProject/DeckBuilderForL12/code/client/lib/app/app.dart:1)
- Router: [lib/app/router/app_router.dart](/Users/sherlock/Documents/workSpace/gameProject/DeckBuilderForL12/code/client/lib/app/router/app_router.dart:1)
- Theme: [lib/app/theme/app_theme.dart](/Users/sherlock/Documents/workSpace/gameProject/DeckBuilderForL12/code/client/lib/app/theme/app_theme.dart:1)
- Home placeholder: [lib/features/home/presentation/pages/home_page.dart](/Users/sherlock/Documents/workSpace/gameProject/DeckBuilderForL12/code/client/lib/features/home/presentation/pages/home_page.dart:1)

## Next Work

1. Ingest `cards.raw.json` into the client asset/data pipeline.
2. Add raw-type to normalized-type mapping.
3. Introduce card DTOs, domain entities, and repository interfaces.
4. Expose a minimal card list flow for the first real page.
