import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uah_shelters/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:uah_shelters/src/shared/app_colors.dart';
import 'package:uah_shelters/src/shared/env_values.dart';

@RoutePage()
class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final _emailController = TextEditingController(text: Env.email);
  final _passwordController = TextEditingController(text: Env.password);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Column(
              children: [
                const Text(
                  'Enter an email and password to get started',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 25),
                TextField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
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
                    onPressed: () {
                      final email = _emailController.value.text;
                      final password = _passwordController.value.text;

                      context.read<AuthBLoC>().add(
                            AuthEvent.loginEmail(
                              email: email,
                              password: password,
                            ),
                          );
                    },
                    child: const Text(
                      'Sign In',
                      style: TextStyle(color: AppColors.white),
                    ),
                  ),
                ),
              ],
            ),
            const Spacer(),
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
