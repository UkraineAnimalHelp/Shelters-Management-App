import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';
import 'package:uah_shelters/src/constants/app_router.gr.dart';
import 'package:uah_shelters/src/models/employee.dart';
import 'package:uah_shelters/src/providers/auth_provider.dart';
import 'package:uah_shelters/src/providers/settings_provider.dart';
import 'package:uah_shelters/src/repository/shelter_repository.dart';
import 'package:uah_shelters/src/models/settings.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Capture the ScaffoldMessenger outside the async gap
    final scaffoldMessenger = ScaffoldMessenger.of(context);

    print("BUILD: Login");

    final settingsProvider =
        Provider.of<SettingsProvider>(context, listen: false);

    var settings = settingsProvider.settings;

    if (settings.isFirstAppLoad == false && settings.appType == AppType.local) {
      print("Login screen: go home1");
      // as we dont need to login now, we should skip login screen
      AutoRouter.of(context).replaceAll([
        const HomeRoute(),
      ]);
      return Container();
    }

    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);

    Future<void> updateSettings(AppType type) async {
      if (settings.isFirstAppLoad == true) {
        // settings.isFirstAppLoad = false;
        settings.appType = type;
        await settingsProvider.update(settings);
      }
    }

    const backgroundColor = Colors.white;
    const textColor = Colors.black;
    const buttonColor = Color(0xFFFF6B00); // Example orange color
    const buttonTextColor = Colors.white;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.sizeOf(context).width * 0.05),
          child: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 700.0, // Set the maximum width here
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Text(
                    'Animals & shelters management',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: textColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48.0),
                  if (settings.isCloud)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: buttonColor, // Background color
                        foregroundColor: buttonTextColor, // Text color
                      ),
                      onPressed: () async {
                        try {
                          await authProvider.signInWithGoogle();
                          // After successful sign-in, the state change will automatically
                          // be handled by the provider's listener in MyApp
                          if (authProvider.user != null) {
                            await updateSettings(AppType.cloud);
                            Employee? e = await ShelterRepository.instance
                                .getOneEmployee(authProvider.user!.id!);
                            if (e == null) {
                              // ignore: use_build_context_synchronously
                              AutoRouter.of(context)
                                  .push(EmployeeRegistrationRoute());
                            } else {
                              // ignore: use_build_context_synchronously
                              AutoRouter.of(context).replaceAll([
                                const HomeRoute(),
                              ]);
                            }
                          }
                        } catch (e) {
                          print(e);
                          scaffoldMessenger.showSnackBar(
                            SnackBar(
                              content:
                                  Text('Failed to sign in with Google: $e'),
                              duration: const Duration(seconds: 10),
                            ),
                          );
                        }
                      },
                      child: const Text('Sign in with Google'),
                    ),
                  const SizedBox(height: 8.0),
                  if (settings.isLocal)
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: textColor, // Text color
                      ),
                      onPressed: () async {
                        await updateSettings(AppType.local);
                        print("Login screen: go home local");
                        // as we dont need to login now, we should skip login screen
                        // ignore: use_build_context_synchronously
                        AutoRouter.of(context).replaceAll([
                          const HomeRoute(),
                        ]);
                      },
                      child: const Text('Use local version'),
                    ),
                  const SizedBox(height: 24.0),
                  TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: textColor, // Text color
                    ),
                    onPressed: () {
                      // Handle "Sign Up" action
                    },
                    child: const Text("Don't have an account? Sign Up here"),
                  ),
                  const SizedBox(height: 24.0),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
