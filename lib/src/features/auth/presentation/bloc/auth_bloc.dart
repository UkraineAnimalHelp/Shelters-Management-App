// ignore_for_file: inference_failure_on_untyped_parameter

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uah_shelters/src/features/auth/domain/service/auth_service.dart';

part 'auth_bloc.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const AuthEvent._();

  const factory AuthEvent.init() = InitEvent;
  const factory AuthEvent.signUpEmail({
    required String email,
    required String password,
  }) = SignUpEmailEvent;
  const factory AuthEvent.loginEmail({
    required String email,
    required String password,
  }) = LoginEmailEvent;
  const factory AuthEvent.logout() = LogoutEvent;
}

sealed class AuthState {
  // const factory AuthState.initial() = InitialAuthState;
  // const factory AuthState.loading() = LoadingAuthState;
  const factory AuthState.authenticated() = AuthenticatedAuthState;
  const factory AuthState.unauthenticated() = UnauthenticatedAuthState;
}

class AuthBLoC extends Bloc<AuthEvent, AuthState> {
  AuthBLoC(this._authService) : super(const UnauthenticatedAuthState()) {
    // TODO(avdonin): [] add subscription

    _authService.authStream.listen(
      (user) => add(const AuthEvent.init()),
    );

    on<InitEvent>(_onInitEvent);
    on<LoginEmailEvent>(_onLoginEmailEvent);
    on<LogoutEvent>(_onLogoutEvent);
    on<SignUpEmailEvent>(_onSignUpEmail);
  }

  final AuthService _authService;

  Future<void> _onLoginEmailEvent(LoginEmailEvent event, emit) async {
    try {
      // emit(const LoadingAuthState());
      await _authService.loginWithEmail(
        email: event.email,
        password: event.password,
      );

      emit(const AuthState.authenticated());
    } catch (e) {
      emit(const UnauthenticatedAuthState());
      rethrow;
    }
  }

  Future<void> _onSignUpEmail(SignUpEmailEvent event, emit) async {
    try {
      //emit(const LoadingAuthState());

      await _authService.signUpWithEmail(
        email: event.email,
        password: event.password,
      );

      emit(const AuthState.authenticated());
    } catch (e) {
      emit(const UnauthenticatedAuthState());
      rethrow;
    }
  }

  Future<void> _onLogoutEvent(_, emit) async {
    _authService.logout();
  }

  Future<void> _onInitEvent(_, emit) async {
    final isAuthhoraized = _authService.isUserLoggedIn;
    if (isAuthhoraized) {
      emit(const AuthenticatedAuthState());
    } else {
      emit(const UnauthenticatedAuthState());
    }
  }
}

// class InitialAuthState implements AuthState {
//   const InitialAuthState();
// }

// class LoadingAuthState implements AuthState {
//   const LoadingAuthState();
// }

class AuthenticatedAuthState implements AuthState {
  const AuthenticatedAuthState();
}

class UnauthenticatedAuthState implements AuthState {
  const UnauthenticatedAuthState();
}
