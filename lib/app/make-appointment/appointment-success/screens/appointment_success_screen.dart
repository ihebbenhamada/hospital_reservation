import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reservation/config/colors/colors.dart';
import 'package:reservation/config/image_urls/image_urls.dart';

import '../../../../widgets/reservation-button/reservation-button.dart';
import '../controllers/appointment_success_controller.dart';

class AppointmentSuccessScreen extends StatelessWidget {
  final _appointmentSuccessController = Get.put(AppointmentSuccessController());

  AppointmentSuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueLight,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            130.h.verticalSpace,
            Center(
              child: Stack(
                children: [
                  Image.asset(
                    AppImages.passwordCircle,
                    height: 188.h,
                    width: 188.h,
                  ),
                  Positioned(
                    top: 20.h,
                    right: 10,
                    child: Image.asset(
                      AppImages.passwordTick,
                      width: 137.h,
                    ),
                  ),
                ],
              ),
            ),
            43.h.verticalSpace,
            Container(
              width: 120,
              padding: EdgeInsets.symmetric(vertical: 8.h),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(21),
              ),
              child: Center(
                child: Text(
                  'Congratultions !!',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),
            25.h.verticalSpace,
            Text(
              'Your Appiontment added Successfull !!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w500,
                color: AppColors.primary,
                height: 1.5,
              ),
            ),
            43.h.verticalSpace,
            Row(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 190.h,
                      width: 8,
                      color: AppColors.white,
                    ),
                    Positioned(
                      top: 0,
                      child: Container(
                        width: 41.h,
                        height: 41.h,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(41.h),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromRGBO(0, 0, 0, 0.1),
                              offset: const Offset(0.0, 2),
                              blurRadius: 5.0.h,
                              spreadRadius: 0.h,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Image.asset(
                            AppImages.hashtag,
                            height: 22.h,
                            width: 22.h,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 41.h,
                      height: 41.h,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(41.h),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromRGBO(0, 0, 0, 0.1),
                            offset: const Offset(0.0, 2),
                            blurRadius: 5.0.h,
                            spreadRadius: 0.h,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Image.asset(
                          AppImages.userDash,
                          height: 17.h,
                          width: 22.h,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: 41.h,
                        height: 41.h,
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(41.h),
                          boxShadow: [
                            BoxShadow(
                              color: const Color.fromRGBO(0, 0, 0, 0.1),
                              offset: const Offset(0.0, 2),
                              blurRadius: 5.0.h,
                              spreadRadius: 0.h,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Image.asset(
                            AppImages.phone,
                            height: 15.h,
                            width: 15.h,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 190.h,
                  padding: EdgeInsets.only(
                    top: 10.h,
                    bottom: 14.h,
                    left: 10,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'MRN: 455',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                      ),
                      Text(
                        'Name: Iheb Ben Hamada',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                      ),
                      Text(
                        'Mobile: 0597896489',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            40.h.verticalSpace,
            ReservationButton(
              text: 'Continue',
              onClick: _appointmentSuccessController.handleClickContinue,
            ),
            20.h.verticalSpace,
            ReservationButton(
              text: 'Back',
              isPrimary: false,
              onClick: _appointmentSuccessController.handleClickBack,
            ),
          ],
        ),
      ),
    );
  }
}
