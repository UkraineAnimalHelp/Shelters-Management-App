import 'package:flutter/material.dart';

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
