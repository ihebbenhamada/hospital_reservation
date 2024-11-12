import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation/app/auth/registration-success/screens/registration_success_screen.dart';
import 'package:reservation/config/colors/colors.dart';
import 'package:reservation/config/interceptor/interceptor.dart';

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
  RxDouble passwordStrengthValue = 0.0.obs;
  RxString password = ''.tr.obs;
  RxString repeatPassword = ''.tr.obs;
  String id = '';
  String fullName = '';
  String phone = '';

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
  }

  void _updateStrength() {
    int strength = 0;
    String password = passwordTextEditingController.text;
    if (hasUppercase(password)) strength++;
    if (hasLowercase(password)) strength++;
    if (hasSpecialCharacter(password)) strength++;
    if (hasMinLength(password, 6)) strength++;
    passwordStrengthValue.value =
        strength / 4; // Progress will be a value between 0 and 1
    if (strength == 0) {
      passwordStrength.value = 'weak_password'.tr;
    } else if (strength == 1) {
      passwordStrength.value = 'weak_password'.tr;
    } else if (strength == 2) {
      passwordStrength.value = 'weak_password'.tr;
    } else if (strength == 3) {
      passwordStrength.value = 'weak_password'.tr;
    } else if (strength == 4) {
      passwordStrength.value = 'strong_password'.tr;
    } // Assuming a maximum strength of 4
  }

  Color getColor(double value) {
    if (value <= 0.25) {
      return AppColors.redLight;
    } else if (value <= 0.50) {
      return AppColors.primary.withOpacity(0.5);
    } else if (value <= 0.75) {
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
    if (id.isNotEmpty &&
        fullName.isNotEmpty &&
        phone.isNotEmpty &&
        passwordTextEditingController.text.isNotEmpty) {
      AppInterceptor.showLoader();
      _passwordService
          .signup(
        hawiaNo: id,
        fullName: fullName,
        phoneNumber: phone,
        password: passwordTextEditingController.text,
        fkDefBranchId: 2,
        fkDefCompanyId: 2,
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
        'Error',
        'Please correct the errors in the form.',
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

// Function to check for minimum length
  bool hasMinLength(String password, int length) {
    return password.length >= length;
  }

  onChangeInputs(String name, String value) {
    if (name == 'password') {
      password.value = value;
    } else {
      repeatPassword.value = value;
    }
  }
}
