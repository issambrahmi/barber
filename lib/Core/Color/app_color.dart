import 'package:flutter/material.dart';

class AppColors {
  static const Color primary1 = Color(0xFFf8f9fb);
  static const Color primary2 = Color(0xff1f3e52);
  static const Color primary222 = Color.fromARGB(255, 15, 31, 42);

  static const Color second1 = Color(0xFFf7f9fa);
  static const Color second2 = Color(0xFfe0e4e6);
  static const Color second3 = Color.fromARGB(255, 72, 109, 131);

  static const Gradient gradient1 =
      LinearGradient(colors: [primary222, second3]);

  static const LinearGradient gardient2 = LinearGradient(
    colors: [
      Color(0xFF2C3E50), // your original color
      Color(0xFF4CA1AF), // a medium steel blue-gray
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
