import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:reservation/app/make-appointment/clinic-doctor/models/doctor_schedule/doctor_schedule.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/image_urls/image_urls.dart';
import '../../../../config/theme/theme_controller.dart';
import '../../../dashboard/controller/dashboard-controller.dart';

class DateTimeAppointmentScreen extends StatelessWidget {
  DateTimeAppointmentScreen({super.key});
  final ThemeController _themeController = Get.find();
  final DashboardController _dashboardController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _themeController.isDarkMode.value
          ? AppColors.dark2
          : AppColors.blueLight,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            130.h.verticalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          _themeController.isDarkMode.value
                              ? AppImages.appointmentCircleDark
                              : AppImages.verificationCircle,
                          height: 142.h,
                          width: 142.h,
                        ),
                        Image.asset(
                          AppImages.stethoscope,
                          height: 70.h,
                        ),
                      ],
                    ),
                  ),
                  50.h.verticalSpace,
                  Container(
                    width: double.infinity,
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        'choose_date_time_step'.tr,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  28.h.verticalSpace,
                  GestureDetector(
                    onTap: () => _dashboardController.selectDate(context),
                    child: Container(
                      width: double.infinity,
                      height: 60.h,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 23,
                      ),
                      decoration: BoxDecoration(
                        color: _themeController.isDarkMode.value
                            ? AppColors.dark1
                            : AppColors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromRGBO(0, 0, 0, 0.1),
                            offset: const Offset(0.0, 1),
                            blurRadius: 10.0.h,
                            spreadRadius: 0.h,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => Text(
                              DateFormat('dd-MM-yyyy')
                                  .format(
                                    _dashboardController.selectedDate.value,
                                  )
                                  .toString(),
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: _themeController.isDarkMode.value
                                    ? AppColors.gray1
                                    : AppColors.gray5,
                              ),
                            ),
                          ),
                          Image.asset(
                            AppImages.appointment,
                            height: 18.h,
                            color: _themeController.isDarkMode.value
                                ? AppColors.gray1
                                : AppColors.gray5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  28.h.verticalSpace,
                  GetBuilder<DashboardController>(
                    builder: (_) => Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 23.h, horizontal: 14),
                      decoration: BoxDecoration(
                        color: _themeController.isDarkMode.value
                            ? AppColors.dark1
                            : AppColors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromRGBO(0, 0, 0, 0.1),
                            offset: const Offset(0.0, 1),
                            blurRadius: 10.0.h,
                            spreadRadius: 0.h,
                          ),
                        ],
                      ),
                      child: Obx(
                        () => _dashboardController.doctorScheduleList.isNotEmpty
                            ? GridView.builder(
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      5, // Number of elements in each row
                                  crossAxisSpacing: 10.0,
                                  mainAxisSpacing: 14.0.h,
                                  childAspectRatio: 2,
                                ),
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: _dashboardController
                                    .doctorScheduleList
                                    .length, // Total number of elements
                                itemBuilder: (context, index) {
                                  DoctorSchedule item = _dashboardController
                                      .doctorScheduleList[index];
                                  return GestureDetector(
                                    onTap: item.appointmentAvailable
                                        ? () => _dashboardController
                                            .selectTime(item)
                                        : null,
                                    child: Container(
                                      height: 27.h,
                                      decoration: BoxDecoration(
                                        color: item.appointmentAvailable
                                            ? (_dashboardController
                                                        .selectedDoctorSchedule
                                                        .serial ==
                                                    item.serial
                                                ? AppColors.primary
                                                : _themeController
                                                        .isDarkMode.value
                                                    ? AppColors.dark4
                                                    : AppColors.white)
                                            : AppColors.primaryDisabled,
                                        borderRadius: BorderRadius.circular(7),
                                        border: Border.all(
                                          color: item.appointmentAvailable
                                              ? (_dashboardController
                                                          .selectedDoctorSchedule
                                                          .serial ==
                                                      item.serial
                                                  ? AppColors.primary
                                                  : AppColors.gray4)
                                              : AppColors.gray1,
                                        ),
                                      ),
                                      child: Center(
                                        child: Text(
                                          item.startTime.substring(0, 5),
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            color: item.appointmentAvailable
                                                ? (_dashboardController
                                                            .selectedDoctorSchedule
                                                            .serial ==
                                                        item.serial
                                                    ? AppColors.white
                                                    : _themeController
                                                            .isDarkMode.value
                                                        ? AppColors.gray1
                                                        : AppColors.gray4)
                                                : AppColors.gray1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              )
                            : Center(
                                child: Text(
                                  'No available time found!',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: AppColors.gray1,
                                  ),
                                ),
                              ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
