import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../config/controllerConfig/base_controller.dart';
import '../../login/screens/login_screen.dart';
import '../../verification/screens/verification_screen.dart';
import '../services/forget_password_service.dart';

class ForgetPasswordController extends BaseController {
  /// SERVICES
  final ForgetPasswordService _forgetPasswordService = ForgetPasswordService();

  /// CONTROLLERS
  TextEditingController idNumberTextEditingController = TextEditingController();

  /// VARIABLES
  RxString id = ''.obs;
  RxBool isValidForgetPassword = false.obs;

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
  void initValues() {}

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

  onChange(String value) {
    id.value = value;
  }
}
