import 'package:challenge/domain/meal_type.dart';
import 'package:challenge/domain/recipe.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'day_meals.freezed.dart';
part 'day_meals.g.dart';

@freezed
class DayMeals with _$DayMeals {
  const factory DayMeals(
    int day,
    Map<MealType, Recipe> meals,
  ) = _DayMeals;

  factory DayMeals.fromJson(Map<String, dynamic> json) =>
      _$DayMealsFromJson(json);
}
