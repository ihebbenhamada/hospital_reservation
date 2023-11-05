import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:reservation/app/dashboard/home/screens/home_screen.dart';

import '../../../../config/controllerConfig/base_controller.dart';

class DashboardController extends BaseController
    with GetSingleTickerProviderStateMixin {
  int selectedIndex = 0;
  final PageController pageController = PageController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }

  onItemSelected(int index) {
    selectedIndex = index;
    update();
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
}
