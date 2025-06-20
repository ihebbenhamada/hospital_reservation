import 'package:get/get.dart';
import 'package:inn_tech_appointment/routes/app_routes.dart';

import '../../../../config/controllerConfig/base_controller.dart';

class AppointmentSuccessController extends BaseController {
  /// SERVICES

  /// CONTROLLERS

  /// VARIABLES

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
  void initValues() {}

  /// FUNCTIONS
  handleClickContinue() {
    Get.offNamedUntil(AppRoutes.dashboard, (route) {
      return true;
    });
  }

  void handleClickBack() async {
    Get.back();
  }
}
