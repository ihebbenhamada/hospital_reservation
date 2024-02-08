import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:reservation/app/auth/verification/screens/verification_screen.dart';

import '../../../../config/controllerConfig/base_controller.dart';
import '../../login/screens/login_screen.dart';
import '../services/forget_password_service.dart';

class ForgetPasswordController extends BaseController {
  /// SERVICES
  final ForgetPasswordService _forgetPasswordService = ForgetPasswordService();

  /// CONTROLLERS
  late TextEditingController idNumberTextEditingController;

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
    idNumberTextEditingController.dispose();
    super.dispose();
  }

  /// INITIALISATION
  void initValues() {
    idNumberTextEditingController = TextEditingController();
  }

  /// FUNCTIONS

  handleClickContinue() {
    Get.to(
      () => VerificationScreen(),
      transition: Transition.rightToLeft,
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
