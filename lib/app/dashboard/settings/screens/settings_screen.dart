import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inn_tech_appointment/app/dashboard/settings/controllers/settings_controller.dart';
import 'package:inn_tech_appointment/config/image_urls/image_urls.dart';
import 'package:inn_tech_appointment/widgets/settings-item/settings-item.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/strings/strings.dart';
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
        padding: EdgeInsets.symmetric(horizontal: 40.0.w),
        child: Column(
          children: [
            220.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              textDirection: TextDirection.ltr,
              children: [
                Obx(
                  () => SettingsItem(
                    icon: AppImages.language,
                    title: AppStrings.arabicLanguage,
                    description: AppStrings.changeLanguage,
                    isEnabled: _settingsController.isArabic.value,
                    isDarkMode: themeController.isDarkMode.value,
                    onToggleSwitch: _settingsController.toggleLanguage,
                    isSwitchVisible: true,
                  ),
                ),
                Obx(
                  () => SettingsItem(
                    icon: AppImages.theme,
                    title: AppStrings.darkTheme,
                    description: AppStrings.changeTheme,
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
                    title: AppStrings.sendNotification,
                    description: AppStrings.sendNotificationAlarm,
                    isEnabled: _settingsController.isNotificationEnabled.value,
                    isDarkMode: themeController.isDarkMode.value,
                    onToggleSwitch: _settingsController.toggleNotification,
                    isSwitchVisible: true,
                  ),
                ),
                SettingsItem(
                  icon: AppImages.signout,
                  title: AppStrings.signOut,
                  description: AppStrings.signOutFromApp,
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
