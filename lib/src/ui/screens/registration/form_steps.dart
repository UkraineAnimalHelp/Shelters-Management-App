import 'package:flutter/material.dart';
import 'package:uah_shelters/src/shared/constants/constants.dart';
import 'package:uah_shelters/src/ui/widgets/multi_step_form.dart';
import 'package:uah_shelters/src/ui/widgets/pickable_avatar.dart';
import 'package:uah_shelters/src/utils/validators.dart';
import 'form_data.dart';

List<FormStep> formSteps(EmployeeFormData employee) {
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
          key: const Key("firstName"),
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
          key: const Key("lastName"),
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
          key: const Key("phone"),
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
          key: const Key("linkedinLink"),
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
