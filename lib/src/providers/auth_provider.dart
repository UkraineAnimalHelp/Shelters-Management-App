import 'package:flutter/material.dart';
import 'package:uah_shelters/src/model/employee.dart';
import 'package:uah_shelters/src/services/api/auth/interface.dart';

class AuthenticationProvider extends ChangeNotifier {
  final IAuthService _authService;
  
  Employee? _user;

  Employee? get user => _user;

  AuthenticationProvider(this._authService);

  Future<void> signInWithGoogle() async {
    _user = await _authService.signInWithGoogle();
    notifyListeners();
  }

  Future<void> signOut() async {
    await _authService.signOut();
    _user = null;
    notifyListeners();
  }
}
