import 'package:barber_app/Core/Color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatisticDatePicker extends StatelessWidget {
  const StatisticDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    List test = ['hi', 'test'];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 40.h,
            width: 120.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 1),
                    blurRadius: 5,
                    spreadRadius: 1,
                    color: Colors.black26,
                  )
                ]),
            child: DropdownButtonFormField<String>(
              //  dropdownColor: AppColor.mainScreencolor,
              value: test[0],
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none)),
              items: List.generate(test.length, (index) {
                return DropdownMenuItem(
                  value: test[index],
                  child: Text(
                    test[index],
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black45,
                    ),
                  ),
                );
              }),
              onChanged: (txt) {},
            ),
          ),
          ///////////////
          Container(
            width: 180.w,
            height: 40.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.primary2,
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 1),
                    blurRadius: 5,
                    spreadRadius: 1,
                    color: Colors.black26,
                  )
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.date_range_rounded,
                  color: Colors.white,
                  size: 22.sp,
                ),
                SizedBox(width: 8.w),
                Text(
                  '26 Avril 2025',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
