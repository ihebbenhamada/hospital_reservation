import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inn_tech_appointment/app/auth/signup/services/signup_service.dart';
import 'package:inn_tech_appointment/app/auth/verification/screens/verification_screen.dart';
import 'package:inn_tech_appointment/config/colors/colors.dart';

import '../../../../config/controllerConfig/base_controller.dart';
import '../../../../config/strings/strings.dart';
import '../../login/screens/login_screen.dart';

class SignUpController extends BaseController {
  final SignUpService _signUpService = SignUpService();

  /// TEXT CONTROLLERS
  TextEditingController fullNameTextEditingController = TextEditingController();
  TextEditingController idTextEditingController = TextEditingController();
  TextEditingController phoneNumberTextEditingController =
      TextEditingController();

  /// VARIABLES
  RxString id = ''.obs;
  RxString fullName = ''.obs;
  RxString phone = ''.obs;

  RxBool isIdValid = false.obs;
  RxBool isNameValid = false.obs;
  RxBool isPhoneNumberValid = false.obs;

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
      _signUpService.sendOTP(phone: phone.value).then((value) {
        if (value != null) {
          log("message : ${value.message}");
          log("otp : ${value.otp}");
          log("phoneNumber : ${value.phoneNumber}");
        } else {
          print('error');
        }
      });
      Get.to(
        () => VerificationScreen(),
        transition: Transition.leftToRight,
        arguments: [id.value, fullName.value, phone.value],
        curve: Curves.ease,
        duration: const Duration(milliseconds: 500),
      );
      clearInputs();
    } else {
      Get.snackbar(
        AppStrings.error.tr,
        AppStrings.pleaseCorrectError.tr,
        colorText: AppColors.white,
        backgroundColor: AppColors.redLight,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  clearInputs() {
    idTextEditingController.clear();
    fullNameTextEditingController.clear();
    phoneNumberTextEditingController.clear();
    id.value = '';
    fullName.value = '';
    phone.value = '';
    isIdValid.value = false;
    isNameValid.value = false;
    isPhoneNumberValid.value = false;
  }

  void handleClickSignIn() async {
    clearInputs();
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
        isIdValid.value = id.value.length == 10;
        break;
      case 'fullName':
        fullName.value = value ?? '';
        isNameValid.value = fullName.value.isNotEmpty;
        break;
      case 'phone':
        phone.value = value ?? '';
        isPhoneNumberValid.value =
            RegExp(r'^(05)[0-9]{8}$').hasMatch(phone.value);
        break;
      default:
        break;
    }
  }
}
