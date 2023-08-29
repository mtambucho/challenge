import 'package:challenge/domain/recipe.dart';
import 'package:challenge/features/recipes/domain/recipes_datasource.dart';
import 'package:challenge/features/recipes/domain/recipes_params.dart';
import 'package:challenge/features/recipes/infrastructure/recipes_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'recipes_repository.g.dart';

abstract class RecipesRepository {
  ///function to get all recipes
  Future<List<Recipe>> getRecipes(RecipesParams params);
}

@riverpod
RecipesRepository recipesRepository(RecipesRepositoryRef ref) {
  return RecipesRepositoryImpl(dataSource: ref.read(recipesDataSourceProvider));
}
