import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uah_shelters/src/features/auth/domain/service/auth_service.dart';
import 'package:uah_shelters/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:uah_shelters/src/shared/constants/constants.dart';

@RoutePage()
class AuthGuard extends StatelessWidget {
  const AuthGuard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<AuthBLoC, AuthState, AppUser?>(
      selector: (state) => state.user,
      builder: (context, user) {
        return AutoRouter.declarative(
          routes: (_) => [user == null ? const AuthFlow() : const MainFlow()],
        );
      },
    );
  }
}
