import 'package:challenge/domain/meal_type.dart';
import 'package:challenge/domain/recipe.dart';
import 'package:challenge/features/recipes/domain/recipes_datasource.dart';
import 'package:challenge/features/recipes/domain/recipes_params.dart';
import 'package:challenge/features/recipes/infrastructure/recipes_datasource_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///provider to get the mealType
final recipesProvider =
    StateNotifierProvider<RecipesStateNotifier, RecipesState>((ref) {
  final RecipesDataSource dataSource = RecipesDataSourceImpl();
  return RecipesStateNotifier(dataSource);
});

class RecipesStateNotifier extends StateNotifier<RecipesState> {
  RecipesStateNotifier(this.dataSource) : super(RecipesState.initial()) {
    getRecipes();
  }
  final RecipesDataSource dataSource;

  Future<void> getRecipes() async {
    final params = RecipesParams(type: state.mealType);
    state = state.copyWith(
        recipes: const AsyncValue.loading(), mealType: state.mealType);
    final List<Recipe> recipes = await dataSource.getRecipes(params);
    state = state.copyWith(
        recipes: AsyncValue.data(recipes), mealType: state.mealType);
  }

  ///change mealType
  void changeMealType(MealType mealType) {
    state = state.copyWith(mealType: mealType);
    getRecipes();
  }
}

class RecipesState {
  final AsyncValue<List<Recipe>> recipes;
  final MealType mealType;

  RecipesState({required this.recipes, required this.mealType});

  factory RecipesState.initial() {
    late final MealType initValue;
    final now = DateTime.now();
    if (now.hour < _kBreakfastEndTime) {
      initValue = MealType.breakfast;
    } else if (now.hour < _kLunchEndTime) {
      initValue = MealType.lunch;
    } else if (now.hour < _kTeaEndTime) {
      initValue = MealType.morningSnack;
    } else {
      initValue = MealType.dinner;
    }

    return RecipesState(
        recipes: const AsyncValue.loading(), mealType: initValue);
  }

  RecipesState copyWith(
      {AsyncValue<List<Recipe>>? recipes, MealType? mealType}) {
    return RecipesState(
      recipes: recipes ?? this.recipes,
      mealType: mealType ?? this.mealType,
    );
  }
}

const _kBreakfastEndTime = 11;
const _kLunchEndTime = 15;
const _kTeaEndTime = 19;
