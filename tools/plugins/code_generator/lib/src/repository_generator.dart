/// Generates repository classes for data access
class RepositoryGenerator {
  /// Generate a repository class for a given model
  static String generateRepository({
    required String modelName,
    required String repositoryName,
    required String baseUrl,
    List<String>? methods,
  }) {
    methods ??= ['getAll', 'getById', 'create', 'update', 'delete'];
    
    final buffer = StringBuffer();
    
    buffer.writeln('import \'package:network/network.dart\';');
    buffer.writeln('import \'package:shared/shared.dart\';');
    buffer.writeln('');
    buffer.writeln('class $repositoryName {');
    buffer.writeln('  final ApiClient _apiClient;');
    buffer.writeln('');
    buffer.writeln('  $repositoryName({ApiClient? apiClient})');
    buffer.writeln('      : _apiClient = apiClient ?? ApiClient(baseUrl: \'$baseUrl\');');
    buffer.writeln('');
    
    if (methods.contains('getAll')) {
      buffer.writeln('  Future<List<$modelName>> getAll() async {');
      buffer.writeln('    final response = await _apiClient.get(\'/${modelName.toLowerCase()}s\');');
      buffer.writeln('    return (response[\'data\'] as List)');
      buffer.writeln('        .map((json) => $modelName.fromJson(json))');
      buffer.writeln('        .toList();');
      buffer.writeln('  }');
      buffer.writeln('');
    }
    
    if (methods.contains('getById')) {
      buffer.writeln('  Future<$modelName> getById(int id) async {');
      buffer.writeln('    final response = await _apiClient.get(\'/${modelName.toLowerCase()}s/\$id\');');
      buffer.writeln('    return $modelName.fromJson(response[\'data\']);');
      buffer.writeln('  }');
      buffer.writeln('');
    }
    
    if (methods.contains('create')) {
      buffer.writeln('  Future<$modelName> create($modelName model) async {');
      buffer.writeln('    final response = await _apiClient.post(');
      buffer.writeln('      \'/${modelName.toLowerCase()}s\',');
      buffer.writeln('      body: model.toJson(),');
      buffer.writeln('    );');
      buffer.writeln('    return $modelName.fromJson(response[\'data\']);');
      buffer.writeln('  }');
      buffer.writeln('');
    }
    
    buffer.writeln('}');
    
    return buffer.toString();
  }
}
