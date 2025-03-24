import 'package:barber_app/Controllers/Home_page_controller.dart';
import 'package:barber_app/Core/Color/app_color.dart';
import 'package:barber_app/Model/reservation_model.dart';
import 'package:barber_app/View/Shared/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class HomePageResrvations extends StatelessWidget {
  const HomePageResrvations({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageController controller = Get.find<HomePageController>();
    return Obx(() => SliverList.separated(
          itemCount: controller.reservations.length,
          separatorBuilder: (context, index) => SizedBox(height: 15.h),
          itemBuilder: (BuildContext context, int index) {
            return ReservationCard(
              reservation: controller.reservations[index],
              index: index,
            );
          },
        ));
  }
}

class ReservationCard extends StatelessWidget {
  const ReservationCard(
      {super.key, required this.reservation, required this.index});

  final ReservationModel reservation;
  final int index;
  @override
  Widget build(BuildContext context) {
    HomePageController controller = Get.find<HomePageController>();
    return GestureDetector(
        // onLongPress: () {
        //   if (controller.indexLongPressed.value != index) {
        //     controller.isLongPress.value = true;
        //     controller.indexLongPressed!.value = index;
        //   }
       // },
        child: Obx(
          () => Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15),
            margin: EdgeInsets.symmetric(horizontal: 5.w),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(0, 0),
                    blurRadius: 5,
                    spreadRadius: 0,
                    color: Colors.black26,
                  )
                ]),
            child: controller.isLongPress.value &&
                    controller.indexLongPressed == index
                ? Column(
                    children: [
                      AppButton(
                        text: 'Valider',
                        height: 35.h,
                        width: 150.w,
                        textSize: 13.sp,
                        color: Colors.green,
                        textColor: Colors.white,
                      ),
                      SizedBox(height: 10.h),
                      AppButton(
                        text: 'Edit',
                        height: 35.h,
                        width: 150.w,
                        textSize: 13.sp,
                        color: Colors.orange,
                        textColor: Colors.white,
                      ),
                      SizedBox(height: 10.h),
                      AppButton(
                        text: 'Delete',
                        height: 35.h,
                        width: 150.w,
                        textSize: 13.sp,
                        color: Colors.red,
                        textColor: Colors.white,
                      ),
                    ],
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Container(
                            height: 45.sp,
                            width: 45.sp,
                            padding: EdgeInsets.all(10.sp),
                            decoration: BoxDecoration(
                                color: AppColors.primary2,
                                borderRadius: BorderRadius.circular(60),
                                boxShadow: const [
                                  BoxShadow(
                                    offset: Offset(0, 0),
                                    blurRadius: 8,
                                    spreadRadius: 0,
                                    color: AppColors.primary2,
                                  )
                                ]),
                            child: Center(
                              child: Text(
                                reservation.name[0],
                                style: TextStyle(
                                  fontSize: 17.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                reservation.name,
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Row(
                                children: [
                                  Icon(
                                    Icons.date_range_rounded,
                                    size: 18.sp,
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                      DateFormat('yyyy-MM-dd')
                                          .format(reservation.date),
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      )),
                                  SizedBox(width: 20.w),
                                  Icon(
                                    Icons.access_time_outlined,
                                    size: 18.sp,
                                  ),
                                  SizedBox(width: 5.w),
                                  Text(
                                      '${DateFormat('HH:mm').format(reservation.date)} H',
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                      )),
                                ],
                              )
                            ],
                          ),
                          const Spacer(),
                          Container(
                            height: 40.h,
                            width: 10.w,
                            decoration: BoxDecoration(
                              color: reservation.state == 'finish'
                                  ? Colors.green.withOpacity(0.3)
                                  : Colors.orange.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(50),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20.h),
                      if (reservation.comment.isNotEmpty)
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.h),
                          child: Text(
                            reservation.comment.toString(),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      const Divider(),
                      SizedBox(height: 5.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 40.sp,
                            width: 40.sp,
                            padding: EdgeInsets.all(8.sp),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: AppColors.second2,
                            ),
                            child: Icon(
                              Icons.phone,
                              size: 22.sp,
                              color: AppColors.primary2,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10.sp),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(60),
                              color: reservation.state == 'finish'
                                  ? Colors.green.withOpacity(0.3)
                                  : Colors.orange.withOpacity(0.3),
                            ),
                            child: Center(
                              child: Row(
                                children: [
                                  Icon(Icons.check_circle_outline, size: 18.sp),
                                  SizedBox(width: 5.w),
                                  Text(
                                    reservation.state == 'finish'
                                        ? 'terminer'
                                        : 'En attend',
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      // const Divider(),
                    ],
                  ),
          ),
        ));
  }
}
