import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../config/colors/colors.dart';

class SettingsItem extends StatelessWidget {
  const SettingsItem({
    super.key,
    required this.icon,
    this.isEnabled,
    required this.title,
    required this.description,
    this.onToggleSwitch,
    this.isDarkMode = false,
    this.isSwitchVisible = false,
  });

  final String icon;
  final bool isSwitchVisible;
  final bool? isEnabled;
  final bool isDarkMode;
  final String title;
  final String description;
  final void Function()? onToggleSwitch;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onToggleSwitch,
      child: Container(
        height: 0.36.sw,
        width: 0.36.sw,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: isDarkMode ? AppColors.dark1 : AppColors.white,
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
                  icon,
                  height: 28.h,
                  width: 28.h,
                  color: isDarkMode ? AppColors.white : AppColors.gray4,
                ),
                isEnabled != null
                    ? SizedBox(
                        height: 16,
                        width: 33,
                        child: Transform.scale(
                          scale: 0.7,
                          child: CupertinoSwitch(
                            value: isEnabled!,
                            activeColor: AppColors.primary,
                            onChanged: (value) => onToggleSwitch,
                          ),
                        ),
                      )
                    : const SizedBox(),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  title.tr,
                  style: TextStyle(
                    color: isDarkMode ? AppColors.white : AppColors.gray3,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                6.h.verticalSpace,
                Text(
                  description.tr,
                  style: TextStyle(
                    color: isDarkMode ? AppColors.gray1 : AppColors.gray3,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
