import 'package:flutter/material.dart';

class AppColors {
  static const Color appBarColor = Color.fromRGBO(42, 147, 213, 1);
  static const Color cardBackgroundColor = Color.fromARGB(255, 245, 245, 245);
  static const Color buttonTextColor = Color.fromARGB(255, 255, 255, 255);
  static const Color buttonBackgroundColor = Color.fromRGBO(52, 171, 97, 1);
  static const Color cardTextColor = Color(0xFF3B3B3B);
  static const Color bannerTitleColor = Colors.black;
  static const Color bannerDescriptionColor = Color.fromARGB(255, 150, 150, 150); // Ajuste para corresponder ao Color.grey[600]
  static const Color navigationCircleColor = Color.fromRGBO(42, 147, 213, 1);
  static const Color actionSquareColor = Color.fromRGBO(42, 147, 213, 1);
}

class AppTextStyles {
  static const TextStyle cardHeaderTextStyle = TextStyle(
    fontSize: 16,
    color: AppColors.cardTextColor,
  );

  static const TextStyle cardBalanceTextStyle = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle bannerTitleTextStyle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColors.bannerTitleColor,
  );

  static const TextStyle bannerDescriptionTextStyle = TextStyle(
    fontSize: 12,
    color: AppColors.bannerDescriptionColor,
  );

  static const TextStyle buttonTextStyle = TextStyle(
    color: AppColors.buttonTextColor,
  );

  static const TextStyle navigationCircleTextStyle = TextStyle(
    fontSize: 12,
  );

  static const TextStyle actionSquareTextStyle = TextStyle(
    fontSize: 12,
    color: Colors.white,
  );
}
