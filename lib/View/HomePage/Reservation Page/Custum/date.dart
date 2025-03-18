import 'package:barber_app/Core/Color/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class HomePageDate extends StatefulWidget {
  const HomePageDate({super.key});

  @override
  State<HomePageDate> createState() => _HomePageDateState();
}

class _HomePageDateState extends State<HomePageDate> {
  List<String> days = [];
  @override
  void initState() {
    days = _initDays(2025, 2);
    setState(() {});
    super.initState();
  }

  List<String> _initDays(int year, int mounth) {
    DateTime firstDayofMounth = DateTime(year, mounth, 1);
    DateTime firstDayOfNextMounth = DateTime(year, mounth + 1, 1);
    DateTime lastDayOfMounth =
        firstDayOfNextMounth.subtract(const Duration(days: 1));

    List<String> days = [];
    for (int i = 0; i < lastDayOfMounth.day; i++) {
      DateTime currentDay = firstDayofMounth.add(Duration(days: i));
      days.add(DateFormat('EEEE').format(currentDay));
    }
    return days;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: null,
      // height: 170,
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
                  child: Icon(
                    Icons.arrow_drop_down,
                    size: 28.sp,
                    color: Colors.white,
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
                      '2 Mars 2025',
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
          // Expanded(
          //   child: ListView.separated(
          //       padding: EdgeInsets.all(10.sp),
          //       scrollDirection: Axis.horizontal,
          //       itemCount: days.length,
          //       separatorBuilder: (context, index) => SizedBox(width: 5.w),
          //       itemBuilder: (context, index) => DateCard(
          //             index: index,
          //             day: days[index],
          //           )),
          // )
        ],
      ),
    );
  }
}

class DateCard extends StatefulWidget {
  const DateCard({super.key, required this.index, required this.day});

  final int index;
  final String day;

  @override
  State<DateCard> createState() => _DateCardState();
}

class _DateCardState extends State<DateCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: 70.w,
      padding: EdgeInsets.symmetric(vertical: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: widget.index == 0 ? AppColors.primary2 : Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.day,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.bold,
              color: widget.index == 0 ? Colors.white : AppColors.primary2,
            ),
          ),
          Container(
            height: 35.sp,
            width: 35.sp,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(60),
              color: widget.index != 0 ? null : AppColors.second3,
            ),
            child: Center(
              child: Text(
                (widget.index + 1).toString(),
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.sp,
                  color: widget.index == 0 ? Colors.white : AppColors.primary2,
                ),
              ),
            ),
          ),
          Text(
            'mars',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 13.sp,
              color: widget.index == 0 ? Colors.white : AppColors.primary2,
            ),
          )
        ],
      ),
    );
  }
}
