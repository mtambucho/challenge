import 'dart:convert';
import 'dart:developer';

import 'package:challenge/domain/recipe.dart';
import 'package:challenge/features/recipes/domain/recetas_datasource.dart';
import 'package:challenge/features/recipes/domain/recipes_params.dart';
import 'package:flutter/services.dart';

class RecipesDataSourceImpl implements RecipesDataSource {
  ///function to get all recipes from recetas.json

  @override
  Future<List<Recipe>> getRecipes(RecipesParams params) async {
    try {
      final recipes = List<Recipe>.empty(growable: true);
      for (var i = 1; i <= 7; i++) {
        final list = await _getRecipesForWeek(params, i);
        recipes.addAll(list);
      }
      return recipes;
    } catch (e) {
      log('==>>$e');
      return [];
    }
  }

  Future<List<Recipe>> _getRecipesForWeek(
      RecipesParams params, int week) async {
    try {
      final List<Recipe> recetas = [];
      final filename = 's${week}_${params.type.toRawValue()}';
      final json = await rootBundle.loadString('assets/recetas/$filename.json');
      final List<dynamic> jsonResponse = jsonDecode(json);
      for (var element in jsonResponse) {
        final receta = Recipe.fromJson(element);
        recetas.add(receta);
      }
      return recetas;
    } catch (e) {
      log('==>>$e');
      return [];
    }
  }
}
