import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reservation/config/colors/colors.dart';
import 'package:reservation/config/image_urls/image_urls.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({
    Key? key,
    required this.type,
    required this.doctorName,
    required this.speciality,
    required this.date,
  }) : super(key: key);

  final String type;
  final String doctorName;
  final String speciality;
  final String date;

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
            color: AppColors.white,
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
                    ? 'Your Appointment Done Successfully'
                    : 'Your Appointment Cancelled',
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
                  color: AppColors.black1,
                  fontWeight: FontWeight.w500,
                  fontSize: 12.sp,
                ),
              ),
              6.h.verticalSpace,
              Container(
                padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                decoration: BoxDecoration(
                  color:
                      type == 'done' ? AppColors.primary : AppColors.redLight,
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
          right: 33,
          child: Container(
            height: 35.h,
            width: 35.h,
            decoration: BoxDecoration(
              color: type == 'done' ? AppColors.primary : AppColors.redLight,
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: AppColors.blueLight,
                width: 3,
              ),
            ),
            child: Center(
              child: type == 'done'
                  ? Image.asset(
                      AppImages.tickWhite,
                      height: 12,
                      width: 16,
                    )
                  : Image.asset(
                      AppImages.cancelWhite,
                      height: 12,
                      width: 12,
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
