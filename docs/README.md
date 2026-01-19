# Flutter Monorepo

A Flutter monorepo containing reusable packages, example apps, and development tools.

## Structure

```
my-monorepo/
├── packages/          # Reusable Flutter packages
│   ├── widgets/       # UI components and widgets
│   ├── state_management/ # State management utilities
│   ├── network/       # HTTP client and API utilities
│   ├── shared/        # Shared models and types
│   └── utils/         # Utility functions and helpers
├── examples/          # Example Flutter applications
│   ├── counter_app/   # Simple counter demo
│   ├── todo_app/      # Todo list application
│   └── demo_app/      # Comprehensive package demo
├── tools/             # Development tools and plugins
│   ├── ci/            # CI/CD configurations
│   ├── scripts/       # Helper scripts
│   └── plugins/       # Flutter plugins and code generators
└── docs/              # Documentation
```

## Packages

### widgets
A collection of reusable Flutter UI components including:
- `CustomButton` - Customizable button with loading state
- `InfoCard` - Information display card
- `TextFieldInput` - Styled text input field

### state_management
Simple state management solution:
- `Store<T>` - State container with ChangeNotifier
- `StoreBuilder<T>` - Widget that rebuilds on state changes
- `Controller` mixin for stateful logic

### network
HTTP client and API utilities:
- `ApiClient` - HTTP client wrapper
- `ApiEndpoints` - Endpoint definitions
- Error handling with `ApiException`

### shared
Shared models and data types:
- `User` model
- `Post` model

### utils
Utility functions:
- `DateFormatter` - Date formatting utilities
- `StringUtils` - String manipulation helpers
- `Validators` - Form validation functions

## Examples

### Counter App
A simple counter application demonstrating the state_management package.

### Todo App
A full-featured todo list application showcasing widgets, state management, and utils.

### Demo App
Comprehensive demonstration of all packages in the monorepo.

## Getting Started

1. Clone the repository
2. Navigate to an example app:
   ```bash
   cd examples/counter_app
   flutter pub get
   flutter run
   ```

3. To use packages in your own project, reference them via path:
   ```yaml
   dependencies:
     widgets:
       path: ../packages/widgets
   ```

## Development

All packages follow Flutter package conventions. Each package has:
- `pubspec.yaml` - Package configuration
- `lib/` - Source code
- Tests in `test/` directory (to be added)

## Contributing

This is a monorepo structure for Flutter development. Each package can be developed independently while sharing code across the workspace.
