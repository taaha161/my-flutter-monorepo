# Getting Started Guide

This guide will help you set up and start working with the Flutter monorepo.

## Prerequisites

- Flutter SDK (>=3.10.0)
- Dart SDK (>=3.0.0)
- Your favorite IDE (VS Code, Android Studio, etc.)

## Setup

### 1. Install Dependencies

Each package and example app needs dependencies installed separately:

```bash
# Install dependencies for all packages
cd packages/widgets && flutter pub get && cd ../..
cd packages/state_management && flutter pub get && cd ../..
cd packages/network && flutter pub get && cd ../..
cd packages/shared && flutter pub get && cd ../..
cd packages/utils && flutter pub get && cd ../..

# Install dependencies for example apps
cd examples/counter_app && flutter pub get && cd ../..
cd examples/todo_app && flutter pub get && cd ../..
cd examples/demo_app && flutter pub get && cd ../..
```

Or use the helper script:
```bash
./tools/scripts/install_all.sh
```

### 2. Run an Example App

```bash
cd examples/counter_app
flutter run
```

### 3. Using Packages in Your App

To use a package in your Flutter app, add it to your `pubspec.yaml`:

```yaml
dependencies:
  widgets:
    path: ../packages/widgets
  state_management:
    path: ../packages/state_management
```

Then import and use:

```dart
import 'package:widgets/widgets.dart';
import 'package:state_management/state_management.dart';

// Use CustomButton
CustomButton(
  text: 'Click me',
  onPressed: () => print('Clicked!'),
)

// Use Store for state management
final store = Store(0);
store.update(store.state + 1);
```

## Package Development

### Creating a New Package

1. Create a new directory in `packages/`
2. Create `pubspec.yaml` with package configuration
3. Create `lib/` directory with your code
4. Add exports to `lib/<package_name>.dart`

### Testing Packages

Run tests for a specific package:

```bash
cd packages/widgets
flutter test
```

## Common Tasks

### Format Code

```bash
flutter format .
```

### Analyze Code

```bash
flutter analyze
```

### Build for Release

```bash
cd examples/counter_app
flutter build apk  # Android
flutter build ios  # iOS
```

## Troubleshooting

### Packages Not Found

If you get errors about packages not being found:
1. Run `flutter pub get` in the package directory
2. Run `flutter pub get` in your app directory
3. Restart your IDE

### Version Conflicts

Ensure all packages use compatible Flutter and Dart SDK versions (check `pubspec.yaml` files).
