import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:uah_shelters/src/shared/storage/app_storage.dart';

abstract class AuthService {
  Stream<bool> get authStream;

  bool get currentState;

  Future<void> login();

  void logout();

  void dispose();
}

class AuthServiceImpl implements AuthService {
  AuthServiceImpl(this._sharedPreferences) {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      _controller.add(user == null);
    });
  }

  final AppKeyValueStorage _sharedPreferences;

  final _controller = StreamController<bool>.broadcast();

  @override
  Stream<bool> get authStream => _controller.stream;

  @override
  Future<void> login() async {
    // TODO(avdonin): for future use
    await Future.delayed(const Duration(seconds: 2), () {});
    _controller.add(true);
  }

  @override
  Future<void> logout() async {
    await _sharedPreferences.clear();
    await FirebaseAuth.instance.signOut();
    _controller.add(false);
  }

  @override
  void dispose() {
    _controller.close();
  }

  @override
  bool get currentState => FirebaseAuth.instance.currentUser != null;
}
