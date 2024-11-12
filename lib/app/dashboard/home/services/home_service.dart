import 'package:dio/dio.dart';

import '../../../../config/api-urls/end_points.dart';
import '../../../../config/interceptor/interceptor.dart';
import '../model/patient_statistic/patient_statistic.dart';

class HomeService {
  Future<PatientStatistics?> getPatientStatisticsAndCharts() async {
    Response? response =
        await AppInterceptor.dio?.get(EndPoints.GET_PATIENT_STATISTICS_CHART);
    if (response != null && response.statusCode == 200) {
      return PatientStatistics.fromJson(response.data);
    } else {
      return null;
    }
  }
}
