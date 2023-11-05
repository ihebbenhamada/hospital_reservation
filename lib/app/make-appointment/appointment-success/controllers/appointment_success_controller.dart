import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:reservation/app/dashboard/screen/dashboard-screen.dart';

import '../../../../config/controllerConfig/base_controller.dart';

class AppointmentSuccessController extends BaseController {
  /// SERVICES

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
  handleClickContinue() {
    Get.offAll(
      DashboardScreen(),
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  void handleClickBack() async {
    Get.back();
  }
}
