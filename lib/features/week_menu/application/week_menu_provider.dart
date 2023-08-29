import 'package:challenge/domain/meal_type.dart';
import 'package:challenge/domain/recipe.dart';
import 'package:challenge/features/week_menu/model/day_meals.dart';
import 'package:challenge/services/local_storage_manager.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///create a weak menu provider with Riverpod for the week menu for each week
///user can add the recipe for each meal of the day
///use WeekMenuState to save the recipes for each day of the week

final weekMenuProvider = StateNotifierProvider<WeekMenuNotifier, WeekMenuState>(
  (ref) {
    final storeManager = ref.read(localStorageManagerProvider);
    final weekMeals = storeManager.getWeeksRecipes();

    return WeekMenuNotifier(storeManager, weekMeals);
  },
);

class WeekMenuNotifier extends StateNotifier<WeekMenuState> {
  WeekMenuNotifier(this._localStorageManager, List<DayMeals> meals)
      : super(WeekMenuState(meals));
  final LocalStorageManager _localStorageManager;

  ///add recipe for a day of the week
  ///if the recipe already exist for that day and meal type update it
  ///if not add it
  void addRecipeForDay({
    required int day,
    required MealType type,
    required Recipe recipe,
  }) {
    final weekRecipes = state.meals;
    final index = weekRecipes.indexWhere((x) => x.day == day);
    if (index >= 0) {
      weekRecipes[index].meals[type] = recipe;
    } else {
      weekRecipes.add(DayMeals(day, {type: recipe}));
    }
    _localStorageManager.saveWeeksRecipes(weekRecipes);
    state = state.copyWith(meals: weekRecipes);
  }

  ///delete recipe for a day of the week
  void deleteRecipeForDay({
    required int day,
    required MealType type,
  }) {
    final meals = state.getMealsForDay(day);
    if (meals != null) {
      meals.meals.removeWhere((key, value) => key == type);
    }
    state = state.copyWith(meals: state.meals);
  }
}

class WeekMenuState {
  final List<DayMeals> meals;

  ///get a meals for specific day
  DayMeals? getMealsForDay(int day) {
    return meals.firstWhereOrNull((element) => element.day == day);
  }

  WeekMenuState(this.meals);

  //copyWith method to copy the state
  WeekMenuState copyWith({
    List<DayMeals>? meals,
  }) {
    return WeekMenuState(
      meals ?? this.meals,
    );
  }
}
