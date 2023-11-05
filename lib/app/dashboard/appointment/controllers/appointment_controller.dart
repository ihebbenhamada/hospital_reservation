import '../../../../config/controllerConfig/base_controller.dart';
import '../services/appointment_service.dart';

class AppointmentController extends BaseController {
  /// SERVICES
  final AppointmentService _appointmentService = AppointmentService();

  /// CONTROLLERS

  /// VARIABLES

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
