import 'package:uah_shelters/src/features/auth/domain/service/auth_service.dart';

class AuthState {
  AuthState({
    required this.user,
    this.isLoading = false,
  });

  final AppUser? user;
  final bool isLoading;

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
