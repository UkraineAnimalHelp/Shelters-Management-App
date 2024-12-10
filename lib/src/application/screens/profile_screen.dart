import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uah_shelters/src/features/auth/presentation/bloc/auth_bloc.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: () {
          context.read<AuthBLoC>().add(const AuthEvent.logout());
        },
        child: const Text(
          'Logout',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
