import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/route_manager.dart';

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/interceptor/interceptor.dart';
import '../../../../config/strings/strings.dart';
import '../models/doctor_schedule/doctor_schedule.dart';

class ClinicDoctorService {
  Future<List<DoctorSchedule>?> getDoctorSchedule(
      {required int doctorId, required String date}) async {
    try {
      Response? response = await AppInterceptor.dio?.get(
        EndPoints.GET_DOCTOR_SCHEDULE_BY_DOCTOR_ID_DATE,
        data: {"doctorId": doctorId.toString(), "bookDate": date},
      );
      if (response != null && response.statusCode == 200) {
        List<DoctorSchedule> doctorScheduleList =
            (response.data as List<dynamic>)
                .map(
                  (doctorScheduleJson) => DoctorSchedule.fromJson(
                    doctorScheduleJson,
                  ),
                )
                .toList();
        return doctorScheduleList;
      } else {
        return null;
      }
    } on DioException catch (e) {
      Get.snackbar(
        AppStrings.error.tr,
        e.response?.data.toString() ?? AppStrings.error.tr,
        colorText: AppColors.white,
        backgroundColor: AppColors.redLight,
        snackPosition: SnackPosition.BOTTOM,
      );
      log(e.response.toString());
      return null;
    }
  }
}
