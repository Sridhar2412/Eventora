enum ErrorType {
  response,
  phoneLinkFirebase,
  network,
  parse,
  other,
  connection,
  responseError,
}

class AppException implements Exception {
  AppException(
      {required this.type, required this.message, this.trace, this.data});

  final ErrorType type;
  final String message;
  final dynamic data;
  final StackTrace? trace;
}
