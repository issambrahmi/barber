import 'package:barber_app/Core/Color/app_color.dart';
import 'package:barber_app/View/ClientPage/client_page.dart';
import 'package:barber_app/View/HomePage/Reservation%20Page/home_page.dart';
import 'package:barber_app/View/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(),
          home: child,
        );
      },
      child: const SafeArea(child: HomePage()),
    );
  }
}
