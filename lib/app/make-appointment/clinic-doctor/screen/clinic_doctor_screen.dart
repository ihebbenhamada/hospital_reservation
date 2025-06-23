import 'package:animated_custom_dropdown/custom_dropdown.dart';
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
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 40.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            85.h.verticalSpace,
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
                  Obx(
                    () => CustomDropdown<Clinic>.searchRequest(
                      items: _dashboardController.clinicsList,
                      listItemBuilder:
                          (context, clinic, isSelected, onItemSelect) {
                        return Text(
                          Get.locale?.languageCode == 'en'
                              ? clinic.departmentNameEn
                              : clinic.departmentNameAr,
                          style: TextStyle(
                            color: _themeController.isDarkMode.value
                                ? AppColors.white
                                : AppColors.gray5,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      },
                      headerBuilder: (context, emp, isTrue) {
                        return Text(
                          Get.locale?.languageCode == 'en'
                              ? _dashboardController
                                      .selectedClinic.value?.departmentNameEn ??
                                  ""
                              : _dashboardController
                                      .selectedClinic.value?.departmentNameAr ??
                                  "",
                          style: TextStyle(
                            color: _themeController.isDarkMode.value
                                ? AppColors.white
                                : AppColors.gray5,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      },
                      closedHeaderPadding: EdgeInsets.symmetric(
                        horizontal: 23,
                        vertical: 18.h,
                      ),
                      initialItem: _dashboardController.selectedClinic.value,
                      decoration: CustomDropdownDecoration(
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                        ),
                        closedSuffixIcon: Image.asset(
                          AppImages.arrowDrop,
                          height: 8.h,
                          color: _themeController.isDarkMode.value
                              ? AppColors.white
                              : AppColors.gray5,
                        ),
                        closedBorderRadius: BorderRadius.circular(30),
                        closedFillColor: _themeController.isDarkMode.value
                            ? AppColors.dark1
                            : AppColors.white,
                        expandedFillColor: _themeController.isDarkMode.value
                            ? AppColors.dark1
                            : AppColors.white,
                        expandedBorderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        closedShadow: [
                          BoxShadow(
                            color: const Color.fromRGBO(0, 0, 0, 0.1),
                            offset: const Offset(0.0, 1),
                            blurRadius: 10.0.h,
                            spreadRadius: 0.h,
                          ),
                        ],
                        expandedShadow: [
                          BoxShadow(
                            color: const Color.fromRGBO(0, 0, 0, 0.1),
                            offset: const Offset(0.0, 1),
                            blurRadius: 10.0.h,
                            spreadRadius: 0.h,
                          ),
                        ],
                        listItemDecoration: ListItemDecoration(
                          selectedColor: _themeController.isDarkMode.value
                              ? AppColors.dark1
                              : AppColors.white,
                          splashColor: _themeController.isDarkMode.value
                              ? AppColors.dark2
                              : AppColors.white,
                          highlightColor: _themeController.isDarkMode.value
                              ? AppColors.dark2
                              : AppColors.white,
                        ),
                        searchFieldDecoration: SearchFieldDecoration(
                          fillColor: _themeController.isDarkMode.value
                              ? AppColors.dark1
                              : AppColors.gray2,
                          textStyle: TextStyle(
                            color: _themeController.isDarkMode.value
                                ? AppColors.white
                                : AppColors.gray5,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                          hintStyle: TextStyle(
                            color: _themeController.isDarkMode.value
                                ? AppColors.white
                                : AppColors.gray5,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      searchHintText: AppStrings.searchClinic.tr,
                      futureRequest: (value) =>
                          _dashboardController.searchClinic(value),
                      onChanged: (Clinic? newValue) =>
                          _dashboardController.onSelectClinic(newValue),
                    ),
                  ),
                  28.h.verticalSpace,
                  Obx(
                    () => CustomDropdown<Doctor>(
                      items: _dashboardController.doctorsList,
                      hintText: "select_employee".tr,
                      listItemBuilder:
                          (context, doctor, isSelected, onItemSelect) {
                        return Text(
                          doctor.fullName,
                          style: TextStyle(
                            color: _themeController.isDarkMode.value
                                ? AppColors.white
                                : AppColors.gray5,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      },
                      headerBuilder: (context, emp, isTrue) {
                        return Text(
                          _dashboardController.selectedDoctor.value?.fullName ??
                              "",
                          style: TextStyle(
                            color: _themeController.isDarkMode.value
                                ? AppColors.white
                                : AppColors.gray5,
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        );
                      },
                      closedHeaderPadding: EdgeInsets.symmetric(
                        horizontal: 23,
                        vertical: 18.h,
                      ),
                      initialItem: _dashboardController.selectedDoctor.value,
                      decoration: CustomDropdownDecoration(
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                        ),
                        closedSuffixIcon: Image.asset(
                          AppImages.arrowDrop,
                          height: 8.h,
                          color: _themeController.isDarkMode.value
                              ? AppColors.white
                              : AppColors.gray5,
                        ),
                        closedBorderRadius: BorderRadius.circular(30),
                        closedFillColor: _themeController.isDarkMode.value
                            ? AppColors.dark1
                            : AppColors.white,
                        expandedFillColor: _themeController.isDarkMode.value
                            ? AppColors.dark1
                            : AppColors.white,
                        expandedBorderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        closedShadow: [
                          BoxShadow(
                            color: const Color.fromRGBO(0, 0, 0, 0.1),
                            offset: const Offset(0.0, 1),
                            blurRadius: 10.0.h,
                            spreadRadius: 0.h,
                          ),
                        ],
                        expandedShadow: [
                          BoxShadow(
                            color: const Color.fromRGBO(0, 0, 0, 0.1),
                            offset: const Offset(0.0, 1),
                            blurRadius: 10.0.h,
                            spreadRadius: 0.h,
                          ),
                        ],
                        listItemDecoration: ListItemDecoration(
                          selectedColor: _themeController.isDarkMode.value
                              ? AppColors.dark1
                              : AppColors.white,
                          splashColor: _themeController.isDarkMode.value
                              ? AppColors.dark2
                              : AppColors.white,
                          highlightColor: _themeController.isDarkMode.value
                              ? AppColors.dark2
                              : AppColors.white,
                        ),
                      ),
                      /*futureRequest: (value) =>
                              _dashboardController.searchDoctor(value),*/
                      onChanged: (Doctor? doctor) {
                        _dashboardController.selectedDoctor.value = doctor!;
                      },
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
