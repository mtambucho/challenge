// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_meals.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_DayMeals _$$_DayMealsFromJson(Map<String, dynamic> json) => _$_DayMeals(
      json['day'] as int,
      (json['meals'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$MealTypeEnumMap, k),
            Recipe.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$$_DayMealsToJson(_$_DayMeals instance) =>
    <String, dynamic>{
      'day': instance.day,
      'meals': instance.meals.map((k, e) => MapEntry(_$MealTypeEnumMap[k]!, e)),
    };

const _$MealTypeEnumMap = {
  MealType.breakfast: 'breakfast',
  MealType.morningSnack: 'morningSnack',
  MealType.lunch: 'lunch',
  MealType.snack: 'snack',
  MealType.dinner: 'dinner',
};
