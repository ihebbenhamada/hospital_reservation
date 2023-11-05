import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reservation/app/dashboard/history/controllers/history_controller.dart';
import 'package:reservation/widgets/history-item/history-item.dart';

import '../../../../config/colors/colors.dart';

class HistoryScreen extends StatelessWidget {
  final _historyController = Get.put(HistoryController());
  HistoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueLight,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 56.h),
        child: Column(
          children: [
            220.h.verticalSpace,
            ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _historyController.historyList.length,
              itemBuilder: (context, index) {
                var item = _historyController.historyList[index];
                return HistoryItem(
                  type: item['type'],
                  doctorName: item['doctor']['name'],
                  speciality: item['doctor']['speciality'],
                  date: item['date'],
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return 31.h.verticalSpace;
              },
            ),
            30.h.verticalSpace,
          ],
        ),
      ),
    );
  }
}
