import 'package:reservation/app/dashboard/home/model/doctor/doctor.dart';
import 'package:reservation/config/image_urls/image_urls.dart';

import '../../../../config/controllerConfig/base_controller.dart';
import '../services/home_service.dart';

class HomeController extends BaseController {
  /// SERVICES
  final HomeService _homeService = HomeService();

  /// CONTROLLERS

  /// VARIABLES
  final List<Map<String, dynamic>> homeList = [
    {
      'icon': AppImages.hashtagWhite,
      'value': 4562,
      'title': 'My Mrn',
      'description': 'File Number',
      'isPrimary': true,
    },
    {
      'icon': AppImages.appointment,
      'value': 20,
      'title': 'My Appiontment',
      'description': 'Appiontment Number',
      'isPrimary': false,
    },
    {
      'icon': AppImages.pending,
      'value': 15,
      'title': 'Pending',
      'description': 'Pending Appiontment',
      'isPrimary': false,
    },
    {
      'icon': AppImages.cancel,
      'value': 5,
      'title': 'Cancel',
      'description': 'Cancel Appiontment',
      'isPrimary': false,
    },
  ];
  List<DoctorsData> data = [
    DoctorsData('Mohamed\nAhmed', 100),
    DoctorsData('Ali\nAbd Elsalalm', 60),
    DoctorsData('roqa\nali', 80),
    DoctorsData('Mohamed\nIsmail', 90),
    DoctorsData('Dina\nAhmed', 70)
  ];

  late final int maxSales;

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
    maxSales = data.map((e) => e.nbrVisitors).reduce((a, b) => a > b ? a : b);
  }

  /// FUNCTIONS
}
