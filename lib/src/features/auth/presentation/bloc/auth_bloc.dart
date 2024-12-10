// ignore_for_file: public_member_api_docs, sort_constructors_first
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

class AuthState {
  AuthState({
    required this.user,
    this.isLoading = false,
  });

  final AppUser? user;
  final bool isLoading;

  factory AuthState.loggedOut() {
    return AuthState(user: null);
  }

  AuthState copyWith({
    AppUser? Function()? user,
    bool? isLoading,
  }) {
    return AuthState(
      user: user != null ? user() : this.user,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}

class AuthBLoC extends Bloc<AuthEvent, AuthState> {
  AuthBLoC(this._authService)
      : super(AuthState(user: _authService.currentUser)) {
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
      emit(state.copyWith(isLoading: true));

      final user = await _authService.loginWithEmail(
        email: event.email,
        password: event.password,
      );

      emit(AuthState(user: user, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, user: () => null));

      rethrow;
    }
  }

  Future<void> _onSignUpEmail(SignUpEmailEvent event, emit) async {
    try {
      emit(state.copyWith(isLoading: true));

      final user = await _authService.signUpWithEmail(
        email: event.email,
        password: event.password,
      );

      emit(AuthState(user: user, isLoading: false));
    } catch (e) {
      emit(state.copyWith(isLoading: false, user: () => null));
      rethrow;
    }
  }

  Future<void> _onLogoutEvent(_, emit) async {
    _authService.logout();
  }

  Future<void> _onInitEvent(_, emit) async {
    final user = _authService.currentUser;
    emit(state.copyWith(user: () => user));
  }
}
