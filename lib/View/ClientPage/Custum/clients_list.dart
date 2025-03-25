import 'package:barber_app/Controllers/client_controller.dart';
import 'package:barber_app/Core/Color/app_color.dart';
import 'package:barber_app/Model/client_model.dart';
import 'package:barber_app/View/ClientPage/Custum/add_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ClientsList extends StatelessWidget {
  const ClientsList({super.key});

  @override
  Widget build(BuildContext context) {
    ClientController controller = Get.find<ClientController>();

    return Obx(() => SliverList.separated(
          itemCount: controller.clients.length,
          separatorBuilder: (context, index) => SizedBox(height: 15.h),
          itemBuilder: (context, index) => ClientCard(
            client: controller.clients[index],
            index: index,
          ),
        ));
  }
}

class ClientCard extends StatelessWidget {
  const ClientCard({super.key, required this.client, required this.index});

  final ClientModel client;
  final int index;
  @override
  Widget build(BuildContext context) {
    ClientController controller = Get.find<ClientController>();

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
                    client.name[0],
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
                    client.name,
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
                        client.phoneNumber.toString(),
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
                    if (value == 'edit') {
                      controller.clientName.text = client.name;
                      controller.phoneNumber.text =
                          client.phoneNumber.toString();
                      addNewCliente(context, false, client.id);
                    }
                    if (value == 'delete') {
                      controller.deleteClient(client.id);
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
              ),
            ],
          )
        ],
      ),
    );
  }
}
