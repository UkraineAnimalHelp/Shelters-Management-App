import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:uah_shelters/src/shared/app_colors.dart';
import 'package:uah_shelters/src/shared/constants/constants.dart';

@RoutePage()
class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Column(
              children: [
                const Text(
                  'Animals & shelters management',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 12),
                const Text(
                  'Manage your animal patients with ease',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 60),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.orangeButton),
                    onPressed: () {},
                    child: const Text(
                      'Sign in with Google',
                      style: TextStyle(color: AppColors.white),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    context.pushRoute(const SignInRoute());
                  },
                  child: const Text(
                    'Sign in with email',
                    style: TextStyle(color: AppColors.orangeButton),
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                    color: AppColors.grey,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpPage()),
                    );
                  },
                  child: const Text(
                    'Sign Up here',
                    style: TextStyle(
                      color: AppColors.orangeButton,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text('Sign-Up Page (To Be Implemented)'),
      ),
    );
  }
}
