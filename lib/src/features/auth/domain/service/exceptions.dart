class AuthException implements Exception {
  final String message;
  AuthException(this.message);
}

enum ExceptionType {
  emailAlreadyInUse,
  invalidEmail,
  weakPassword,
  userNotFound,
  wrongPassword,
  userDisabled,
  operationNotAllowed,
  unknown,
}
