import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uah_shelters/src/features/auth/domain/service/auth_service.dart';
import 'package:uah_shelters/src/features/auth/presentation/bloc/auth_state.dart';

// TODO(avdonin): Need add all cases for error handling
class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this._authService)
      : super(AuthState(user: _authService.currentUser)) {
    _subscription = _authService.authStream.listen(
      (user) {
        emit(state.copyWith(user: () => user));
      },
    );
  }

  final AuthService _authService;

  StreamSubscription? _subscription;

  Future<void> loginWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      emit(state.copyWith(isLoading: true));

      final user = await _authService.loginWithEmail(
        email: email,
        password: password,
      );

      emit(AuthState(user: user, isLoading: false));
    } catch (e) {
      emit(AuthState.unauthrized());

      rethrow;
    }
  }

  Future<void> signUpWithEmail({
    required String email,
    required String password,
  }) async {
    try {
      emit(state.copyWith(isLoading: true));

      final user = await _authService.signUpWithEmail(
        email: email,
        password: password,
      );

      emit(AuthState(user: user, isLoading: false));
    } catch (e) {
      emit(AuthState.unauthrized());

      rethrow;
    }
  }

  Future<void> logout() async {
    unawaited(_authService.logout());

    emit(AuthState.unauthrized());
  }

  @override
  Future<void> close() {
    _subscription?.cancel();

    return super.close();
  }
}
