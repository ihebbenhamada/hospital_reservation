import 'package:get/get.dart';

import '../../../../config/controllerConfig/base_controller.dart';
import '../models/patient_appointments/patient_appointments.dart';
import '../services/history_service.dart';

class HistoryController extends BaseController {
  /// SERVICES
  final HistoryService _historyService = HistoryService();

  /// CONTROLLERS

  /// VARIABLES
  final Rx<PatientAppointments> historicList = PatientAppointments(
    patientAppointments: [],
    latestDoctors: [],
  ).obs;

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
    _historyService.getPatientsAppointments().then((value) {
      if (value != null) {
        historicList.value = value;
      }
    });
  }

  /// FUNCTIONS
}
