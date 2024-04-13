import 'package:uah_shelters/src/models/auth_user.dart';

abstract class IAuthService {
  Future<AuthUser> signInWithGoogle();
  Future<void> signOut();
}
