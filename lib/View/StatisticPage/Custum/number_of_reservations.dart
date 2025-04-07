import 'package:barber_app/Core/Color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatisticNumberOfReservations extends StatelessWidget {
  const StatisticNumberOfReservations({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        children: [
          Container(
            width: 160.w,
            padding: EdgeInsets.all(8.sp),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: AppColors.gardient2
                //color: AppColors.second3,
                ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Reservations',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '25',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 15.w),
                    Icon(
                      Icons.arrow_drop_down,
                      size: 18.sp,
                      color: Colors.red,
                    ),
                    Text(
                      '5%',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Spacer(),
          Container(
            width: 160.w,
            padding: EdgeInsets.all(8.sp),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: AppColors.gardient2
                //color: AppColors.second3,
                ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Totale',
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '6300 da',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 15.w),
                    Icon(
                      Icons.arrow_drop_up_rounded,
                      size: 18.sp,
                      color: Colors.green,
                    ),
                    Text(
                      '3%',
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
