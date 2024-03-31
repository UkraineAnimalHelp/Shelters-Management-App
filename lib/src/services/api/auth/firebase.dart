import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:uah_shelters/src/model/employee.dart';
import 'interface.dart';

class FirebaseAuthService implements IAuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Employee _userFromFirebase(User? user) {
    return Employee(
      id: user?.uid,
      email: user?.email,
      name: user?.displayName,
    );
  }

  @override
  Future<Employee> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential userCredential =
        await _firebaseAuth.signInWithCredential(credential);
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
