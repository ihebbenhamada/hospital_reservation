import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inn_tech_appointment/app/dashboard/controller/dashboard-controller.dart';
import 'package:inn_tech_appointment/config/colors/colors.dart';
import 'package:inn_tech_appointment/config/image_urls/image_urls.dart';

import '../../../../config/strings/strings.dart';
import '../../../../config/theme/theme_controller.dart';
import '../controllers/appointment_success_controller.dart';

class AppointmentSuccessScreen extends StatelessWidget {
  final _appointmentSuccessController = Get.put(AppointmentSuccessController());
  final ThemeController themeController = Get.find();
  final DashboardController _dashboardController = Get.find();
  AppointmentSuccessScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeController.isDarkMode.value
          ? AppColors.dark2
          : AppColors.blueLight,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            100.h.verticalSpace,
            Center(
              child: Stack(
                children: [
                  Image.asset(
                    themeController.isDarkMode.value
                        ? AppImages.passwordCircleDark
                        : AppImages.passwordCircle,
                    height: 188.h,
                    width: 188.h,
                  ),
                  Positioned(
                    top: 20.h,
                    right: 10,
                    child: Image.asset(
                      AppImages.passwordTick,
                      width: 137.h,
                    ),
                  ),
                ],
              ),
            ),
            43.h.verticalSpace,
            Container(
              width: 140,
              padding: EdgeInsets.symmetric(vertical: 8.h),
              decoration: BoxDecoration(
                color: themeController.isDarkMode.value
                    ? AppColors.dark1
                    : AppColors.white,
                borderRadius: BorderRadius.circular(21),
              ),
              child: Center(
                child: Text(
                  AppStrings.congratulations.tr.toUpperCase(),
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
            25.h.verticalSpace,
            Text(
              AppStrings.successAppointmentAdded.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
                height: 1.5,
              ),
            ),
            43.h.verticalSpace,
            Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 190.h,
                      width: 8,
                      color: themeController.isDarkMode.value
                          ? AppColors.dark1
                          : AppColors.white,
                    ),
                    Positioned(
                      top: 0,
                      child: Container(
                        width: 41.h,
                        height: 41.h,
                        decoration: BoxDecoration(
                          color: themeController.isDarkMode.value
                              ? AppColors.dark1
                              : AppColors.white,
                          borderRadius: BorderRadius.circular(41.h),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromRGBO(0, 0, 0, 0.1),
                              offset: const Offset(0.0, 2),
                              blurRadius: 5.0.h,
                              spreadRadius: 0.h,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Image.asset(
                            AppImages.hashtag,
                            height: 22.h,
                            width: 22.h,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 41.h,
                      height: 41.h,
                      decoration: BoxDecoration(
                        color: themeController.isDarkMode.value
                            ? AppColors.dark1
                            : AppColors.white,
                        borderRadius: BorderRadius.circular(41.h),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromRGBO(0, 0, 0, 0.1),
                            offset: const Offset(0.0, 2),
                            blurRadius: 5.0.h,
                            spreadRadius: 0.h,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Image.asset(
                          AppImages.userDash,
                          height: 17.h,
                          width: 22.h,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: 41.h,
                        height: 41.h,
                        decoration: BoxDecoration(
                          color: themeController.isDarkMode.value
                              ? AppColors.dark1
                              : AppColors.white,
                          borderRadius: BorderRadius.circular(41.h),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromRGBO(0, 0, 0, 0.1),
                              offset: const Offset(0.0, 2),
                              blurRadius: 5.0.h,
                              spreadRadius: 0.h,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Image.asset(
                            AppImages.phone,
                            height: 15.h,
                            width: 15.h,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 190.h,
                  padding: EdgeInsets.only(
                    top: 10.h,
                    bottom: 14.h,
                    left: Get.locale?.languageCode == 'en' ? 10 : 0,
                    right: Get.locale?.languageCode == 'ar' ? 10 : 0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${AppStrings.mrn.tr} ${_dashboardController.mrnTextEditingController.text}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                      ),
                      Text(
                        '${AppStrings.name.tr} ${_dashboardController.patientNameTextEditingController.text}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                      ),
                      Text(
                        '${AppStrings.phoneNumber1.tr} ${_dashboardController.mobileTextEditingController.text}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
