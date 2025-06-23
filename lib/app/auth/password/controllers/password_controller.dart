import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inn_tech_appointment/app/auth/registration-success/screens/registration_success_screen.dart';
import 'package:inn_tech_appointment/config/colors/colors.dart';
import 'package:inn_tech_appointment/config/interceptor/interceptor.dart';
import 'package:inn_tech_appointment/config/strings/strings.dart';

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
  RxString passwordStrength = AppStrings.weakPassword.tr.obs;
  RxDouble passwordStrengthValue = 0.0.obs;
  RxString password = ''.tr.obs;
  RxString repeatPassword = ''.tr.obs;
  String id = '';
  String fullName = '';
  String phone = '';
  RxBool isValidPassword = false.obs;
  RxBool isValidConfirmPassword = false.obs;

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  /// INITIALISATION
  void initValues() {
    if (Get.arguments != null) {
      log(Get.arguments.toString());
      id = Get.arguments[0];
      fullName = Get.arguments[1];
      phone = Get.arguments[2];
    }
    passwordTextEditingController = TextEditingController();
    confirmPasswordTextEditingController = TextEditingController();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    passwordTextEditingController.addListener(_updateStrength);
    confirmPasswordTextEditingController.addListener(_updateStrength);
  }

  void _updateStrength() {
    int strength = 0;
    String password = passwordTextEditingController.text;
    String repeatPassword = confirmPasswordTextEditingController.text;
    if (hasUppercase(password)) strength++;
    if (hasLowercase(password)) strength++;
    if (hasSpecialCharacter(password)) strength++;
    if (hasNumber(password)) strength++;
    if (hasMinLength(password, 6)) strength++;
    passwordStrengthValue.value = strength / 5;
    isValidPassword.value = (strength == 5);
    isValidConfirmPassword.value =
        (repeatPassword == password && isValidPassword.isTrue);

    passwordStrength.value = (strength == 5)
        ? AppStrings.strongPassword.tr
        : AppStrings.weakPassword.tr;
  }

  Color getColor(double value) {
    if (value <= 0.2) {
      return AppColors.redLight;
    } else if (value <= 0.4) {
      return AppColors.primary.withOpacity(0.5);
    } else if (value <= 0.6) {
      return AppColors.primary;
    } else if (value <= 0.8) {
      return AppColors.primary;
    } else {
      return AppColors.green;
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
    if (isValidPassword.isTrue && isValidConfirmPassword.isTrue) {
      AppInterceptor.showLoader();
      _passwordService
          .signup(
        hawiaNo: id,
        fullName: fullName,
        phoneNumber: phone,
        password: passwordTextEditingController.text,
        fkDefBranchId: 3,
        fkDefCompanyId: 3,
        encryptedOTP: null,
        otp: null,
      )
          .then((value) {
        AppInterceptor.hideLoader();
        if (value != null) {
          if (value.resultStatus == true) {
            Get.offAll(
              () => RegistrationSuccessScreen(),
              arguments: [
                {
                  'mrn': value.mrn ?? '',
                  'fullName': value.fullName,
                  'phone': value.phoneNumber,
                },
              ],
              transition: Transition.leftToRight,
              curve: Curves.ease,
              duration: const Duration(milliseconds: 500),
            );
          } else {
            log(value.resultMessage);
            Get.snackbar(
              'Error',
              value.resultMessage,
              colorText: AppColors.white,
              backgroundColor: AppColors.redLight,
              snackPosition: SnackPosition.BOTTOM,
            );
          }
        } else {
          print('error');
        }
      });
    } else {
      // Show an error message or handle invalid form
      Get.snackbar(
        AppStrings.error.tr,
        AppStrings.pleaseCorrectError.tr,
        colorText: AppColors.white,
        backgroundColor: AppColors.redLight,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void handleClickSignIn() async {
    Get.off(
      LoginScreen(),
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  // Function to check for at least one uppercase letter
  bool hasUppercase(String password) {
    return password.contains(RegExp(r'[A-Z]'));
  }

// Function to check for at least one lowercase letter
  bool hasLowercase(String password) {
    return password.contains(RegExp(r'[a-z]'));
  }

// Function to check for at least one special character
  bool hasSpecialCharacter(String password) {
    return password.contains(RegExp(r'\W'));
  }

  // Function to check for at least one number
  bool hasNumber(String password) {
    return password.contains(RegExp(r'[0-9]'));
  }

// Function to check for minimum length
  bool hasMinLength(String password, int length) {
    return password.length >= length;
  }
}
