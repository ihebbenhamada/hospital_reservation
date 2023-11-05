import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

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

  handleClickConfirm() {}

  void handleClickSignIn() async {
    Get.off(
      LoginScreen(),
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }
}
