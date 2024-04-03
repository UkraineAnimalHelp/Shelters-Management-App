import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';
import 'package:uah_shelters/src/constants/app_router.gr.dart';
import 'package:uah_shelters/src/providers/auth_provider.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Access the AuthenticationProvider using Provider
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);

    // Capture the ScaffoldMessenger outside the async gap
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            try {
              await authProvider.signInWithGoogle();
              // After successful sign-in, the state change will automatically
              // be handled by the provider's listener in MyApp
              if (authProvider.user != null) {
                AutoRouter.of(context).push(const HomeRoute());
                // Navigator.pushReplacementNamed(context, Routes.home);
              }
            } catch (e) {
              scaffoldMessenger.showSnackBar(
                SnackBar(
                  content: Text('Failed to sign in with Google: $e'),
                  duration: const Duration(seconds: 3),
                ),
              );
            }
          },
          child: const Text('Sign in with Google'),
        ),
      ),
    );
  }
}
