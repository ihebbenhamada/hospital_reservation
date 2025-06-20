import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:get/route_manager.dart';

import '../../../config/api-urls/end_points.dart';
import '../../../config/colors/colors.dart';
import '../../../config/interceptor/interceptor.dart';
import '../../../config/strings/strings.dart';
import '../../make-appointment/main/models/doctor/doctor.dart';

class NotificationsService {
  Future<List<Doctor>?> getNotifications() async {
    try {
      Response? response =
          await AppInterceptor.dio?.get(EndPoints.GET_LATEST_DOCTORS);
      if (response != null && response.statusCode == 200) {
        return (response.data as List<dynamic>)
            .map((e) => Doctor.fromJson(e as Map<String, dynamic>))
            .toList();
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
