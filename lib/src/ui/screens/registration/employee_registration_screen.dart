import 'dart:io';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';
import 'package:uah_shelters/src/constants/constants.dart';
import 'package:uah_shelters/src/models/employee.dart';
import 'package:uah_shelters/src/providers/auth_provider.dart';
import 'package:uah_shelters/src/ui/widgets/multi_step_form.dart';
import 'package:uah_shelters/src/repository/org_repository.dart';
import 'form_data.dart';
import 'form_container.dart';
import 'form_steps.dart';

@RoutePage()
class EmployeeRegistrationScreen extends StatelessWidget {
  EmployeeRegistrationScreen({super.key});

  final EmployeeFormData employee = EmployeeFormData();

  void _nextStep(BuildContext context, MultiStepFormState state) {
    if (state.isLastStep()) {
      _submit(context, state);
    } else {
      if (state.validate()) {
        state.save();
        state.nextStep();
      }
    }
  }

  Future<void> _submit(BuildContext context, MultiStepFormState state) async {
    if (state.validate()) {
      final authProvider =
          Provider.of<AuthenticationProvider>(context, listen: false);
      final repo = OrgRepository.instance;
      final scaffoldMessenger = ScaffoldMessenger.of(context);
      final router = AutoRouter.of(context);

      state.save();
      var model = Employee(
          uuid: authProvider.user!.id ?? "",
          firstName: employee.firstNameController.text,
          lastName: employee.lastNameController.text,
          photoPath: employee.photoController.text,
          email: authProvider.user!.email ?? "",
          phones: [employee.phoneController.text,],
          links: [employee.linkController.text],
          isOwner: false);

      try {
        var path = await repo.updateEmployeePhoto(model.uuid, File(model.photoPath));
        model.photoPath = path;
        await repo.addEmployee(model);
      } catch (e) {
        scaffoldMessenger.showSnackBar(
          SnackBar(
            content: Text('Failed to create new user: $e'),
            duration: const Duration(seconds: 10),
          ),
        );
        return;
      }
   
      router.replaceAll([
        const JoinOrRegisterOrganizationRoute(),
      ]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiStepForm(
      children: formSteps(employee),
      buildContainer: (state, form) => RegistrationFormContainer(
          form: form, formState: state, nextStep: _nextStep),
    );
  }

  void dispose() {
    employee.dispose();
  }
}
