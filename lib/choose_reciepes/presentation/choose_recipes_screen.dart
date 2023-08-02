import 'package:challenge/appbar/appbar.dart';
import 'package:challenge/domain/meal_type.dart';
import 'package:challenge/recipes/domain/recipes_params.dart';
import 'package:challenge/recipes/presentation/recipes_screen.dart';
import 'package:challenge/utils/router.dart';
import 'package:challenge/utils/string_extensions.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../application/choose_recipes_provider.dart';

class ChooseRecipesScreen extends ConsumerWidget {
  const ChooseRecipesScreen({Key? key, required this.params}) : super(key: key);
  final ChooseRecipesScreenParams params;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipes = ref.watch(chooseRecipesProvider(RecipesParams(
      type: params.type,
    )));
    return Scaffold(
      appBar: CustomAppBar(
        title: params.type.toString().capitalize(),
        titleImage: params.type.imageURL(),
        showFav: true,
      ),
      body: recipes.when(
        data: (r) => RecipesList(r, params.type, (recipe) {
          if (params.itemsSelectables) {
            context.pop(recipe);
          } else {
            context.push(Routes.recipeDetails,
                extra: {'recipe': recipe, 'mealType': params.type});
          }
        }),
        loading: () => const CircularProgressIndicator(),
        error: (error, stackTrace) => Text(error.toString()),
      ),
    );
  }
}

class ChooseRecipesScreenParams {
  final MealType type;
  final bool itemsSelectables;

  ChooseRecipesScreenParams(this.type, this.itemsSelectables);
}
