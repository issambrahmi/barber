import 'package:barber_app/Controllers/add_new_reservation_controller.dart';
import 'package:barber_app/View/HomePage/Add%20Reservation%20Page/Custum/add_button.dart';
import 'package:barber_app/View/HomePage/Add%20Reservation%20Page/Custum/app_bar.dart';
import 'package:barber_app/View/HomePage/Add%20Reservation%20Page/Custum/form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddNewReservationPage extends StatelessWidget {
  const AddNewReservationPage({super.key});


  @override
  Widget build(BuildContext context) {
    Get.put(AddNewReservationController());
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const AddNewReservationAppBar(),
            SizedBox(height: 5.h),
            const Expanded(child: AddNewResrvationForm()),
            const AddNewResrvationButton()
          ],
        ),
      ),
    );
  }
}
