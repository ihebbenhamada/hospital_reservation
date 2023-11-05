import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reservation/app/dashboard/screen/dashboard-screen.dart';

import '../../../../config/controllerConfig/base_controller.dart';
import '../../signup/screens/signup_screen.dart';
import '../services/login_service.dart';

class LoginController extends BaseController {
  /// SERVICES
  final LoginService _loginService = LoginService();

  /// TEXT CONTROLLERS
  late TextEditingController idTextEditingController;
  late TextEditingController passwordTextEditingController;

  /// VARIABLES
  late bool enabled;
  late bool isPasswordVisible;

  /// VALIDATION
  late bool isIdError;
  late String idErrorText;
  late GetStorage storage;

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  @override
  void dispose() {
    idTextEditingController.dispose();
    passwordTextEditingController.dispose();
    super.dispose();
  }

  /// INITIALISATION
  void initValues() {
    idTextEditingController = TextEditingController();
    passwordTextEditingController = TextEditingController();
    idErrorText = "invalid_email";
    isIdError = false;
    isPasswordVisible = false;
    enabled = false;
    storage = GetStorage();
  }

  /// FUNCTIONS
  showHidePassword() {
    isPasswordVisible = !isPasswordVisible;
    update();
  }

  validateEmail() {
    isIdError = !GetUtils.isEmail(idTextEditingController.value.text);
    enableLoginButton();
  }

  validatePassword() {
    enableLoginButton();
  }

  enableLoginButton() {
    enabled = !isIdError &&
        idTextEditingController.value.text.isNotEmpty &&
        passwordTextEditingController.value.text.isNotEmpty;
    update();
  }

  handleClickForgetPassword() {
    storage.write('from', 'forgetPassword');
    /*Get.to(
      () => PhoneNumberScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );*/
  }

  handleClickSignup() {
    Get.off(
      () => SignUpScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  /// SIGN IN METHODS
  signInWithEmailAndPassword() {
    if (enabled) {
      Get.offAll(
        () => DashboardScreen(),
        transition: Transition.leftToRight,
        curve: Curves.ease,
        duration: const Duration(milliseconds: 500),
      );
    }
    /*_loginService
          .loginWithEmailAndPassword(emailTextEditingController.value.text,
              passwordTextEditingController.value.text)
          .then(
        (value) {
          box.write('isLoggedIn', true);
          if (emailTextEditingController.value.text == 'driver@gmail.com') {
            box.write('role', 'driver');
          } else {
            box.write('role', 'client');
          }
          Get.offAll(
            () => const DashboardScreen(),
            transition: Transition.leftToRight,
            curve: Curves.ease,
            duration: const Duration(milliseconds: 500),
          );
        },
      );*/
  }
}
