import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:reservation/app/make-appointment/clinic-doctor/models/data_create_appointment/data_create_appointment.dart';
import 'package:reservation/app/make-appointment/patient-information/models/create_appointment_response/create_appointment_response.dart';

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/interceptor/interceptor.dart';

class PatientInfoService {
  Future<CreateAppointmentResponse?> createAppointment(
      {required DataCreateAppointment data}) async {
    try {
      Response? response = await AppInterceptor.dio
          ?.post(EndPoints.CREATE_PATIENT_APPOINTMENT, data: data.toJson());
      if (response != null && response.statusCode == 200) {
        return CreateAppointmentResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on DioException catch (e) {
      Get.snackbar(
        'Error',
        e.response?.data.toString() ?? 'error'.tr,
        colorText: AppColors.white,
        backgroundColor: AppColors.redLight,
        snackPosition: SnackPosition.BOTTOM,
      );
      log(e.response.toString());
      return null;
    }
  }
}
