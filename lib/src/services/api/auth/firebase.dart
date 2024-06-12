import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uah_shelters/src/models/auth_user.dart';
import 'package:uah_shelters/src/constants/constants.dart';
import 'interface.dart';

class FirebaseAuthService implements IAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  AuthUser _userFromFirebase(User? user) {
    return AuthUser(
      id: user?.uid,
      email: user?.email,
      name: user?.displayName,
    );
  }

  @override
  Future<AuthUser> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential userCredential;

    if (!useEmulator) {
      userCredential =
          await _firebaseAuth.signInWithCredential(credential);
    } else {
      // for testing
      userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
              email: testUserEmail, password: testUserPassword);
    }

    return _userFromFirebase(userCredential.user);
  }

  @override
  Future<void> signOut() async {
    // This needed so user can select account for Sign in,
    // in other case it would be cache the previous one
    if (await _googleSignIn.isSignedIn()) {
      await _googleSignIn.signOut();
    }
    await _firebaseAuth.signOut();
  }
}
