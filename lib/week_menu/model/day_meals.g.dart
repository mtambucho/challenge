// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_meals.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DayMeals _$DayMealsFromJson(Map<String, dynamic> json) => DayMeals(
      json['day'] as int,
      (json['meals'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$MealTypeEnumMap, k),
            Recipe.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$DayMealsToJson(DayMeals instance) => <String, dynamic>{
      'day': instance.day,
      'meals': instance.meals.map((k, e) => MapEntry(_$MealTypeEnumMap[k]!, e)),
    };

const _$MealTypeEnumMap = {
  MealType.desayuno: 'desayuno',
  MealType.colacion: 'colacion',
  MealType.almuerzo: 'almuerzo',
  MealType.merienda: 'merienda',
  MealType.cena: 'cena',
};
