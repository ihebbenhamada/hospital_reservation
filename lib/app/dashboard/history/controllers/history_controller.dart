import '../../../../config/controllerConfig/base_controller.dart';
import '../services/history_service.dart';

class HistoryController extends BaseController {
  /// SERVICES
  final HistoryService _historyService = HistoryService();

  /// CONTROLLERS

  /// VARIABLES
  final List<Map<String, dynamic>> historyList = [
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
