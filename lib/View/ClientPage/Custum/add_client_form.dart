import 'package:barber_app/Core/Color/app_color.dart';
import 'package:barber_app/Core/Functions/app_validator.dart';
import 'package:barber_app/View/Shared/form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddClientForm extends StatelessWidget {
  const AddClientForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController cntrl = TextEditingController();
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.primary1,
          boxShadow: const [
            BoxShadow(blurRadius: 10, spreadRadius: 2, color: Colors.black26)
          ]),
      child: ListView(
        children: [
          AppFormField(
              text: 'Client name',
              hint: 'Client name',
              prefixIcon: const Icon(Icons.person, color: AppColors.primary2),
              textController: cntrl,
              validator: (txt) => appValidator(value: txt.toString())),
          SizedBox(height: 15.h),
          AppFormField(
              text: 'Phone number',
              hint: '0xxxxxxxxx',
              prefixIcon: const Icon(Icons.phone_android_outlined,
                  color: AppColors.primary2),
              textController: cntrl,
              validator: (txt) => appValidator(value: txt.toString())),
          SizedBox(height: 15.h),
          AppFormField(
              hint: 'select date',
              prefixIcon: const Icon(Icons.date_range_outlined,
                  color: AppColors.primary2),
              textController: cntrl,
              validator: (txt) => appValidator(value: txt.toString()),
              text: 'Reservation Date'),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.w),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TimeCard(text: 'aujordhuit'),
                TimeCard(text: 'demain'),
                TimeCard(text: 'apres demain')
              ],
            ),
          ),
          SizedBox(height: 20.h),
          AppFormField(
              hint: 'select time',
              prefixIcon: const Icon(Icons.date_range_outlined,
                  color: AppColors.primary2),
              textController: cntrl,
              validator: (txt) => appValidator(value: txt.toString()),
              text: 'Reservation Time'),
        ],
      ),
    );
  }
}

class TimeCard extends StatelessWidget {
  const TimeCard({super.key, required this.text});

  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: AppColors.primary2,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
