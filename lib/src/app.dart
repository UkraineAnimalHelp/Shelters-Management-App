import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uah_shelters/di.dart';
import 'package:uah_shelters/src/features/auth/domain/service/auth_service.dart';
import 'package:uah_shelters/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:uah_shelters/src/shared/constants/constants.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthBLoC(getIt.get<AuthService>()),
      child: BlocListener<AuthBLoC, AuthState>(
        listener: (context, state) {
          switch (state) {
            case (UnauthenticatedAuthState()):
              _appRouter.replaceAll([const AuthRoute()]);

            case (AuthenticatedAuthState()):
              _appRouter.replaceAll([const StartRoute()]);

            default:
              break;
          }
        },
        child: MaterialApp.router(
          routerConfig: _appRouter.config(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
