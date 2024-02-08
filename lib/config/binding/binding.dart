import 'package:get/get.dart';
import 'package:reservation/app/auth/forget-password/controllers/forget_password_controller.dart';
import 'package:reservation/app/auth/login/controllers/login_controller.dart';
import 'package:reservation/app/auth/password/controllers/password_controller.dart';
import 'package:reservation/app/auth/registration-success/controllers/registration_success_controller.dart';
import 'package:reservation/app/auth/signup/controllers/signup_controller.dart';
import 'package:reservation/app/auth/verification/controllers/verification_controller.dart';
import 'package:reservation/app/dashboard/appointment/controllers/appointment_controller.dart';
import 'package:reservation/app/dashboard/controller/dashboard-controller.dart';
import 'package:reservation/app/dashboard/history/controllers/history_controller.dart';
import 'package:reservation/app/dashboard/settings/controllers/settings_controller.dart';
import 'package:reservation/app/make-appointment/appointment-success/controllers/appointment_success_controller.dart';
import 'package:reservation/app/make-appointment/clinic-doctor/controllers/clinic_doctor_controller.dart';
import 'package:reservation/app/make-appointment/controllers/appointment_steps_controller.dart';
import 'package:reservation/app/make-appointment/date-time-appointment/controllers/date_time_appointment_controller.dart';
import 'package:reservation/app/make-appointment/patient-information/controllers/patient_information_controller.dart';
import 'package:reservation/app/notifications/controllers/notifications_controller.dart';
import 'package:reservation/app/profile/change-password/controllers/change-password_controller.dart';
import 'package:reservation/app/profile/controllers/profile_controller.dart';

import '../../app/dashboard/home/controllers/home_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
    Get.lazyPut(() => SignUpController());
    Get.lazyPut(() => VerificationController());
    Get.lazyPut(() => PasswordController());
    Get.lazyPut(() => ForgetPasswordController());
    Get.lazyPut(() => RegistrationSuccessController());
    Get.lazyPut(() => DashboardController());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => HistoryController());
    Get.lazyPut(() => AppointmentController());
    Get.lazyPut(() => SettingsController());
    Get.lazyPut(() => AppointmentStepsController());
    Get.lazyPut(() => ClinicDoctorController());
    Get.lazyPut(() => DateTimeAppointmentController());
    Get.lazyPut(() => PatientInformationController());
    Get.lazyPut(() => AppointmentSuccessController());
    Get.lazyPut(() => ProfileController());
    Get.lazyPut(() => ChangePasswordController());
    Get.lazyPut(() => NotificationsController());
  }
}
