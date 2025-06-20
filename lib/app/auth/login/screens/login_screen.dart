import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inn_tech_appointment/config/colors/colors.dart';
import 'package:inn_tech_appointment/config/image_urls/image_urls.dart';
import 'package:inn_tech_appointment/widgets/background-shape/background-shape.dart';
import 'package:inn_tech_appointment/widgets/reservation-button/reservation-button.dart';

import '../../../../config/strings/strings.dart';
import '../../../../config/theme/theme_controller.dart';
import '../../../../widgets/reservation-input/reservation-input.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final _authController = Get.put(LoginController());
  final ThemeController themeController = Get.find();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: BackgroundShape(
        backgroundColor: themeController.isDarkMode.value
            ? AppColors.dark2
            : AppColors.white,
        withLogo: true,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              280.h.verticalSpace,
              Text(
                AppStrings.signIn.tr.toUpperCase(),
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
                AppStrings.fillCredentials.tr,
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.gray1,
                ),
              ),
              33.h.verticalSpace,
              ReservationInput(
                controller: _authController.idTextEditingController,
                height: 63.h,
                width: double.infinity,
                isDarkMode: themeController.isDarkMode.value,
                hintText: AppStrings.idNumber.tr,
                maxLength: 10,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(
                    left: 24.0,
                    right: 15.0,
                  ),
                  child: Image.asset(
                    AppImages.id,
                    height: 20.h,
                    width: 20.h,
                  ),
                ),
              ),
              37.h.verticalSpace,
              ReservationInput(
                controller: _authController.passwordTextEditingController,
                height: 63.h,
                obscureText: true,
                width: double.infinity,
                hintText: AppStrings.password.tr,
                isDarkMode: themeController.isDarkMode.value,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(
                    left: 24.0,
                    right: 15.0,
                  ),
                  child: Image.asset(
                    AppImages.password,
                    height: 20.h,
                    width: 20.h,
                  ),
                ),
              ),
              23.h.verticalSpace,
              GestureDetector(
                onTap: _authController.handleClickForgetPassword,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    AppStrings.forgetPassword.tr.toUpperCase(),
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.gray1,
                    ),
                  ),
                ),
              ),
              50.h.verticalSpace,
              ReservationButton(
                text: AppStrings.signIn.tr.toUpperCase(),
                onClick: _authController.handleClickSignIn,
              ),
              47.h.verticalSpace,
              Center(
                child: Text(
                  AppStrings.dontHaveAccount.tr,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.gray1,
                  ),
                ),
              ),
              15.h.verticalSpace,
              GestureDetector(
                onTap: _authController.handleClickSignup,
                child: Center(
                  child: Text(
                    AppStrings.signUpNow.tr,
                    style: TextStyle(
                      fontSize: 16.sp,
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
    );
  }
}
