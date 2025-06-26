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


## Project Overview

### 1. Project Goals
The objective of this project is to develop a personalized mobile application that allows users to systematically create, evolve, and manage their own sauce recipes. The core goals are as follows:

Personalized Recipe Asset Management: To enable users to meticulously record their unique sauce recipes down to the precise ingredient and quantity, allowing them to build and permanently store a digital library of personal recipe assets.
Evolutionary Recipe Development: To facilitate the gradual evolution of recipes. Through a "Recipe Versioning" and "Cooking Log" system, users can fork new versions from existing recipes based on their real-world cooking experiences (e.g., "a bit too salty," "use less sugar next time"), rather than overwriting them. This preserves the entire developmental history of a recipe.
Frictionless User Experience: To provide a frictionless user experience. The app will feature "In-Context Ingredient Creation," allowing users to add new ingredients without disrupting their recipe creation workflow. A "Tag/Chip-Based Input" system will prevent typos and ensure data consistency, allowing users to focus solely on the task of recording their recipes.
Data-Driven Discovery: To enable data-driven meal discovery. Users can instantly search for recipes they can make with the ingredients they currently have, effectively answering the question, "What can I cook today?"
Robust & Scalable Architecture: To build a robust and scalable architecture. The project will initially adopt a "Local-First" approach, ensuring full offline functionality and fast performance. By implementing Clean Architecture, the app will be flexible and prepared for future expansion, such as introducing server-side data synchronization and sharing features.

### 2. Screens to Implement
To achieve the goals above, the following screens will be implemented.

#### 1. Splash Screen

Key Features: Display app logo on launch, check user authentication status, and automatically redirect to either the Main Screen or Login Screen.
#### 2. Authentication Screens

Key Features: Provide login and sign-up functionality using email/password authentication.
#### 3. Main Screen (Recipe Group List)

Key Features: Display a list of all user-created "Recipe Groups" in a card format (note: shows groups, not individual versions). Provide a guided "Empty State" UI for new users. Serve as the entry point for the ingredient-based search.
#### 4. Recipe Detail Screen

Key Features: Allow users to browse and select from all available versions within a specific "Recipe Group" (e.g., v1-Original, v2-Less Spicy). Display the detailed ingredient list for the selected version. Show a chronological list of all "Cooking Logs" (photos, memos) associated with that specific version.
#### 5. Recipe Create/Edit Screen

Key Features:
Create new recipe groups and their initial versions.
Modify an existing version and choose to either "Overwrite" it or "Save as a New Version."
Add ingredients from a predefined list (tags/chips) and adjust quantities in "1/4 tablespoon" increments.
Provide "In-Context Ingredient Creation" to add new, unlisted ingredients on the fly.
#### 6. Cooking Log Create Screen

Key Features: After cooking with a specific recipe version, allow the user to record and save a photo of the dish along with a dedicated memo (e.g., "Turned out great," "Add more vegetables next time").
#### 7. Ingredient-based Search Screen

Key Features: Display a comprehensive list of all ingredients as selectable chips. As the user selects chips, the list of recipe groups is filtered in real-time to show only those containing all the selected ingredients.
#### 8. Profile/Settings Screen

Key Features: Provide user logout and account management. Include an "Ingredient List Management" feature for users to merge, delete, or correct any duplicate or misspelled ingredients that may result from the "In-Context Ingredient Creation" feature.