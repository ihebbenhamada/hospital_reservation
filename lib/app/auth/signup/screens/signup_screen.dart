import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reservation/app/auth/signup/widgets/signup_header.dart';
import 'package:reservation/widgets/background-shape/background-shape.dart';
import 'package:reservation/widgets/enabled-input/enabled-input.dart';

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
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              62.h.verticalSpace,
              SignUpHeader(),
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
              Obx(
                () => EnabledInput(
                  controller: _signUpController.idTextEditingController,
                  onChanged: (value) =>
                      _signUpController.onChangeInputs('id', value),
                  height: 63.h,
                  isFilled: _signUpController.id.value.isNotEmpty,
                  isDarkMode: themeController.isDarkMode.value,
                  width: double.infinity,
                  hintText: 'id_number'.tr,
                  maxLength: 10,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  error: _signUpController.isIdValid.isTrue,
                  errorText: _signUpController.isIdValid.value
                      ? null
                      : 'ID must be 10 digits',
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
                  isFilled: _signUpController.fullName.value.isNotEmpty,
                  isDarkMode: themeController.isDarkMode.value,
                  width: double.infinity,
                  hintText: 'full_name'.tr,
                  /*validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required';
                    }
                    return null;
                  },*/
                  error: _signUpController.isNameValid.isFalse,
                  errorText: _signUpController.isNameValid.value
                      ? null
                      : 'Name cannot be empty',
                ),
              ),
              26.h.verticalSpace,
              Obx(
                () => EnabledInput(
                  controller:
                      _signUpController.phoneNumberTextEditingController,
                  height: 63.h,
                  onChanged: (value) =>
                      _signUpController.onChangeInputs('phone', value),
                  isFilled: _signUpController.phone.value.isNotEmpty,
                  isDarkMode: themeController.isDarkMode.value,
                  width: double.infinity,
                  hintText: 'phone_number'.tr,
                  maxLength: 10,
                  keyboardType: TextInputType.phone,
                  error: _signUpController.isPhoneNumberValid.isFalse,
                  errorText: _signUpController.isPhoneNumberValid.value
                      ? null
                      : 'Invalid Saudi phone number',
                ),
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
