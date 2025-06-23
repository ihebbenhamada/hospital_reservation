import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:inn_tech_appointment/config/api-urls/end_points.dart';
import 'package:inn_tech_appointment/config/colors/colors.dart';

import '../../../../config/interceptor/interceptor.dart';
import '../models/signup_response.dart';

class PasswordService {
  Future<SignUpResponse?> signup({
    required String hawiaNo,
    required String fullName,
    required String password,
    required String phoneNumber,
    required int fkDefCompanyId,
    required int fkDefBranchId,
    String? encryptedOTP,
    String? otp,
  }) async {
    Map<String, dynamic> data = {
      "HawiaNo": hawiaNo,
      "FullName": fullName,
      "Password": password,
      "PhoneNumber": phoneNumber,
      "Fk_DefCompanyId": fkDefCompanyId,
      "Fk_DefBranchId": fkDefBranchId,
      "EncryptedOTP": encryptedOTP,
      "OTP": otp,
    };
    log(data.toString());
    try {
      Response? response =
          await AppInterceptor.dio?.post(EndPoints.CREATE_PATENT, data: data);
      if (response != null && response.statusCode == 200) {
        return SignUpResponse.fromJson(response.data);
      } else {
        return null;
      }
    } on DioException catch (e) {
      log(e.response.toString());
      Fluttertoast.showToast(
        msg: e.response?.data['errors']['Password'][0].toString() ?? 'error'.tr,
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
