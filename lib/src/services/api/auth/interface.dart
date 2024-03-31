import 'package:uah_shelters/src/model/employee.dart';

abstract class IAuthService {
  Future<Employee> signInWithGoogle();
  Future<void> signOut();
  // Stream<Employee> get authStateChanges;
}
