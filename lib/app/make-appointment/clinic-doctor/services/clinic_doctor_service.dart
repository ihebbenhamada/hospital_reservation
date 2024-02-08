import 'package:dio/dio.dart';
import 'package:reservation/app/make-appointment/clinic-doctor/models/clinic_response.dart';
import 'package:reservation/config/api-urls/end_points.dart';

import '../../../../config/interceptor/interceptor.dart';
import '../models/doctors_by_clinic_response.dart';

class ClinicDoctorService {
  Future<ClinicResponse?> getAllClinics() async {
    Response? response =
        await AppInterceptor.dio?.get(EndPoints.GET_ALL_CLINICS);
    if (response != null && response.statusCode == 200) {
      return ClinicResponse.fromJson(response.data);
    } else {
      return null;
    }
  }

  Future<DoctorsByClinicResponse?> getDoctorsByClinic({
    required int clinicId,
  }) async {
    Response? response = await AppInterceptor.dio
        ?.get(EndPoints.GET_ALL_DOCTORS_BY_CLINIC_ID + clinicId.toString());
    if (response != null && response.statusCode == 200) {
      return DoctorsByClinicResponse.fromJson(response.data);
    } else {
      return null;
    }
  }
}
