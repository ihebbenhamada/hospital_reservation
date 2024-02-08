import 'package:dio/dio.dart';
import 'package:reservation/app/auth/login/models/login_response.dart';
import 'package:reservation/config/api-urls/end_points.dart';

import '../../../../config/interceptor/interceptor.dart';

class LoginService {
  Future<LoginResponse?> login({
    required String id,
    required String password,
  }) async {
    Map<String, String> data = {
      "email": id,
      "password": password,
    };
    Response? response =
        await AppInterceptor.dio?.post(EndPoints.LOGIN_URL, data: data);
    if (response != null && response.statusCode == 200) {
      return LoginResponse.fromJson(response.data);
    } else {
      return null;
    }
  }
}
