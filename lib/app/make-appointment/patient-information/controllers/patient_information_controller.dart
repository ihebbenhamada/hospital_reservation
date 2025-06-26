import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:inn_tech_appointment/app/make-appointment/clinic-doctor/models/data_create_appointment/data_create_appointment.dart';
import 'package:inn_tech_appointment/app/make-appointment/patient-information/services/patient_info_service.dart';

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
    if (GetStorage().read('user') is Map<String, dynamic>) {
      loginResponse.value = LoginResponse.fromJson(
          GetStorage().read('user') as Map<String, dynamic>);
    } else if (GetStorage().read('user') is LoginResponse) {
      loginResponse.value = GetStorage().read('user') as LoginResponse;
    }
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

      if (GetStorage().read('user') is Map<String, dynamic>) {
        mobileTextEditingController.text = LoginResponse.fromJson(
                GetStorage().read('user') as Map<String, dynamic>)
            .phoneNumber;
      } else if (GetStorage().read('user') is LoginResponse) {
        mobileTextEditingController.text =
            (GetStorage().read('user') as LoginResponse).phoneNumber;
      }
    }
  }
}
