import 'package:get/get.dart';
import 'package:inn_tech_appointment/app/make-appointment/main/models/doctor/doctor.dart';
import 'package:inn_tech_appointment/app/notifications/services/notifications_service.dart';
import 'package:inn_tech_appointment/config/interceptor/interceptor.dart';

import '../../../../config/controllerConfig/base_controller.dart';

class NotificationsController extends BaseController {
  /// SERVICES
  NotificationsService _notificationsService = NotificationsService();

  /// CONTROLLERS

  /// VARIABLES
  final RxList<Doctor> notificationsList = <Doctor>[].obs;
  /*[
    {
      'type': 'news',
      'doctor': {
        'name': 'Dina Saber Ahmed',
        'speciality': 'General Surgery',
      },
      'date': '13Dec - 6:30'
    },
    {
      'type': 'done',
      'doctor': {
        'name': 'Dina Saber Ahmed',
        'speciality': 'General Surgery',
      },
      'date': '13Dec - 6:30'
    },
    {
      'type': 'cancelled',
      'doctor': {
        'name': 'Iheb Ben Hamada',
        'speciality': 'General Surgery',
      },
      'date': '13Dec - 6:30'
    },
    {
      'type': 'news',
      'doctor': {
        'name': 'Dina Saber Ahmed',
        'speciality': 'General Surgery',
      },
      'date': '13Dec - 6:30'
    },
    {
      'type': 'done',
      'doctor': {
        'name': 'Dina Saber Ahmed',
        'speciality': 'General Surgery',
      },
      'date': '13Dec - 6:30'
    },
    {
      'type': 'cancelled',
      'doctor': {
        'name': 'Dina Saber Ahmed',
        'speciality': 'General Surgery',
      },
      'date': '13Dec - 6:30'
    },
    {
      'type': 'done',
      'doctor': {
        'name': 'Dina Saber Ahmed',
        'speciality': 'General Surgery',
      },
      'date': '13Dec - 6:30'
    },
  ]*/

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
    getNotifications();
  }

  getNotifications() {
    AppInterceptor.showLoader();
    _notificationsService.getNotifications().then((value) {
      if (value != null) {
        notificationsList.value = value;
      }
      AppInterceptor.hideLoader();
    });
  }

  /// FUNCTIONS
}
