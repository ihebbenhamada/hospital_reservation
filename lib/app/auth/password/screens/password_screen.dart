import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inn_tech_appointment/widgets/background-shape/background-shape.dart';
import 'package:inn_tech_appointment/widgets/enabled-input/enabled-input.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/image_urls/image_urls.dart';
import '../../../../config/strings/strings.dart';
import '../../../../config/theme/theme_controller.dart';
import '../../../../widgets/reservation-button/reservation-button.dart';
import '../controllers/password_controller.dart';

class PasswordScreen extends StatelessWidget {
  final PasswordController _passwordController = Get.put(PasswordController());
  final ThemeController themeController = Get.find();
  PasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundShape(
      backgroundColor:
          themeController.isDarkMode.value ? AppColors.dark2 : AppColors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40.0,
        ),
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
                  AppStrings.registration.tr.toUpperCase(),
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
              AppStrings.enterPassword.tr.toUpperCase(),
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
              AppStrings.fillFields.tr,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.gray1,
              ),
            ),
            46.h.verticalSpace,
            Obx(
              () => EnabledInput(
                controller: _passwordController.passwordTextEditingController,
                height: 63.h,
                width: double.infinity,
                onChanged: (value) =>
                    _passwordController.onChangeInputs('password', value ?? ''),
                isValid: _passwordController.isValidPassword.value,
                isDarkMode: themeController.isDarkMode.value,
                hintText: AppStrings.password.tr,
                obscureText: true,
              ),
            ),
            26.h.verticalSpace,
            Obx(
              () => EnabledInput(
                controller:
                    _passwordController.confirmPasswordTextEditingController,
                height: 63.h,
                width: double.infinity,
                onChanged: (value) => _passwordController.onChangeInputs(
                    'repeatPassword', value ?? ''),
                isValid: _passwordController.isValidConfirmPassword.value,
                isDarkMode: themeController.isDarkMode.value,
                hintText: AppStrings.repeatPassword.tr,
                obscureText: true,
              ),
            ),
            57.h.verticalSpace,
            Center(
              child: SizedBox(
                width: 164,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppStrings.passwordStrength.tr,
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
                          animation: _passwordController.animationController,
                          builder: (context, child) {
                            return Obx(() => LinearProgressIndicator(
                                  value: _passwordController
                                      .passwordStrengthValue.value,
                                  color: _passwordController.getColor(
                                    _passwordController
                                        .passwordStrengthValue.value,
                                  ),
                                  backgroundColor: AppColors.white,
                                  borderRadius: BorderRadius.circular(4),
                                  minHeight: 7.0.h,
                                ));
                          },
                        ),
                      ],
                    ),
                    14.h.verticalSpace,
                    Align(
                      alignment: Alignment.centerRight,
                      child: Obx(
                        () => Text(
                          '${_passwordController.passwordStrength}',
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
              text: AppStrings.continueText.tr,
              onClick: _passwordController.handleClickContinue,
            ),
            20.h.verticalSpace,
            ReservationButton(
              text: AppStrings.haveAccount.tr,
              isPrimary: false,
              onClick: _passwordController.handleClickSignIn,
            ),
          ],
        ),
      ),
    );
  }
}
