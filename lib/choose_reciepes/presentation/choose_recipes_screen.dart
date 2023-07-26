import 'package:challenge/appbar/appbar.dart';
import 'package:challenge/cart/cart_provider.dart';
import 'package:challenge/choose_reciepes/presentation/choose_recipes_item.dart';
import 'package:challenge/domain/meal_type.dart';
import 'package:challenge/recipes/recipes_provider.dart';
import 'package:challenge/utils/router.dart';
import 'package:challenge/utils/string_extensions.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../application/choose_recipes_provider.dart';

class ChooseRecipesScreenParams {
  final MealType type;
  final bool itemsSelectables;

  ChooseRecipesScreenParams(this.type, this.itemsSelectables);
}

class ChooseRecipesScreen extends ConsumerWidget {
  const ChooseRecipesScreen({Key? key, required this.params}) : super(key: key);
  final ChooseRecipesScreenParams params;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipes = ref.watch(chooseRecipesProvider(RecipesParams(
      type: params.type,
    )));

    final cart = ref.watch(cartProvider);

    return Scaffold(
      appBar: CustomAppBar(
        title: params.type.toString().capitalize(),
      ),
      body: recipes.when(
        data: (recetas) {
          return ListView.builder(
              itemCount: recetas.length,
              itemBuilder: (context, index) {
                final itemInCart = cart.firstWhereOrNull(
                    (element) => element.recipe.name == recetas[index].name);
                return ChoseRecipesItem(
                  recipe: recetas[index],
                  onTap: () {
                    final recipe = recetas[index];
                    if (params.itemsSelectables) {
                      context.pop(recipe);
                    } else {
                      context.push(Routes.recipeDetails,
                          extra: {'recipe': recipe, 'mealType': params.type});
                    }
                  },
                  color: params.type.color(),
                  inCart: itemInCart != null,
                );
              });
        },
        loading: () => const CircularProgressIndicator(),
        error: (error, stackTrace) => Text(error.toString()),
      ),
    );
  }
}
