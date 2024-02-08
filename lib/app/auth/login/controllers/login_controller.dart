import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reservation/app/auth/forget-password/screens/forget_password_screen.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/controllerConfig/base_controller.dart';
import '../../../dashboard/screen/dashboard-screen.dart';
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
      _loginService
          .login(
              id: idTextEditingController.value.text,
              password: passwordTextEditingController.value.text)
          .then((value) {
        if (value != null) {
          storage.write('token', value.token);
          storage.write('user', value.toJson());
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
      Fluttertoast.showToast(
        msg: "Fill in the credentials",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.redLight,
        textColor: AppColors.white,
        fontSize: 16.0,
      );
    }
  }
}
