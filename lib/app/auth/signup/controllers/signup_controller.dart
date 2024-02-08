import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation/app/auth/verification/screens/verification_screen.dart';

import '../../../../config/controllerConfig/base_controller.dart';
import '../../login/screens/login_screen.dart';
import '../services/signup_service.dart';

class SignUpController extends BaseController {
  final SignUpService _signupService = SignUpService();

  /// TEXT CONTROLLERS
  late TextEditingController fullNameTextEditingController;
  late TextEditingController idTextEditingController;
  late TextEditingController phoneNumberTextEditingController;
  late TextEditingController mrnTextEditingController;

  /// VARIABLES

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  /// INITIALISATION
  void initValues() {
    fullNameTextEditingController = TextEditingController();
    idTextEditingController = TextEditingController();
    phoneNumberTextEditingController = TextEditingController();
    mrnTextEditingController = TextEditingController(text: '455');
  }

  @override
  void dispose() {
    fullNameTextEditingController.dispose();
    idTextEditingController.dispose();
    phoneNumberTextEditingController.dispose();
    mrnTextEditingController.dispose();
    super.dispose();
  }

  /// SIGN UP METHODS
  handleClickContinue() {
    _signupService
        .signup(
      fullName: fullNameTextEditingController.value.text,
      hawia: idTextEditingController.value.text,
      mobile: phoneNumberTextEditingController.value.text,
    )
        .then((value) {
      if (value != null) {
        print(value.fullName);
      } else {
        print('error');
      }
    });
    Get.to(
      () => VerificationScreen(),
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
