import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reservation/app/dashboard/settings/controllers/settings_controller.dart';
import 'package:reservation/app/notifications/controllers/notifications_controller.dart';
import 'package:reservation/widgets/history-item/history-item.dart';

import '../../../../config/colors/colors.dart';
import '../../../config/image_urls/image_urls.dart';
import '../../../config/theme/theme_controller.dart';

class NotificationsScreen extends StatelessWidget {
  final _notificationsController = Get.put(NotificationsController());
  final SettingsController _settingsController = Get.find();
  final ThemeController _themeController = Get.find();
  NotificationsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _themeController.isDarkMode.value
          ? AppColors.dark2
          : AppColors.blueLight,
      body: Column(
        children: [
          80.h.verticalSpace,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      AppImages.backArrow,
                      height: 30.h,
                      color: _themeController.isDarkMode.value
                          ? AppColors.white
                          : AppColors.gray3,
                    ),
                  ),
                  onTap: () {
                    Get.back();
                  },
                ),
                Text(
                  'Notifications'.toUpperCase(),
                  style: TextStyle(
                    color: _themeController.isDarkMode.value
                        ? AppColors.white
                        : AppColors.black1,
                    fontWeight: FontWeight.w500,
                    fontSize: 18.sp,
                  ),
                ),
              ],
            ),
          ),
          30.h.verticalSpace,
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(bottom: 56.h, top: 20.h),
              child: Column(
                children: [
                  ListView.separated(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount:
                        _notificationsController.notificationsList.length,
                    itemBuilder: (context, index) {
                      var item =
                          _notificationsController.notificationsList[index];
                      return HistoryItem(
                        type: item['type'],
                        doctorName: item['doctor']['name'],
                        speciality: item['doctor']['speciality'],
                        date: item['date'],
                        isArabic: _settingsController.isArabic.value,
                        isDarkMode: _themeController.isDarkMode.value,
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return 31.h.verticalSpace;
                    },
                  ),
                  30.h.verticalSpace,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
