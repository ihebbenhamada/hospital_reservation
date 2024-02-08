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
  late final Rx<bool> isArabic;
  late final Rx<bool> isNotificationEnabled;
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
    isArabic = false.obs;
    isNotificationEnabled = true.obs;
  }

  /// FUNCTIONS
  toggleLanguage(bool value) {
    isArabic.value = value;
    if (value) {
      Get.updateLocale(const Locale('ar', 'AR'));
      storage.write('language', 'ar');
    } else {
      Get.updateLocale(const Locale('en', 'US'));
      storage.write('language', 'en');
    }
  }

  toggleNotification(bool value) {
    isNotificationEnabled.value = value;
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
