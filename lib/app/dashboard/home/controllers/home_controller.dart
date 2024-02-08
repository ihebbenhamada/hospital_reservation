import 'package:get_storage/get_storage.dart';
import 'package:reservation/api/models/patient/patient.dart';
import 'package:reservation/app/dashboard/home/model/doctor/doctor.dart';
import 'package:reservation/config/image_urls/image_urls.dart';

import '../../../../config/controllerConfig/base_controller.dart';
import '../../../auth/login/models/login_response.dart';
import '../services/home_service.dart';

class HomeController extends BaseController {
  /// SERVICES
  final HomeService _homeService = HomeService();
  late GetStorage storage;

  /// CONTROLLERS

  /// VARIABLES
  final List<Map<String, dynamic>> homeList = [
    {
      'icon': AppImages.hashtagWhite,
      'value': 4562,
      'title': 'my_mrn',
      'description': 'file_number',
      'isPrimary': true,
    },
    {
      'icon': AppImages.appointment,
      'value': 20,
      'title': 'my_appointment',
      'description': 'appointment_number',
      'isPrimary': false,
    },
    {
      'icon': AppImages.pending,
      'value': 15,
      'title': 'pending',
      'description': 'pending_appointment',
      'isPrimary': false,
    },
    {
      'icon': AppImages.cancel,
      'value': 5,
      'title': 'cancel',
      'description': 'cancel_appointment',
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

  late int maxSales;
  LoginResponse? user;
  late Patient patient;

  /// VALIDATION

  /// SCREEN LIFE CYCLE
  @override
  void onInit() {
    initValues();
    if (GetStorage().read('user') != null) {
      print(GetStorage().read('user').runtimeType);
      user = LoginResponse.fromJson(GetStorage().read('user'));
      //user = GetStorage().read('user');
    } else {
      user = LoginResponse(
        resultMessage: '',
        userName: '',
        email: '',
        phoneNumber: '',
        token: '',
        refreshTokenExpiration: '',
        isAdmin: false,
        isAuthenticated: false,
      );
    }

    getHomeInformation(mobileNumber: user != null ? user!.phoneNumber : '0');
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// INITIALISATION
  void initValues() {
    maxSales = data.map((e) => e.nbrVisitors).reduce((a, b) => a > b ? a : b);
    storage = GetStorage();
  }

  /// FUNCTIONS
  void getHomeInformation({required String mobileNumber}) {
    _homeService
        .getPatientByMobileNumber(mobileNumber: mobileNumber)
        .then((value) {
      if (value != null) {
        patient = value;
        print(patient.fullName);
        print(patient.id);
        print(patient.hawia);
        print(patient.mobile);
        storage.write('patient', value);
      } else {
        print('error');
      }
    });
  }
}
