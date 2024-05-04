import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:uah_shelters/src/constants/constants.dart';

@RoutePage()
class JoinOrRegisterOrganizationScreen extends StatelessWidget {
  const JoinOrRegisterOrganizationScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    'Join or create organization',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.bold,
                      color: BaseStyle.primaryTextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          BaseStyle.primaryButtonColor, // Background color
                      foregroundColor:
                          BaseStyle.primaryButtonTextColor, // Text color
                    ),
                    onPressed: () async {
                      // AutoRouter.of(context).push(EmployeeRegistrationRoute());
                    },
                    child: const Text('Join'),
                  ),
                  const SizedBox(height: 20.0),
                  const Text(
                    'or',
                    style: TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: BaseStyle.primaryTextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20.0),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          BaseStyle.primaryButtonColor, // Background color
                      foregroundColor:
                          BaseStyle.primaryButtonTextColor, // Text color
                    ),
                    onPressed: () async {
                      AutoRouter.of(context).push(RegisterOrganizationRoute());
                    },
                    child: const Text('Create new one'),
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
