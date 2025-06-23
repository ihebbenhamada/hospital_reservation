import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:inn_tech_appointment/config/api-urls/end_points.dart';
import 'package:inn_tech_appointment/config/colors/colors.dart';

import '../../../../config/interceptor/interceptor.dart';
import '../models/otp_response.dart';

class SignUpService {
  Future<OTPResponse?> sendOTP({
    required String phone,
  }) async {
    Map<String, dynamic> data = {
      "phone": phone,
    };
    try {
      Response? response =
          await AppInterceptor.dio?.post(EndPoints.SEND_OTP, data: data);
      if (response != null && response.statusCode == 200) {
        return OTPResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on DioException catch (e) {
      log(e.response.toString());
      Fluttertoast.showToast(
        msg: e.response?.data.toString() ?? 'error'.tr,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: AppColors.redLight,
        textColor: AppColors.white,
        fontSize: 16.0.sp,
      );
      return null;
    }
  }
}
