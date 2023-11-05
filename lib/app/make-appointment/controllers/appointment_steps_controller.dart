import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:reservation/app/make-appointment/clinic-doctor/screen/clinic_doctor_screen.dart';

import '../../../../config/controllerConfig/base_controller.dart';

class AppointmentStepsController extends BaseController {
  /// CONTROLLERS

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
    super.dispose();
  }

  /// INITIALISATION
  void initValues() {}

  /// FUNCTIONS
  handleClickMakeAppointment() {
    Get.to(
      ClinicDoctorScreen(),
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  void handleClickBack() async {
    Get.back();
  }
}
