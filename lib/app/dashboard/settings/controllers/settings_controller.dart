import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reservation/app/auth/login/screens/login_screen.dart';

import '../../../../config/controllerConfig/base_controller.dart';
import '../services/settings_service.dart';

class SettingsController extends BaseController {
  /// SERVICES
  final SettingsService _settingsService = SettingsService();

  /// CONTROLLERS

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
    storage.remove('token');
    storage.remove('user');
    Get.offAll(
      () => LoginScreen(),
      transition: Transition.leftToRight,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }
}
