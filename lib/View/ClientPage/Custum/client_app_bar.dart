import 'package:barber_app/Core/Color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClientAppBar extends StatelessWidget {
  const ClientAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: const BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(blurRadius: 10, spreadRadius: -6, color: Colors.black26)
      ]),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(width: 20.w),
            Container(
              height: 40.sp,
              padding: EdgeInsets.all(10.sp),
              decoration: BoxDecoration(
                color: AppColors.second2,
                borderRadius: BorderRadius.circular(30),
              ),
              child: Text(
                '10 Clients',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
                height: 40.sp,
                width: 40.sp,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 10,
                          spreadRadius: -1,
                          color: Colors.black26)
                    ]),
                child: const Icon(Icons.dark_mode)),
          ],
        ),
      ),
    );
  }
}
