import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/smart_management.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:reservation/app/dashboard/screen/dashboard-screen.dart';

import '../config/binding/binding.dart';
import '../config/translation/translation.dart';
import '../routes/app_pages.dart';

class Reservation extends StatelessWidget {
  const Reservation({Key? key, this.isLoggedIn, required this.language})
      : super(key: key);
  final bool? isLoggedIn;
  final String? language;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          getPages: AppPages.routes,
          translations: Translation(),
          theme: ThemeData(fontFamily: 'Graphik'),
          locale: const Locale('en', 'US'),
          /*language == 'ar'
              ? const Locale('ar', 'AR')
              : const Locale('en', 'US'),*/
          initialBinding: Binding(),
          smartManagement: SmartManagement.keepFactory,
          home: isLoggedIn != null ? DashboardScreen() : DashboardScreen(),
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
