import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:inn_tech_appointment/app/make-appointment/clinic-doctor/models/doctor_schedule/doctor_schedule.dart';
import 'package:inn_tech_appointment/app/make-appointment/date-time-appointment/services/date_appointment_service.dart';
import 'package:inn_tech_appointment/config/colors/colors.dart';

import '../../../../config/controllerConfig/base_controller.dart';
import '../../../../config/interceptor/interceptor.dart';
import '../../../../config/strings/strings.dart';
import '../../clinic-doctor/models/data_create_appointment/data_create_appointment.dart';
import '../../clinic-doctor/services/clinic_doctor_service.dart';
import '../../patient-information/screen/patient_information_screen.dart';

class DateTimeAppointmentController extends BaseController {
  /// SERVICES
  final ClinicDoctorService _clinicDoctorService = ClinicDoctorService();
  final DateAppointmentService _dateAppointmentService =
      DateAppointmentService();

  /// CONTROLLERS

  /// VARIABLES
  final Rx<DateTime> selectedDate = DateTime.now().obs;
  DoctorSchedule selectedDoctorSchedule = DoctorSchedule();
  final RxList<DoctorSchedule> doctorScheduleList = <DoctorSchedule>[].obs;
  Rx<DataCreateAppointment> dataCreateAppointment = DataCreateAppointment().obs;

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
  void initValues() {
    if (Get.arguments != null) {
      doctorScheduleList.value = Get.arguments[0];
      if (doctorScheduleList.isNotEmpty) {
        selectedDoctorSchedule = doctorScheduleList
            .firstWhere((value) => value.appointmentAvailable == true);
        update();
      }
      dataCreateAppointment.value = Get.arguments[1];
      dataCreateAppointment.value.appointmentDate =
          DateTime.now().toString().substring(0, 10);
    }
  }

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
      AppInterceptor.showLoader();
      dataCreateAppointment.value.appointmentDate =
          pickedDate.toString().substring(0, 10);
      _clinicDoctorService
          .getDoctorSchedule(
        doctorId: dataCreateAppointment.value.doctorId ?? 0,
        date: pickedDate.toString().substring(0, 10),
      )
          .then((value) {
        if (value != null) {
          doctorScheduleList.value = value;
          if (doctorScheduleList.isNotEmpty) {
            selectedDoctorSchedule = doctorScheduleList
                .firstWhere((value) => value.appointmentAvailable == true);
            update();
          }
        }
        AppInterceptor.hideLoader();
      });
    }
  }

  void selectTime(DoctorSchedule doctorSchedule) {
    selectedDoctorSchedule = doctorSchedule;
    update();
  }

  handleClickNext() {
    if (doctorScheduleList.isNotEmpty) {
      AppInterceptor.showLoader();
      _dateAppointmentService
          .getPatientByMrn(mrn: GetStorage().read('mrn') ?? "0")
          .then((value) {
        if (value != null) {
          dataCreateAppointment.value.fKMedDoctorScheduleId =
              selectedDoctorSchedule.fKMedDoctorScheduleId;
          dataCreateAppointment.value.appointmentTimeFrom =
              selectedDoctorSchedule.startTime;
          dataCreateAppointment.value.appointmentTimeTo =
              selectedDoctorSchedule.endTime;
          dataCreateAppointment.value.appointmentNo =
              selectedDoctorSchedule.serial;
          dataCreateAppointment.value.medicalRegisterNo =
              GetStorage().read('mrn') ?? '';
          dataCreateAppointment.value.patientId = value.id;
          AppInterceptor.hideLoader();
          Get.to(
            () => PatientInformationScreen(),
            arguments: [dataCreateAppointment.value],
            transition: Transition.rightToLeft,
            curve: Curves.ease,
            duration: const Duration(milliseconds: 500),
          );
        }
      });
    } else {
      Get.snackbar(
        AppStrings.error.tr,
        AppStrings.shouldSelectAvailableDate.tr,
        colorText: AppColors.white,
        backgroundColor: AppColors.redLight,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void handleClickBack() async {
    Get.back();
  }
}
