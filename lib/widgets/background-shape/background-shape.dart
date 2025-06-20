import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inn_tech_appointment/config/colors/colors.dart';

import '../../config/image_urls/image_urls.dart';
import '../../config/strings/strings.dart';
import '../../config/theme/theme_controller.dart';

class BackgroundShape extends StatelessWidget {
  BackgroundShape({
    super.key,
    required this.child,
    this.backgroundColor = AppColors.white,
    this.withLogo = false,
  });
  final Widget child;
  final Color? backgroundColor;
  final bool? withLogo;
  final ThemeController themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Stack(
              alignment: Alignment.bottomCenter,
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  AppImages.bgShapeTop,
                  fit: BoxFit.fitHeight,
                  color: themeController.isDarkMode.value
                      ? AppColors.dark1
                      : AppColors.blueLight,
                ),
                withLogo!
                    ? Positioned(
                        bottom: -50.h,
                        child: Center(
                          child: Image.asset(
                            themeController.isDarkMode.value
                                ? AppImages.logoCompanyDark
                                : AppImages.logo,
                            height: 99.h,
                            width: 99.h,
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
                withLogo!
                    ? Positioned(
                        bottom: -90.h,
                        child: Center(
                          child: Text(
                            AppStrings.reservation.tr.toUpperCase(),
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w600,
                              color: themeController.isDarkMode.value
                                  ? AppColors.white
                                  : AppColors.gray,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              AppImages.bgShapeBottom,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              color: themeController.isDarkMode.value
                  ? AppColors.dark1
                  : AppColors.blueLight,
            ),
          ),
          Positioned(
            bottom: 16.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.logoCompany,
                  height: 18.h,
                  width: 18.h,
                ),
                8.horizontalSpace,
                Text(
                  'InnTeck || Reservation v1.1',
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.gray1,
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () => {FocusScope.of(context).unfocus()},
            behavior: HitTestBehavior.opaque,
            child: SingleChildScrollView(
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
