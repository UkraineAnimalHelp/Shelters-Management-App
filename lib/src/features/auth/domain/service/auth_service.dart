import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:uah_shelters/src/shared/storage/app_storage.dart';

abstract class AuthService {
  Stream<AppUser?> get authStream;

  bool get isUserLoggedIn;

  AppUser? get currentUser;

  Future<AppUser> loginWithEmail({
    required String email,
    required String password,
  });

  Future<AppUser> signUpWithEmail({
    required String email,
    required String password,
    String? firstName,
    String? lastName,
  });

  Future<void> logout();

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
  Future<AppUser> loginWithEmail({
    required String email,
    required String password,
  }) async {
    final user = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((creds) => creds.user);

    if (user == null) throw Exception("User can't be null");

    return AppUser(id: user.uid);
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
  Future<AppUser> signUpWithEmail({
    required String email,
    required String password,
    String? firstName,
    String? lastName,
  }) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

    FirebaseAuth.instance.currentUser
        ?.updateDisplayName([firstName, lastName].join(' '));

    final user = currentUser;

    if (user == null) throw Exception("User can't be null");

    return user;
  }

  @override
  AppUser? get currentUser => AppUser.from(FirebaseAuth.instance.currentUser);
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

  static AppUser? from(User? user) {
    if (user == null) return null;

    return AppUser(
      id: user.uid,
      displayName: user.displayName,
      email: user.email,
    );
  }
}
