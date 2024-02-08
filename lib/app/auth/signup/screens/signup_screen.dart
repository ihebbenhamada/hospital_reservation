import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reservation/widgets/background-shape/background-shape.dart';
import 'package:reservation/widgets/disabled-input/disabled-input.dart';
import 'package:reservation/widgets/enabled-input/enabled-input.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/image_urls/image_urls.dart';
import '../../../../config/theme/theme_controller.dart';
import '../../../../widgets/reservation-button/reservation-button.dart';
import '../controllers/signup_controller.dart';

class SignUpScreen extends StatelessWidget {
  final SignUpController _signUpController = Get.put(SignUpController());
  final ThemeController themeController = Get.find();
  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundShape(
      backgroundColor:
          themeController.isDarkMode.value ? AppColors.dark2 : AppColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              62.h.verticalSpace,
              Row(
                children: [
                  Stack(
                    children: [
                      Image.asset(
                        AppImages.userPhoto,
                        height: 55.h,
                        width: 55.h,
                      ),
                      Image.asset(
                        themeController.isDarkMode.value
                            ? AppImages.signupUserShapeDark
                            : AppImages.signupUserShape,
                        height: 55.h,
                        width: 55.h,
                      ),
                    ],
                  ),
                  12.horizontalSpace,
                  Text(
                    'registration'.tr.toUpperCase(),
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: themeController.isDarkMode.value
                          ? AppColors.white
                          : AppColors.black1,
                    ),
                  ),
                ],
              ),
              90.h.verticalSpace,
              Text(
                'easy_steps'.tr.toUpperCase(),
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: themeController.isDarkMode.value
                      ? AppColors.white
                      : AppColors.black1,
                ),
              ),
              10.h.verticalSpace,
              Text(
                'fill_fields'.tr,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.gray1,
                ),
              ),
              46.h.verticalSpace,
              DisabledInput(
                controller: _signUpController.mrnTextEditingController,
                height: 63.h,
                width: double.infinity,
                hintText: 'full_name'.tr,
              ),
              26.h.verticalSpace,
              EnabledInput(
                controller: _signUpController.fullNameTextEditingController,
                height: 63.h,
                isDarkMode: themeController.isDarkMode.value,
                width: double.infinity,
                hintText: 'full_name'.tr,
              ),
              26.h.verticalSpace,
              EnabledInput(
                controller: _signUpController.idTextEditingController,
                height: 63.h,
                isDarkMode: themeController.isDarkMode.value,
                width: double.infinity,
                hintText: 'id_number'.tr,
              ),
              26.h.verticalSpace,
              EnabledInput(
                controller: _signUpController.phoneNumberTextEditingController,
                height: 63.h,
                isDarkMode: themeController.isDarkMode.value,
                width: double.infinity,
                hintText: 'phone_number'.tr,
              ),
              40.h.verticalSpace,
              ReservationButton(
                text: 'continue'.tr,
                onClick: _signUpController.handleClickContinue,
              ),
              20.h.verticalSpace,
              ReservationButton(
                text: 'have_account'.tr,
                isPrimary: false,
                onClick: _signUpController.handleClickSignIn,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
