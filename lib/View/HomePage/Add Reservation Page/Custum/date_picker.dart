import 'package:barber_app/Core/Color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDatePicker extends StatelessWidget {
  const AppDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Text('Date',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary2,
                )),
          ),
          SizedBox(height: 10.h),
          InkWell(
            onTap: () async {
              DateTime? date = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2000),
                  lastDate: DateTime(2090),
                  builder: (context, child) {
                    return Theme(
                        data: ThemeData().copyWith(
                          colorScheme: const ColorScheme.light(
                              primary: AppColors.primary2),
                        ),
                        child: child!);
                  });
              print(date);
            },
            child: Container(
              height: 50.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 0),
                    spreadRadius: 0,
                    blurRadius: 5,
                    color: Colors.black26,
                  )
                ],
              ),
              child: Row(
                children: [
                  Icon(
                    Icons.date_range_rounded,
                    size: 22.sp,
                    color: AppColors.primary2,
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'Select Date',
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey[600],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
