import 'package:challenge/constants/colors.dart';
import 'package:flutter/material.dart';

class HomeStyle {
  static TextStyle get title => const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: AppColors.black,
      );
  static TextStyle get itemTitle => const TextStyle(
        fontSize: 11,
        color: AppColors.accentColor,
        fontWeight: FontWeight.bold,
      );
  static TextStyle get item => const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      );
}
// 