import 'package:challenge/domain/recipe.dart';
import 'package:challenge/features/recipes/domain/recipes_params.dart';

abstract class RecipesDataSource {
  Future<List<Recipe>> getRecipes(RecipesParams params);
}
