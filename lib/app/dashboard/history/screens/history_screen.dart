import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reservation/app/dashboard/history/controllers/history_controller.dart';
import 'package:reservation/config/theme/theme_controller.dart';
import 'package:reservation/widgets/history-item/history-item.dart';

import '../../../../config/colors/colors.dart';
import '../../settings/controllers/settings_controller.dart';

class HistoryScreen extends StatelessWidget {
  final _historyController = Get.put(HistoryController());
  final SettingsController _settingsController = Get.find();
  final ThemeController _themeController = Get.find();
  HistoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _themeController.isDarkMode.value
          ? AppColors.dark2
          : AppColors.blueLight,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 56.h),
        child: Column(
          children: [
            220.h.verticalSpace,
            ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _historyController.historyList.length,
              itemBuilder: (context, index) {
                var item = _historyController.historyList[index];
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
    );
  }
}
