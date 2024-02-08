import 'package:dio/dio.dart';

import '../../../../api/models/patient/patient.dart';
import '../../../../config/api-urls/end_points.dart';
import '../../../../config/interceptor/interceptor.dart';

class HomeService {
  Future<Patient?> getPatientByMobileNumber(
      {required String mobileNumber}) async {
    Response? response = await AppInterceptor.dio?.get(
      EndPoints.GET_PATIENT_BY_MOBILE_NUMBER + mobileNumber,
    );
    if (response != null && response.statusCode == 200) {
      return Patient.fromJson(response.data);
    } else {
      return null;
    }
  }
}
