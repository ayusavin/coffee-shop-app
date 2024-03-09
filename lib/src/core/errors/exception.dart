class ValidationException implements Exception {
  final Type model;
  final Map<String, dynamic> data;

  ValidationException({
    required this.model,
    required this.data
  });
}
