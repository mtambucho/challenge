import 'package:challenge/domain/recipe.dart';
import 'package:challenge/features/recipes/domain/recipes_params.dart';
import 'package:challenge/features/recipes/infrastructure/recipes_datasource_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipes_datasource.g.dart';

abstract class RecipesDataSource {
  ///function to get all recipes
  Future<List<Recipe>> getRecipes(RecipesParams params);
}

@riverpod
RecipesDataSource recipesDataSource(RecipesDataSourceRef ref) {
  return RecipesDataSourceImpl();
}
