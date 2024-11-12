import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation/app/auth/verification/screens/verification_screen.dart';
import 'package:reservation/config/colors/colors.dart';

import '../../../../config/controllerConfig/base_controller.dart';
import '../../login/screens/login_screen.dart';

class SignUpController extends BaseController {
  /// TEXT CONTROLLERS
  TextEditingController fullNameTextEditingController = TextEditingController();
  TextEditingController idTextEditingController = TextEditingController();
  TextEditingController phoneNumberTextEditingController =
      TextEditingController();

  /// VARIABLES
  RxString id = ''.obs;
  RxString fullName = ''.obs;
  RxString phone = ''.obs;

  RxBool isIdValid = true.obs;
  RxBool isNameValid = true.obs;
  RxBool isPhoneNumberValid = true.obs;

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  /// INITIALISATION
  void initValues() {}

  @override
  void dispose() {
    fullNameTextEditingController.dispose();
    idTextEditingController.dispose();
    phoneNumberTextEditingController.dispose();
    super.dispose();
  }

  /// SIGN UP METHODS
  handleClickContinue() {
    isIdValid.value = id.value.length == 10;
    isNameValid.value = fullName.value.isNotEmpty;
    isPhoneNumberValid.value = RegExp(r'^(05)[0-9]{8}$').hasMatch(phone.value);

    if (isIdValid.value && isNameValid.value && isPhoneNumberValid.value) {
      Get.to(
        () => VerificationScreen(),
        transition: Transition.leftToRight,
        arguments: [id.value, fullName.value, phone.value],
        curve: Curves.ease,
        duration: const Duration(milliseconds: 500),
      );
    } else {
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

  void onChangeInputs(String key, String? value) {
    switch (key) {
      case 'id':
        id.value = value ?? '';
        break;
      case 'fullName':
        fullName.value = value ?? '';
        break;
      case 'phone':
        phone.value = value ?? '';
        break;
      default:
        break;
    }
  }
}
