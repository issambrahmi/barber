import 'package:barber_app/Core/Color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageResrvations extends StatelessWidget {
  const HomePageResrvations({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: 10,
      separatorBuilder: (context, index) => SizedBox(height: 15.h),
      itemBuilder: (BuildContext context, int index) {
        return const ReservationCard();
      },
    );
  }
}

class ReservationCard extends StatelessWidget {
  const ReservationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    'A',
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
                    'Brahmi issam',
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
                      Text('25-03-2025',
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
                      Text('8.45 H',
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
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(50),
                ),
              )
            ],
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.h),
            child: const Text(
              'Sechoire ',
              style: TextStyle(
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
                  color: Colors.green.withOpacity(0.3),
                ),
                child: Center(
                  child: Row(
                    children: [
                      Icon(Icons.check_circle_outline, size: 18.sp),
                      SizedBox(width: 5.w),
                      Text(
                        'terminer',
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
    );
  }
}
