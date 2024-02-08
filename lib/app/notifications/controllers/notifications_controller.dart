import '../../../../config/controllerConfig/base_controller.dart';

class NotificationsController extends BaseController {
  /// SERVICES

  /// CONTROLLERS

  /// VARIABLES
  final List<Map<String, dynamic>> notificationsList = [
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
  ];

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
  void initValues() {}

  /// FUNCTIONS
}
