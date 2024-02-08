import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reservation/widgets/information-input/information-input.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/image_urls/image_urls.dart';
import '../../../../config/theme/theme_controller.dart';
import '../../../../widgets/reservation-button/reservation-button.dart';
import '../controllers/patient_information_controller.dart';

class PatientInformationScreen extends StatelessWidget {
  PatientInformationScreen({Key? key}) : super(key: key);

  final _patientInformationController = Get.put(PatientInformationController());
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
                          AppImages.info,
                          height: 80.h,
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
                        'complete_information_step'.tr,
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                  ),
                  28.h.verticalSpace,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InformationInput(
                        controller: _patientInformationController
                            .mrnTextEditingController,
                        height: 50.h,
                        width: MediaQuery.of(context).size.width * 0.38,
                        hintText: 'Mrn',
                      ),
                      InformationInput(
                        controller: _patientInformationController
                            .serialTextEditingController,
                        height: 50.h,
                        width: MediaQuery.of(context).size.width * 0.38,
                        hintText: 'serial'.tr,
                      ),
                    ],
                  ),
                  35.h.verticalSpace,
                  InformationInput(
                    controller: _patientInformationController
                        .patientNameTextEditingController,
                    height: 50.h,
                    width: double.infinity,
                    hintText: 'patient_name'.tr,
                  ),
                  35.h.verticalSpace,
                  InformationInput(
                    controller: _patientInformationController
                        .mobileTextEditingController,
                    height: 50.h,
                    width: double.infinity,
                    hintText: 'phone_number'.tr,
                  ),
                ],
              ),
            ),
            ReservationButton(
              text: 'confirm'.tr,
              onClick: _patientInformationController.handleClickConfirm,
            ),
            20.h.verticalSpace,
            ReservationButton(
              text: 'back'.tr,
              isPrimary: false,
              onClick: _patientInformationController.handleClickBack,
            ),
            80.h.verticalSpace
          ],
        ),
      ),
    );
  }
}
