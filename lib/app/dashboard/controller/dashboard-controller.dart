import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:reservation/app/auth/login/screens/login_screen.dart';
import 'package:reservation/app/dashboard/home/screens/home_screen.dart';
import 'package:reservation/app/make-appointment/screen/appointment-steps.dart';
import 'package:reservation/app/notifications/screens/notifications_screen.dart';
import 'package:reservation/app/profile/screen/profile_screen.dart';

import '../../../../config/controllerConfig/base_controller.dart';
import '../../auth/login/models/login_response.dart';

class DashboardController extends BaseController
    with GetSingleTickerProviderStateMixin {
  int selectedIndex = 0;
  final GetStorage storage = GetStorage();
  LoginResponse? user;

  @override
  void onInit() {
    if (GetStorage().read('user') != null) {
      print(GetStorage().read('user').runtimeType);
      user = LoginResponse.fromJson(GetStorage().read('user'));
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

    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  onItemSelected(int index) {
    if (index == 4) {
      storage.remove('user');
      storage.remove('token');
      Get.offAll(
        () => LoginScreen(),
        transition: Transition.rightToLeft,
        curve: Curves.ease,
        duration: const Duration(milliseconds: 500),
      );
    } else {
      selectedIndex = index;
      update();
    }
  }

  void navigateToPage(int index, BuildContext context) {
    Navigator.of(context).pop(); // Close the drawer if open
    selectedIndex = index;
    update();
    // Navigate to the selected page
    switch (index) {
      case 0:
        // Navigate to Home Page
        Get.to(() => HomeScreen(), id: 1);
        break;
      case 1:
        // Navigate to Search Page
        Get.to(() => HomeScreen(), id: 1);
        break;
      case 4:
        // Navigate to Profile Page
        Get.to(() => HomeScreen(), id: 1);
        break;
    }
  }

  void bookNow() {
    Get.to(
      () => AppointmentStepsScreen(),
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  void handleClickNotifications() {
    Get.to(
      () => NotificationsScreen(),
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }

  void handleClickProfile() {
    Get.to(
      () => ProfileScreen(),
      transition: Transition.rightToLeft,
      curve: Curves.ease,
      duration: const Duration(milliseconds: 500),
    );
  }
}
