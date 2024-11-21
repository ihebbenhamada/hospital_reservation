import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:reservation/config/colors/colors.dart';
import 'package:reservation/widgets/dashboard-grid-item/dashboard-grid-item.dart';

import '../../../../config/theme/theme_controller.dart';
import '../controllers/home_controller.dart';

class HomeScreen extends StatelessWidget {
  final _homeController = Get.put(HomeController());
  final ThemeController themeController = Get.find();
  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeController.isDarkMode.value
          ? AppColors.dark2
          : AppColors.blueLight,
      body: RefreshIndicator(
        onRefresh: _homeController.handleRefresh,
        color: AppColors.white,
        displacement: 100,
        backgroundColor: AppColors.primary,
        child: SingleChildScrollView(
          padding: EdgeInsets.only(bottom: 56.h),
          child: Column(
            children: [
              220.h.verticalSpace,
              Obx(
                () => GridView.builder(
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
                      value: item['value'].toString(),
                      title: item['title'],
                      description: item['description'],
                      isPrimary: item['isPrimary'],
                      isDarkMode: themeController.isDarkMode.value,
                    );
                  },
                ),
              ),
              30.h.verticalSpace,
              Container(
                height: 47.h,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                margin: const EdgeInsets.symmetric(horizontal: 40.0),
                decoration: BoxDecoration(
                  color: themeController.isDarkMode.value
                      ? AppColors.dark1
                      : AppColors.white,
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
                      'top_5_doctors'.tr,
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
                          unselectedLabelColor: themeController.isDarkMode.value
                              ? AppColors.white
                              : AppColors.gray3,
                          labelPadding: EdgeInsets.zero,
                          dividerHeight: 0,
                          onTap: (index) =>
                              _homeController.onSelectFilter(index),
                          tabs: [
                            Tab(
                              text: 'today'.tr,
                            ),
                            Tab(
                              text: 'week'.tr,
                            ),
                            Tab(
                              text: 'month'.tr,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              20.h.verticalSpace,
              Obx(
                () => Container(
                  height: 230.h,
                  decoration: BoxDecoration(
                    color: themeController.isDarkMode.value
                        ? AppColors.dark2
                        : AppColors.blueLight,
                  ),
                  child: Center(
                    child: BarChart(
                      swapAnimationCurve: Curves.bounceIn,
                      swapAnimationDuration: const Duration(milliseconds: 0),
                      BarChartData(
                        backgroundColor: Colors.transparent,
                        borderData: FlBorderData(
                          show: false,
                        ),
                        titlesData: FlTitlesData(
                          topTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          rightTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
                          ),
                          leftTitles: const AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: false,
                            ),
                          ),
                          bottomTitles: AxisTitles(
                            sideTitles: SideTitles(
                              showTitles: true,
                              reservedSize: 39,
                              interval: 5,
                              getTitlesWidget: (value, titleMeta) {
                                int index = value.toInt();
                                if (index < 0 ||
                                    index >=
                                        _homeController.patientStatistics.value
                                            .topDoctorsThisMonth.length) {
                                  return const Text('');
                                }
                                String formattedName = _homeController
                                        .selectedListStatistics[index].doctor
                                        .replaceAll(' ', '\n') ??
                                    '';
                                return Text(
                                  formattedName,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: themeController.isDarkMode.isTrue
                                        ? AppColors.blueLight
                                        : AppColors.black.withOpacity(0.7),
                                  ),
                                  textAlign: TextAlign.center,
                                );
                              },
                            ),
                          ),
                        ),
                        gridData: const FlGridData(
                          show: false,
                        ),
                        barGroups: _homeController.barGroups.value,
                        barTouchData: BarTouchData(
                          touchTooltipData: BarTouchTooltipData(
                            direction: TooltipDirection.top,
                            tooltipPadding: EdgeInsets.zero,
                            tooltipMargin: 0,
                            getTooltipItem: (group, groupIndex, rod, rodIndex) {
                              return BarTooltipItem(
                                '${rod.toY}',
                                const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              /*Obx(
                () => Container(
                  color: Colors.amberAccent,
                  child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(
                      majorGridLines: const MajorGridLines(width: 0),
                      axisLine: const AxisLine(width: 0),
                      borderWidth: 0,
                      labelStyle: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.w500,
                        color: themeController.isDarkMode.value
                            ? AppColors.gray1
                            : AppColors.gray3,
                      ),
                      labelAlignment: LabelAlignment.center,
                      majorTickLines: const MajorTickLines(width: 0),
                    ),
                    primaryYAxis: const CategoryAxis(
                      majorGridLines: MajorGridLines(width: 0),
                      axisLine: AxisLine(width: 0),
                    ),
                    plotAreaBorderWidth: 0,
                    isTransposed: true,
                    legend: const Legend(isVisible: false),
                    series: <CartesianSeries<TopDoctor, String>>[
                      BarSeries(
                        dataSource: _homeController
                            .patientStatistics.value.topDoctorsToday,
                        xValueMapper: (TopDoctor doctor, _) => doctor.doctor,
                        yValueMapper: (TopDoctor doctor, _) => 500,
                        borderRadius: BorderRadius.circular(20),
                        pointColorMapper: (TopDoctor doctor, _) {
                          log(_homeController
                              .patientStatistics.value.topDoctorsToday
                              .toString());
                          log('o99o9oo9o9o9o9o99iooo99oo9o9oo');
                          if (*/ /*doctor.nbrVisitors == _homeController.maxSales*/ /* true) {
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
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
