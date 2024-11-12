import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reservation/config/colors/colors.dart';
import 'package:reservation/config/image_urls/image_urls.dart';
import 'package:reservation/config/theme/theme_controller.dart';

class SignUpHeader extends StatelessWidget {
  SignUpHeader({super.key});
  final ThemeController themeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Image.asset(
              AppImages.userPhoto,
              height: 55.h,
              width: 55.h,
            ),
            Image.asset(
              themeController.isDarkMode.value
                  ? AppImages.signupUserShapeDark
                  : AppImages.signupUserShape,
              height: 55.h,
              width: 55.h,
            ),
          ],
        ),
        12.horizontalSpace,
        Text(
          'registration'.tr.toUpperCase(),
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
            color: themeController.isDarkMode.value
                ? AppColors.white
                : AppColors.black1,
          ),
        ),
      ],
    );
  }
}
