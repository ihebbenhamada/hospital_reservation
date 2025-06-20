import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/controllerConfig/base_controller.dart';
import '../../../../config/interceptor/interceptor.dart';
import '../../../../config/strings/strings.dart';
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
            storage.write(AppStrings.token, value.token);
            storage.write(AppStrings.user, value);
            storage.write(AppStrings.phone, value.phoneNumber);
            Get.offAll(
              () => DashboardScreen(),
              transition: Transition.leftToRight,
              curve: Curves.ease,
              duration: const Duration(milliseconds: 500),
            );
          } else {
            print(AppStrings.error.tr);
          }
        });
      } else {
        Get.snackbar(
          AppStrings.error.tr,
          AppStrings.makeSureRightId.tr,
          colorText: AppColors.white,
          backgroundColor: AppColors.redLight,
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } else {
      Get.snackbar(
        AppStrings.error.tr,
        AppStrings.fillCredentials.tr,
        colorText: AppColors.white,
        backgroundColor: AppColors.redLight,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
