import 'package:challenge/domain/recipe.dart';
import 'package:challenge/services/local_storage_manager.dart';
import 'package:challenge/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FavWidget extends ConsumerWidget {
  const FavWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final showFav = ref.watch(showFavoriteProvider);

    return IconButton(
      onPressed: () {
        final current = ref.read(showFavoriteProvider.notifier);
        current.state = !current.state;
      },
      icon: showFav ? const Icon(Icons.star) : const Icon(Icons.star_border),
    );
  }
}

///bolean
final showFavoriteProvider = StateProvider<bool>((ref) => false);

class FavRecipeWidget extends ConsumerWidget {
  const FavRecipeWidget({required this.recipe, Key? key}) : super(key: key);
  final Recipe recipe;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///add remove to favorites
    final favList = ref.watch(favProvider);
    final fav = ref.read(favProvider.notifier);
    final isFavorite = favList.contains(recipe);
    return IconButton(
      onPressed: () {
        //add remove for favorites
        if (isFavorite) {
          fav.removeRecipe(recipe);
        } else {
          fav.addRecipe(recipe);
        }
      },
      icon: isFavorite
          ? const Icon(
              Icons.star,
              color: AppColors.golden,
            )
          : const Icon(Icons.star_border),
    );
  }
}

///create a provider to manage the favorites recipes
final favProvider = StateNotifierProvider<FavNotifier, List<Recipe>>((ref) {
  final localManager = ref.read(localStorageManagerProvider);
  final recipes = localManager.getFavorites();

  return FavNotifier(recipes, localManager);
});

class FavNotifier extends StateNotifier<List<Recipe>> {
  FavNotifier(List<Recipe> recipes, this.localStorageManager) : super(recipes);
  final LocalStorageManager localStorageManager;

  void addRecipe(Recipe recipe) {
    state = [...state, recipe];
    localStorageManager.saveFavorite(recipe);
  }

  void removeRecipe(Recipe recipe) {
    ///remove from state
    state = state.where((element) => element.name != recipe.name).toList();

    localStorageManager.removeFavorite(recipe);
  }
}
