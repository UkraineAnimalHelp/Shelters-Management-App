// ignore_for_file: inference_failure_on_untyped_parameter

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uah_shelters/src/features/auth/domain/service/auth_service.dart';

part 'auth_bloc.freezed.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const AuthEvent._();

  const factory AuthEvent.init() = InitEvent;
  const factory AuthEvent.login() = LoginEvent;
  const factory AuthEvent.logout() = LogoutEvent;
}

sealed class AuthState {
  const factory AuthState.initial() = InitialAuthState;
  const factory AuthState.loading() = LoadingAuthState;
  const factory AuthState.authenticated() = AuthenticatedAuthState;
  const factory AuthState.unauthenticated() = UnauthenticatedAuthState;
}

class AuthBLoC extends Bloc<AuthEvent, AuthState> {
  AuthBLoC(this._authService) : super(const LoadingAuthState()) {
    on<InitEvent>(_handleInitEvent);
    on<LoginEvent>(_handleLoginEvent);
    on<LogoutEvent>(_handleLogoutEvent);
  }

  final AuthService _authService;

  Future<void> _handleLoginEvent(_, emit) async {
    try {
      emit(const LoadingAuthState());
      await _authService.login();

      emit(const AuthState.authenticated());
    } catch (e) {
      emit(const UnauthenticatedAuthState());
      rethrow;
    }
  }

  Future<void> _handleLogoutEvent(_, emit) async {
    _authService.logout();
    emit(const UnauthenticatedAuthState());
  }

  Future<void> _handleInitEvent(_, emit) async {
    final isAuthhoraized = _authService.currentState;
    if (isAuthhoraized) {
      emit(const AuthenticatedAuthState());
    } else {
      emit(const UnauthenticatedAuthState());
    }
  }
}

class InitialAuthState implements AuthState {
  const InitialAuthState();
}

class LoadingAuthState implements AuthState {
  const LoadingAuthState();
}

class AuthenticatedAuthState implements AuthState {
  const AuthenticatedAuthState();
}

class UnauthenticatedAuthState implements AuthState {
  const UnauthenticatedAuthState();
}
