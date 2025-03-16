import 'package:barber_app/Core/Color/app_color.dart';
import 'package:barber_app/View/HomePage/Custum/list_of_reservations.dart';
import 'package:barber_app/View/HomePage/Custum/time.dart';
import 'package:barber_app/View/Shared/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primary1,
        body: Column(
          children: [
            const AppTopBar(),
            SizedBox(height: 30.h),
            HomePageResrvations()
            // Expanded(
            //     child: Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 15.w),
            //   child: Column(
            //     children: [
            //       const HomePageTime(),
            //       SizedBox(height: 40.h),
            //       const Expanded(child: HomePageResrvations()),
            //     ],
            //   ),
            // )),
            // Container(
            //     margin: EdgeInsets.symmetric(horizontal: 70.w),
            //     child: const HomePageTime()),
            // SizedBox(height: 10.h),
            // Expanded(
            //   child: Container(
            //     margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
            //     child: const HomePageResrvations(),
            //   ),
            // )
          ],
        ));
  }
}
