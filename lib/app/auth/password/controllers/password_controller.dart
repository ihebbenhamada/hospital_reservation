import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation/app/auth/registration-success/screens/registration_success_screen.dart';
import 'package:reservation/config/colors/colors.dart';

import '../../../../config/controllerConfig/base_controller.dart';
import '../../login/screens/login_screen.dart';
import '../services/password_service.dart';

class PasswordController extends BaseController
    with GetSingleTickerProviderStateMixin {
  final PasswordService _passwordService = PasswordService();

  /// TEXT CONTROLLERS
  late TextEditingController passwordTextEditingController;
  late TextEditingController confirmPasswordTextEditingController;

  /// VARIABLES
  late AnimationController animationController;
  RxString passwordStrength = 'weak_password'.tr.obs;

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  /// INITIALISATION
  void initValues() {
    passwordTextEditingController = TextEditingController();
    confirmPasswordTextEditingController = TextEditingController();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    passwordTextEditingController.addListener(_updateStrength);
  }

  void _updateStrength() {
    String password = passwordTextEditingController.text;
    int strength = calculatePasswordStrength(password);
    double percentage = strength / 6.0; // Assuming a maximum strength of 4

    animationController.animateTo(percentage);
  }

  int calculatePasswordStrength(String password) {
    if (animationController.value < 0.50) {
      passwordStrength.value = 'weak_password'.tr;
    } else if (animationController.value < 0.83) {
      passwordStrength.value = 'medium_password'.tr;
    } else {
      passwordStrength.value = 'strong_password'.tr;
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
    passwordTextEditingController.dispose();
    confirmPasswordTextEditingController.dispose();
    super.dispose();
  }

  /// SIGN UP METHODS
  handleClickContinue() {
    Get.to(
      () => RegistrationSuccessScreen(),
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
