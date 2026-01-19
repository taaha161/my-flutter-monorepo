/// Generates model classes from JSON schemas or annotations
class ModelGenerator {
  /// Generate a Dart model class from a class name and fields
  static String generateModel({
    required String className,
    required Map<String, String> fields,
    bool includeJsonSerialization = true,
  }) {
    final buffer = StringBuffer();
    
    buffer.writeln('class $className {');
    
    // Fields
    for (final entry in fields.entries) {
      buffer.writeln('  final ${entry.value} ${entry.key};');
    }
    
    buffer.writeln('');
    buffer.writeln('  $className({');
    
    // Constructor parameters
    for (final entry in fields.entries) {
      final isRequired = entry.value.startsWith('String') || 
                         entry.value.startsWith('int') ||
                         entry.value.startsWith('double') ||
                         entry.value.startsWith('bool');
      if (isRequired) {
        buffer.writeln('    required this.${entry.key},');
      } else {
        buffer.writeln('    this.${entry.key},');
      }
    }
    
    buffer.writeln('  });');
    
    if (includeJsonSerialization) {
      buffer.writeln('');
      buffer.writeln('  factory $className.fromJson(Map<String, dynamic> json) {');
      buffer.writeln('    return $className(');
      for (final entry in fields.entries) {
        buffer.writeln('      ${entry.key}: json[\'${entry.key}\'] as ${entry.value},');
      }
      buffer.writeln('    );');
      buffer.writeln('  }');
      
      buffer.writeln('');
      buffer.writeln('  Map<String, dynamic> toJson() {');
      buffer.writeln('    return {');
      for (final entry in fields.entries) {
        buffer.writeln('      \'${entry.key}\': ${entry.key},');
      }
      buffer.writeln('    };');
      buffer.writeln('  }');
    }
    
    buffer.writeln('}');
    
    return buffer.toString();
  }
}
