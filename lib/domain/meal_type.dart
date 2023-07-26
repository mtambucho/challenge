import 'dart:developer';

import 'package:challenge/utils/colors.dart';
import 'package:challenge/utils/images.dart';
import 'package:flutter/material.dart';

enum MealType {
  desayuno,
  colacion,
  almuerzo,
  merienda,
  cena;

  @override
  String toString() {
    switch (this) {
      case MealType.desayuno:
        return 'Desayuno';
      case MealType.colacion:
        return 'Colación';
      case MealType.almuerzo:
        return 'Almuerzo';
      case MealType.merienda:
        return 'Merienda';
      case MealType.cena:
        return 'Cena';
    }
  }

  String imageURL() {
    switch (this) {
      case MealType.desayuno:
        return AppImages.desayuno;
      case MealType.colacion:
        return AppImages.colacion;
      case MealType.almuerzo:
        return AppImages.almuerzo;
      case MealType.merienda:
        return AppImages.merienda;
      case MealType.cena:
        return AppImages.cena;
    }
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
    switch (this) {
      case MealType.desayuno:
        return 'desayuno';
      case MealType.colacion:
        return 'colacion';
      case MealType.merienda:
        return 'merienda';
      case MealType.almuerzo:
      case MealType.cena:
        return 'comida';
    }
  }

  Color color() {
    switch (this) {
      case MealType.desayuno:
        return AppColors.skyBlue;
      case MealType.colacion:
        return AppColors.lemon;
      case MealType.almuerzo:
        return AppColors.green;
      case MealType.merienda:
        return AppColors.blue;
      case MealType.cena:
        return AppColors.peach;
    }
  }
}
