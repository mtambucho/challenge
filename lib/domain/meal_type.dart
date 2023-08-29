import 'dart:developer';

import 'package:challenge/constants/colors.dart';
import 'package:challenge/constants/images.dart';
import 'package:challenge/constants/strings.dart';
import 'package:flutter/material.dart';

enum MealType {
  breakfast,
  morningSnack,
  lunch,
  snack,
  dinner;

  @override
  String toString() {
    return switch (this) {
      MealType.breakfast => AppStrings.breakfast,
      MealType.morningSnack => AppStrings.morningSnack,
      MealType.lunch => AppStrings.lunch,
      MealType.snack => AppStrings.snack,
      MealType.dinner => AppStrings.dinner
    };
  }

  String imageURL() {
    return switch (this) {
      breakfast => AppImages.desayuno,
      morningSnack => AppImages.colacion,
      lunch => AppImages.almuerzo,
      snack => AppImages.merienda,
      dinner => AppImages.cena,
    };
  }

  static MealType fromJson(String? json) {
    try {
      return MealType.values.firstWhere(
        (element) => element.toRawValue() == json,
      );
    } catch (e) {
      log('error');
      return MealType.breakfast;
    }
  }

  String toRawValue() {
    return switch (this) {
      breakfast => 'desayuno',
      morningSnack => 'colacion',
      snack => 'merienda',
      lunch || dinner => 'comida'
    };
  }

  Color color() {
    return switch (this) {
      MealType.breakfast => AppColors.skyBlue,
      MealType.morningSnack => AppColors.lemon,
      MealType.lunch => AppColors.green,
      MealType.snack => AppColors.blue,
      MealType.dinner => AppColors.peach
    };
  }
}
