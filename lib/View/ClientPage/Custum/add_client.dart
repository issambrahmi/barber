import 'package:barber_app/Core/Color/app_color.dart';
import 'package:barber_app/Core/Functions/app_validator.dart';
import 'package:barber_app/View/Shared/app_button.dart';
import 'package:barber_app/View/Shared/form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

addNewCliente(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) {
        TextEditingController cntrl = TextEditingController();
        return AlertDialog(
          backgroundColor: Colors.white,
          content: SizedBox(
            height: 280.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppFormField(
                  hint: 'Nom du client',
                  prefixIcon: Icon(
                    Icons.person_outline_rounded,
                    size: 22.sp,
                    color: AppColors.primary2,
                  ),
                  textController: cntrl,
                  validator: (txt) => appValidator(value: txt!),
                  text: 'Nom du client',
                ),
                SizedBox(height: 20.w),
                AppFormField(
                  hint: '0xxxxxxxxxx',
                  prefixIcon: Icon(
                    Icons.phone_android_rounded,
                    size: 22.sp,
                    color: AppColors.primary2,
                  ),
                  textController: cntrl,
                  validator: (txt) => appValidator(value: txt!),
                  text: 'Telephone',
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppButton(
                      text: 'Cancel',
                      height: 40.h,
                      width: 100.w,
                      textSize: 16.sp,
                      color: Colors.red.withOpacity(0.8),
                      textColor: Colors.white,
                      onTap: () => Get.back(),
                    ),
                    //SizedBox(width: 10.w),
                    AppButton(
                      text: 'Confirm',
                      height: 40.h,
                      width: 100.w,
                      textSize: 16.sp,
                      color: AppColors.primary2,
                      textColor: Colors.white,
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      });
}
