class AuthError implements Exception {
  final String message;

  AuthError(this.message);

  @override
  String toString() => 'AuthError: $message';
}
