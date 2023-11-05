import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reservation/app/dashboard/home/controllers/home_controller.dart';
import 'package:reservation/app/dashboard/home/model/doctor/doctor.dart';
import 'package:reservation/config/colors/colors.dart';
import 'package:reservation/widgets/dashboard-grid-item/dashboard-grid-item.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HomeScreen extends StatelessWidget {
  final _homeController = Get.put(HomeController());
  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blueLight,
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 56.h),
        child: Column(
          children: [
            220.h.verticalSpace,
            GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Number of columns
                crossAxisSpacing: 28.0, // Spacing between columns
                mainAxisSpacing: 25.0, // Spacing between rows
              ),
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: _homeController.homeList.length,
              itemBuilder: (context, index) {
                var item = _homeController.homeList[index];
                return DashboardGridItem(
                  icon: item['icon'],
                  value: item['value'],
                  title: item['title'],
                  description: item['description'],
                  isPrimary: item['isPrimary'],
                );
              },
            ),
            30.h.verticalSpace,
            Container(
              height: 47.h,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              margin: const EdgeInsets.symmetric(horizontal: 40.0),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [
                  BoxShadow(
                    color: const Color.fromRGBO(0, 0, 0, 0.1),
                    offset: const Offset(0.0, 1),
                    blurRadius: 10.0.h,
                    spreadRadius: 0.h,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top 5 Doctors',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                    ),
                  ),
                  SizedBox(
                    width: 130,
                    child: DefaultTabController(
                      length: 3,
                      child: TabBar(
                        indicatorColor: AppColors.primary,
                        labelStyle: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                        labelColor: AppColors.primary,
                        unselectedLabelColor: AppColors.gray3,
                        labelPadding: EdgeInsets.zero,
                        tabs: const [
                          Tab(
                            text: 'Today',
                          ),
                          Tab(
                            text: 'Week',
                          ),
                          Tab(
                            text: 'Month',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 200.h,
              child: SfCartesianChart(
                primaryXAxis: CategoryAxis(
                  majorGridLines: const MajorGridLines(width: 0),
                  axisLine: const AxisLine(width: 0),
                  borderWidth: 0,
                  labelStyle: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.gray3,
                  ),
                  labelAlignment: LabelAlignment.center,
                  majorTickLines: const MajorTickLines(width: 0),
                ),
                primaryYAxis: CategoryAxis(
                  majorGridLines: const MajorGridLines(width: 0),
                  axisLine: const AxisLine(width: 0),
                ),
                plotAreaBorderWidth: 0,
                isTransposed: true,
                legend: const Legend(isVisible: false),
                series: <ChartSeries<DoctorsData, String>>[
                  BarSeries(
                    dataSource: _homeController.data,
                    xValueMapper: (DoctorsData doctor, _) => doctor.name,
                    yValueMapper: (DoctorsData doctor, _) => doctor.nbrVisitors,
                    borderRadius: BorderRadius.circular(20),
                    pointColorMapper: (DoctorsData doctor, _) {
                      if (doctor.nbrVisitors == _homeController.maxSales) {
                        return AppColors.primary; // Color for the highest bar
                      } else {
                        return AppColors.white; // Default color
                      }
                    },
                    spacing: 0,
                    width: .5,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
