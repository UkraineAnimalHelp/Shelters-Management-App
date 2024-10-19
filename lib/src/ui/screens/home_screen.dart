import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';
import 'package:uah_shelters/src/routing/app_router.gr.dart';
import 'package:uah_shelters/src/providers/auth_provider.dart';
import 'package:uah_shelters/src/providers/settings_provider.dart';

@RoutePage()
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    final settingsProvider =
        Provider.of<SettingsProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        actions: [
          if (settingsProvider.settings.isCloud)
            IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () async {
                await authProvider.signOut();
                // ignore: use_build_context_synchronously
                AutoRouter.of(context).replaceAll([
                  const LoginRoute(),
                ]);
              },
            ),
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Animal Manager"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Existing routes'),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                context.pushRoute(const LoginRoute());
              },
              label: const Text('go to LoginRoute'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                context.pushRoute(EmployeeRegistrationRoute());
              },
              label: const Text('go to EmployeeRegistrationRoute'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                context.pushRoute(const JoinOrRegisterOrganizationRoute());
              },
              label: const Text('go to JoinOrRegisterOrganizationRoute'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                context.pushRoute(RegisterOrganizationRoute());
              },
              label: const Text('go to RegisterOrganizationRoute'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                context.pushRoute(const JoinOrganizationRoute());
              },
              label: const Text('go to JoinOrganizationRoute'),
            )
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
