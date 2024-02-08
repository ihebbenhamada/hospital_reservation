import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reservation/app/auth/forget-password/controllers/forget_password_controller.dart';
import 'package:reservation/config/colors/colors.dart';

import '../../../../config/image_urls/image_urls.dart';
import '../../../../config/theme/theme_controller.dart';
import '../../../../widgets/background-shape/background-shape.dart';
import '../../../../widgets/enabled-input/enabled-input.dart';
import '../../../../widgets/reservation-button/reservation-button.dart';

class ForgetPasswordScreen extends StatelessWidget {
  final _forgetPasswordController = Get.put(ForgetPasswordController());
  final ThemeController _themeController = Get.find();
  ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundShape(
      backgroundColor:
          _themeController.isDarkMode.value ? AppColors.dark2 : AppColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
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
                            AppImages.signupUserShape,
                            height: 55.h,
                            width: 55.h,
                          ),
                        ],
                      ),
                      12.horizontalSpace,
                      Text(
                        'forget_password_1'.tr.toUpperCase(),
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                          color: _themeController.isDarkMode.value
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
                      color: _themeController.isDarkMode.value
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
                  EnabledInput(
                    controller:
                        _forgetPasswordController.idNumberTextEditingController,
                    height: 63.h,
                    isDarkMode: _themeController.isDarkMode.value,
                    width: double.infinity,
                    hintText: 'id_number'.tr,
                  ),
                ],
              ),
            ),
            ReservationButton(
              text: 'continue'.tr,
              onClick: _forgetPasswordController.handleClickContinue,
            ),
            20.h.verticalSpace,
            ReservationButton(
              text: 'have_account'.tr,
              isPrimary: false,
              onClick: _forgetPasswordController.handleClickSignIn,
            ),
            150.h.verticalSpace,
          ],
        ),
      ),
    );
  }
}
