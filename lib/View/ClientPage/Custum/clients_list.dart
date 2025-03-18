import 'package:barber_app/Core/Color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClientsList extends StatelessWidget {
  const ClientsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.separated(
      itemCount: 10,
      separatorBuilder: (context, index) => SizedBox(height: 15.h),
      itemBuilder: (context, index) => const ClientCard(),
    );
  }
}

class ClientCard extends StatelessWidget {
  const ClientCard({super.key});

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
              SizedBox(width: 15.w),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Brahmi issam',
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary2,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.phone,
                        size: 19.sp,
                        color: AppColors.second3,
                      ),
                      SizedBox(width: 5.w),
                      Text(
                        '0541071957',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.second3,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const Spacer(),
              Align(
                alignment: Alignment.centerRight,
                child: PopupMenuButton<String>(
                  onSelected: (value) {
                    // Perform actions based on the selected value
                    if (value == 'edit') {}
                    if (value == 'delete') {}
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      const PopupMenuItem(
                        value: 'edit',
                        child: Text('Mofifier'),
                      ),
                      const PopupMenuItem(
                        value: 'delete',
                        child: Text('suprimmer'),
                      ),
                    ];
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
