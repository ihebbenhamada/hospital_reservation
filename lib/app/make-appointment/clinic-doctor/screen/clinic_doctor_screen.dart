import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reservation/app/make-appointment/clinic-doctor/controllers/clinic_doctor_controller.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/image_urls/image_urls.dart';
import '../../../../config/theme/theme_controller.dart';
import '../../../../widgets/reservation-button/reservation-button.dart';

class ClinicDoctorScreen extends StatelessWidget {
  ClinicDoctorScreen({Key? key}) : super(key: key);
  final _clinicDoctorController = Get.put(ClinicDoctorController());
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
                          AppImages.laptopMedical,
                          height: 53.h,
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
                        'choose_clinic_doctor_step'.tr,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  28.h.verticalSpace,
                  Container(
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
                    child: GetBuilder<ClinicDoctorController>(
                      builder: (_) => DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _clinicDoctorController.selectedClinic,
                          style: TextStyle(
                            color: AppColors.gray5,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          isExpanded: true,
                          alignment: Alignment.bottomCenter,
                          icon: Image.asset(
                            AppImages.arrowDrop,
                            height: 8.h,
                          ),
                          onChanged: (String? newValue) =>
                              _clinicDoctorController.onSelectClinic(newValue),
                          items: _clinicDoctorController.clinics
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  40.h.verticalSpace,
                  Container(
                    width: double.infinity,
                    height: 60.h,
                    padding: const EdgeInsets.symmetric(horizontal: 23),
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
                    child: GetBuilder<ClinicDoctorController>(
                      builder: (_) => DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: _clinicDoctorController.selectedDoctor,
                          style: TextStyle(
                            color: AppColors.gray5,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          isExpanded: true,
                          alignment: Alignment.bottomCenter,
                          icon: Image.asset(
                            AppImages.arrowDrop,
                            height: 8.h,
                          ),
                          onChanged: (String? newValue) =>
                              _clinicDoctorController.onSelectDoctor(newValue),
                          items: _clinicDoctorController.doctors
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ReservationButton(
              text: 'next'.tr,
              onClick: _clinicDoctorController.handleClickNext,
            ),
            20.h.verticalSpace,
            ReservationButton(
              text: 'back'.tr,
              isPrimary: false,
              onClick: _clinicDoctorController.handleClickBack,
            ),
            80.h.verticalSpace
          ],
        ),
      ),
    );
  }
}
