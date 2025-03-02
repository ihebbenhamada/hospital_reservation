import 'package:reservation/app/make-appointment/clinic-doctor/services/clinic_doctor_service.dart';

import '../../../../config/controllerConfig/base_controller.dart';
import '../../main/services/appointment_steps_service.dart';

class ClinicDoctorController extends BaseController {
  /// SERVICE
  final ClinicDoctorService _clinicDoctorService = ClinicDoctorService();
  final AppointmentStepsService _appointmentStepsService =
      AppointmentStepsService();

  /// CONTROLLERS

  /// VARIABLES

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// INITIALISATION
}
