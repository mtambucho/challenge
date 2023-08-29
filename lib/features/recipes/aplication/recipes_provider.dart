import 'package:challenge/domain/meal_type.dart';
import 'package:challenge/domain/recipe.dart';
import 'package:challenge/features/recipes/domain/recetas_datasource.dart';
import 'package:challenge/features/recipes/domain/recipes_params.dart';
import 'package:challenge/features/recipes/infrastructure/recetas_datasource.dart';
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
    if (now.hour < 11) {
      initValue = MealType.desayuno;
    } else if (now.hour < 15) {
      initValue = MealType.almuerzo;
    } else if (now.hour < 19) {
      initValue = MealType.colacion;
    } else {
      initValue = MealType.cena;
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
