import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:uah_shelters/src/shared/storage/app_storage.dart';

abstract class AuthService {
  Stream<AppUser?> get authStream;

  bool get isUserLoggedIn;

  Future<void> loginWithEmail({
    required String email,
    required String password,
  });

  Future<bool> signUpWithEmail({
    required String email,
    required String password,
    String? firstName,
    String? lastName,
  });

  void logout();

  void dispose();
}

class AuthServiceImpl implements AuthService {
  AuthServiceImpl(this._sharedPreferences);

  final AppKeyValueStorage _sharedPreferences;

  @override
  Stream<AppUser?> get authStream => FirebaseAuth.instance.userChanges().map(
        (user) {
          if (user == null) return null;
          return AppUser(
            id: user.uid,
            displayName: user.displayName,
            email: user.email,
          );
        },
      );

  @override
  Future<void> loginWithEmail({
    required String email,
    required String password,
  }) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
  }

  @override
  Future<void> logout() async {
    await _sharedPreferences.clear();
    await FirebaseAuth.instance.signOut();
  }

  @override
  void dispose() {}

  @override
  bool get isUserLoggedIn => FirebaseAuth.instance.currentUser != null;

  @override
  Future<bool> signUpWithEmail({
    required String email,
    required String password,
    String? firstName,
    String? lastName,
  }) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    FirebaseAuth.instance.currentUser
        ?.updateDisplayName([firstName, lastName].join(' '));

    return true;
  }
}

class AppUser {
  AppUser({
    required this.id,
    this.email,
    this.displayName,
  });

  final String? id;
  final String? displayName;
  final String? email;
}
