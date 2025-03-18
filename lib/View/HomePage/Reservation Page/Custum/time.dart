import 'package:barber_app/Controllers/Home_page_controller.dart';
import 'package:barber_app/Core/Color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomePageTime extends StatelessWidget {
  const HomePageTime({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageController controller = Get.find<HomePageController>();
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.w),
        child: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  InkWell(
                    onTap: () => controller.changeTime(isMorningTap: true),
                    child: Container(
                        padding: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: controller.isMorning.value
                                ? AppColors.primary2
                                : Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 0),
                                blurRadius: 5,
                                spreadRadius: 0,
                                color: controller.isMorning.value
                                    ? AppColors.primary2
                                    : Colors.black26,
                              )
                            ]),
                        child: Icon(
                          Icons.sunny,
                          size: 28.sp,
                          color: controller.isMorning.value
                              ? Colors.white
                              : AppColors.primary2,
                        )),
                  ),
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
                  InkWell(
                    onTap: () => controller.changeTime(isMorningTap: false),
                    child: Container(
                        padding: EdgeInsets.all(10.sp),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: controller.isMorning.value == false
                                ? AppColors.primary2
                                : Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 0),
                                blurRadius: 5,
                                spreadRadius: 0,
                                color: controller.isMorning.value == false
                                    ? AppColors.primary2
                                    : Colors.black26,
                              )
                            ]),
                        child: Icon(
                          Icons.dark_mode_outlined,
                          size: 28.sp,
                          color: controller.isMorning.value == false
                              ? Colors.white
                              : AppColors.primary2,
                        )),
                  ),
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
        ));
  }
}
