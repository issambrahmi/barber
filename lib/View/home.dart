import 'package:barber_app/View/HomePage/Reservation%20Page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: const HomePage(),
    );
  }
}
