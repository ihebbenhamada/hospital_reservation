import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../config/colors/colors.dart';

class ReservationButton extends StatelessWidget {
  const ReservationButton({
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
            text,
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
