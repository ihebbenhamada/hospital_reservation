import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/route_manager.dart';
import 'package:get/utils.dart';

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/colors/colors.dart';
import '../../../../config/interceptor/interceptor.dart';
import '../../../../config/strings/strings.dart';
import '../models/clinic/clinic.dart';
import '../models/doctor/doctor.dart';

class AppointmentStepsService {
  Future<List<Clinic>?> getAllClinics() async {
    try {
      Response? response =
          await AppInterceptor.dio?.get(EndPoints.GET_ALL_CLINICS);
      if (response != null && response.statusCode == 200) {
        List<Clinic> clinics = (response.data as List<dynamic>)
            .map((clinicJson) => Clinic.fromJson(clinicJson))
            .toList();
        return clinics;
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

  Future<List<Doctor>?> getDoctorsByClinic({
    required int clinicId,
  }) async {
    try {
      Response? response = await AppInterceptor.dio
          ?.get(EndPoints.GET_ALL_DOCTORS_BY_CLINIC_ID(clinicId.toString()));
      if (response != null && response.statusCode == 200) {
        List<Doctor> doctors = (response.data as List<dynamic>)
            .map((doctorJson) => Doctor.fromJson(doctorJson))
            .toList();
        return doctors;
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
