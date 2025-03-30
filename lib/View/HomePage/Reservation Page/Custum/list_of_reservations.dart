import 'package:barber_app/Controllers/Home_page_controller.dart';
import 'package:barber_app/Core/Color/app_color.dart';
import 'package:barber_app/Model/reservation_model.dart';
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
    if (controller.helperDate.hour != reservation.date.hour) {
      controller.helperDate = reservation.date;
      controller.printedDates.clear();
    } else {
      controller.printedDates.add(0);
    }
    return Column(
      children: [
        controller.helperDate.hour == reservation.date.hour &&
                controller.printedDates.isEmpty
            ? Padding(
                padding: index != 0
                    ? EdgeInsets.symmetric(vertical: 15.h)
                    : EdgeInsets.only(bottom: 15.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 3.h,
                      width: 130.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.primary222,
                      ),
                    ),
                    Text(
                      '${controller.helperDate.hour.toString()} h',
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Container(
                      height: 3.h,
                      width: 130.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColors.primary222,
                      ),
                    ),
                  ],
                ),
              )
            : const SizedBox(),
        Container(
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
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
                child: Column(
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
                        ),
                      ],
                    ),
                    if (reservation.state != 'finish')
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15.h),
                          // const Divider(),
                          Text(
                            'Services',
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 5.h),
                          Wrap(
                            spacing: 10.w,
                            runSpacing: 5.h,
                            children: [
                              Container(
                                padding: EdgeInsets.all(5.sp),
                                decoration: BoxDecoration(
                                  color: AppColors.second3,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  'degrade 0',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5.sp),
                                decoration: BoxDecoration(
                                  color: AppColors.second3,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  'sechoire',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5.sp),
                                decoration: BoxDecoration(
                                  color: AppColors.second3,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  'sechoire',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5.sp),
                                decoration: BoxDecoration(
                                  color: AppColors.second3,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  'sechoire',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              Text(
                                'Totale :',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                '500 DA',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primary222,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5.h),
                        ],
                      ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: PopupMenuButton<String>(
                  onSelected: (value) {
                    // Perform actions based on the selected value
                    // if (value == 'edit') {
                    //   controller.clientName.text = client.name;
                    //   controller.phoneNumber.text = client.phoneNumber.toString();
                    //   addNewCliente(context, false, client.id);
                    // }
                    // if (value == 'delete') {
                    //   controller.deleteClient(client.id);
                    // }
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      const PopupMenuItem(
                        value: 'validate',
                        child: Text(
                          'Valider',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'edit',
                        child: Text(
                          'Mofifier',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.orange,
                          ),
                        ),
                      ),
                      const PopupMenuItem(
                        value: 'delete',
                        child: Text(
                          'suprimmer',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ),
                    ];
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
