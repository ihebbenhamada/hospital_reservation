import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inn_tech_appointment/app/dashboard/controller/dashboard-controller.dart';
import 'package:inn_tech_appointment/config/strings/strings.dart';
import 'package:inn_tech_appointment/config/theme/theme_controller.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/image_urls/image_urls.dart';
//import '../controllers/appointment_steps_controller.dart';

class AppointmentStepsScreen extends StatelessWidget {
  AppointmentStepsScreen({super.key});
  //final _appointmentStepsController = Get.put(AppointmentStepsController());
  final DashboardController _dashboardController = Get.find();
  final ThemeController _themeController = Get.find();
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
            100.h.verticalSpace,
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
                          AppImages.hospital,
                          height: 60.h,
                        ),
                      ],
                    ),
                  ),
                  80.h.verticalSpace,
                  Center(
                    child: Container(
                      width: 200,
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      decoration: BoxDecoration(
                        color: _themeController.isDarkMode.value
                            ? AppColors.dark1
                            : AppColors.white,
                        borderRadius: BorderRadius.circular(21),
                      ),
                      child: Center(
                        child: Text(
                          AppStrings.makeYourAppointment.tr,
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  22.h.verticalSpace,
                  Center(
                    child: Text(
                      AppStrings.withEasySteps.tr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  28.h.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 17.h,
                                  width: 17.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(17),
                                  ),
                                ),
                                10.h.verticalSpace,
                                Text(
                                  AppStrings.step1.tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 17.h,
                                  width: 17.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(17),
                                  ),
                                ),
                                10.h.verticalSpace,
                                Text(
                                  AppStrings.step2.tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 17.h,
                                  width: 17.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(17),
                                  ),
                                ),
                                10.h.verticalSpace,
                                Text(
                                  AppStrings.step3.tr,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Positioned(
                          child: Divider(
                            thickness: 2.2,
                            color: AppColors.primary,
                            indent: 17.h,
                            endIndent: 17.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                  55.h.verticalSpace,
                  Text(
                    AppStrings.chooseClinicDoctor.tr.toUpperCase(),
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: _themeController.isDarkMode.value
                          ? AppColors.white
                          : AppColors.gray3,
                    ),
                  ),
                  30.h.verticalSpace,
                  Text(
                    AppStrings.chooseDateTime.tr.toUpperCase(),
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: _themeController.isDarkMode.value
                          ? AppColors.white
                          : AppColors.gray3,
                    ),
                  ),
                  30.h.verticalSpace,
                  Text(
                    AppStrings.completeInformation.tr.toUpperCase(),
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: _themeController.isDarkMode.value
                          ? AppColors.white
                          : AppColors.gray3,
                    ),
                  ),
                ],
              ),
            ),
            /*ReservationButton(
              text: 'start_your_appointment'.tr,
              onClick: _appointmentStepsController.handleClickMakeAppointment,
            ),
            20.h.verticalSpace,
            ReservationButton(
              text: 'back'.tr,
              isPrimary: false,
              onClick: _appointmentStepsController.handleClickBack,
            ),
            80.h.verticalSpace*/
          ],
        ),
      ),
    );
  }
}
