import 'package:barber_app/Core/Color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewReservationAppBar extends StatelessWidget {
  const AddNewReservationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: const BoxDecoration(color: AppColors.primary1, boxShadow: [
        BoxShadow(blurRadius: 10, spreadRadius: -6, color: Colors.black26)
      ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: ()=>Navigator.pop(context),
            child: Container(
                height: 40.sp,
                width: 40.sp,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: const [
                      BoxShadow(
                          blurRadius: 10, spreadRadius: -1, color: Colors.black26)
                    ]),
                child: const Icon(Icons.arrow_back_ios_rounded)),
          ),
          Container(
            height: 40.sp,
            padding: EdgeInsets.all(10.sp),
            decoration: BoxDecoration(
              color: AppColors.second2,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              'Add Client',
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
                        blurRadius: 10, spreadRadius: -1, color: Colors.black26)
                  ]),
              child: const Icon(Icons.dark_mode)),
        ],
      ),
    );
  }
}
