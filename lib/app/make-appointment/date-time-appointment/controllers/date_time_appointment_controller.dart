import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation/app/make-appointment/patient-information/screen/patient_information_screen.dart';
import 'package:reservation/config/colors/colors.dart';

import '../../../../config/controllerConfig/base_controller.dart';

class DateTimeAppointmentController extends BaseController {
  /// CONTROLLERS

  /// VARIABLES
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  int selectedHourIndex = 0;
  final List<String> hoursList = [
    '09:00',
    '10:00',
    '11:00',
    '12:00',
    '13:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    '18:00',
    '19:00',
    '20:00',
    '21:00',
    '22:00',
    '23:00',
    '00:00',
    '01:00',
    '02:00',
    '03:00',
    '04:00',
  ];

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// INITIALISATION
  void initValues() {}

  /// FUNCTIONS
  void selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary, // header background color
              onPrimary: AppColors.white, // header text color
              onSurface: AppColors.black1, // body text color
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.black1, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
    }
  }

  void selectHour(int index) {
    selectedHourIndex = index;
    update();
  }

  handleClickNext() {
    Get.to(
      () => PatientInformationScreen(),
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  void handleClickBack() async {
    Get.back();
  }
}
