class Env {
  static String get email => const String.fromEnvironment('EMAIL');
  static String get password => const String.fromEnvironment('PASSWORD');
}
