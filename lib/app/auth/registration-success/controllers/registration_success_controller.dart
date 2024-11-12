import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:reservation/app/auth/registration-success/services/registration_success_service.dart';

import '../../../../config/controllerConfig/base_controller.dart';
import '../../login/screens/login_screen.dart';

class RegistrationSuccessController extends BaseController {
  /// SERVICES
  final RegistrationSuccessService _registrationSuccessService =
      RegistrationSuccessService();
  RxString mrn = ''.obs;
  RxString fullName = ''.obs;
  RxString phone = ''.obs;

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
  void initValues() {
    if (Get.arguments != null) {
      mrn.value = Get.arguments[0]['mrn'];
      fullName.value = Get.arguments[0]['fullName'];
      phone.value = Get.arguments[0]['phone'];
    }
  }

  /// FUNCTIONS
  handleClickContinue() {
    Get.offAll(
      () => LoginScreen(),
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
