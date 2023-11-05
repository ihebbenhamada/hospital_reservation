import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reservation/app/dashboard/settings/controllers/settings_controller.dart';
import 'package:reservation/config/image_urls/image_urls.dart';

import '../../../../config/colors/colors.dart';

class SettingsScreen extends StatelessWidget {
  final _settingsController = Get.put(SettingsController());
  SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueLight,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 56.h),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            children: [
              220.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 160.h,
                    width: 160.h,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromRGBO(0, 0, 0, 0.1),
                          offset: const Offset(0.0, 1),
                          blurRadius: 10.0.h,
                          spreadRadius: 0.h,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.language,
                              height: 28,
                              width: 28,
                              color: AppColors.gray4,
                            ),
                            SizedBox(
                              height: 16,
                              width: 33,
                              child: Transform.scale(
                                scale: 0.7,
                                child: CupertinoSwitch(
                                  value: true,
                                  activeColor: AppColors.primary,
                                  onChanged: (value) {},
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Arabic Language',
                              style: TextStyle(
                                color: AppColors.gray3,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            6.h.verticalSpace,
                            Text(
                              'Change Laugauge',
                              style: TextStyle(
                                color: AppColors.gray3,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 160.h,
                    width: 160.h,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromRGBO(0, 0, 0, 0.1),
                          offset: const Offset(0.0, 1),
                          blurRadius: 10.0.h,
                          spreadRadius: 0.h,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.theme,
                              height: 28,
                              width: 28,
                              color: AppColors.gray4,
                            ),
                            SizedBox(
                              height: 16,
                              width: 33,
                              child: Transform.scale(
                                scale: 0.7,
                                child: CupertinoSwitch(
                                  value: true,
                                  activeColor: AppColors.primary,
                                  onChanged: (value) {},
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Dark Theme',
                              style: TextStyle(
                                color: AppColors.gray3,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            6.h.verticalSpace,
                            Text(
                              'Change Theme',
                              style: TextStyle(
                                color: AppColors.gray3,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              28.h.verticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 160.h,
                    width: 160.h,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromRGBO(0, 0, 0, 0.1),
                          offset: const Offset(0.0, 1),
                          blurRadius: 10.0.h,
                          spreadRadius: 0.h,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImages.notif,
                              height: 28,
                              width: 28,
                              color: AppColors.gray4,
                            ),
                            SizedBox(
                              height: 16,
                              width: 33,
                              child: Transform.scale(
                                scale: 0.7,
                                child: CupertinoSwitch(
                                  value: true,
                                  activeColor: AppColors.primary,
                                  onChanged: (value) {},
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Send Notification',
                              style: TextStyle(
                                color: AppColors.gray3,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            6.h.verticalSpace,
                            Text(
                              'Send Notification Alarm',
                              style: TextStyle(
                                color: AppColors.gray3,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 160.h,
                    width: 160.h,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: const Color.fromRGBO(0, 0, 0, 0.1),
                          offset: const Offset(0.0, 1),
                          blurRadius: 10.0.h,
                          spreadRadius: 0.h,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              AppImages.signout,
                              height: 28,
                              width: 28,
                              color: AppColors.gray4,
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Sign Out',
                              style: TextStyle(
                                color: AppColors.gray3,
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            6.h.verticalSpace,
                            Text(
                              'Sign Out From App',
                              style: TextStyle(
                                color: AppColors.gray3,
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
              30.h.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
