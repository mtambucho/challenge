import 'package:challenge/utils/colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  final appThemeData = ThemeData(
    primarySwatch: AppColors.primary,
    fontFamily: 'Gilroy',
    brightness: Brightness.light,
    visualDensity: VisualDensity.adaptivePlatformDensity,
    dividerColor: AppColors.grey,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 1,
      titleTextStyle: TextStyle(
        color: Colors.black,
        fontFamily: 'Gilroy',
      ),
      iconTheme: IconThemeData(color: Colors.black), // set icon color to black
    ),
  );
}
