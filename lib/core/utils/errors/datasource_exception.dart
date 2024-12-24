class NetworkException implements Exception {
  final String message;
  final int statusCode; 
  final Object? originalError;

  NetworkException({
    required this.message,
    this.statusCode = 0, 
    this.originalError,
  });

  @override
  String toString() => 'NetworkException: $message (Status code: $statusCode)';
}

class ServerException implements NetworkException {

  @override
  final String message;

  @override
  final int statusCode; 
  
  @override
  final Object? originalError;

  ServerException({
    required this.message,
    required this.statusCode, 
    this.originalError,
  });

  @override
  String toString() => 'ServerException: $message (Status code: $statusCode)';
}

class UnknownException implements NetworkException {
  @override
  final String message;
  @override
  final int statusCode; 
  @override
  final Object? originalError;

  UnknownException({
    required this.message,
    this.statusCode = 0, 
    this.originalError,
  });

  @override
  String toString() => 'UnknownException: $message (Status code: $statusCode)';
}
