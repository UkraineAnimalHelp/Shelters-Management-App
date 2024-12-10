import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uah_shelters/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:uah_shelters/src/shared/constants/constants.dart';

@RoutePage()
class AuthGuardScreen extends StatelessWidget {
  const AuthGuardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBLoC, AuthState>(
      builder: (context, state) {
        return AutoRouter.declarative(
          routes: (_) => <PageRouteInfo>[
            switch (state) {
              UnauthenticatedAuthState() => const AuthNavigatorRoute(),
              AuthenticatedAuthState() => const MainFlowRoute(),
            }
          ],
        );
      },
    );
  }
}
