import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reservation/config/colors/colors.dart';
import 'package:reservation/config/image_urls/image_urls.dart';
import 'package:reservation/widgets/background-shape/background-shape.dart';
import 'package:reservation/widgets/reservation-button/reservation-button.dart';

import '../../../../widgets/reservation-input/reservation-input.dart';
import '../controllers/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final _authController = Get.put(LoginController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundShape(
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
                AppImages.logo,
                height: 99.h,
                width: 99.h,
              ),
            ),
            23.h.verticalSpace,
            Center(
              child: Text(
                'RESERVATION',
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.gray,
                ),
              ),
            ),
            55.h.verticalSpace,
            Text(
              'Sign In',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.black1,
              ),
            ),
            10.h.verticalSpace,
            Text(
              'Please fill in the Credentials',
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
              hintText: 'Id Number',
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
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
              hintText: 'Password',
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
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                'Forget Your Password ?',
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.gray1,
                ),
              ),
            ),
            50.h.verticalSpace,
            ReservationButton(
              text: 'Sign In',
              onClick: () {},
            ),
            47.h.verticalSpace,
            Center(
              child: Text(
                'Dont have account ?',
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
                  'Sign Up Now',
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
    );
  }
}
