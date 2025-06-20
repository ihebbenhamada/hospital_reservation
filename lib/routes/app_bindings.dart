import 'package:get/get.dart';
import 'package:inn_tech_appointment/app/auth/forget-password/controllers/forget_password_controller.dart';
import 'package:inn_tech_appointment/app/auth/login/controllers/login_controller.dart';
import 'package:inn_tech_appointment/app/auth/password/controllers/password_controller.dart';
import 'package:inn_tech_appointment/app/auth/registration-success/controllers/registration_success_controller.dart';
import 'package:inn_tech_appointment/app/auth/signup/controllers/signup_controller.dart';
import 'package:inn_tech_appointment/app/auth/verification/controllers/verification_controller.dart';
import 'package:inn_tech_appointment/app/dashboard/appointment/controllers/appointment_controller.dart';
import 'package:inn_tech_appointment/app/dashboard/controller/dashboard-controller.dart';
import 'package:inn_tech_appointment/app/dashboard/history/controllers/history_controller.dart';
import 'package:inn_tech_appointment/app/dashboard/settings/controllers/settings_controller.dart';
import 'package:inn_tech_appointment/app/make-appointment/appointment-success/controllers/appointment_success_controller.dart';
import 'package:inn_tech_appointment/app/notifications/controllers/notifications_controller.dart';
import 'package:inn_tech_appointment/app/profile/change-password/controllers/change-password_controller.dart';
import 'package:inn_tech_appointment/app/profile/controllers/profile_controller.dart';

import '../app/dashboard/home/controllers/home_controller.dart';
import '../app/make-appointment/main/controllers/appointment_steps_controller.dart';

class LoginPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}

class SignUpPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
  }
}

class VerificationPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerificationController());
  }
}

class PasswordPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PasswordController());
  }
}

class ForgetPasswordPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPasswordController());
  }
}

class RegistrationSuccessPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegistrationSuccessController());
  }
}

class DashboardPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashboardController());
  }
}

class HomePageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}

class HistoryPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HistoryController());
  }
}

class AppointmentPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppointmentController());
  }
}

class SettingsPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsController());
  }
}

class AppointmentStepsPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppointmentStepsController());
  }
}

class AppointmentSuccessPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AppointmentSuccessController());
  }
}

class ProfilePageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProfileController());
  }
}

class ChangePasswordPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePasswordController());
  }
}

class NotificationsPageBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationsController());
  }
}
