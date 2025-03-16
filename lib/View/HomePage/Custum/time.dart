import 'package:barber_app/Core/Color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageTime extends StatelessWidget {
  const HomePageTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 50.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 0),
                          blurRadius: 5,
                          spreadRadius: 0,
                          color: Colors.black26,
                        )
                      ]),
                  child: const Icon(Icons.sunny)),
              SizedBox(height: 5.h),
              Text(
                'morning',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                ),
              )
            ],
          ),
          Column(
            children: [
              Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: AppColors.primary2,
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 0),
                          blurRadius: 5,
                          spreadRadius: 0,
                          color: Colors.black26,
                        )
                      ]),
                  child: const Icon(
                    Icons.dark_mode_outlined,
                    color: Colors.white,
                  )),
              SizedBox(height: 5.h),
              Text(
                'evening',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15.sp,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
