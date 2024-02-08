import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:reservation/app/profile/change-password/screens/change_password_screen.dart';

import '../../../../config/controllerConfig/base_controller.dart';

class ProfileController extends BaseController {
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
  handleClickChangePassword() {
    Get.to(
      () => ChangePasswordScreen(),
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  handleClickChangePhone() {
    Get.to(
      () => ChangePasswordScreen(),
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  void handleClickBack() async {
    Get.back();
  }
}
