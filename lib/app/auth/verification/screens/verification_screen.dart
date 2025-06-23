import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inn_tech_appointment/app/auth/verification/controllers/verification_controller.dart';
import 'package:inn_tech_appointment/config/colors/colors.dart';
import 'package:inn_tech_appointment/config/image_urls/image_urls.dart';
import 'package:inn_tech_appointment/config/strings/strings.dart';
import 'package:inn_tech_appointment/widgets/verification-otp/verification-otp.dart';

import '../../../../config/theme/theme_controller.dart';
import '../../../../widgets/reservation-button/reservation-button.dart';

class VerificationScreen extends StatelessWidget {
  final _verificationController = Get.put(VerificationController());
  final ThemeController themeController = Get.find();
  VerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeController.isDarkMode.value
          ? AppColors.dark2
          : AppColors.blueLight,
      body: GestureDetector(
        onTap: () => {FocusScope.of(context).unfocus()},
        behavior: HitTestBehavior.opaque,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 40.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                130.h.verticalSpace,
                Center(
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Image.asset(
                        themeController.isDarkMode.value
                            ? AppImages.appointmentCircleDark
                            : AppImages.verificationCircle,
                        height: 163.h,
                        width: 163.h,
                      ),
                      Image.asset(
                        AppImages.verificationTick,
                        width: 98.h,
                      ),
                    ],
                  ),
                ),
                66.h.verticalSpace,
                Container(
                  width: 120,
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  decoration: BoxDecoration(
                    color: themeController.isDarkMode.value
                        ? AppColors.dark1
                        : AppColors.white,
                    borderRadius: BorderRadius.circular(21),
                  ),
                  child: Center(
                    child: Text(
                      AppStrings.verifyAccount.tr,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
                27.h.verticalSpace,
                Text(
                  '${AppStrings.enterVerificationCode.tr} ${_verificationController.phone}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                    height: 1.5,
                  ),
                ),
                20.h.verticalSpace,
                Container(
                  width: 77,
                  padding: EdgeInsets.symmetric(vertical: 6.h),
                  decoration: BoxDecoration(
                    color: AppColors.redLight,
                    borderRadius: BorderRadius.circular(21),
                  ),
                  child: Center(
                    child: Text(
                      AppStrings.wrongCode.tr,
                      style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                15.h.verticalSpace,
                VerificationOTP(
                  onCompleted: (val) => _verificationController.enableBtn(val),
                  onEditing: (value) => _verificationController.onEdit(value),
                  isDarkMode: themeController.isDarkMode.value,
                ),
                40.h.verticalSpace,
                CircularCountDownTimer(
                  // Countdown duration in Seconds.
                  duration: _verificationController.duration,

                  // Countdown initial elapsed Duration in Seconds.
                  initialDuration: 0,

                  // Controls (i.e Start, Pause, Resume, Restart) the Countdown Timer.
                  controller: _verificationController.controller,

                  // Width of the Countdown Widget.
                  width: 52.h,

                  // Height of the Countdown Widget.
                  height: 52.h,

                  // Ring Color for Countdown Widget.
                  ringColor: themeController.isDarkMode.value
                      ? AppColors.dark3
                      : AppColors.white,

                  // Ring Gradient for Countdown Widget.
                  ringGradient: null,

                  // Filling Color for Countdown Widget.
                  fillColor: AppColors.primary,

                  // Filling Gradient for Countdown Widget.
                  fillGradient: null,

                  // Background Color for Countdown Widget.
                  backgroundColor: null,

                  // Background Gradient for Countdown Widget.
                  backgroundGradient: null,

                  // Border Thickness of the Countdown Ring.
                  strokeWidth: 9.0,

                  // Begin and end contours with a flat edge and no extension.
                  strokeCap: StrokeCap.round,

                  // Text Style for Countdown Text.
                  textStyle: const TextStyle(
                    fontSize: 10.0,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                  ),

                  // Format for the Countdown Text.
                  textFormat: CountdownTextFormat.S,

                  // Handles Countdown Timer (true for Reverse Countdown (max to 0), false for Forward Countdown (0 to max)).
                  isReverse: true,

                  // Handles Animation Direction (true for Reverse Animation, false for Forward Animation).
                  isReverseAnimation: true,

                  // Handles visibility of the Countdown Text.
                  isTimerTextShown: true,

                  // Handles the timer start.
                  autoStart: true,

                  // This Callback will execute when the Countdown Starts.
                  onStart: () {
                    // Here, do whatever you want
                    debugPrint('Countdown Started');
                  },

                  // This Callback will execute when the Countdown Ends.
                  onComplete: () {
                    // Here, do whatever you want
                    debugPrint('Countdown Ended');
                  },

                  // This Callback will execute when the Countdown Changes.
                  onChange: (String timeStamp) {
                    // Here, do whatever you want
                    debugPrint('Countdown Changed $timeStamp');
                  },
                  timeFormatterFunction: (defaultFormatterFunction, duration) {
                    return '${Function.apply(defaultFormatterFunction, [
                          duration
                        ])} s';
                  },
                ),
                40.h.verticalSpace,
                Container(
                  width: 120,
                  padding: EdgeInsets.symmetric(vertical: 8.h),
                  decoration: BoxDecoration(
                    color: themeController.isDarkMode.value
                        ? AppColors.dark1
                        : AppColors.white,
                    borderRadius: BorderRadius.circular(21),
                  ),
                  child: Center(
                    child: Text(
                      AppStrings.resendCode.tr,
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ),
                40.h.verticalSpace,
                ReservationButton(
                  text: AppStrings.confirm.tr,
                  onClick: _verificationController.handleClickConfirm,
                ),
                20.h.verticalSpace,
                ReservationButton(
                  text: AppStrings.haveAccount.tr,
                  isPrimary: false,
                  onClick: _verificationController.handleClickSignIn,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
