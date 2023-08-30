import 'package:challenge/domain/meal_type.dart';
import 'package:challenge/domain/recipe.dart';
import 'package:json_annotation/json_annotation.dart';

part 'day_meals.g.dart';

@JsonSerializable()
class DayMeals {
  final int day;
  final Map<MealType, Recipe> meals;

  DayMeals(
    this.day,
    this.meals,
  );

  DayMeals copyWith({
    int? day,
    Map<MealType, Recipe>? meals,
  }) {
    return DayMeals(
      day ?? this.day,
      meals ?? this.meals,
    );
  }

  factory DayMeals.fromJson(Map<String, dynamic> json) =>
      _$DayMealsFromJson(json);

  Map<String, dynamic> toJson() => _$DayMealsToJson(this);
}
