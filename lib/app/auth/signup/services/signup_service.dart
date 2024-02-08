import 'package:dio/dio.dart';

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/interceptor/interceptor.dart';
import '../models/signup_response.dart';

class SignUpService {
  Future<SignUpResponse?> signup({
    required String hawia,
    required String fullName,
    required String mobile,
  }) async {
    AppInterceptor.showLoader();
    Map<String, dynamic> data = {
      "hawia": hawia,
      "mobile": mobile,
      "fullName": fullName,
      "gender": 1,
    };
    AppInterceptor.dio?.post(EndPoints.CREATE_PATENT, data: data).then(
      (Response<dynamic> response) {
        if (response.statusCode == 200) {
          return SignUpResponse.fromJson(response.data);
        }
      },
    );
    return null;
  }
}
