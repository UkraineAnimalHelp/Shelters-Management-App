import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AuthNavigatorScreen extends StatelessWidget {
  const AuthNavigatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
