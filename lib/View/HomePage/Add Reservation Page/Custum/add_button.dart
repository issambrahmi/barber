import 'package:barber_app/Controllers/add_new_reservation_controller.dart';
import 'package:barber_app/Core/Color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddNewResrvationButton extends StatelessWidget {
  const AddNewResrvationButton({super.key});

  @override
  Widget build(BuildContext context) {
    AddNewReservationController controller =
        Get.find<AddNewReservationController>();
    return InkWell(
      onTap: () {
        if (controller.isAddPage) {
          controller.addnewReservation();
        } else {
          controller.editReservation();
        }
      },
      child: Container(
        height: 50.h,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: AppColors.gradient1,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              size: 22.sp,
              color: Colors.white,
            ),
            SizedBox(width: 10.w),
            Text(
              Get.find<AddNewReservationController>().isAddPage
                  ? 'Confirmer Reservation'
                  : 'Confirmer Modification',
              style: TextStyle(
                fontSize: 16.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
