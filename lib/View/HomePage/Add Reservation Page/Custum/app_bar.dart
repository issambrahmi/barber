import 'package:barber_app/Controllers/add_new_reservation_controller.dart';
import 'package:barber_app/Core/Color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddNewReservationAppBar extends StatelessWidget {
  const AddNewReservationAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    AddNewReservationController controller =
        Get.find<AddNewReservationController>();
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
            onTap: () => Get.back(),
            child: Container(
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
              controller.isAddPage ? 'Ajouter reservation' : 'Modifier reservation',
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
