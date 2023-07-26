import 'package:flutter/material.dart';

class AppColors {
  static const primaryColor = Color(0xFF1D4447);
  static const accentColor = Color(0xFFF50D50);
  static const blue = Color(0xFFAEC6CF);
  static const green = Color(0xFFB2D8B0);
  static const purple = Color(0xFFB19CD9);
  static const golden = Color(0xFFFBC02D);
  static const peach = Color(0xFFFFDAB9);
  static const lavender = Color(0xFFE6E6FA);
  static const coral = Color(0xFFFF7F50);
  static const lilac = Color(0xFFDCD0FF);
  static const turquoise = Color(0xFFAFEEEE);
  static const salmon = Color(0xFFFFA07A);
  static const peachyPink = Color(0xFFFFDAB9);
  static const skyBlue = Color(0xFF87CEEB);
  static const lemon = Color(0xFFFFFACD);
  static const grey = Color(0xFF9E9E9E);
  static const black = Color(0xDD000000);
  static const lightGrey = Color(0xFFF5F5F5);

  static MaterialColor primary2 = const MaterialColor(0xFFB2D8B0, {
    50: Color(0xFFF0F7F2),
    100: Color(0xFFDBF0DA),
    200: Color(0xFFC4E9C3),
    300: Color(0xFFACDFAA),
    400: Color(0xFF97D895),
    500: Color(0xFF82D27F),
    600: Color(0xFF78C974),
    700: Color(0xFF6EBC68),
    800: Color(0xFF64B45C),
    900: Color(0xFF59A750),
  });

  static MaterialColor primary = const MaterialColor(
    0xFF1D4447, // Primary color value
    <int, Color>{
      50: Color(0xFFE0F1F1),
      100: Color(0xFFB3D6D9),
      200: Color(0xFF80BBC1),
      300: Color(0xFF4D9FA8),
      400: Color(0xFF269496),
      500: Color(0xFF1D4447), // Primary color value
      600: Color(0xFF1A3E40),
      700: Color(0xFF173737),
      800: Color(0xFF142F30),
      900: Color(0xFF0D2425),
    },
  );

  MaterialColor generateMaterialColor(Color color) {
    List<Color> shades = [
      color,
      color.withOpacity(0.8),
      color.withOpacity(0.6),
      color.withOpacity(0.4),
      color.withOpacity(0.2),
      color.withOpacity(0.1),
      color.withOpacity(0.05),
    ];

    return MaterialColor(color.value, {
      50: shades[6],
      100: shades[5],
      200: shades[4],
      300: shades[3],
      400: shades[2],
      500: shades[1],
      600: shades[0],
      700: shades[1],
      800: shades[2],
      900: shades[3],
    });
  }
}
