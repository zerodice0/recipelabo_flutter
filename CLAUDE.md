# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Language Instructions

- **Always respond in Korean (한글)** when communicating with users
- Provide explanations, error messages, and all text responses in Korean
- Code comments and documentation should be in Korean when added

## Project Overview

Recipick is a Flutter cross-platform mobile application for creating, sharing, and discovering recipes. The project follows Clean Architecture principles with clear separation between data, domain, and presentation layers.

## Current Implementation Status

### ✅ Completed Features

#### Core App Structure
- **MainNavigationScreen**: 4-tab navigation (recipes, search, timer, settings)
- **Clean Architecture**: Domain, Data, Presentation layer separation
- **SQLite Database**: Version 14, complete offline support
- **Dependency Injection**: Riverpod-based DI system

#### Recipe Management
- **RecipeListScreen**: Recipe list screen with empty state UI
- **RecipeDetailScreen**: Version selection and detailed information display
- **RecipeEditScreen**: Recipe creation/editing with version management
- **Recipe Versioning**: Version names, genealogy tracking, change log support
- **Version Management**: New version creation, existing version overwrite, version deletion

#### Search & Discovery
- **IngredientSearchScreen**: Ingredient-based real-time search
- **Tag/Chip System**: Chip-based UI for ingredient selection
- **Real-time Filtering**: Filter recipes by selected ingredients

#### Cooking Features
- **CookingLogCreateScreen**: Post-cooking photo and memo recording
- **TimerScreen**: Multiple timer support with background notifications
- **Timer Presets**: Built-in timer presets (pasta, eggs, etc.)
- **Step-by-Step Cooking**: Cooking step widgets with timer integration

#### Data Management
- **SeasoningManagementScreen**: Seasoning/master data management
- **Image Storage**: Local image storage and management system
- **Unit System**: Various unit support and conversion

#### Technical Features
- **Background Notifications**: Utilizing flutter_local_notifications
- **Image Handling**: Camera/gallery image selection and storage
- **Data Consistency**: Tag/Chip-based input for typo prevention
- **Offline-First**: Complete offline functionality
- **Internationalization**: Complete i18n support for Korean, English, and Japanese (187 translation keys)
- **Google Sheets Integration**: Translation management via Google Sheets with interactive CLI tools
- **AdMob Integration**: Banner advertising with environment-based configuration
- **Translation Management**: Interactive shell script for translation workflow automation

### 🚧 Partially Implemented
- **Authentication**: Basic structure exists but actual authentication system not implemented
- **Profile/Settings**: Only seasoning management implemented, user profile features incomplete

### ❌ Not Implemented
- **Splash Screen**: Launch screen not implemented
- **User Authentication**: Login/signup functionality not implemented
- **Remote Sync**: Server synchronization not implemented (Local-First state)
- **Sharing Features**: Recipe sharing functionality not implemented

## Development Commands

### Flutter Development
- **Run app**: `flutter run`
- **Run tests**: `flutter test`
- **Analyze code**: `flutter analyze`
- **Get dependencies**: `flutter pub get`
- **Build APK**: `flutter build apk`
- **Build iOS**: `flutter build ios`
- **Generate code**: `flutter packages pub run build_runner build --delete-conflicting-outputs`

### Internationalization Management
- **Interactive i18n tool**: `./i18n.sh` (recommended)
- **Generate translations**: `flutter gen-l10n`
- **Scan hardcoded strings**: `./i18n.sh scan` or `dart run scripts/scan_hardcoded_strings.dart`
- **Update translations from Google Sheets**: `./i18n.sh update` or `dart run scripts/update_translations.dart`
- **Upload improved translations**: `./i18n.sh upload` or `dart run scripts/upload_improved_translations.dart`
- **Full translation workflow**: `./i18n.sh workflow`

## Architecture

The project follows Clean Architecture with these key layers, as detailed in [ARCHITECTURE.md](./ARCHITECTURE.md):

