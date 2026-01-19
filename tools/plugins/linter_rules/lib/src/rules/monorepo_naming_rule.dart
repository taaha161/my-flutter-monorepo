/// Linter rule for enforcing naming conventions in the monorepo
class MonorepoNamingRule {
  /// Validates that class names follow PascalCase convention
  static bool isValidClassName(String name) {
    if (name.isEmpty) return false;
    return RegExp(r'^[A-Z][a-zA-Z0-9]*$').hasMatch(name);
  }

  /// Validates that variable names follow camelCase convention
  static bool isValidVariableName(String name) {
    if (name.isEmpty) return false;
    return RegExp(r'^[a-z][a-zA-Z0-9]*$').hasMatch(name);
  }

  /// Validates that file names follow snake_case convention
  static bool isValidFileName(String name) {
    if (name.isEmpty) return false;
    return RegExp(r'^[a-z][a-z0-9_]*\.dart$').hasMatch(name);
  }
}
