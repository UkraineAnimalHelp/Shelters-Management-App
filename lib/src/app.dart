import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';
import 'package:uah_shelters/src/constants/app_router.gr.dart';
import 'package:uah_shelters/src/providers/auth_provider.dart';
import 'package:uah_shelters/src/constants/constants.dart';
//import 'package:firebase_analytics/firebase_analytics.dart';
//import 'package:firebase_analytics/observer.dart';

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2)).then((_) {
      var authProvider =
          Provider.of<AuthenticationProvider>(context, listen: false);
      if (authProvider.user != null) {
        print("LOGGED IN");
        _appRouter.push(const HomeRoute());
      } 
      FlutterNativeSplash.remove();
    });

    return MaterialApp.router(
      routerConfig: _appRouter.config(),
    );
  }
}
