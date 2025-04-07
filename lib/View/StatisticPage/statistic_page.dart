import 'package:barber_app/View/Shared/top_bar.dart';
import 'package:barber_app/View/StatisticPage/Custum/bar_chart.dart';
import 'package:barber_app/View/StatisticPage/Custum/number_of_reservations.dart';
import 'package:barber_app/View/StatisticPage/Custum/statistic_date_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatisticPage extends StatelessWidget {
  const StatisticPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const AppTopBar(),
          const StatisticDatePicker(),
          SizedBox(height: 15.h),
          const StatisticNumberOfReservations(),
          SizedBox(height: 15.h),
          const StatisticBarChart(),
        ],
      ),
    );
  }
}
