import 'package:flutter/material.dart';

class FormStep extends StatelessWidget {
  const FormStep({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}

class MultiStepForm extends StatefulWidget {
  const MultiStepForm({
    super.key,
    required this.children,
    required this.buildContainer,
  });

  final Widget Function(MultiStepFormState state, Widget form) buildContainer;
  final List<FormStep> children;

  @override
  MultiStepFormState createState() => MultiStepFormState();
}

class MultiStepFormState extends State<MultiStepForm> {
  late List<GlobalKey<FormState>> keys;
  late int activeStep;

  void nextStep() {
    setState(() {
      activeStep++;
    });
  }

  void prevStep() {
    if (activeStep > 0) {
      setState(() {
        activeStep--;
      });
    }
  }

  bool validate() {
    return keys[activeStep].currentState!.validate();
  }

  bool isLastStep() {
    return activeStep == (widget.children.length - 1);
  }

  void save() {
    return keys[activeStep].currentState!.save();
  }


  @override
  void initState() {
    super.initState();
    activeStep = 0;
    keys = List<GlobalKey<FormState>>.generate(
        widget.children.length, (index) => GlobalKey<FormState>());
  }

  @override
  Widget build(BuildContext context) {
    return widget.buildContainer(this, Form(
      key: keys[activeStep],
      child: widget.children[activeStep],
    ));
  }
}
