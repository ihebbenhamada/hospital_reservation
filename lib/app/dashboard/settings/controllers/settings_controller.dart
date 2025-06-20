import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:inn_tech_appointment/app/dashboard/controller/dashboard-controller.dart';

import '../../../../config/controllerConfig/base_controller.dart';
import '../../../auth/login/screens/login_screen.dart';
import '../services/settings_service.dart';

class SettingsController extends BaseController {
  /// SERVICES
  final SettingsService _settingsService = SettingsService();

  /// CONTROLLERS
  final DashboardController _dashboardController = Get.find();

  /// VARIABLES
  final Rx<bool> isArabic = false.obs;
  final Rx<bool> isNotificationEnabled = false.obs;
  RxBool isDarkTheme = false.obs;
  final storage = GetStorage();

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
    isArabic.value = storage.read('language') == 'ar';

    isNotificationEnabled.value =
        storage.read('isNotificationEnabled') ?? false;
  }

  /// FUNCTIONS
  toggleLanguage() {
    isArabic.value = !isArabic.value;
    if (isArabic.isTrue) {
      Get.updateLocale(const Locale('ar', 'AR'));
      storage.write('language', 'ar');
    } else {
      Get.updateLocale(const Locale('en', 'US'));
      storage.write('language', 'en');
    }
  }

  toggleTheme() {
    isDarkTheme.value = !isDarkTheme.value;
    storage.write('isDarkTheme', isDarkTheme.value);
  }

  toggleNotification() {
    isNotificationEnabled.value = !isNotificationEnabled.value;
    storage.write('isNotificationEnabled', isNotificationEnabled.value);
  }

  signOut() {
    storage.erase();
    _dashboardController.selectedIndex = 0;
    //update();
    Get.offAll(
      () => LoginScreen(),
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
    /*Get.offAll(
      () => LoginScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );*/
  }
}
