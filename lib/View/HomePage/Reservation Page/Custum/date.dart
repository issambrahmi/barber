import 'package:barber_app/Controllers/Home_page_controller.dart';
import 'package:barber_app/Core/Color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomePageDate extends StatelessWidget {
  const HomePageDate({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageController controller = Get.find<HomePageController>();
    return InkWell(
        onTap: () async {
          DateTime? date = await showDatePicker(
              context: context,
              initialDate: controller.selectedDate ?? DateTime.now(),
              firstDate: DateTime(2000),
              lastDate: DateTime(2090),
              builder: (context, child) {
                return Theme(
                    data: ThemeData().copyWith(
                      colorScheme:
                          const ColorScheme.light(primary: AppColors.primary2),
                    ),
                    child: child!);
              });
          if (date != null) {
            controller.selectedDate = date;
            controller.initDays();
            controller.getReservations();
            controller.helperDate = DateTime.now();
            controller.printedDates.clear();
            controller.update(['home page date']);
            //controller.update(['reservations']);
          }
        },
        child: GetBuilder<HomePageController>(
          id: 'home page date',
          builder: (controller) => Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 5,
                    spreadRadius: 0,
                    color: Colors.black26,
                  )
                ]),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(15.sp),
                  decoration: BoxDecoration(
                    color: AppColors.primary2,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerRight,
                        child: SizedBox(
                          height: 30.sp,
                          width: 30.sp,
                          child: InkWell(
                            onTap: () => controller.isFullDateShow.value =
                                !controller.isFullDateShow.value,
                            child: Align(
                              child: Icon(
                                Icons.arrow_drop_down,
                                size: 28.sp,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.date_range_rounded,
                            size: 20.sp,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            DateFormat('dd MMM yyyy')
                                .format(controller.selectedDate!),
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Obx(() {
                  if (!controller.isFullDateShow.value) {
                    return const SizedBox();
                  } else {
                    return SizedBox(
                        height: 120.h,
                        child: ListView.separated(
                            padding: EdgeInsets.all(10.sp),
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.days.length,
                            separatorBuilder: (context, index) =>
                                SizedBox(width: 5.w),
                            itemBuilder: (context, index) => DateCard(
                                  index: index,
                                  day: controller.days[index],
                                )));
                  }
                })
              ],
            ),
          ),
        ));
  }
}

class DateCard extends StatelessWidget {
  const DateCard({super.key, required this.index, required this.day});

  final int index;
  final String day;

  @override
  Widget build(BuildContext context) {
    HomePageController controller = Get.find<HomePageController>();
    return InkWell(
      onTap: () {
        controller.changeDateDay(index + 1);
      },
      child: Container(
        height: double.infinity,
        width: 70.w,
        padding: EdgeInsets.symmetric(vertical: 5.h),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: controller.selectedDate!.day == index + 1
              ? AppColors.primary2
              : Colors.white,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              day,
              style: TextStyle(
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
                color: controller.selectedDate!.day == index + 1
                    ? Colors.white
                    : AppColors.primary2,
              ),
            ),
            Container(
              height: 35.sp,
              width: 35.sp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: controller.selectedDate!.day != index + 1
                    ? null
                    : AppColors.second3,
              ),
              child: Center(
                child: Text(
                  (index + 1).toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.sp,
                    color: controller.selectedDate!.day == index + 1
                        ? Colors.white
                        : AppColors.primary2,
                  ),
                ),
              ),
            ),
            Text(
              DateFormat('MMM').format(controller.selectedDate!),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13.sp,
                color: controller.selectedDate!.day == index + 1
                    ? Colors.white
                    : AppColors.primary2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
