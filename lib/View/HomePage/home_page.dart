import 'package:barber_app/Core/Color/app_color.dart';
import 'package:barber_app/View/HomePage/Custum/date.dart';
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
        bottomNavigationBar: Container(
          height: 50.h,
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          decoration: const BoxDecoration(color: Colors.white, boxShadow: [
            BoxShadow(
              spreadRadius: 0,
              blurRadius: 5,
              color: Colors.black26,
            )
          ]),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(Icons.person),
              Icon(Icons.home),
              Icon(Icons.stairs),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.second3,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          // const Text(
          //   'Ajouter une Reservation',
          //   style: TextStyle(
          //     fontWeight: FontWeight.bold,
          //     color: Colors.white,
          //   ),
          // ),
        ),
        body: Column(
          children: [
            const AppTopBar(),
            SizedBox(height: 20.h),
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
