import 'package:flutter/material.dart';
import 'package:uah_shelters/src/shared/constants/constants.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    // var settingsProvider =
    //     Provider.of<SettingsProvider>(context, listen: false);

    // switch (settingsProvider.settings.appType) {
    //   case AppType.cloud:
    //     // Init cloud db singleton
    //     Repository.initialize(cloud: true);

    //     var authProvider =
    //         Provider.of<AuthenticationProvider>(context, listen: false);
    //     if (authProvider.user != null) {
    //       _appRouter.push(const HomeRoute());
    //     }
    //   case AppType.notset:
    //     _appRouter.push(const LoginRoute());
    //   default:
    //     // Init local db singleton
    //     Repository.initialize(cloud: false);

    //     _appRouter.push(const HomeRoute());
    // }
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      debugShowCheckedModeBanner: false,
    );
  }
}
