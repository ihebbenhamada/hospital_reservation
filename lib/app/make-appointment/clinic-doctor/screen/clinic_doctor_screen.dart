import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:inn_tech_appointment/app/make-appointment/main/models/doctor/doctor.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/image_urls/image_urls.dart';
import '../../../../config/strings/strings.dart';
import '../../../../config/theme/theme_controller.dart';
import '../../../dashboard/controller/dashboard-controller.dart';
import '../../main/models/clinic/clinic.dart';

class ClinicDoctorScreen extends StatelessWidget {
  ClinicDoctorScreen({super.key});
  //final _clinicDoctorController = Get.put(ClinicDoctorController());
  final ThemeController _themeController = Get.find();
  final DashboardController _dashboardController = Get.find();
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
            100.h.verticalSpace,
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
                        AppStrings.chooseClinicDoctorStep.tr,
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
                    child: Obx(
                      () => DropdownButtonHideUnderline(
                        child: DropdownButton<Clinic>(
                          value: _dashboardController.selectedClinic.value,
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
                          onChanged: (Clinic? newValue) =>
                              _dashboardController.onSelectClinic(newValue),
                          items: _dashboardController.clinicsList
                              .map<DropdownMenuItem<Clinic>>((Clinic value) {
                            return DropdownMenuItem<Clinic>(
                              value: value,
                              child: Text(value.departmentNameEn),
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
                    child: Obx(
                      () => DropdownButtonHideUnderline(
                        child: DropdownButton<Doctor>(
                          value: _dashboardController.selectedDoctor.value,
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
                          onChanged: (Doctor? newValue) =>
                              _dashboardController.onSelectDoctor(newValue),
                          items: _dashboardController.doctorsList
                              .map<DropdownMenuItem<Doctor>>((Doctor value) {
                            return DropdownMenuItem<Doctor>(
                              value: value,
                              child: Text(value.fullName),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
