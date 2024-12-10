import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uah_shelters/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:uah_shelters/src/shared/constants/constants.dart';
import 'package:uah_shelters/src/ui/screens/start_page.dart';

@RoutePage()
class MainFlowScreen extends StatelessWidget {
  const MainFlowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBLoC, AuthState>(
      builder: (context, state) {
        return const AutoRouter();
      },
    );
  }
}
