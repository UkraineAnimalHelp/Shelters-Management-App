import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uah_shelters/src/constants/constants.dart';
import 'package:uah_shelters/src/providers/auth_provider.dart';
import 'package:uah_shelters/src/services/api/auth/firebase.dart';
import 'package:uah_shelters/src/ui/screens/home_screen.dart';
import 'package:uah_shelters/src/ui/screens/login_screen.dart';
import 'package:uah_shelters/src/ui/screens/splash_screen.dart';
//import 'package:firebase_analytics/firebase_analytics.dart';
//import 'package:firebase_analytics/observer.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        onGenerateRoute: _generateRoute,
        home: Builder(
          builder: (context) {
            // Use Future.microtask to delay navigation until after the build method completes
            Future.delayed(const Duration(seconds: 10)).then((_) {
              var authProvider =
                  Provider.of<AuthenticationProvider>(context, listen: false);
              if (authProvider.user != null) {
                Navigator.of(context).pushReplacementNamed(Routes.home);
              } else {
                Navigator.of(context).pushReplacementNamed(Routes.login);
              }
            });
            
            // Return a temporary widget until Future.microtask completes
            return const SplashScreen();
          },
        ),
    );
  }

  Route<dynamic> _generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
            builder: (_) => const HomeScreen(title: 'Flutter Demo Home Page'));
      case Routes.login:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      default:
        return MaterialPageRoute(builder: (_) => const LoginScreen());
    }
  }
}
