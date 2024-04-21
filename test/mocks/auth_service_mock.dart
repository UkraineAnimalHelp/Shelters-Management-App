import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in_mocks/google_sign_in_mocks.dart';
import 'package:mockito/mockito.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:uah_shelters/src/services/api/auth/interface.dart';
import 'package:uah_shelters/src/models/auth_user.dart';

// A Mock class using Mockito package
class MockFirebaseAuthService extends Mock implements IAuthService {
  final googleSignIn = MockGoogleSignIn();
  late final MockFirebaseAuth firebaseAuth;

  @override
  Future<AuthUser> signInWithGoogle() async {
    final signinAccount = await googleSignIn.signIn();
    final googleAuth = await signinAccount?.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    // Sign in.
    final user = MockUser(
      isAnonymous: false,
      uid: 'someuid',
      email: 'tester@uah.fund',
      displayName: 'Tester',
    );
    final firebaseAuth = MockFirebaseAuth(mockUser: user);
    final result = await firebaseAuth.signInWithCredential(credential);
    final firebaseUser = result.user;

    return AuthUser(
      id: firebaseUser?.uid, 
      name: firebaseUser?.displayName, 
      email: firebaseUser?.email);
  }

  @override
  Future<void> signOut() async {
    await googleSignIn.signOut();
    await firebaseAuth.signOut();
  }
}
