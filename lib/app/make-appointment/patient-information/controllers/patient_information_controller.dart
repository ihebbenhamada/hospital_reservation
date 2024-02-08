import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation/app/make-appointment/appointment-success/screens/appointment_success_screen.dart';

import '../../../../config/controllerConfig/base_controller.dart';

class PatientInformationController extends BaseController {
  /// CONTROLLERS
  late TextEditingController mrnTextEditingController;
  late TextEditingController serialTextEditingController;
  late TextEditingController patientNameTextEditingController;
  late TextEditingController doctorNameTextEditingController;
  late TextEditingController mobileTextEditingController;
  late TextEditingController dateTextEditingController;

  /// VARIABLES

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  @override
  void dispose() {
    mrnTextEditingController.dispose();
    serialTextEditingController.dispose();
    patientNameTextEditingController.dispose();
    doctorNameTextEditingController.dispose();
    mobileTextEditingController.dispose();
    dateTextEditingController.dispose();
    super.dispose();
  }

  /// INITIALISATION
  void initValues() {
    mrnTextEditingController = TextEditingController();
    serialTextEditingController = TextEditingController();
    patientNameTextEditingController = TextEditingController();
    doctorNameTextEditingController = TextEditingController();
    mobileTextEditingController = TextEditingController();
    dateTextEditingController = TextEditingController();
  }

  /// FUNCTIONS
  handleClickConfirm() {
    Get.to(
      () => AppointmentSuccessScreen(),
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  void handleClickBack() async {
    Get.back();
  }
}
