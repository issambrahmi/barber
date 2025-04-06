import 'package:barber_app/Controllers/Home_page_controller.dart';
import 'package:barber_app/Core/Color/app_color.dart';
import 'package:barber_app/View/Shared/app_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void validateReservationDialogue(BuildContext context, int index) {
  HomePageController controller = Get.find<HomePageController>();
  showDialog(
      context: context,
      builder: (context) => Dialog(
            backgroundColor: Colors.transparent,
            child: Container(
              height: 420.h,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 3,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ...List.generate(
                                controller.services.length,
                                (index) => Obx(() => CheckboxListTile(
                                      value: controller.selectedServices
                                          .contains(
                                              controller.services[index].id),
                                      onChanged: (state) {
                                        if (state == true) {
                                          controller.selectedServices.add(
                                              controller.services[index].id);
                                          controller.totale.value +=
                                              controller.services[index].price;
                                        }
                                        if (state == false) {
                                          controller.selectedServices.remove(
                                              controller.services[index].id);
                                          controller.totale.value -=
                                              controller.services[index].price;
                                        }
                                        controller.update();
                                      },
                                      contentPadding: const EdgeInsets.all(0),
                                      activeColor: AppColors.primary2,
                                      title: Text(
                                        controller.services[index].name,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.w600,
                                          color: AppColors.primary2,
                                        ),
                                      ),
                                      subtitle: Text(
                                        '${controller.services[index].price.toStringAsFixed(0)} da',
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.second3,
                                        ),
                                      ),
                                    )))
                          ],
                        ),
                      )),
                  Expanded(
                      child: Column(
                    children: [
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Totale : ',
                            style: TextStyle(
                                fontSize: 14.sp, fontWeight: FontWeight.bold),
                          ),
                          GetBuilder<HomePageController>(builder: (controller) {
                            return Text(
                              '${controller.totale.toStringAsFixed(0)} da',
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.bold,
                                color: AppColors.primary2,
                              ),
                            );
                          })
                        ],
                      ),
                      SizedBox(height: 15.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppButton(
                            onTap: () => Get.back(),
                            text: 'Cancel',
                            height: 40.h,
                            width: 110.w,
                            textSize: 14.sp,
                            color: Colors.red.withOpacity(0.4),
                            textColor: AppColors.primary2,
                          ),
                          AppButton(
                            onTap: () {
                              controller.validateReservation(index);
                            },
                            text: 'Valider',
                            height: 40.h,
                            width: 110.w,
                            textSize: 14.sp,
                            color: AppColors.primary2,
                            textColor: Colors.white,
                          )
                        ],
                      ),
                    ],
                  ))
                ],
              ),
            ),
          ));
}
