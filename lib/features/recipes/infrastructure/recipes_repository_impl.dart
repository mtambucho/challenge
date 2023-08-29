import 'dart:developer';

import 'package:challenge/domain/recipe.dart';
import 'package:challenge/features/recipes/domain/recipes_datasource.dart';
import 'package:challenge/features/recipes/domain/recipes_params.dart';
import 'package:challenge/features/recipes/domain/recipes_repository.dart';

class RecipesRepositoryImpl implements RecipesRepository {
  final RecipesDataSource dataSource;

  RecipesRepositoryImpl({required this.dataSource});

  ///function to get all recipes from jsons
  @override
  Future<List<Recipe>> getRecipes(RecipesParams params) async {
    try {
      return dataSource.getRecipes(params);
    } catch (e) {
      log('==>>$e');
      return [];
    }
  }
}
