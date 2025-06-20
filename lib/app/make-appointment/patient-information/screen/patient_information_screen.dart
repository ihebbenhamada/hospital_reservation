import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inn_tech_appointment/widgets/information-input/information-input.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/image_urls/image_urls.dart';
import '../../../../config/strings/strings.dart';
import '../../../../config/theme/theme_controller.dart';
import '../../../dashboard/controller/dashboard-controller.dart';

class PatientInformationScreen extends StatelessWidget {
  PatientInformationScreen({super.key});
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
                          AppImages.info,
                          height: 80.h,
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
                        AppStrings.completeInformationStep.tr,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  28.h.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InformationInput(
                        controller:
                            _dashboardController.mrnTextEditingController,
                        height: 50.h,
                        width: MediaQuery.of(context).size.width * 0.38,
                        hintText: AppStrings.mrn.tr,
                        title: AppStrings.mrn.tr,
                      ),
                      InformationInput(
                        controller:
                            _dashboardController.serialTextEditingController,
                        height: 50.h,
                        width: MediaQuery.of(context).size.width * 0.38,
                        hintText: AppStrings.serial.tr,
                      ),
                    ],
                  ),
                  35.h.verticalSpace,
                  InformationInput(
                    controller:
                        _dashboardController.patientNameTextEditingController,
                    height: 50.h,
                    width: double.infinity,
                    hintText: AppStrings.patientName.tr,
                  ),
                  35.h.verticalSpace,
                  InformationInput(
                    controller:
                        _dashboardController.mobileTextEditingController,
                    height: 50.h,
                    width: double.infinity,
                    hintText: AppStrings.phoneNumber.tr,
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
