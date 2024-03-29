import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:reservation/app/make-appointment/clinic-doctor/services/clinic_doctor_service.dart';
import 'package:reservation/app/make-appointment/date-time-appointment/screen/date_time_appointment_screen.dart';

import '../../../../config/controllerConfig/base_controller.dart';

class ClinicDoctorController extends BaseController {
  /// SERVICE
  final ClinicDoctorService _clinicDoctorService = ClinicDoctorService();

  /// CONTROLLERS

  /// VARIABLES
  String selectedClinic = 'Choose Clinic';
  String selectedDoctor = 'Choose Doctor';
  final List<String> clinics = [
    'Choose Clinic',
    'Option 2',
    'Option 3',
    'Option 4'
  ];
  final List<String> doctors = [
    'Choose Doctor',
    'Option 2',
    'Option 3',
    'Option 4'
  ];

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    _clinicDoctorService.getAllClinics();
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
  onSelectDoctor(String? value) {
    selectedDoctor = value!;
    update();
  }

  onSelectClinic(String? value) {
    selectedClinic = value!;
    _clinicDoctorService.getDoctorsByClinic(clinicId: int.parse(value));
    update();
  }

  handleClickNext() {
    Get.to(
      () => DateTimeAppointmentScreen(),
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  void handleClickBack() async {
    Get.back();
  }
}
