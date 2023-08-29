import 'dart:developer';

import 'package:challenge/constants/colors.dart';
import 'package:challenge/constants/images.dart';
import 'package:flutter/material.dart';

enum MealType {
  desayuno,
  colacion,
  almuerzo,
  merienda,
  cena;

  @override
  String toString() {
    return switch (this) {
      MealType.desayuno => 'Desayuno',
      MealType.colacion => 'Colación',
      MealType.almuerzo => 'Almuerzo',
      MealType.merienda => 'Merienda',
      MealType.cena => 'Cena'
    };
  }

  String imageURL() {
    return switch (this) {
      desayuno => AppImages.desayuno,
      colacion => AppImages.colacion,
      almuerzo => AppImages.almuerzo,
      merienda => AppImages.merienda,
      cena => AppImages.cena,
    };
  }

  static MealType fromJson(String? json) {
    try {
      return MealType.values.firstWhere(
        (element) => element.toRawValue() == json,
      );
    } catch (e) {
      log('error');
      return MealType.desayuno;
    }
  }

  String toRawValue() {
    return switch (this) {
      desayuno => 'desayuno',
      colacion => 'colacion',
      merienda => 'merienda',
      almuerzo || cena => 'comida'
    };
  }

  Color color() {
    return switch (this) {
      MealType.desayuno => AppColors.skyBlue,
      MealType.colacion => AppColors.lemon,
      MealType.almuerzo => AppColors.green,
      MealType.merienda => AppColors.blue,
      MealType.cena => AppColors.peach
    };
  }
}
