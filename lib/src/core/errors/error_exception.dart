class ErrorException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  ErrorException({required this.message, required this.stackTrace});
}
