import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reservation/config/theme/theme_controller.dart';

import '../../../config/colors/colors.dart';
import '../../../config/image_urls/image_urls.dart';
import '../../../widgets/reservation-button/reservation-button.dart';
import '../controllers/profile_controller.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final _profileController = Get.put(ProfileController());
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            130.h.verticalSpace,
            Expanded(
              child: Column(
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Image.asset(
                          AppImages.userPhoto,
                          height: 143.h,
                          width: 143.h,
                        ),
                        Image.asset(
                          AppImages.signupUserShape,
                          height: 143.h,
                          width: 143.h,
                        ),
                      ],
                    ),
                  ),
                  100.h.verticalSpace,
                  Row(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            height: 190.h,
                            width: 8,
                            color: _themeController.isDarkMode.value
                                ? AppColors.dark1
                                : AppColors.white,
                          ),
                          Positioned(
                            top: 0,
                            child: Container(
                              width: 41.h,
                              height: 41.h,
                              decoration: BoxDecoration(
                                color: _themeController.isDarkMode.value
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
                              color: _themeController.isDarkMode.value
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
                                color: _themeController.isDarkMode.value
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
                              '${'mrn'.tr} ${_profileController.patient.value.mrn} ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primary,
                              ),
                            ),
                            Text(
                              '${'name'.tr} ${_profileController.patient.value.name} ',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primary,
                              ),
                            ),
                            Text(
                              '${'phone_number1'.tr} ${_profileController.phone.value} ',
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
            ReservationButton(
              text: 'change_your_password'.tr,
              onClick: _profileController.handleClickChangePassword,
            ),
            20.h.verticalSpace,
            ReservationButton(
              text: 'change_phone_number'.tr,
              isPrimary: true,
              onClick: _profileController.handleClickChangePhone,
            ),
            20.h.verticalSpace,
            ReservationButton(
              text: 'back'.tr,
              isPrimary: false,
              onClick: _profileController.handleClickBack,
            ),
            80.h.verticalSpace,
          ],
        ),
      ),
    );
  }
}
