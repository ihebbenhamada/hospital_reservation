import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reservation/app/dashboard/appointment/screens/appointment_screen.dart';
import 'package:reservation/app/dashboard/controller/dashboard-controller.dart';
import 'package:reservation/app/dashboard/history/screens/history_screen.dart';
import 'package:reservation/app/dashboard/settings/screens/settings_screen.dart';
import 'package:reservation/app/make-appointment/screen/appointment-steps.dart';
import 'package:reservation/widgets/reservation-button/reservation-button.dart';

import '../../../config/colors/colors.dart';
import '../../../config/image_urls/image_urls.dart';
import '../../../routes/app_routes.dart';
import '../home/screens/home_screen.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);
  final _dashboardController = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (_) => Scaffold(
        backgroundColor: AppColors.blueLight,
        body: SizedBox.expand(
          child: Stack(
            children: [
              IndexedStack(
                index: _dashboardController.selectedIndex,
                children: [
                  Navigator(
                    key: Get.nestedKey(1),
                    initialRoute: AppRoutes.home,
                    onGenerateRoute: (route) => MaterialPageRoute(
                      settings: route,
                      builder: (context) => HomeScreen(),
                    ),
                  ),
                  Navigator(
                    key: Get.nestedKey(2),
                    onGenerateRoute: (route) => MaterialPageRoute(
                      settings: route,
                      builder: (context) => HistoryScreen(),
                    ),
                  ),
                  Navigator(
                    key: Get.nestedKey(3),
                    onGenerateRoute: (route) => MaterialPageRoute(
                      settings: route,
                      builder: (context) => AppointmentScreen(),
                    ),
                  ),
                  Navigator(
                    key: Get.nestedKey(4),
                    onGenerateRoute: (route) => MaterialPageRoute(
                      settings: route,
                      builder: (context) => SettingsScreen(),
                    ),
                  ),
                  Navigator(
                    key: Get.nestedKey(5),
                    onGenerateRoute: (route) => MaterialPageRoute(
                      settings: route,
                      builder: (context) => SettingsScreen(),
                    ),
                  ),
                ],
              ),
              Positioned(
                child: Stack(
                  alignment: Alignment.center,
                  clipBehavior: Clip.none,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(43),
                        bottomRight: Radius.circular(43),
                      ),
                      child: Container(
                        height: 149.h,
                        width: double.infinity,
                        color: AppColors.white,
                        padding: EdgeInsets.only(
                          top: 10.h,
                          left: 40,
                          right: 40,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 50.h,
                              child: Row(
                                children: [
                                  Stack(
                                    children: [
                                      Image.asset(
                                        AppImages.userPhoto,
                                        height: 50.h,
                                        width: 50.h,
                                      ),
                                      Image.asset(
                                        AppImages.signupUserShape,
                                        height: 50.h,
                                        width: 50.h,
                                      ),
                                    ],
                                  ),
                                  12.horizontalSpace,
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Welcome',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.primary,
                                        ),
                                      ),
                                      3.h.verticalSpace,
                                      Text(
                                        'Iheb Ben Hamada',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.gray3,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  width: 40,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(AppImages.notifBg),
                                    ),
                                  ),
                                  child: Center(
                                    child: Stack(
                                      children: [
                                        Image.asset(
                                          AppImages.notification,
                                          height: 18.h,
                                          width: 16,
                                        ),
                                        Positioned(
                                          top: 1,
                                          right: 0,
                                          child: Container(
                                            height: 8.h,
                                            width: 8.h,
                                            decoration: BoxDecoration(
                                              color: AppColors.redLight,
                                              borderRadius:
                                                  BorderRadius.circular(8.h),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Builder(builder: (context) {
                                  return GestureDetector(
                                    onTap: () {
                                      Scaffold.of(context).openDrawer();
                                    },
                                    child: Container(
                                      width: 40,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(AppImages.menuBg),
                                        ),
                                      ),
                                      child: Center(
                                        child: Image.asset(
                                          AppImages.menu,
                                          height: 12.h,
                                          width: 14,
                                        ),
                                      ),
                                    ),
                                  );
                                }),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: -20.h,
                      child: Container(
                        height: 40.h,
                        width: 134,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(26),
                          border: Border.all(
                            color: AppColors.blueLight,
                            width: 3.h,
                          ),
                        ),
                        child: Center(
                          child: Text(
                            'Book Now !',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(28.0),
                topRight: Radius.circular(28.0),
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                elevation: 0,
                selectedFontSize: 0,
                unselectedFontSize: 0,
                onTap: (index) {
                  _dashboardController.onItemSelected(index);
                },
                currentIndex: _dashboardController.selectedIndex,
                selectedLabelStyle: TextStyle(
                  fontSize: 0.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.gray3,
                ),
                backgroundColor: AppColors.white,
                useLegacyColorScheme: false,
                unselectedLabelStyle: TextStyle(
                  fontSize: 0.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.gray3,
                ),
                items: [
                  BottomNavigationBarItem(
                    activeIcon: Image.asset(
                      AppImages.chart,
                      height: 20,
                      width: 20,
                      color: AppColors.gray3,
                    ),
                    icon: Image.asset(
                      AppImages.chart,
                      height: 20,
                      width: 20,
                      color: AppColors.gray3,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Image.asset(
                      AppImages.userDashNav,
                      height: 20,
                      width: 26,
                      color: AppColors.gray3,
                    ),
                    icon: Image.asset(
                      AppImages.userDashNav,
                      height: 20,
                      width: 26,
                      color: AppColors.gray3,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Container(
                      height: 25,
                      width: 23,
                      color: AppColors.white.withOpacity(0),
                    ),
                    icon: Container(
                      height: 25,
                      width: 23,
                      color: AppColors.white.withOpacity(0),
                    ),
                    label: 'Book Now !!',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Image.asset(
                      AppImages.settings,
                      height: 23,
                      width: 23,
                      color: AppColors.gray3,
                    ),
                    icon: Image.asset(
                      AppImages.settings,
                      height: 23,
                      width: 23,
                      color: AppColors.gray3,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Image.asset(
                      AppImages.logout,
                      height: 21,
                      width: 21,
                      color: AppColors.gray3,
                    ),
                    icon: Image.asset(
                      AppImages.logout,
                      height: 21,
                      width: 21,
                      color: AppColors.gray3,
                    ),
                    label: '',
                  ),
                ],
              ),
            ),
          ],
        ),
        drawer: Drawer(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(27),
              bottomRight: Radius.circular(27),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(
              left: 33.0,
              right: 33.0,
              bottom: 27.h,
              top: MediaQuery.of(context).viewPadding.top + 27.h,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 50.h,
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          Image.asset(
                            AppImages.userPhoto,
                            height: 50.h,
                            width: 50.h,
                          ),
                          Image.asset(
                            AppImages.signupUserShape,
                            height: 50.h,
                            width: 50.h,
                          ),
                        ],
                      ),
                      12.horizontalSpace,
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primary,
                            ),
                          ),
                          3.h.verticalSpace,
                          Text(
                            'Iheb Ben Hamada',
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: AppColors.gray3,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                15.h.verticalSpace,
                const Divider(
                  thickness: 1,
                  color: AppColors.gray3,
                ),
                40.h.verticalSpace,
                GestureDetector(
                  onTap: () => _dashboardController.navigateToPage(0, context),
                  child: Row(
                    children: [
                      Image.asset(
                        AppImages.chart,
                        height: 16,
                      ),
                      20.horizontalSpace,
                      Text(
                        'Home',
                        style: TextStyle(
                          color: AppColors.gray3,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
                40.h.verticalSpace,
                GestureDetector(
                  onTap: () => _dashboardController.navigateToPage(1, context),
                  child: Row(
                    children: [
                      Image.asset(
                        AppImages.userMenu,
                        height: 16,
                      ),
                      20.horizontalSpace,
                      Text(
                        'Account',
                        style: TextStyle(
                          color: AppColors.gray3,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
                40.h.verticalSpace,
                GestureDetector(
                  onTap: () => _dashboardController.navigateToPage(1, context),
                  child: Row(
                    children: [
                      Image.asset(
                        AppImages.appointment,
                        height: 16,
                      ),
                      20.horizontalSpace,
                      Text(
                        'My Appointment',
                        style: TextStyle(
                          color: AppColors.gray3,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
                40.h.verticalSpace,
                GestureDetector(
                  onTap: () => _dashboardController.navigateToPage(3, context),
                  child: Row(
                    children: [
                      Image.asset(
                        AppImages.settings,
                        height: 16,
                      ),
                      20.horizontalSpace,
                      Text(
                        'Setting',
                        style: TextStyle(
                          color: AppColors.gray3,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
                60.h.verticalSpace,
                ReservationButton(
                  text: 'Make Appointment',
                  onClick: () {},
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: GestureDetector(
          onTap: () {
            Get.to(() => AppointmentStepsScreen());
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: 75.h,
                width: 75.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.floatingBtn),
                  ),
                ),
                child: Center(
                  child: Image.asset(
                    AppImages.appointment,
                    height: 22.h,
                    width: 25,
                  ),
                ),
              ),
              7.h.verticalSpace,
              Text(
                'Book Now !!',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: AppColors.gray3,
                  fontSize: 13.sp,
                ),
              ),
              9.h.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}
