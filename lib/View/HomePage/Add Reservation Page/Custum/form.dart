import 'package:barber_app/Core/Color/app_color.dart';
import 'package:barber_app/Core/Functions/app_validator.dart';
import 'package:barber_app/View/HomePage/Add%20Reservation%20Page/Custum/date_picker.dart';
import 'package:barber_app/View/HomePage/Add%20Reservation%20Page/Custum/time_picker.dart';
import 'package:barber_app/View/Shared/form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewResrvationForm extends StatelessWidget {
  const AddNewResrvationForm({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController cntrl = TextEditingController();
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 20.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: AppColors.primary1,
          boxShadow: const [
            BoxShadow(blurRadius: 10, spreadRadius: 2, color: Colors.black26)
          ]),
      child: Form(
        child: ListView(
          children: [
            AppFormField(
                text: 'Nom de Client',
                hint: 'Nom de client',
                prefixIcon: Icon(
                  Icons.person_outline_sharp,
                  color: AppColors.primary2,
                  size: 22.sp,
                ),
                textController: cntrl,
                validator: (txt) => appValidator(value: txt.toString())),
            SizedBox(height: 15.h),
            AppFormField(
                text: 'Telephone',
                hint: '0xxxxxxxxx',
                prefixIcon: Icon(
                  Icons.phone_android_outlined,
                  color: AppColors.primary2,
                  size: 22.sp,
                ),
                textController: cntrl,
                validator: (txt) => appValidator(value: txt.toString())),
            SizedBox(height: 15.h),
            const AppDatePicker(),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
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
            const AppTimePicker(),
            SizedBox(height: 20.h),
            AppFormField(
                text: 'Commentaire',
                hint: 'ajouter un commentaire',
                prefixIcon: Icon(
                  Icons.comment,
                  color: AppColors.primary2,
                  size: 22.sp,
                ),
                textController: cntrl,
                validator: (txt) => appValidator(value: txt.toString())),
            SizedBox(height: 10.h),
          ],
        ),
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
