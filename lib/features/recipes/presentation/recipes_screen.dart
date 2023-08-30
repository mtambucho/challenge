import 'package:challenge/appbar/appbar.dart';
import 'package:challenge/domain/meal_type.dart';
import 'package:challenge/domain/recipe.dart';
import 'package:challenge/features/cart/application/cart_provider.dart';
import 'package:challenge/features/recipes/application/recipes_provider.dart';
import 'package:challenge/features/recipes/presentation/widgets/meals_bubbles.dart';
import 'package:challenge/features/recipes/presentation/widgets/recipes_item.dart';
import 'package:challenge/global_widgets/fav_widget.dart';
import 'package:challenge/routing/router.dart';
// ignore: depend_on_referenced_packages
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class RecipesScreen extends ConsumerWidget {
  const RecipesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final recipes = ref.watch(recipesProvider);
    final notifier = ref.read(recipesProvider.notifier);

    return Scaffold(
        appBar: CustomAppBar(
          titleImage: recipes.mealType.imageURL(),
          title: recipes.mealType.toString(),
          showFav: true,
        ),
        body: Column(children: [
          MealsBubbles(
            onSelected: (mealType) {
              notifier.changeMealType(mealType);
            },
            selected: recipes.mealType,
            canChangeCategory: true,
          ),
          Expanded(
            child: recipes.recipes.when(
              data: (r) => RecipesList(r, recipes.mealType, (recipe) {
                context.pushNamed(Routes.recipeDetails,
                    extra: {'recipe': recipe, 'mealType': recipes.mealType});
              }),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => Text(error.toString()),
            ),
          )
        ]));
  }
}

class RecipesList extends ConsumerWidget {
  const RecipesList(this.recipes, this.type, this.onSelected, {super.key});
  final List<Recipe> recipes;
  final void Function(Recipe) onSelected;
  final MealType type;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late List<Recipe> recetas;
    final cart = ref.watch(cartProvider);
    final showFavorites = ref.watch(showFavoriteProvider);
    if (showFavorites) {
      final favorites = ref.watch(favProvider);

      recetas =
          recipes.where((element) => favorites.contains(element)).toList();
    } else {
      recetas = recipes;

      ///show favorites first
      recetas.sort((a, b) {
        final aFav = ref.watch(favProvider).contains(a);
        final bFav = ref.watch(favProvider).contains(b);
        if (aFav && !bFav) {
          return -1;
        } else if (!aFav && bFav) {
          return 1;
        } else {
          return 0;
        }
      });
    }

    return ListView.builder(
        itemCount: recetas.length,
        itemBuilder: (context, index) {
          final itemInCart = cart.firstWhereOrNull(
              (element) => element.recipe.name == recetas[index].name);
          return Column(
            children: [
              RecipesItem(
                receta: recetas[index],
                onTap: () => onSelected.call(recetas[index]),
                color: type.color(),
                inCart: itemInCart != null,
              ),
              if (index != recetas.length - 1) const Divider(),
            ],
          );
        });
  }
}