### Core Layer (`lib/core/`)
- **config/**: App configuration including themes, recipe card widgets
- **di/**: Dependency injection setup (Riverpod providers)
- **routes/**: Navigation and routing configuration (GoRouter)
- **services/**: Core services (ImageStorageService, TimerService)

### Internationalization (`lib/l10n/`)
- **app_*.arb**: Translation files for Korean, English, and Japanese
- **app_localizations.dart**: Generated localization classes
- **l10n.yaml**: Internationalization configuration

### Data Layer (`lib/data/`)
- **datasources/local/**: SQLite database helpers and local data sources
  - `database_helper.dart`: SQLite DB schema and management (v14)
  - `recipe_local_data_source.dart`: Recipe data CRUD operations
  - `ingredient_local_data_source.dart`: Ingredient data management
  - `cooking_log_local_data_source.dart`: Cooking log management
  - `seasoning_local_data_source.dart`: Seasoning master data
  - `timer_preset_datasource.dart`: Timer preset management
- **models/**: Freezed-based data models with JSON serialization
- **repositories/**: Repository pattern implementations

### Domain Layer (`lib/domain/`)
- **entities/**: Freezed-based business entities
  - `recipe_entity.dart`, `recipe_version_entity.dart`: Recipe and version management
  - `ingredient_entity.dart`, `step_entity.dart`: Ingredients and cooking steps
  - `cooking_log_entity.dart`: Cooking records
  - `seasoning_entity.dart`: Seasoning information
  - `cooking_timer_entity.dart`, `timer_preset_entity.dart`: Timer-related entities
- **repositories/**: Abstract repository interfaces
- **usecases/**: 40+ specific business logic Use Cases

### Presentation Layer (`lib/presentation/`)
- **main/**: Main navigation screen
- **recipe/**: Recipe-related UI components
  - **list/**: Recipe list screen with empty state UI
  - **detail/**: Recipe detail screen with version management
  - **edit/**: Recipe creation/editing screen
  - **widgets/**: Reusable recipe widgets
  - **providers/**: Ingredient and unit-related providers
- **search/**: Ingredient-based search functionality
- **cooking_log/**: Cooking log creation screen
- **seasoning/**: Seasoning management screen
- **timer/**: Timer screen and widgets

## Key Patterns

- **MVVM**: ViewModels manage state and business logic for screens
- **Repository Pattern**: Abstract data access through interfaces
- **Use Cases**: Encapsulate specific business operations (40+ use cases implemented)
- **Dependency Injection**: Riverpod-based centralized DI (`core/di/`)
- **Freezed**: Immutable data classes with code generation
- **Local-First**: Complete offline functionality priority

## Key Technical Decisions

### State Management
- **Riverpod**: Global state management and dependency injection
- **Riverpod Generator**: Type safety through code generation
- **Freezed**: Immutable state objects and Union types

### Database & Storage
- **SQLite**: Local database (sqflite package)
- **Local Image Storage**: Store images in app internal directory
- **Schema Versioning**: Database migration system

### UI/UX Patterns
- **Material Design 3**: Seed color-based dynamic themes
- **Bottom Navigation**: 4-tab main navigation
- **Chip-based Input**: Tag/Chip system for data consistency
- **Empty States**: Guide UI for new users

### Background Services
- **Flutter Local Notifications**: Background timer notifications
- **Timezone Handling**: Accurate scheduling
- **Permission Management**: iOS/Android notification permission handling

## Development Guidelines

- Follow the existing folder structure when adding new features
- Implement new screens using the view/viewmodel pattern
- Create use cases for business logic rather than putting it in ViewModels
- Use entities in the domain layer and models in the data layer
- Keep ViewModels focused on UI state management
- Use Freezed for all data classes and state objects
- Implement proper error handling in all async operations
- Follow the established naming conventions for files and classes

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
- Create new recipe groups and their initial versions.
- Modify an existing version and choose to either "Overwrite" it or "Save as a New Version."
- Add ingredients from a predefined list (tags/chips) and adjust quantities in "1/4 tablespoon" increments.
- Provide "In-Context Ingredient Creation" to add new, unlisted ingredients on the fly.

#### 6. Cooking Log Create Screen
Key Features: After cooking with a specific recipe version, allow the user to record and save a photo of the dish along with a dedicated memo (e.g., "Turned out great," "Add more vegetables next time").

#### 7. Ingredient-based Search Screen
Key Features: Display a comprehensive list of all ingredients as selectable chips. As the user selects chips, the list of recipe groups is filtered in real-time to show only those containing all the selected ingredients.

#### 8. Profile/Settings Screen
Key Features: Provide user logout and account management. Include an "Ingredient List Management" feature for users to merge, delete, or correct any duplicate or misspelled ingredients that may result from the "In-Context Ingredient Creation" feature.