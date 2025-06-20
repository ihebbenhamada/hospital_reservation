import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inn_tech_appointment/app/auth/registration-success/screens/registration_success_screen.dart';
import 'package:inn_tech_appointment/config/colors/colors.dart';

import '../../../../config/controllerConfig/base_controller.dart';
import '../../../../config/strings/strings.dart';

class ChangePasswordController extends BaseController
    with GetSingleTickerProviderStateMixin {
  /// TEXT CONTROLLERS
  late TextEditingController oldPasswordTextEditingController;
  late TextEditingController newPasswordTextEditingController;
  late TextEditingController confirmPasswordTextEditingController;

  /// VARIABLES
  late AnimationController animationController;
  RxString passwordStrength = AppStrings.weakPassword.tr.obs;

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  /// INITIALISATION
  void initValues() {
    oldPasswordTextEditingController = TextEditingController();
    newPasswordTextEditingController = TextEditingController();
    confirmPasswordTextEditingController = TextEditingController();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    newPasswordTextEditingController.addListener(_updateStrength);
  }

  void _updateStrength() {
    String password = newPasswordTextEditingController.text;
    int strength = calculatePasswordStrength(password);
    double percentage = strength / 6.0; // Assuming a maximum strength of 4

    animationController.animateTo(percentage);
  }

  int calculatePasswordStrength(String password) {
    if (animationController.value < 0.50) {
      passwordStrength.value = AppStrings.weakPassword.tr;
    } else if (animationController.value < 0.83) {
      passwordStrength.value = AppStrings.mediumPassword.tr;
    } else {
      passwordStrength.value = AppStrings.strongPassword.tr;
    }
    return password.length;
  }

  Color getColor(double value) {
    if (value < 0.51) {
      return AppColors.primary;
    } else if (value < 0.84) {
      return AppColors.primary;
    } else {
      return AppColors.primary;
    }
  }

  @override
  void dispose() {
    newPasswordTextEditingController.dispose();
    oldPasswordTextEditingController.dispose();
    confirmPasswordTextEditingController.dispose();
    super.dispose();
  }

  /// SIGN UP METHODS
  handleClickContinue() {
    Get.to(
      () => RegistrationSuccessScreen(from: 'changePassword'),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  void handleClickBack() async {
    Get.back();
  }
}
