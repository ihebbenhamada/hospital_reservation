import 'package:get/get.dart';
import 'package:reservation/app/auth/forget-password/screens/forget_password_screen.dart';
import 'package:reservation/app/auth/password/screens/password_screen.dart';
import 'package:reservation/app/auth/registration-success/screens/registration_success_screen.dart';
import 'package:reservation/app/auth/verification/screens/verification_screen.dart';
import 'package:reservation/app/dashboard/appointment/screens/appointment_screen.dart';
import 'package:reservation/app/dashboard/history/screens/history_screen.dart';
import 'package:reservation/app/dashboard/screen/dashboard-screen.dart';
import 'package:reservation/app/dashboard/settings/screens/settings_screen.dart';
import 'package:reservation/app/make-appointment/appointment-success/screens/appointment_success_screen.dart';
import 'package:reservation/app/notifications/screens/notifications_screen.dart';
import 'package:reservation/app/profile/change-password/screens/change_password_screen.dart';
import 'package:reservation/app/profile/screen/profile_screen.dart';

import '../app/auth/login/screens/login_screen.dart';
import '../app/auth/signup/screens/signup_screen.dart';
import '../app/dashboard/home/screens/home_screen.dart';
import '../app/make-appointment/main/screen/appointment-steps.dart';
import 'app_bindings.dart';
import 'app_routes.dart';

class AppPages {
  AppPages._();

  static final List<GetPage> routes = <GetPage>[
    GetPage(
      name: AppRoutes.login,
      page: () => LoginScreen(),
      binding: LoginPageBindings(),
    ),
    GetPage(
      name: AppRoutes.signup,
      page: () => SignUpScreen(),
      binding: SignUpPageBindings(),
    ),
    GetPage(
      name: AppRoutes.verification,
      page: () => VerificationScreen(),
      binding: VerificationPageBindings(),
    ),
    GetPage(
      name: AppRoutes.password,
      page: () => PasswordScreen(),
      binding: PasswordPageBindings(),
    ),
    GetPage(
      name: AppRoutes.forgetPassword,
      page: () => ForgetPasswordScreen(),
      binding: ForgetPasswordPageBindings(),
    ),
    GetPage(
      name: AppRoutes.registrationSuccess,
      page: () => RegistrationSuccessScreen(),
      binding: RegistrationSuccessPageBindings(),
    ),
    GetPage(
      name: AppRoutes.dashboard,
      page: () => DashboardScreen(),
      binding: DashboardPageBindings(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => HomeScreen(),
      binding: HomePageBindings(),
    ),
    GetPage(
      name: AppRoutes.history,
      page: () => HistoryScreen(),
      binding: HistoryPageBindings(),
    ),
    GetPage(
      name: AppRoutes.appointment,
      page: () => AppointmentScreen(),
      binding: AppointmentPageBindings(),
    ),
    GetPage(
      name: AppRoutes.settings,
      page: () => SettingsScreen(),
      binding: SettingsPageBindings(),
    ),
    GetPage(
      name: AppRoutes.appointmentSteps,
      page: () => AppointmentStepsScreen(),
      binding: AppointmentStepsPageBindings(),
    ),
    GetPage(
      name: AppRoutes.appointmentSuccess,
      page: () => AppointmentSuccessScreen(),
      binding: AppointmentSuccessPageBindings(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => ProfileScreen(),
      binding: ProfilePageBindings(),
    ),
    GetPage(
      name: AppRoutes.changePassword,
      page: () => ChangePasswordScreen(),
      binding: ChangePasswordPageBindings(),
    ),
    GetPage(
      name: AppRoutes.notifications,
      page: () => NotificationsScreen(),
      binding: NotificationsPageBindings(),
    ),
  ];
}
