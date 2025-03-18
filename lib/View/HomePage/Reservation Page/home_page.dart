import 'package:barber_app/Core/Color/app_color.dart';
import 'package:barber_app/View/HomePage/Add%20Reservation%20Page/add_reservation_page.dart';
import 'package:barber_app/View/HomePage/Reservation%20Page/Custum/date.dart';
import 'package:barber_app/View/HomePage/Reservation%20Page/Custum/list_of_reservations.dart';
import 'package:barber_app/View/HomePage/Reservation%20Page/Custum/time.dart';
import 'package:barber_app/View/Shared/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.primary1,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => const AddNewReservationPage())),
          backgroundColor: AppColors.primary2,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: Column(
          children: [
            const AppTopBar(),
            SizedBox(height: 10.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: CustomScrollView(
                  slivers: [
                    const SliverToBoxAdapter(
                      child: HomePageDate(),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(height: 30.h),
                    ),
                    const SliverToBoxAdapter(
                      child: HomePageTime(),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(height: 30.h),
                    ),
                    const HomePageResrvations(),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
