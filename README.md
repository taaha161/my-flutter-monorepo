# Flutter Monorepo

A comprehensive Flutter monorepo structure containing reusable packages, example applications, development tools, and documentation.

## 📦 Packages

This monorepo includes the following Flutter packages:

- **widgets** - Reusable UI components (buttons, cards, inputs)
- **state_management** - Simple state management solution
- **network** - HTTP client and API utilities
- **shared** - Shared models and data types
- **utils** - Utility functions and helpers

## 📱 Examples

Example Flutter applications demonstrating package usage:

- **counter_app** - Simple counter app with state management
- **todo_app** - Full-featured todo list application
- **demo_app** - Comprehensive package showcase

## 🛠️ Tools

Development tools and plugins:

- **code_generator** - Code generation utilities
- **linter_rules** - Custom linting rules
- **scripts** - Helper scripts for common tasks
- **ci** - CI/CD configurations

## 📚 Documentation

See the [docs](./docs/) folder for detailed documentation:
- [README](./docs/README.md) - Overview and structure
- [Getting Started](./docs/GETTING_STARTED.md) - Setup guide
- [Packages](./docs/PACKAGES.md) - Package documentation

## 🚀 Quick Start

```bash
# Install dependencies for all packages
cd packages/widgets && flutter pub get && cd ../..
cd packages/state_management && flutter pub get && cd ../..
cd packages/network && flutter pub get && cd ../..
cd packages/shared && flutter pub get && cd ../..
cd packages/utils && flutter pub get && cd ../..

# Run an example app
cd examples/counter_app
flutter pub get
flutter run
```

Or use the helper script:
```bash
chmod +x tools/scripts/install_all.sh
./tools/scripts/install_all.sh
```

## 📖 Usage

To use packages in your Flutter app, add them to your `pubspec.yaml`:

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
```

## 🏗️ Structure

```
my-monorepo/
├── packages/          # Reusable Flutter packages
├── examples/          # Example applications
├── tools/             # Development tools and plugins
│   ├── plugins/       # Flutter plugins
│   ├── scripts/       # Helper scripts
│   └── ci/            # CI/CD configs
└── docs/              # Documentation
```

## 🤝 Contributing

This monorepo follows Flutter package conventions. Each package can be developed independently while sharing code across the workspace.

## 📝 License

This project is provided as-is for demonstration purposes.
