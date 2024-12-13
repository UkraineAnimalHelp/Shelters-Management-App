import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:uah_shelters/di.dart';
import 'package:uah_shelters/src/shared/app_colors.dart';
import 'package:uah_shelters/src/shared/storage/app_storage.dart';

@RoutePage()
class OrganizationScreen extends StatelessWidget {
  OrganizationScreen({this.onOrganizationCreated, super.key});

  final VoidCallback? onOrganizationCreated;

  final _organizationController = TextEditingController();

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
                  'Create an organization',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 30),
                TextField(
                  controller: _organizationController,
                  decoration: const InputDecoration(
                    labelText: 'Organization name',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 50),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.orange),
                    onPressed: () async {
                      final organizationId = _organizationController.value.text;
                      await getIt<AppKeyValueStorage>()
                          .setOrganizationId(organizationId);

                      onOrganizationCreated?.call();
                    },
                    child: const Text(
                      'Create',
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
