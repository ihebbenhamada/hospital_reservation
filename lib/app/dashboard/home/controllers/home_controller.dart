import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reservation/app/dashboard/controller/dashboard-controller.dart';
import 'package:reservation/app/dashboard/home/model/patient_statistic/patient_statistic.dart';
import 'package:reservation/app/dashboard/home/model/top_doctor/top_doctor.dart';
import 'package:reservation/config/colors/colors.dart';
import 'package:reservation/config/image_urls/image_urls.dart';
import 'package:reservation/config/interceptor/interceptor.dart';

import '../../../../config/controllerConfig/base_controller.dart';
import '../services/home_service.dart';

class HomeController extends BaseController {
  /// SERVICES
  final HomeService _homeService = HomeService();
  late GetStorage storage;
  final DashboardController _dashboardController = Get.find();

  /// CONTROLLERS

  /// VARIABLES
  final RxList<Map<String, dynamic>> homeList = <Map<String, dynamic>>[].obs;
  final Rx<PatientStatistics> patientStatistics = PatientStatistics().obs;
  RxList<BarChartGroupData> barGroups = <BarChartGroupData>[].obs;
  RxInt showingTooltip = 1.obs;
  RxList<TopDoctor> selectedListStatistics = <TopDoctor>[].obs;
  TopDoctor defaultDoctor = TopDoctor(doctor: '', rate: 0);

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// INITIALISATION
  void initValues() {
    storage = GetStorage();
    homeList.value = [
      {
        'icon': AppImages.hashtagWhite,
        'value': 0,
        'title': 'my_mrn',
        'description': 'file_number',
        'isPrimary': true,
      },
      {
        'icon': AppImages.appointment,
        'value': 0,
        'title': 'my_appointment',
        'description': 'appointment_number',
        'isPrimary': false,
      },
      {
        'icon': AppImages.pending,
        'value': 0,
        'title': 'pending',
        'description': 'pending_appointment',
        'isPrimary': false,
      },
      {
        'icon': AppImages.cancel,
        'value': 0,
        'title': 'cancel',
        'description': 'cancel_appointment',
        'isPrimary': false,
      },
    ];
    getHomeInformation();
  }

  /// FUNCTIONS
  void getHomeInformation() {
    barGroups.value = [];
    AppInterceptor.showLoader();
    _homeService.getPatientStatisticsAndCharts().then((value) {
      if (value != null) {
        patientStatistics.value = value;
        homeList.value = [
          {
            'icon': AppImages.hashtagWhite,
            'value': value.mrn,
            'title': 'my_mrn',
            'description': 'file_number',
            'isPrimary': true,
          },
          {
            'icon': AppImages.appointment,
            'value': value.allAppointments.length,
            'title': 'my_appointment',
            'description': 'appointment_number',
            'isPrimary': false,
          },
          {
            'icon': AppImages.pending,
            'value': value.pendingAppointments.length,
            'title': 'pending',
            'description': 'pending_appointment',
            'isPrimary': false,
          },
          {
            'icon': AppImages.cancel,
            'value': value.canceledAppointments.length,
            'title': 'cancel',
            'description': 'cancel_appointment',
            'isPrimary': false,
          },
        ];
        _dashboardController.patient.value = value;
        fillChart(Filter.today);
        storage.write('patient', value.toJson());
        storage.write('mrn', value.mrn);
        storage.write('patientName', value.name);
      } else {
        print('error');
      }
      AppInterceptor.hideLoader();
    });
  }

  Future<void> handleRefresh() async {
    getHomeInformation();
  }

  BarChartGroupData generateGroupData(int x, int y, Color color) {
    return BarChartGroupData(
      x: x,
      showingTooltipIndicators: [],
      barRods: [
        BarChartRodData(
          toY: y.toDouble(),
          color: color,
          width: 35,
          borderRadius: BorderRadius.circular(30),
        ),
      ],
    );
  }

  generateGroup(List<TopDoctor> list) {
    TopDoctor highestRatedDoctor = list.reduce((curr, next) {
      return curr.rate > next.rate ? curr : next;
    });
    for (var i = 0; i < list.length; i++) {
      barGroups.add(generateGroupData(i, list[i].rate,
          list[i] == highestRatedDoctor ? AppColors.primary : AppColors.white));
    }
  }

  fillChart(Filter filter) {
    switch (filter) {
      case Filter.today:
        selectedListStatistics.value = patientStatistics.value.topDoctorsToday;
        break;
      case Filter.week:
        selectedListStatistics.value =
            patientStatistics.value.topDoctorsThisWeek;
        break;
      case Filter.month:
        selectedListStatistics.value =
            patientStatistics.value.topDoctorsThisMonth;
        break;
      default:
        selectedListStatistics.value = patientStatistics.value.topDoctorsToday;
    }
    while (selectedListStatistics.length < 5) {
      selectedListStatistics.add(defaultDoctor);
    }
    generateGroup(selectedListStatistics);
  }

  onSelectFilter(int index) {
    barGroups.clear();
    switch (index) {
      case 0:
        fillChart(Filter.today);
        break;
      case 1:
        fillChart(Filter.week);
        break;
      case 2:
        fillChart(Filter.month);
        break;
      default:
        fillChart(Filter.today);
    }
  }
}

enum Filter { today, week, month }
