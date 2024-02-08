import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/image_urls/image_urls.dart';
import '../../../../config/theme/theme_controller.dart';
import '../../../../widgets/reservation-button/reservation-button.dart';
import '../controllers/date_time_appointment_controller.dart';

class DateTimeAppointmentScreen extends StatelessWidget {
  DateTimeAppointmentScreen({Key? key}) : super(key: key);

  final _dateTimeAppointmentController =
      Get.put(DateTimeAppointmentController());
  final ThemeController _themeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _themeController.isDarkMode.value
          ? AppColors.dark2
          : AppColors.blueLight,
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
                          _themeController.isDarkMode.value
                              ? AppImages.appointmentCircleDark
                              : AppImages.verificationCircle,
                          height: 142.h,
                          width: 142.h,
                        ),
                        Image.asset(
                          AppImages.stethoscope,
                          height: 70.h,
                        ),
                      ],
                    ),
                  ),
                  50.h.verticalSpace,
                  Container(
                    width: double.infinity,
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Center(
                      child: Text(
                        'choose_date_time_step'.tr,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  28.h.verticalSpace,
                  GestureDetector(
                    onTap: () =>
                        _dateTimeAppointmentController.selectDate(context),
                    child: Container(
                      width: double.infinity,
                      height: 60.h,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 23,
                      ),
                      decoration: BoxDecoration(
                        color: _themeController.isDarkMode.value
                            ? AppColors.dark1
                            : AppColors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromRGBO(0, 0, 0, 0.1),
                            offset: const Offset(0.0, 1),
                            blurRadius: 10.0.h,
                            spreadRadius: 0.h,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Obx(
                            () => Text(
                              DateFormat('dd-MM-yyyy')
                                  .format(_dateTimeAppointmentController
                                      .selectedDate.value)
                                  .toString(),
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: _themeController.isDarkMode.value
                                    ? AppColors.gray1
                                    : AppColors.gray5,
                              ),
                            ),
                          ),
                          Image.asset(
                            AppImages.appointment,
                            height: 18.h,
                            color: _themeController.isDarkMode.value
                                ? AppColors.gray1
                                : AppColors.gray5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  28.h.verticalSpace,
                  GetBuilder<DateTimeAppointmentController>(
                    builder: (_) => Container(
                      width: double.infinity,
                      padding:
                          EdgeInsets.symmetric(vertical: 23.h, horizontal: 14),
                      decoration: BoxDecoration(
                        color: _themeController.isDarkMode.value
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
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 5, // Number of elements in each row
                          crossAxisSpacing: 10.0,
                          mainAxisSpacing: 14.0.h,
                          childAspectRatio: 2,
                        ),
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _dateTimeAppointmentController
                            .hoursList.length, // Total number of elements
                        itemBuilder: (context, index) {
                          String item =
                              _dateTimeAppointmentController.hoursList[index];
                          return GestureDetector(
                            onTap: () => _dateTimeAppointmentController
                                .selectHour(index),
                            child: Container(
                              height: 27.h,
                              decoration: BoxDecoration(
                                color: _dateTimeAppointmentController
                                            .selectedHourIndex ==
                                        index
                                    ? AppColors.primary
                                    : _themeController.isDarkMode.value
                                        ? AppColors.dark4
                                        : AppColors.white,
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(
                                  color: _dateTimeAppointmentController
                                              .selectedHourIndex ==
                                          index
                                      ? AppColors.primary
                                      : AppColors.gray4,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  item,
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w500,
                                    color: _dateTimeAppointmentController
                                                .selectedHourIndex ==
                                            index
                                        ? AppColors.white
                                        : _themeController.isDarkMode.value
                                            ? AppColors.gray1
                                            : AppColors.gray4,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ReservationButton(
              text: 'next'.tr,
              onClick: _dateTimeAppointmentController.handleClickNext,
            ),
            20.h.verticalSpace,
            ReservationButton(
              text: 'back'.tr,
              isPrimary: false,
              onClick: _dateTimeAppointmentController.handleClickBack,
            ),
            80.h.verticalSpace
          ],
        ),
      ),
    );
  }
}
