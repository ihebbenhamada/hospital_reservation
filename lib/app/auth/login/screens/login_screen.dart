import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reservation/config/colors/colors.dart';
import 'package:reservation/config/image_urls/image_urls.dart';
import 'package:reservation/widgets/background-shape/background-shape.dart';
import 'package:reservation/widgets/reservation-button/reservation-button.dart';

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
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: BackgroundShape(
        backgroundColor: themeController.isDarkMode.value
            ? AppColors.dark2
            : AppColors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              105.h.verticalSpace,
              Center(
                child: Image.asset(
                  themeController.isDarkMode.value
                      ? AppImages.logoCompanyDark
                      : AppImages.logo,
                  height: 99.h,
                  width: 99.h,
                ),
              ),
              23.h.verticalSpace,
              Center(
                child: Text(
                  'reservation'.tr.toUpperCase(),
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: themeController.isDarkMode.value
                        ? AppColors.white
                        : AppColors.gray,
                  ),
                ),
              ),
              55.h.verticalSpace,
              Text(
                'sign_in'.tr.toUpperCase(),
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
                'fill_credentials'.tr,
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
                hintText: 'id_number'.tr,
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
                hintText: 'password'.tr,
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
                    'forget_password'.tr.toUpperCase(),
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
                text: 'sign_in'.tr.toUpperCase(),
                onClick: _authController.handleClickSignIn,
              ),
              47.h.verticalSpace,
              Center(
                child: Text(
                  'dont_have_account'.tr,
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
                    'sign_up_now'.tr,
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
