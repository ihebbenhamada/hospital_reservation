import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reservation/widgets/background-shape/background-shape.dart';
import 'package:reservation/widgets/enabled-input/enabled-input.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/image_urls/image_urls.dart';
import '../../../../config/theme/theme_controller.dart';
import '../../../../widgets/reservation-button/reservation-button.dart';
import '../controllers/change-password_controller.dart';

class ChangePasswordScreen extends StatelessWidget {
  final ChangePasswordController _changePasswordController =
      Get.put(ChangePasswordController());
  final ThemeController _themeController = Get.find();

  ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundShape(
      backgroundColor:
          _themeController.isDarkMode.value ? AppColors.dark2 : AppColors.white,
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
                        AppImages.signupUserShape,
                        height: 55.h,
                        width: 55.h,
                      ),
                    ],
                  ),
                  12.horizontalSpace,
                  Text(
                    'change_password'.tr.toUpperCase(),
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
                'change_your_password'.tr.toUpperCase(),
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
                    _changePasswordController.oldPasswordTextEditingController,
                height: 63.h,
                width: double.infinity,
                isDarkMode: _themeController.isDarkMode.value,
                hintText: 'enter_old_password'.tr,
                obscureText: true,
              ),
              26.h.verticalSpace,
              EnabledInput(
                controller:
                    _changePasswordController.newPasswordTextEditingController,
                height: 63.h,
                width: double.infinity,
                isDarkMode: _themeController.isDarkMode.value,
                hintText: 'new_password'.tr,
                obscureText: true,
              ),
              26.h.verticalSpace,
              EnabledInput(
                controller: _changePasswordController
                    .confirmPasswordTextEditingController,
                height: 63.h,
                width: double.infinity,
                isDarkMode: _themeController.isDarkMode.value,
                hintText: 'repeat_password'.tr,
                obscureText: true,
              ),
              40.h.verticalSpace,
              Center(
                child: SizedBox(
                  width: 164,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'password_strength'.tr,
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.gray1,
                        ),
                      ),
                      14.h.verticalSpace,
                      Stack(
                        children: [
                          Container(
                            height: 7.h,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(4),
                              boxShadow: [
                                BoxShadow(
                                  color: const Color.fromRGBO(0, 0, 0, 0.1),
                                  offset: const Offset(0.0, 2),
                                  blurRadius: 5.0.h,
                                  spreadRadius: 0.h,
                                ),
                              ],
                            ),
                          ),
                          AnimatedBuilder(
                            animation:
                                _changePasswordController.animationController,
                            builder: (context, child) {
                              return LinearProgressIndicator(
                                value: _changePasswordController
                                    .animationController.value,
                                color: _changePasswordController.getColor(
                                  _changePasswordController
                                      .animationController.value,
                                ),
                                backgroundColor: AppColors.white,
                                borderRadius: BorderRadius.circular(4),
                                minHeight: 7.0.h,
                              );
                            },
                          ),
                        ],
                      ),
                      14.h.verticalSpace,
                      Align(
                        alignment: Alignment.centerRight,
                        child: Obx(
                          () => Text(
                            '${_changePasswordController.passwordStrength}',
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              40.h.verticalSpace,
              ReservationButton(
                text: 'continue'.tr,
                onClick: _changePasswordController.handleClickContinue,
              ),
              20.h.verticalSpace,
              ReservationButton(
                text: 'back'.tr,
                isPrimary: false,
                onClick: _changePasswordController.handleClickBack,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
