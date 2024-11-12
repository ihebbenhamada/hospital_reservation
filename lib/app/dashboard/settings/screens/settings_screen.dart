import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reservation/app/dashboard/settings/controllers/settings_controller.dart';
import 'package:reservation/config/image_urls/image_urls.dart';
import 'package:reservation/widgets/settings-item/settings-item.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/theme/theme_controller.dart';

class SettingsScreen extends StatelessWidget {
  final _settingsController = Get.put(SettingsController());
  final ThemeController themeController = Get.find();
  SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeController.isDarkMode.value
          ? AppColors.dark2
          : AppColors.blueLight,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Column(
          children: [
            220.h.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.ltr,
              children: [
                Obx(
                  () => SettingsItem(
                    icon: AppImages.language,
                    title: 'arabic_language',
                    description: 'change_language',
                    isEnabled: _settingsController.isArabic.value,
                    isDarkMode: themeController.isDarkMode.value,
                    onToggleSwitch: _settingsController.toggleLanguage,
                    isSwitchVisible: true,
                  ),
                ),
                Obx(
                  () => SettingsItem(
                    icon: AppImages.theme,
                    title: 'dark_theme',
                    description: 'change_theme',
                    isDarkMode: themeController.isDarkMode.value,
                    isEnabled: themeController.isDarkMode.value,
                    onToggleSwitch: themeController.toggleTheme,
                    isSwitchVisible: true,
                  ),
                ),
              ],
            ),
            28.h.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.ltr,
              children: [
                Obx(
                  () => SettingsItem(
                    icon: AppImages.notif,
                    title: 'send_notification',
                    description: 'send_notification_alarm',
                    isEnabled: _settingsController.isNotificationEnabled.value,
                    isDarkMode: themeController.isDarkMode.value,
                    onToggleSwitch: _settingsController.toggleNotification,
                    isSwitchVisible: true,
                  ),
                ),
                SettingsItem(
                  icon: AppImages.signout,
                  title: 'sign_out',
                  description: 'sign_out_from_app',
                  isDarkMode: themeController.isDarkMode.value,
                  onToggleSwitch: _settingsController.signOut,
                  isSwitchVisible: false,
                ),
              ],
            ),
            30.h.verticalSpace,
          ],
        ),
      ),
    );
  }
}
