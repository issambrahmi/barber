import 'package:barber_app/Core/Color/app_color.dart';
import 'package:barber_app/View/ClientPage/Custum/add_client.dart';
import 'package:barber_app/View/ClientPage/Custum/client_app_bar.dart';
import 'package:barber_app/View/ClientPage/Custum/clients_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ClientPage extends StatelessWidget {
  const ClientPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () => addNewCliente(context),
        backgroundColor: AppColors.second3,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: Column(
        children: [
          const ClientAppBar(),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(child: SizedBox(height: 10.h)),
                  const ClientsList(),
                  SliverToBoxAdapter(child: SizedBox(height: 70.h)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
