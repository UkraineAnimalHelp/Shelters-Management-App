import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uah_shelters/di.dart';
import 'package:uah_shelters/src/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:uah_shelters/src/shared/storage/app_storage.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Organization id =  ${getIt<AppKeyValueStorage>().getOrganizationId()},',
            style: const TextStyle(fontSize: 20),
          ),
          TextButton(
            onPressed: () => context.read<AuthCubit>().logout(),
            child: const Text(
              'Logout',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }
}
