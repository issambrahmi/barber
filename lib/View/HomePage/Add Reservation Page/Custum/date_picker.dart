import 'package:barber_app/Controllers/add_new_reservation_controller.dart';
import 'package:barber_app/Core/Color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AppDatePicker extends StatelessWidget {
  const AppDatePicker({super.key});

  @override
  Widget build(BuildContext context) {
    AddNewReservationController controller =
        Get.find<AddNewReservationController>();
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
              controller.date = await showDatePicker(
                  context: context,
                  initialDate: controller.date ?? DateTime.now(),
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
              controller.update(['date picker']);
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
                  GetBuilder<AddNewReservationController>(
                      id: 'date picker',
                      builder: (controller) {
                        return Text(
                          controller.date != null
                              ? DateFormat('dd MMM yyyy')
                                  .format(controller.date!)
                              : 'Select Date',
                          style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: controller.date != null
                                ? FontWeight.bold
                                : FontWeight.w500,
                            color: controller.date != null
                                ? AppColors.primary2
                                : Colors.grey[600],
                          ),
                        );
                      }),
                  const Spacer(),
                  GetBuilder<AddNewReservationController>(
                      id: 'date picker',
                      builder: (controller) => controller.date != null
                          ? Icon(
                              Icons.check_circle_outline,
                              size: 22.sp,
                              color: AppColors.primary2,
                            )
                          : const SizedBox())
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
