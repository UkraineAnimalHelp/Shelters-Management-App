import 'package:uah_shelters/src/models/employee.dart';

abstract class IAuthService {
  Future<Employee> signInWithGoogle();
  Future<void> signOut();
  // Stream<Employee> get authStateChanges;
}
