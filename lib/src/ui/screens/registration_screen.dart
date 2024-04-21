import 'dart:io';
import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:provider/provider.dart';
import 'package:uah_shelters/src/constants/constants.dart';
import 'package:uah_shelters/src/models/employee.dart';
import 'package:uah_shelters/src/providers/auth_provider.dart';
import 'package:uah_shelters/src/ui/widgets/multi_step_form.dart';
import 'package:uah_shelters/src/ui/widgets/pickable_avatar.dart';
import 'package:uah_shelters/src/utils/validators.dart';
import 'package:uah_shelters/src/repository/shelter_repository.dart';

class EmployeeFormData {
  TextEditingController firstNameController;
  TextEditingController lastNameController;
  TextEditingController phoneController;
  TextEditingController linkController;
  TextEditingController photoController;

  EmployeeFormData()
      : firstNameController = TextEditingController(),
        lastNameController = TextEditingController(),
        phoneController = TextEditingController(),
        linkController = TextEditingController(),
        photoController = TextEditingController();

  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    phoneController.dispose();
    linkController.dispose();
    photoController.dispose();
  }
}

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
      final repo = ShelterRepository.instance;

      state.save();
      var model = Employee(
          uuid: authProvider.user!.id ?? "",
          firstName: employee.firstNameController.text,
          lastName: employee.lastNameController.text,
          photoPath: employee.photoController.text,
          email: authProvider.user!.email ?? "",
          isOwner: false);

      await repo.addEmployee(model);
      await repo.setEmployeePhoto(model, File(model.photoPath));
      // ignore: use_build_context_synchronously
      AutoRouter.of(context).replaceAll([
        const HomeRoute(),
      ]);
    }
  }

  Widget buildFormContainer(
      BuildContext context, MultiStepFormState state, Widget form) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create new User'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              if (state.activeStep > 0) {
                state.prevStep();
              } else {
                context.back();
              }
            },
          ),
        ),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width * 0.05),
                child: Center(
                    child: ConstrainedBox(
                        constraints: const BoxConstraints(
                          maxWidth: 700.0, // Set the maximum width here
                        ),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              form,
                              const SizedBox(height: 48.0),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: BaseStyle.primaryButtonColor,
                                  foregroundColor:
                                      BaseStyle.primaryButtonTextColor,
                                ),
                                onPressed: () => _nextStep(context, state),
                                child: state.isLastStep()
                                    ? const Text('Submit')
                                    : const Text('Next step'),
                              ),
                            ]))))));
  }

  List<FormStep> _getSteps() {
    return [
      FormStep(
        child: Column(children: [
          const Text(
            'Introduce youreself',
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              color: BaseStyle.primaryTextColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48.0),
          TextFormField(
            controller: employee.firstNameController,
            validator: (value) => value != null && value.runes.length > 2
                ? null
                : 'Enter a valid first name',
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter your first name',
            ),
          ),
          const SizedBox(height: 48.0),
          TextFormField(
            controller: employee.lastNameController,
            validator: (value) => value != null && value.runes.length > 2
                ? null
                : 'Enter a valid last name',
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter your last name',
            ),
          )
        ]),
      ),
      FormStep(
        child: Column(children: [
          const Text(
            'Leave some contact information',
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              color: BaseStyle.primaryTextColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48.0),
          TextFormField(
            controller: employee.phoneController,
            validator: (value) => isPhone(value!.trim())
                ? null
                : 'Enter a valid phone (Example: +380632223344)',
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter phone number',
            ),
          ),
          const SizedBox(height: 48.0),
          TextFormField(
            controller: employee.linkController,
            validator: (value) => isLink(value!.trim())
                ? null
                : 'Enter a valid linkedin link (Example: linkedin.com/in/creotiv/)',
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Enter your linkedin link',
            ),
          )
        ]),
      ),
      FormStep(
          child: Column(children: [
        const Text(
          'Add your profile photo',
          style: TextStyle(
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
            color: BaseStyle.primaryTextColor,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 48.0),
        AvatarPicker(controller: employee.photoController)
      ]))
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MultiStepForm(
      children: _getSteps(),
      buildContainer: (state, form) => buildFormContainer(context, state, form),
    );
  }

  void dispose() {
    employee.dispose();
  }
}
