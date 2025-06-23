import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inn_tech_appointment/app/dashboard/history/controllers/history_controller.dart';
import 'package:inn_tech_appointment/app/dashboard/history/models/patient_appointment/patient_appointment.dart';
import 'package:inn_tech_appointment/config/theme/theme_controller.dart';
import 'package:inn_tech_appointment/widgets/history-item/history-item.dart';
import 'package:intl/intl.dart';

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
      body: RefreshIndicator(
        onRefresh: _historyController.handleRefresh,
        color: AppColors.white,
        backgroundColor: AppColors.primary,
        edgeOffset: 150.h,
        child: ListView(
          children: [
            150.h.verticalSpace,
            Obx(
              () => ListView.separated(
                padding: EdgeInsets.only(left: 40.0, right: 40.0, bottom: 80.h),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: _historyController
                    .historicList.value.patientAppointments.length,
                itemBuilder: (context, index) {
                  PatientAppointment item = _historyController
                      .historicList.value.patientAppointments[index];
                  return HistoryItem(
                    isCanceled: item.isCanceled,
                    doctorName: Get.locale?.languageCode == 'en'
                        ? item.docotorNameEn
                        : item.docotorNameAr,
                    speciality: Get.locale?.languageCode == 'en'
                        ? item.docotorJobNameEn ?? ''
                        : item.doctorJobNameAr ?? '',
                    date: DateFormat('MM/dd/yyyy hh:mm a',
                            Get.locale?.languageCode ?? 'en')
                        .format(DateTime.parse(item.appointmentDateStartTime)),
                    isDarkMode: _themeController.isDarkMode.value,
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return 28.h.verticalSpace;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
