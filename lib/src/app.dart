import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:uah_shelters/src/constants/app_router.gr.dart';
import 'package:uah_shelters/src/models/settings.dart';
import 'package:uah_shelters/src/providers/auth_provider.dart';
import 'package:uah_shelters/src/providers/settings_provider.dart';
import 'package:uah_shelters/src/constants/constants.dart';
//import 'package:firebase_analytics/firebase_analytics.dart';
//import 'package:firebase_analytics/observer.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 0)).then((_) {
      print("APP INIT");
      var settingsProvider =
          Provider.of<SettingsProvider>(context, listen: false);

      switch (settingsProvider.settings.appType) {
        case AppType.cloud:
          var authProvider =
              Provider.of<AuthenticationProvider>(context, listen: false);
          if (authProvider.user != null) {
            print("main screen: go home1");
            _appRouter.push(const HomeRoute());
          }
        case AppType.notset:

            print("main screen: go login");
          _appRouter.push(const LoginRoute());
        default:

            print("main screen: go home defeult");
          _appRouter.push(const HomeRoute());
      }

      FlutterNativeSplash.remove();
    });

    return MaterialApp.router(
      routerConfig: _appRouter.config(),
    );
  }
}
