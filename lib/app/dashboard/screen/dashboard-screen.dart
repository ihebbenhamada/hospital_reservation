import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reservation/app/dashboard/appointment/screens/appointment_screen.dart';
import 'package:reservation/app/dashboard/controller/dashboard-controller.dart';
import 'package:reservation/app/dashboard/history/screens/history_screen.dart';
import 'package:reservation/app/dashboard/settings/screens/settings_screen.dart';
import 'package:reservation/app/make-appointment/screen/appointment-steps.dart';
import 'package:reservation/config/theme/theme_controller.dart';
import 'package:reservation/widgets/reservation-button/reservation-button.dart';

import '../../../config/colors/colors.dart';
import '../../../config/image_urls/image_urls.dart';
import '../../../routes/app_routes.dart';
import '../home/screens/home_screen.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);
  final _dashboardController = Get.put(DashboardController());
  final ThemeController themeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (_) => Obx(
        () => Scaffold(
          backgroundColor: themeController.isDarkMode.value
              ? AppColors.dark2
              : AppColors.blueLight,
          body: SizedBox.expand(
            child: Stack(
              alignment: Alignment.topCenter,
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
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(43),
                    bottomRight: Radius.circular(43),
                  ),
                  child: Container(
                    height: 149.h,
                    width: double.infinity,
                    color: themeController.isDarkMode.value
                        ? AppColors.dark1
                        : AppColors.white,
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
                              GestureDetector(
                                onTap: _dashboardController.handleClickProfile,
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      AppImages.userPhoto,
                                      height: 50.h,
                                      width: 50.h,
                                    ),
                                    Image.asset(
                                      themeController.isDarkMode.value
                                          ? AppImages.signupUserShapeDark
                                          : AppImages.signupUserShape,
                                      height: 50.h,
                                      width: 50.h,
                                    ),
                                  ],
                                ),
                              ),
                              12.horizontalSpace,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'welcome'.tr,
                                    style: TextStyle(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.primary,
                                    ),
                                  ),
                                  3.h.verticalSpace,
                                  GetBuilder<DashboardController>(
                                    builder: (_) => Text(
                                      _dashboardController.user != null
                                          ? _dashboardController.user!.userName
                                          : '',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500,
                                        color: themeController.isDarkMode.value
                                            ? AppColors.gray1
                                            : AppColors.gray3,
                                      ),
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
                            GestureDetector(
                              onTap:
                                  _dashboardController.handleClickNotifications,
                              child: Container(
                                width: 40.h,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      themeController.isDarkMode.value
                                          ? AppImages.notifBgDark
                                          : AppImages.notifBg,
                                    ),
                                  ),
                                ),
                                child: Center(
                                  child: Stack(
                                    children: [
                                      Image.asset(
                                        AppImages.notification,
                                        height: 18.h,
                                        width: 18,
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
                            ),
                            8.horizontalSpace,
                            Builder(builder: (context) {
                              return GestureDetector(
                                onTap: () {
                                  Scaffold.of(context).openDrawer();
                                },
                                child: Container(
                                  width: 40.h,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        themeController.isDarkMode.value
                                            ? AppImages.menuBgDark
                                            : AppImages.menuBg,
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      AppImages.menu,
                                      height: 12.h,
                                      width: 14,
                                      color: themeController.isDarkMode.value
                                          ? AppColors.gray1
                                          : AppColors.gray3,
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
                  top: 130.h,
                  child: GestureDetector(
                    onTap: _dashboardController.bookNow,
                    behavior: HitTestBehavior.opaque,
                    child: Container(
                      height: 40.h,
                      width: 134,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(26),
                        border: Border.all(
                          color: themeController.isDarkMode.value
                              ? AppColors.dark2
                              : AppColors.blueLight,
                          width: 3.h,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'book_now'.tr,
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w500,
                            color: themeController.isDarkMode.value
                                ? AppColors.dark1
                                : AppColors.white,
                          ),
                        ),
                      ),
                    ),
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
                  backgroundColor: themeController.isDarkMode.value
                      ? AppColors.dark1
                      : AppColors.white,
                  useLegacyColorScheme: false,
                  unselectedLabelStyle: TextStyle(
                    fontSize: 0.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.gray3,
                  ),
                  items: [
                    BottomNavigationBarItem(
                      activeIcon: Image.asset(
                        AppImages.home,
                        height: 29,
                        width: 29,
                        color: AppColors.primary,
                      ),
                      icon: Image.asset(
                        AppImages.home,
                        height: 29,
                        width: 29,
                        color: themeController.isDarkMode.value
                            ? AppColors.gray1
                            : AppColors.gray3,
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      activeIcon: Image.asset(
                        AppImages.history,
                        height: 26,
                        width: 26,
                        color: AppColors.primary,
                      ),
                      icon: Image.asset(
                        AppImages.history,
                        height: 26,
                        width: 26,
                        color: themeController.isDarkMode.value
                            ? AppColors.gray1
                            : AppColors.gray3,
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
                      label: 'book_now2'.tr,
                    ),
                    BottomNavigationBarItem(
                      activeIcon: Image.asset(
                        AppImages.settings,
                        height: 23,
                        width: 23,
                        color: AppColors.primary,
                      ),
                      icon: Image.asset(
                        AppImages.settings,
                        height: 23,
                        width: 23,
                        color: themeController.isDarkMode.value
                            ? AppColors.gray1
                            : AppColors.gray3,
                      ),
                      label: '',
                    ),
                    BottomNavigationBarItem(
                      activeIcon: Image.asset(
                        AppImages.logout,
                        height: 21,
                        width: 21,
                        color: AppColors.primary,
                      ),
                      icon: Image.asset(
                        AppImages.logout,
                        height: 21,
                        width: 21,
                        color: themeController.isDarkMode.value
                            ? AppColors.gray1
                            : AppColors.gray3,
                      ),
                      label: '',
                    ),
                  ],
                ),
              ),
            ],
          ),
          drawer: Drawer(
            elevation: 0.0,
            backgroundColor: themeController.isDarkMode.value
                ? AppColors.dark2
                : AppColors.white,
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
                              'welcome'.tr,
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w500,
                                color: AppColors.primary,
                              ),
                            ),
                            3.h.verticalSpace,
                            GetBuilder<DashboardController>(
                              builder: (_) => Text(
                                _dashboardController.user != null
                                    ? _dashboardController.user!.userName
                                    : '',
                                style: TextStyle(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w500,
                                  color: themeController.isDarkMode.value
                                      ? AppColors.gray1
                                      : AppColors.gray3,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  15.h.verticalSpace,
                  Divider(
                    thickness: 1,
                    color: themeController.isDarkMode.value
                        ? AppColors.gray1
                        : AppColors.gray3,
                  ),
                  40.h.verticalSpace,
                  GestureDetector(
                    onTap: () =>
                        _dashboardController.navigateToPage(0, context),
                    child: Row(
                      children: [
                        Image.asset(
                          AppImages.chart,
                          height: 16,
                          color: themeController.isDarkMode.value
                              ? AppColors.gray1
                              : AppColors.gray3,
                        ),
                        20.horizontalSpace,
                        Text(
                          'home'.tr,
                          style: TextStyle(
                            color: themeController.isDarkMode.value
                                ? AppColors.gray1
                                : AppColors.gray3,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  40.h.verticalSpace,
                  GestureDetector(
                    onTap: () =>
                        _dashboardController.navigateToPage(1, context),
                    child: Row(
                      children: [
                        Image.asset(
                          AppImages.userMenu,
                          height: 16,
                          color: themeController.isDarkMode.value
                              ? AppColors.gray1
                              : AppColors.gray3,
                        ),
                        20.horizontalSpace,
                        Text(
                          'account'.tr,
                          style: TextStyle(
                            color: themeController.isDarkMode.value
                                ? AppColors.gray1
                                : AppColors.gray3,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  40.h.verticalSpace,
                  GestureDetector(
                    onTap: () =>
                        _dashboardController.navigateToPage(1, context),
                    child: Row(
                      children: [
                        Image.asset(
                          AppImages.appointment,
                          height: 16,
                          color: themeController.isDarkMode.value
                              ? AppColors.gray1
                              : AppColors.gray3,
                        ),
                        20.horizontalSpace,
                        Text(
                          'my_appointment'.tr,
                          style: TextStyle(
                            color: themeController.isDarkMode.value
                                ? AppColors.gray1
                                : AppColors.gray3,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  40.h.verticalSpace,
                  GestureDetector(
                    onTap: () =>
                        _dashboardController.navigateToPage(3, context),
                    child: Row(
                      children: [
                        Image.asset(
                          AppImages.settings,
                          height: 16,
                          color: themeController.isDarkMode.value
                              ? AppColors.gray1
                              : AppColors.gray3,
                        ),
                        20.horizontalSpace,
                        Text(
                          'settings'.tr,
                          style: TextStyle(
                            color: themeController.isDarkMode.value
                                ? AppColors.gray1
                                : AppColors.gray3,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  ),
                  60.h.verticalSpace,
                  ReservationButton(
                    text: 'make_appointment'.tr,
                    onClick: () {},
                  ),
                ],
              ),
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: GestureDetector(
            onTap: () {
              Get.to(() => AppointmentStepsScreen());
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: 81.h,
                  width: 81.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(75),
                    color: themeController.isDarkMode.value
                        ? AppColors.dark1
                        : AppColors.white,
                    border: Border.all(
                      color: themeController.isDarkMode.value
                          ? AppColors.dark2
                          : AppColors.blueLight,
                      width: 6.h,
                    ),
                  ),
                  child: Center(
                    child: Image.asset(
                      AppImages.appointment,
                      height: 22.h,
                      width: 25,
                      color: themeController.isDarkMode.value
                          ? AppColors.gray1
                          : AppColors.gray3,
                    ),
                  ),
                ),
                7.h.verticalSpace,
                Text(
                  'book_now2'.tr,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: themeController.isDarkMode.value
                        ? AppColors.gray1
                        : AppColors.gray3,
                    fontSize: 13.sp,
                  ),
                ),
                9.h.verticalSpace,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
