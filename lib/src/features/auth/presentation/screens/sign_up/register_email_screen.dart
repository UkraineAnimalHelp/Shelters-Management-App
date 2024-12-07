import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:uah_shelters/src/shared/app_colors.dart';

@RoutePage()
class RegisterMailScreen extends StatelessWidget {
  const RegisterMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                'Create an account by entering your email and password',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w400,
                  color: AppColors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 10),
            const TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.orangeButton),
                onPressed: () {},
                child: const Text(
                  'Create account',
                  style: TextStyle(color: AppColors.white),
                ),
              ),
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
