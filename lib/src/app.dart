import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:uah_shelters/src/models/settings.dart';
import 'package:uah_shelters/src/providers/auth_provider.dart';
import 'package:uah_shelters/src/providers/settings_provider.dart';
import 'package:uah_shelters/src/constants/constants.dart';
import 'package:uah_shelters/src/repository/repository.dart';
//import 'package:firebase_analytics/firebase_analytics.dart';
//import 'package:firebase_analytics/observer.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 0)).then((_) {
      var settingsProvider =
          Provider.of<SettingsProvider>(context, listen: false);

      switch (settingsProvider.settings.appType) {
        case AppType.cloud:
          // Init cloud db singleton
          Repository.initialize(cloud: true);

          var authProvider =
              Provider.of<AuthenticationProvider>(context, listen: false);
          if (authProvider.user != null) {
            _appRouter.push(const HomeRoute());
          }
        case AppType.notset:
          _appRouter.push(const LoginRoute());
        default:
          // Init local db singleton
          Repository.initialize(cloud: false);

          _appRouter.push(const HomeRoute());
      }

      FlutterNativeSplash.remove();
    });

    return MaterialApp.router(
      routerConfig: _appRouter.config(),
    );
  }
}
