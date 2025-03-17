import 'package:barber_app/View/ClientPage/Custum/add_client_app_bar.dart';
import 'package:barber_app/View/ClientPage/Custum/add_client_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddClientPage extends StatelessWidget {
  const AddClientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const AddClientAppBar(),
          SizedBox(height: 10.h),
          const Expanded(child: AddClientForm())
        ],
      ),
    );
  }
}
