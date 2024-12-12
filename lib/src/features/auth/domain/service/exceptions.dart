class AuthExceptions implements Exception {
  final String message;
  AuthExceptions(this.message);
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
