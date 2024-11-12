import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/route_manager.dart';

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/interceptor/interceptor.dart';
import '../models/patient_appointments/patient_appointments.dart';

class HistoryService {
  Future<PatientAppointments?> getPatientsAppointments() async {
    try {
      Response? response =
          await AppInterceptor.dio?.get(EndPoints.GET_PATIENT_APPOINTMENTS);
      if (response != null && response.statusCode == 200) {
        return PatientAppointments.fromJson(response.data);
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
