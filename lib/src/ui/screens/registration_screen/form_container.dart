import 'package:flutter/material.dart';
import 'package:uah_shelters/src/ui/widgets/multi_step_form.dart';
import 'package:auto_route/auto_route.dart';
import 'package:uah_shelters/src/constants/constants.dart';

class RegistrationFormContainer extends StatelessWidget {
  final void Function(BuildContext context, MultiStepFormState state) nextStep;
  final MultiStepFormState formState;
  final Widget form;

  const RegistrationFormContainer(
      {super.key,
      required this.form,
      required this.formState,
      required this.nextStep});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Create new User'),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              if (formState.activeStep > 0) {
                formState.prevStep();
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
                                onPressed: () => nextStep(context, formState),
                                child: formState.isLastStep()
                                    ? const Text('Submit')
                                    : const Text('Next step'),
                              ),
                            ]))))));
  }
}
