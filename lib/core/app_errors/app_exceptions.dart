class APIException implements Exception {
  final String message;
  APIException({this.message = 'API error occurred!'});
}
