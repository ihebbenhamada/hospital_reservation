import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reservation/widgets/background-shape/background-shape.dart';
import 'package:reservation/widgets/disabled-input/disabled-input.dart';
import 'package:reservation/widgets/enabled-input/enabled-input.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/image_urls/image_urls.dart';
import '../../../../widgets/reservation-button/reservation-button.dart';
import '../controllers/signup_controller.dart';

class SignUpScreen extends StatelessWidget {
  final SignUpController _signUpController = Get.put(SignUpController());

  SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundShape(
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
                    'Registration',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black1,
                    ),
                  ),
                ],
              ),
              90.h.verticalSpace,
              Text(
                'Easy Steps !!',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black1,
                ),
              ),
              10.h.verticalSpace,
              Text(
                'Just fill this Fields',
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
                hintText: 'Full Name',
              ),
              26.h.verticalSpace,
              EnabledInput(
                controller: _signUpController.fullNameTextEditingController,
                height: 63.h,
                width: double.infinity,
                hintText: 'Full Name',
              ),
              26.h.verticalSpace,
              EnabledInput(
                controller: _signUpController.idTextEditingController,
                height: 63.h,
                width: double.infinity,
                hintText: 'Id Number',
              ),
              26.h.verticalSpace,
              EnabledInput(
                controller: _signUpController.phoneNumberTextEditingController,
                height: 63.h,
                width: double.infinity,
                hintText: 'Phone Number',
              ),
              40.h.verticalSpace,
              ReservationButton(
                text: 'Continue',
                onClick: _signUpController.handleClickContinue,
              ),
              20.h.verticalSpace,
              ReservationButton(
                text: 'I Have Account !!',
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
