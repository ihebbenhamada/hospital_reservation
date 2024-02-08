import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../config/colors/colors.dart';
import '../../config/theme/theme_controller.dart';

class ReservationButton extends StatelessWidget {
  ReservationButton({
    Key? key,
    this.textColor = AppColors.white,
    required this.text,
    required this.onClick,
    this.enabled = true,
    this.isPrimary = true,
  }) : super(key: key);

  final Color textColor;
  final String text;
  final void Function() onClick;
  final bool? enabled;
  final bool isPrimary;
  final ThemeController _themeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onClick(),
      child: Container(
        height: 58.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: isPrimary
              ? enabled!
                  ? AppColors.primary
                  : AppColors.primaryDisabled
              : _themeController.isDarkMode.value
                  ? AppColors.dark1
                  : AppColors.white,
          borderRadius: BorderRadius.circular(29),
          boxShadow: [
            BoxShadow(
              color: const Color.fromRGBO(0, 0, 0, 0.16),
              offset: const Offset(0.0, 1),
              blurRadius: 10.0.h,
              spreadRadius: 0.h,
            ),
          ],
        ),
        child: Center(
          child: Text(
            text.toUpperCase(),
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              color: isPrimary ? textColor : AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }
}
