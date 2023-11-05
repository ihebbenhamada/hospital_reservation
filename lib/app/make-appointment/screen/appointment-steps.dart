import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reservation/app/make-appointment/controllers/appointment_steps_controller.dart';

import '../../../config/colors/colors.dart';
import '../../../config/image_urls/image_urls.dart';
import '../../../widgets/reservation-button/reservation-button.dart';

class AppointmentStepsScreen extends StatelessWidget {
  AppointmentStepsScreen({Key? key}) : super(key: key);
  final _appointmentStepsController = Get.put(AppointmentStepsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueLight,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            130.h.verticalSpace,
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Image.asset(
                          AppImages.verificationCircle,
                          height: 142.h,
                          width: 142.h,
                        ),
                        Image.asset(
                          AppImages.hospital,
                          height: 60.h,
                        ),
                      ],
                    ),
                  ),
                  97.h.verticalSpace,
                  Center(
                    child: Container(
                      width: 200,
                      padding: EdgeInsets.symmetric(vertical: 15.h),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(21),
                      ),
                      child: Center(
                        child: Text(
                          'Make Your Appointment',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  22.h.verticalSpace,
                  Center(
                    child: Text(
                      'With Easy Steps',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                  28.h.verticalSpace,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 17.h,
                                  width: 17.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(17),
                                  ),
                                ),
                                10.h.verticalSpace,
                                Text(
                                  'Step 1',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 17.h,
                                  width: 17.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(17),
                                  ),
                                ),
                                10.h.verticalSpace,
                                Text(
                                  'Step 2',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 17.h,
                                  width: 17.h,
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(17),
                                  ),
                                ),
                                10.h.verticalSpace,
                                Text(
                                  'Step 3',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Positioned(
                          child: Divider(
                            thickness: 2.2,
                            color: AppColors.primary,
                            indent: 17.h,
                            endIndent: 17.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                  55.h.verticalSpace,
                  Text(
                    '1- CHOOSE CLINIC & DOCTOR',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.gray3,
                    ),
                  ),
                  30.h.verticalSpace,
                  Text(
                    '2- Choose Date & Time',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.gray3,
                    ),
                  ),
                  30.h.verticalSpace,
                  Text(
                    '3- Complete Information',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.gray3,
                    ),
                  ),
                ],
              ),
            ),
            ReservationButton(
              text: 'Start Your Appointment',
              onClick: _appointmentStepsController.handleClickMakeAppointment,
            ),
            20.h.verticalSpace,
            ReservationButton(
              text: 'Back',
              isPrimary: false,
              onClick: _appointmentStepsController.handleClickBack,
            ),
            80.h.verticalSpace
          ],
        ),
      ),
    );
  }
}
