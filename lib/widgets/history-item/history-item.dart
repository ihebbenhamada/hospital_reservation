import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reservation/config/colors/colors.dart';
import 'package:reservation/config/image_urls/image_urls.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({
    Key? key,
    required this.type,
    required this.doctorName,
    required this.speciality,
    required this.date,
    required this.isArabic,
    required this.isDarkMode,
  }) : super(key: key);

  final String type;
  final String doctorName;
  final String speciality;
  final String date;
  final bool isArabic;
  final bool isDarkMode;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.only(
            top: 15,
            bottom: 10,
            left: 24,
            right: 24,
          ),
          decoration: BoxDecoration(
            color: isDarkMode ? AppColors.dark1 : AppColors.white,
            borderRadius: BorderRadius.circular(35),
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                type == 'done'
                    ? 'appointment_done'.tr
                    : type == 'cancelled'
                        ? 'appointment_cancelled'.tr
                        : 'new_doctor_added'.tr,
                style: TextStyle(
                  color: AppColors.gray1,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                ),
              ),
              6.h.verticalSpace,
              Text(
                '$doctorName / $speciality',
                style: TextStyle(
                  color: isDarkMode ? AppColors.white : AppColors.black1,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                ),
              ),
              6.h.verticalSpace,
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  color: type == 'done' || type == 'news'
                      ? AppColors.primary
                      : AppColors.redLight,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  date,
                  style: TextStyle(
                    color: AppColors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 10.sp,
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: -17,
          right: !isArabic ? 33 : null,
          left: isArabic ? 33 : null,
          child: Container(
            height: 35.h,
            width: 35.h,
            decoration: BoxDecoration(
              color: type == 'done'
                  ? AppColors.primary
                  : type == 'cancelled'
                      ? AppColors.redLight
                      : AppColors.blueLight,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: isDarkMode ? AppColors.dark2 : AppColors.blueLight,
                width: type == 'news' ? 0 : 3,
              ),
            ),
            child: Center(
              child: type == 'done'
                  ? Image.asset(
                      AppImages.tickWhite,
                      height: 12,
                      width: 16,
                    )
                  : type == 'cancelled'
                      ? Image.asset(
                          AppImages.cancelWhite,
                          height: 12,
                          width: 12,
                        )
                      : Image.asset(
                          AppImages.newDoctor,
                          height: 30,
                          width: 30,
                        ),
            ),
          ),
        ),
      ],
    );
  }
}
