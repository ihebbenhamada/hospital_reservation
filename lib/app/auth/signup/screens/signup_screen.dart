import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inn_tech_appointment/app/auth/signup/widgets/signup_header.dart';
import 'package:inn_tech_appointment/config/strings/strings.dart';
import 'package:inn_tech_appointment/widgets/background-shape/background-shape.dart';
import 'package:inn_tech_appointment/widgets/enabled-input/enabled-input.dart';

import '../../../../config/colors/colors.dart';
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            62.h.verticalSpace,
            SignUpHeader(),
            90.h.verticalSpace,
            Text(
              AppStrings.easySteps.tr.toUpperCase(),
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
                controller: _signUpController.idTextEditingController,
                onChanged: (value) =>
                    _signUpController.onChangeInputs('id', value),
                height: 63.h,
                isDarkMode: themeController.isDarkMode.value,
                width: double.infinity,
                hintText: AppStrings.idNumber.tr,
                maxLength: 10,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                error: _signUpController.isIdValid.isTrue,
                errorText: _signUpController.isIdValid.value
                    ? null
                    : AppStrings.id10Digits.tr,
                isValid: _signUpController.isIdValid.value,
                /*validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'ID is required';
                  } else if (value.length != 10) {
                    return 'ID must be 10 digits';
                  }
                  return null;
                },*/
              ),
            ),
            26.h.verticalSpace,
            Obx(
              () => EnabledInput(
                controller: _signUpController.fullNameTextEditingController,
                height: 63.h,
                onChanged: (value) =>
                    _signUpController.onChangeInputs('fullName', value),
                isDarkMode: themeController.isDarkMode.value,
                width: double.infinity,
                hintText: AppStrings.fullName.tr,
                isValid: _signUpController.isNameValid.value,
                /*validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name is required';
                  }
                  return null;
                },*/
                error: _signUpController.isNameValid.isFalse,
                errorText: _signUpController.isNameValid.value
                    ? null
                    : AppStrings.nameNotEmpty.tr,
              ),
            ),
            26.h.verticalSpace,
            Obx(
              () => EnabledInput(
                controller: _signUpController.phoneNumberTextEditingController,
                height: 63.h,
                onChanged: (value) =>
                    _signUpController.onChangeInputs('phone', value),
                isDarkMode: themeController.isDarkMode.value,
                width: double.infinity,
                hintText: AppStrings.phoneNumber.tr,
                maxLength: 10,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                keyboardType: TextInputType.phone,
                error: _signUpController.isPhoneNumberValid.isFalse,
                errorText: _signUpController.isPhoneNumberValid.value
                    ? null
                    : AppStrings.invalidNumber.tr,
                isValid: _signUpController.isPhoneNumberValid.value,
              ),
            ),
            50.h.verticalSpace,
            ReservationButton(
              text: AppStrings.continueText.tr,
              onClick: _signUpController.handleClickContinue,
            ),
            20.h.verticalSpace,
            ReservationButton(
              text: AppStrings.haveAccount.tr,
              isPrimary: false,
              onClick: _signUpController.handleClickSignIn,
            ),
          ],
        ),
      ),
    );
  }
}
