import 'package:challenge/domain/recipe.dart';
import 'package:challenge/features/recipes/domain/recetas_datasource.dart';
import 'package:challenge/features/recipes/domain/recipes_params.dart';
import 'package:challenge/features/recipes/infrastructure/recetas_datasource.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///create a provider with Riverpod for recetas to getRecetas in a clean way
final chooseRecipesProvider =
    FutureProvider.family<List<Recipe>, RecipesParams>((ref, params) async {
  final RecipesDataSource dataSource = RecipesDataSourceImpl();
  return dataSource.getRecipes(params);
});
