import 'dart:developer';

import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reservation/app/profile/change-password/screens/change_password_screen.dart';

import '../../../../config/controllerConfig/base_controller.dart';
import '../../dashboard/home/model/patient_statistic/patient_statistic.dart';

class ProfileController extends BaseController {
  /// CONTROLLERS

  /// VARIABLES
  Rx<PatientStatistics> patient = PatientStatistics().obs;
  RxString phone = ''.obs;

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// INITIALISATION
  void initValues() {
    if (GetStorage().read('phone') != null) {
      phone.value = GetStorage().read('phone');
    }
    log(PatientStatistics.fromJson(
      GetStorage().read('patient') as Map<String, dynamic>,
    ).toString());
    /*if (GetStorage().read('patient') != null) {
      patient.value = PatientStatistics.fromJson(
        GetStorage().read('patient') as Map<String, dynamic>,
      );
    }*/
  }

  /// FUNCTIONS
  handleClickChangePassword() {
    Get.to(
      () => ChangePasswordScreen(),
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  handleClickChangePhone() {
    Get.to(
      () => ChangePasswordScreen(),
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  void handleClickBack() async {
    Get.back();
  }
}
