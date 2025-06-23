import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:inn_tech_appointment/app/auth/password/screens/password_screen.dart';

import '../../../../config/controllerConfig/base_controller.dart';
import '../../login/screens/login_screen.dart';
import '../services/verification_service.dart';

class VerificationController extends BaseController {
  /// SERVICES
  final VerificationService _verificationService = VerificationService();

  /// CONTROLLERS

  late final CountDownController controller;

  /// VARIABLES
  late bool enabled;
  late final int duration;
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
      id = Get.arguments[0] ?? '';
      fullName = Get.arguments[1] ?? '';
      phone = Get.arguments[2] ?? '';
    }
    enabled = false;
    controller = CountDownController();
    duration = 60;
  }

  /// FUNCTIONS
  void enableBtn(String val) {
    enabled = true;
    update();
  }

  void onEdit(bool isEdited) {
    if (isEdited) {
      enabled = false;
      update();
    }
  }

  handleClickConfirm() {
    Get.off(
      PasswordScreen(),
      arguments: [id, fullName, phone],
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
