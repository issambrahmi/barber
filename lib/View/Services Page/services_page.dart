import 'package:barber_app/Controllers/services_controller.dart';
import 'package:barber_app/Core/Color/app_color.dart';
import 'package:barber_app/View/Services%20Page/Custum/add_new_service.dart';
import 'package:barber_app/View/Services%20Page/Custum/list_of_services.dart';
import 'package:barber_app/View/Shared/top_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ServicesPage extends StatelessWidget {
  const ServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ServicesController());
    return Scaffold(
      backgroundColor: Colors.white ,
      floatingActionButton: FloatingActionButton(
        onPressed: () => addNewService(context, true, null),
        backgroundColor: AppColors.second3,
        child: const Center(
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
      body: const SafeArea(
        child: Column(
          children: [
            AppTopBar(),
            Expanded(child: ServicesList())
          ],
        ),
      ),
    );
  }
}
