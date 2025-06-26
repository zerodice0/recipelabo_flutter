# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

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

## Architecture

The project follows Clean Architecture with these key layers, as detailed in [ARCHITECTURE.md](./ARCHITECTURE.md):

### Core Layer (`lib/core/`)
- **config/**: App configuration including themes
- **constants/**: Global constants and enums
- **di/**: Dependency injection setup
- **routes/**: Navigation and routing configuration

### Data Layer (`lib/data/`)
- **datasources/**: Concrete data source implementations
  - **local/**: SQLite database helpers and local data sources
  - **remote/**: API clients and remote data sources (planned)
- **models/**: Data transfer objects with JSON serialization
- **repositories/**: Repository pattern implementations

### Domain Layer (`lib/domain/`)
- **entities/**: Pure business objects without external dependencies
- **repositories/**: Abstract repository interfaces
- **usecases/**: Business logic encapsulation following single responsibility

### Presentation Layer (`lib/presentation/`)
- **auth/**: Authentication screens and logic
- **recipe/**: Recipe-related UI components
  - **list/**: Recipe listing with view/viewmodel pattern
  - **detail/**: Recipe detail screens
  - **edit/**: Recipe creation/editing
- **search/**: Search functionality

## Key Patterns

- **MVVM**: ViewModels manage state and business logic for screens
- **Repository Pattern**: Abstract data access through interfaces
- **Use Cases**: Encapsulate specific business operations
- **Dependency Injection**: Centralized dependency management in `core/di/`

## Development Guidelines

- Follow the existing folder structure when adding new features
- Implement new screens using the view/viewmodel pattern
- Create use cases for business logic rather than putting it in ViewModels
- Use entities in the domain layer and models in the data layer
- Keep ViewModels focused on UI state management