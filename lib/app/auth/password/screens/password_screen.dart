import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reservation/widgets/background-shape/background-shape.dart';
import 'package:reservation/widgets/enabled-input/enabled-input.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/image_urls/image_urls.dart';
import '../../../../widgets/reservation-button/reservation-button.dart';
import '../controllers/password_controller.dart';

class PasswordScreen extends StatelessWidget {
  final PasswordController _passwordController = Get.put(PasswordController());

  PasswordScreen({super.key});

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
                'Enter Your Password',
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
              EnabledInput(
                controller: _passwordController.passwordTextEditingController,
                height: 63.h,
                width: double.infinity,
                hintText: 'Password',
                obscureText: true,
              ),
              26.h.verticalSpace,
              EnabledInput(
                controller:
                    _passwordController.confirmPasswordTextEditingController,
                height: 63.h,
                width: double.infinity,
                hintText: 'Repeat your password',
                obscureText: true,
              ),
              57.h.verticalSpace,
              Center(
                child: SizedBox(
                  width: 164,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Password Strength',
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
                              return LinearProgressIndicator(
                                value: _passwordController
                                    .animationController.value,
                                color: _passwordController.getColor(
                                  _passwordController.animationController.value,
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
                text: 'Continue',
                onClick: _passwordController.handleClickContinue,
              ),
              20.h.verticalSpace,
              ReservationButton(
                text: 'I Have Account !!',
                isPrimary: false,
                onClick: _passwordController.handleClickSignIn,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
