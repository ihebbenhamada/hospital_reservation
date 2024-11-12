import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';
import 'package:reservation/app/make-appointment/date-time-appointment/models/patient/patient.dart';

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/interceptor/interceptor.dart';

class DateAppointmentService {
  Future<Patient?> getPatientByMrn({required String mrn}) async {
    try {
      Response? response =
          await AppInterceptor.dio?.get(EndPoints.GET_PATIENT_BY_MRN(mrn));
      if (response != null && response.statusCode == 200) {
        return Patient.fromJson(response.data);
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
