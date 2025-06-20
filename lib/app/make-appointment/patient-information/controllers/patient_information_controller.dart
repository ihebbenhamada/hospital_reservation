import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:inn_tech_appointment/app/make-appointment/clinic-doctor/models/data_create_appointment/data_create_appointment.dart';
import 'package:inn_tech_appointment/app/make-appointment/patient-information/services/patient_info_service.dart';
import 'package:logger/logger.dart';

import '../../../../config/controllerConfig/base_controller.dart';
import '../../../auth/login/models/login_response.dart';

class PatientInformationController extends BaseController {
  /// SERVICES
  final PatientInfoService _patientInfoService = PatientInfoService();

  /// CONTROLLERS
  late TextEditingController mrnTextEditingController;
  late TextEditingController serialTextEditingController;
  late TextEditingController patientNameTextEditingController;
  late TextEditingController doctorNameTextEditingController;
  late TextEditingController mobileTextEditingController;
  late TextEditingController dateTextEditingController;

  final Rx<DataCreateAppointment> dataCreateAppointment =
      DataCreateAppointment().obs;
  final Rx<LoginResponse> loginResponse = LoginResponse().obs;

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
    mrnTextEditingController.dispose();
    serialTextEditingController.dispose();
    patientNameTextEditingController.dispose();
    doctorNameTextEditingController.dispose();
    mobileTextEditingController.dispose();
    dateTextEditingController.dispose();
    super.dispose();
  }

  /// INITIALISATION
  void initValues() {
    loginResponse.value = LoginResponse.fromJson(
        GetStorage().read('user') as Map<String, dynamic>);
    mrnTextEditingController = TextEditingController();
    serialTextEditingController = TextEditingController();
    patientNameTextEditingController = TextEditingController();
    doctorNameTextEditingController = TextEditingController();
    mobileTextEditingController = TextEditingController();
    dateTextEditingController = TextEditingController();

    if (Get.arguments != null) {
      dataCreateAppointment.value = Get.arguments[0];
      mrnTextEditingController.text =
          dataCreateAppointment.value.medicalRegisterNo ?? '';
      serialTextEditingController.text =
          dataCreateAppointment.value.appointmentNo.toString();
      patientNameTextEditingController.text =
          GetStorage().read('patientName') ?? "";
      Logger().e(GetStorage().read('user'));
      mobileTextEditingController.text = (LoginResponse.fromJson(
              GetStorage().read('user') as Map<String, dynamic>))
          .phoneNumber;
    }
  }
}
