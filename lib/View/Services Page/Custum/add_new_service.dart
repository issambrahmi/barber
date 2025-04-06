import 'package:barber_app/Controllers/services_controller.dart';
import 'package:barber_app/Core/Color/app_color.dart';
import 'package:barber_app/Core/Functions/app_validator.dart';
import 'package:barber_app/View/Shared/app_button.dart';
import 'package:barber_app/View/Shared/form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

addNewService(BuildContext context, bool isAdd, int? id) {
  showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        ServicesController controller = Get.find<ServicesController>();
        return AlertDialog(
          backgroundColor: Colors.white,
          content: SizedBox(
            height: 280.h,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppFormField(
                  hint: 'Nom du Service',
                  prefixIcon: Icon(
                    Icons.near_me,
                    size: 22.sp,
                    color: AppColors.primary2,
                  ),
                  textController: controller.serviceName,
                  validator: (txt) => appValidator(value: txt!),
                  text: 'Nom du Service',
                ),
                SizedBox(height: 20.w),
                AppFormField(
                  hint: '0.00',
                  text: 'Prix',
                  prefixIcon: Icon(
                    Icons.price_change,
                    size: 22.sp,
                    color: AppColors.primary2,
                  ),
                  keyboardType: TextInputType.number,
                  textController: controller.price,
                  validator: (txt) => appValidator(value: txt!),
                ),
                SizedBox(height: 30.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppButton(
                      text: 'Annuler',
                      height: 40.h,
                      width: 100.w,
                      textSize: 16.sp,
                      color: Colors.red.withOpacity(0.8),
                      textColor: Colors.white,
                      onTap: () {
                        controller.clearFields();
                        Get.back();
                      },
                    ),
                    //SizedBox(width: 10.w),
                    AppButton(
                      text: isAdd ? 'Ajouter' : 'Modifier',
                      onTap: () {
                        if (isAdd) {
                          controller.addNewClient();
                        } else {
                          controller.editClient(id!);
                        }
                      },
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
