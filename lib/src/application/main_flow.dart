import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class MainFlow extends StatelessWidget {
  const MainFlow({super.key});

  @override
  Widget build(BuildContext context) {
    // We will add here all user related blocs.
    return const AutoRouter();
  }
}
