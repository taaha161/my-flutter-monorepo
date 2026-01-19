/// Linter rule for validating package dependencies in the monorepo
class PackageDependencyRule {
  /// Validates that package dependencies are properly declared
  static bool isValidDependency(String packageName, List<String> allowedPackages) {
    return allowedPackages.contains(packageName);
  }

  /// Checks for circular dependencies between packages
  static bool hasCircularDependency(
    Map<String, List<String>> dependencies,
    String packageName,
  ) {
    final visited = <String>{};
    final recursionStack = <String>{};

    return _hasCycle(packageName, dependencies, visited, recursionStack);
  }

  static bool _hasCycle(
    String package,
    Map<String, List<String>> dependencies,
    Set<String> visited,
    Set<String> recursionStack,
  ) {
    if (recursionStack.contains(package)) {
      return true; // Cycle detected
    }

    if (visited.contains(package)) {
      return false; // Already processed
    }

    visited.add(package);
    recursionStack.add(package);

    if (dependencies.containsKey(package)) {
      for (final dep in dependencies[package]!) {
        if (_hasCycle(dep, dependencies, visited, recursionStack)) {
          return true;
        }
      }
    }

    recursionStack.remove(package);
    return false;
  }
}
