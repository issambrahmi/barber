import 'package:barber_app/Controllers/services_controller.dart';
import 'package:barber_app/Core/Color/app_color.dart';
import 'package:barber_app/Model/services_model.dart';
import 'package:barber_app/View/Services%20Page/Custum/add_new_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ServicesList extends StatelessWidget {
  const ServicesList({super.key});

  @override
  Widget build(BuildContext context) {
    ServicesController controller = Get.find<ServicesController>();

    return Obx(() => ListView.separated(
          itemCount: controller.services.length,
          separatorBuilder: (context, index) => SizedBox(height: 15.h),
          itemBuilder: (context, index) => ServiceCard(
            service: controller.services[index],
            index: index,
          ),
        ));
  }
}

class ServiceCard extends StatelessWidget {
  const ServiceCard({super.key, required this.service, required this.index});

  final ServicesModel service;
  final int index;
  @override
  Widget build(BuildContext context) {
    ServicesController controller = Get.find<ServicesController>();

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5),
      margin: EdgeInsets.symmetric(horizontal: 15.w),
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
              SizedBox(width: 15.w),
              SizedBox(
                width: 150.w,
                child: Text(
                  service.name,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary2,
                  ),
                ),
              ),
              const Spacer(),
              SizedBox(
                width: 90.w,
                child: Text(
                  '${service.price.toStringAsFixed(0)} da',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.second3,
                  ),
                ),
              ),
              PopupMenuButton<String>(
                onSelected: (value) {
                  // Perform actions based on the selected value
                  if (value == 'edit') {
                    controller.serviceName.text = service.name;
                    controller.price.text = service.price.toString();
                    addNewService(context, false, service.id);
                  }
                  if (value == 'delete') {
                    controller.deleteClient(service.id);
                  }
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
            ],
          ),
        ],
      ),
    );
  }
}
