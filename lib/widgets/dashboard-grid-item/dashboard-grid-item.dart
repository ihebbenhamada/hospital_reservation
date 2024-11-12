import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reservation/config/colors/colors.dart';

class DashboardGridItem extends StatelessWidget {
  const DashboardGridItem({
    Key? key,
    required this.icon,
    required this.value,
    required this.title,
    required this.description,
    this.isPrimary = false,
    this.isDarkMode = false,
  }) : super(key: key);

  final String icon;
  final String value;
  final String title;
  final String description;
  final bool isPrimary;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: isPrimary
            ? AppColors.primary
            : isDarkMode
                ? AppColors.dark1
                : AppColors.white,
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
                icon,
                height: 28,
                width: 28,
                color:
                    isPrimary || isDarkMode ? AppColors.white : AppColors.gray3,
              ),
              Text(
                value.toString(),
                style: TextStyle(
                  color: isPrimary
                      ? AppColors.white
                      : isDarkMode
                          ? AppColors.gray1
                          : AppColors.gray3,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                title.toString().tr,
                style: TextStyle(
                  color: isPrimary || isDarkMode
                      ? AppColors.white
                      : AppColors.gray3,
                  fontSize: 13.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              6.h.verticalSpace,
              Text(
                description.toString().tr,
                style: TextStyle(
                  color: isPrimary
                      ? AppColors.white
                      : isDarkMode
                          ? AppColors.gray6
                          : AppColors.gray3,
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
