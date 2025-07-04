import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:inn_tech_appointment/app/auth/login/screens/login_screen.dart';
import 'package:inn_tech_appointment/app/dashboard/screen/dashboard-screen.dart';
import 'package:inn_tech_appointment/config/theme/reservation-theme.dart';
import 'package:inn_tech_appointment/config/theme/theme_controller.dart';

import '../config/binding/binding.dart';
import '../config/translation/translation.dart';
import '../routes/app_pages.dart';

class Reservation extends StatelessWidget {
  Reservation({
    super.key,
    required this.isLoggedIn,
    required this.language,
  });
  final bool isLoggedIn;
  final String? language;
  final ThemeController themeController = Get.put(ThemeController());
  final GetStorage storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          getPages: AppPages.routes,
          translations: Translation(),
          theme: ReservationTheme.lightTheme,
          darkTheme: ReservationTheme.darkTheme,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          themeMode:
              storage.read('theme') != null ? ThemeMode.dark : ThemeMode.light,
          locale: language == 'ar'
              ? const Locale('ar', 'AR')
              : const Locale('en', 'US'),
          initialBinding: Binding(),
          smartManagement: SmartManagement.keepFactory,
          home: isLoggedIn ? DashboardScreen() : LoginScreen(),
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
