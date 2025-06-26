# GEMINI.md

This file provides guidance to Gemini when working with code in this repository.

## Language Instructions

- **Always respond in Korean (한글)** when communicating with users
- Provide explanations, error messages, and all text responses in Korean
- Code comments and documentation should be in Korean when added

## Project Overview

Saucerer is a Flutter cross-platform mobile application for creating, sharing, and discovering sauce recipes. The project follows Clean Architecture principles with clear separation between data, domain, and presentation layers.

## Development Commands

- **Run app**: `flutter run`
- **Run tests**: `flutter test`
- **Analyze code**: `flutter analyze`
- **Get dependencies**: `flutter pub get`
- **Build APK**: `flutter build apk`
- **Build iOS**: `flutter build ios`
- **Run build_runner**: `flutter pub run build_runner build --delete-conflicting-outputs`

## Architecture

The project follows Clean Architecture with these key layers, as detailed in [ARCHITECTURE.md](./ARCHITECTURE.md):

### Core Layer (`lib/core/`)
- **config/**: App configuration including themes (`app_theme.dart`)
- **constants/**: Global constants and enums
- **di/**: Dependency injection setup
- **routes/**: Navigation and routing configuration

### Data Layer (`lib/data/`)
- **datasources/**: Concrete data source implementations
  - **local/**: SQLite database helpers (`database_helper.dart`) and local data sources (`recipe_local_data_source.dart`)
  - **remote/**: API clients and remote data sources (planned)
- **models/**: Data transfer objects with JSON serialization (`recipe_version_model.dart`)
- **repositories/**: Repository pattern implementations (`recipe_repository_impl.dart`)

### Domain Layer (`lib/domain/`)
- **entities/**: Pure business objects (`recipe_version.dart`)
- **repositories/**: Abstract repository interfaces (`recipe_repository.dart`)
- **usecases/**: Business logic encapsulation (`get_recipes_usecase.dart`)

### Presentation Layer (`lib/presentation/`)
- **auth/**: Authentication screens and logic
- **recipe/**: Recipe-related UI components
  - **list/**: Recipe listing with view/viewmodel pattern (`recipe_list_screen.dart`, `recipe_list_viewmodel.dart`)
  - **detail/**: Recipe detail screens
  - **edit/**: Recipe creation/editing
- **search/**: Search functionality

## Key Patterns & Conventions

- **State Management**: Use **Riverpod** with the `@riverpod` annotation for providers. Prefer `AsyncNotifierProvider` and `NotifierProvider`. Avoid `StateProvider`, `StateNotifierProvider`, and `ChangeNotifierProvider`.
- **Immutability**: Use **Freezed** for creating immutable state classes and unions.
- **Navigation**: Use **GoRouter** or **auto_route** for navigation and deep linking.
- **Asynchronous Operations**: Use `AsyncValue` for handling loading and error states in UI.
- **Error Handling**: Display errors directly in the UI using `SelectableText.rich` with a red color. Avoid `SnackBars`.
- **Styling**: Use `Theme.of(context)` for consistent styling.
- **JSON Serialization**: Use `@JsonSerializable(fieldRename: FieldRename.snake)` for models.
- **Database Model**: Include `createdAt`, `updatedAt`, and `isDeleted` fields in database tables.
- **Code Generation**: Utilize `build_runner` for Freezed, Riverpod, and JSON serialization.
- **Widget Structure**: Create small, private widget classes instead of helper methods.
- **Performance**: Use `const` widgets, `ListView.builder`, and `cached_network_image`.
- **Code Style**:
    - Keep lines under 80 characters.
    - Use trailing commas.
    - Use arrow syntax for simple one-line functions/methods.
    - Use `log` for debugging instead of `print`.
