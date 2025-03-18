import 'package:barber_app/Controllers/add_new_reservation_controller.dart';
import 'package:barber_app/Core/Color/app_color.dart';
import 'package:barber_app/Core/Functions/app_validator.dart';
import 'package:barber_app/View/HomePage/Add%20Reservation%20Page/Custum/date_picker.dart';
import 'package:barber_app/View/HomePage/Add%20Reservation%20Page/Custum/time_picker.dart';
import 'package:barber_app/View/Shared/form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddNewResrvationForm extends StatelessWidget {
  const AddNewResrvationForm({super.key});

  @override
  Widget build(BuildContext context) {
    AddNewReservationController controller =
        Get.find<AddNewReservationController>();
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
        key: controller.formKey,
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
                textController: controller.clientName,
                validator: (txt) => appValidator(
                      value: txt.toString(),
                      isRequired: true,
                      minLength: 2,
                    )),
            SizedBox(height: 15.h),
            AppFormField(
                text: 'Telephone',
                hint: '0xxxxxxxxx',
                prefixIcon: Icon(
                  Icons.phone_android_outlined,
                  color: AppColors.primary2,
                  size: 22.sp,
                ),
                textController: controller.phoneNumber,
                validator: (txt) => appValidator(
                    value: txt.toString(),
                    isRequired: true,
                    maxLength: 10,
                    minLength: 10)),
            SizedBox(height: 15.h),
            const AppDatePicker(),
            SizedBox(height: 20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.w),
              child: GetBuilder<AddNewReservationController>(
                  id: 'date picker',
                  builder: (controller) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TimeCard(
                          text: 'aujordhuit',
                          isSelected: controller.compareDates(DateTime.now()),
                          onTap: () {
                            if (controller.date != DateTime.now()) {
                              controller.date = DateTime.now();
                              controller.update(['date picker']);
                            }
                          },
                        ),
                        TimeCard(
                          text: 'demain',
                          isSelected: controller.compareDates(
                              DateTime.now().add(const Duration(days: 1))),
                          onTap: () {
                            if (controller.date !=
                                DateTime.now().add(const Duration(days: 1))) {
                              controller.date =
                                  DateTime.now().add(const Duration(days: 1));
                              controller.update(['date picker']);
                            }
                          },
                        ),
                        TimeCard(
                          text: 'apres demain',
                          isSelected: controller.compareDates(
                              DateTime.now().add(const Duration(days: 2))),
                          onTap: () {
                            if (controller.date !=
                                DateTime.now().add(const Duration(days: 2))) {
                              controller.date =
                                  DateTime.now().add(const Duration(days: 2));
                              controller.update(['date picker']);
                            }
                          },
                        )
                      ],
                    );
                  }),
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
                textController: controller.comment,
                validator: (txt) => appValidator(
                      value: txt.toString(),
                      maxLength: 100,
                      minLength: 1,
                      isRequired: false,
                    )),
            SizedBox(height: 10.h),
          ],
        ),
      ),
    );
  }
}

class TimeCard extends StatelessWidget {
  const TimeCard(
      {super.key, required this.text, this.onTap, required this.isSelected});

  final String text;
  final void Function()? onTap;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(10.sp),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: isSelected ? AppColors.primary2 : Colors.white,
            boxShadow: [
              BoxShadow(
                offset: const Offset(0, 0),
                spreadRadius: 0,
                blurRadius: 5,
                color: isSelected ? AppColors.primary2 : Colors.black26,
              )
            ]),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : AppColors.primary2,
          ),
        ),
      ),
    );
  }
}
