import 'package:uah_shelters/src/features/auth/domain/service/auth_service.dart';
import 'package:uah_shelters/src/features/auth/domain/service/exceptions.dart';

class AuthState {
  AuthState({
    required this.user,
    this.isLoading = false,
    this.exception,
  });

  final AppUser? user;
  final bool isLoading;
  final AuthException? exception;

  AuthState copyWith({
    AppUser? Function()? user,
    bool? isLoading,
  }) {
    return AuthState(
      user: user != null ? user() : this.user,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  factory AuthState.unauthrized() {
    return AuthState(user: null, isLoading: false);
  }

  factory AuthState.loading() {
    return AuthState(user: null, isLoading: true);
  }

  factory AuthState.authrized(AppUser user) {
    return AuthState(user: user, isLoading: false);
  }

  factory AuthState.error() {
    return AuthState(
      user: null,
      isLoading: false,
      exception: AuthException('Exception during auth'),
    );
  }
}
