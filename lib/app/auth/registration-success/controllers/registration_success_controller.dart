import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:reservation/app/auth/registration-success/services/registration_success_service.dart';
import 'package:reservation/app/dashboard/screen/dashboard-screen.dart';

import '../../../../config/controllerConfig/base_controller.dart';
import '../../login/screens/login_screen.dart';

class RegistrationSuccessController extends BaseController {
  /// SERVICES
  final RegistrationSuccessService _registrationSuccessService =
      RegistrationSuccessService();

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
    Get.off(
      DashboardScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  void handleClickSignIn() async {
    Get.off(
      LoginScreen(),
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }
}
