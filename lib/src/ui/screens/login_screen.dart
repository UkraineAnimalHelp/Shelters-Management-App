// TODO(avdonin): revisit, deprecated
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';
import 'package:uah_shelters/src/shared/constants/constants.dart';
import 'package:uah_shelters/src/models/employee.dart';
import 'package:uah_shelters/src/providers/auth_provider.dart';
import 'package:uah_shelters/src/providers/settings_provider.dart';
import 'package:uah_shelters/src/models/settings.dart';
import 'package:uah_shelters/src/repository/repository.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Capture the ScaffoldMessenger outside the async gap
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    final router = AutoRouter.of(context);

    final settingsProvider =
        Provider.of<SettingsProvider>(context, listen: false);

    var settings = settingsProvider.settings;

    if (settings.isFirstAppLoad == false && settings.appType == AppType.local) {
      // as we dont need to login now, we should skip login screen
      router.replaceAll([
        const HomeRoute(),
      ]);
      return Container();
    }

    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);

    Future<void> updateSettings(AppType type) async {
      if (settings.isFirstAppLoad == true) {
        settings.isFirstAppLoad = false;
        settings.appType = type;
        await settingsProvider.update(settings);
      }
    }

    void nextCloudScreen(BuildContext context) async {
      try {
        // for tests
        Repository.initialize(cloud: true);
        await authProvider.signInWithGoogle();
      } catch (e) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Failed to sign in with Google: $e'),
            duration: const Duration(seconds: 10),
          ),
        );
        return null;
      }

      // After successful sign-in, the state change will automatically
      // be handled by the provider's listener in MyApp
      if (authProvider.user != null) {
        await updateSettings(AppType.cloud);
        Employee? e =
            await Repository.org().getOneEmployee(authProvider.user!.id!);

        if (e == null) {
          router.push(EmployeeRegistrationRoute());
        } else if (e.accountUUID == null) {
          router.push(const JoinOrRegisterOrganizationRoute());
        } else {
          router.replaceAll([
            const HomeRoute(),
          ]);
        }
      }
    }

    void nextLocalScreen(BuildContext context) async {
      try {
        // for tests
        Repository.initialize(cloud: false);
      } catch (e) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Failed to init local storage: $e'),
            duration: const Duration(seconds: 10),
          ),
        );
        return null;
      }

      var repo = Repository.org();
      await updateSettings(AppType.local);
      await repo.createLocalEmployee();
      // ignore: use_build_context_synchronously
      router.replaceAll([
        const HomeRoute(),
      ]);
    }

    return Scaffold(
      backgroundColor: BaseStyle.backgroundColor,
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
                      color: BaseStyle.primaryTextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48.0),
                  if (settings.isCloud)
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            BaseStyle.primaryButtonColor, // Background color
                        foregroundColor:
                            BaseStyle.primaryButtonTextColor, // Text color
                      ),
                      onPressed: () async {
                        nextCloudScreen(context);
                      },
                      child: const Text('Sign in with Google'),
                    ),
                  const SizedBox(height: 8.0),
                  if (settings.isLocal)
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor:
                            BaseStyle.primaryTextColor, // Text color
                      ),
                      onPressed: () async {
                        nextLocalScreen(context);
                      },
                      child: const Text('Use local version'),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
