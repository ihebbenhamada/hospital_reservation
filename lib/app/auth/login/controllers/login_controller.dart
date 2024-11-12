import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reservation/config/interceptor/interceptor.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/controllerConfig/base_controller.dart';
import '../../../dashboard/screen/dashboard-screen.dart';
import '../../forget-password/screens/forget_password_screen.dart';
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
    Get.to(
      () => ForgetPasswordScreen(),
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
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
  handleClickSignIn() {
    if (idTextEditingController.value.text.isNotEmpty &&
        passwordTextEditingController.value.text.isNotEmpty) {
      if (idTextEditingController.value.text.length >= 10) {
        AppInterceptor.showLoader();
        _loginService
            .login(
                hawiaNo: idTextEditingController.value.text,
                password: passwordTextEditingController.value.text)
            .then((value) {
          AppInterceptor.hideLoader();
          if (value != null) {
            idTextEditingController.clear();
            passwordTextEditingController.clear();
            storage.write('token', value.token);
            storage.write('user', value);
            storage.write('phone', value.phoneNumber);
            Get.offAll(
              () => DashboardScreen(),
              transition: Transition.leftToRight,
              curve: Curves.ease,
              duration: const Duration(milliseconds: 500),
            );
          } else {
            print('error');
          }
        });
      } else {
        Get.snackbar(
          'Error',
          'Make sure you entered right id',
          colorText: AppColors.white,
          backgroundColor: AppColors.redLight,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } else {
      Get.snackbar(
        'Error',
        'Fill in the credentials',
        colorText: AppColors.white,
        backgroundColor: AppColors.redLight,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
