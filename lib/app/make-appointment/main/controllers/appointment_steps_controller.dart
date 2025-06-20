import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:inn_tech_appointment/app/make-appointment/clinic-doctor/screen/clinic_doctor_screen.dart';
import 'package:inn_tech_appointment/app/make-appointment/main/services/appointment_steps_service.dart';
import 'package:inn_tech_appointment/config/interceptor/interceptor.dart';

import '../../../../config/controllerConfig/base_controller.dart';

class AppointmentStepsController extends BaseController {
  /// SERVICES
  final AppointmentStepsService _appointmentStepsService =
      AppointmentStepsService();

  /// CONTROLLERS

  /// VARIABLES

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
  handleClickMakeAppointment() {
    AppInterceptor.showLoader();
    _appointmentStepsService.getAllClinics().then((clinics) {
      if (clinics != null && clinics.isNotEmpty) {
        _appointmentStepsService
            .getDoctorsByClinic(clinicId: clinics[0].id)
            .then((doctors) {
          if (doctors != null) {
            Get.to(
              () => ClinicDoctorScreen(),
              arguments: [clinics, doctors],
              transition: Transition.rightToLeft,
              curve: Curves.ease,
              duration: const Duration(milliseconds: 500),
            );
          }
          AppInterceptor.hideLoader();
        });
      }
    });
  }

  void handleClickBack() async {
    Get.back();
  }
}
