import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/interceptor/interceptor.dart';
import '../../../../config/strings/strings.dart';
import '../models/login_response.dart';

class LoginService {
  Future<LoginResponse?> login({
    required String hawiaNo,
    required String password,
  }) async {
    Map<String, String> data = {
      "hawiaNo": hawiaNo,
      "password": password,
    };

    try {
      Response? response =
          await AppInterceptor.dio?.post(EndPoints.LOGIN_URL, data: data);
      if (response != null && response.statusCode == 200) {
        return LoginResponse.fromJson(response.data);
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
