import 'package:challenge/cart/cart_screen.dart';
import 'package:challenge/choose_reciepes/presentation/choose_recipes_screen.dart';
import 'package:challenge/domain/recipe.dart';
import 'package:challenge/home/home_screen.dart';
import 'package:challenge/recipe_details/presentation/recipe_details_screen.dart';
import 'package:challenge/recipes/recipes_screen.dart';
import 'package:challenge/settings/settings_screen.dart';
import 'package:challenge/splash_screen.dart';
import 'package:challenge/week_menu/presentation/week_menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../domain/meal_type.dart';
import '../meal_type/meal_type_screen.dart';
import '../shopping_list/shopping_list_screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      initialLocation: Routes.splash,
      navigatorKey: _rootNavigatorKey,
      debugLogDiagnostics: true,
      routes: [
        ///splash screen
        GoRoute(
          path: Routes.splash,
          name: Routes.splash,
          parentNavigatorKey: _rootNavigatorKey,
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const SplashScreen(),
          ),
        ),

        ///home screen
        GoRoute(
          path: Routes.home,
          name: Routes.home,
          parentNavigatorKey: _rootNavigatorKey,
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const HomeScreen(),
          ),
        ),

        ///meal type
        GoRoute(
            path: Routes.mealType,
            name: Routes.mealType,
            parentNavigatorKey: _rootNavigatorKey,
            pageBuilder: (context, state) {
              return NoTransitionPage(
                key: state.pageKey,
                child: const MealTypeScreen(),
              );
            }),

        ///recipes screen
        GoRoute(
            path: Routes.recipes,
            name: Routes.recipes,
            parentNavigatorKey: _rootNavigatorKey,
            pageBuilder: (context, state) {
              final params = state.extra as Map;
              final type = params['type'] as MealType;
              return NoTransitionPage(
                key: state.pageKey,
                child: RecipesScreen(
                  type: type,
                ),
              );
            }),

        ///recipe details
        GoRoute(
          path: Routes.recipeDetails,
          name: Routes.recipeDetails,
          parentNavigatorKey: _rootNavigatorKey,
          pageBuilder: (context, state) {
            final params = state.extra as Map;
            final recipe = params['recipe'] as Recipe;
            final mealType = params['mealType'] as MealType;
            return NoTransitionPage(
                key: state.pageKey,
                child: RecipeDetailsScreen(
                  recipe: recipe,
                  mealType: mealType,
                ));
          },
        ),

        ///cart
        GoRoute(
          path: Routes.cart,
          name: Routes.cart,
          parentNavigatorKey: _rootNavigatorKey,
          pageBuilder: (context, state) {
            final params = state.extra as Map?;
            final showDrawer = params?['showDrawer'] as bool?;
            return NoTransitionPage(
              key: state.pageKey,
              child: CartScreen(showDrawer ?? false),
            );
          },
        ),

        ///shopping list
        GoRoute(
          path: Routes.shoppingList,
          name: Routes.shoppingList,
          parentNavigatorKey: _rootNavigatorKey,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              key: state.pageKey,
              child: const ShoppingListScreen(),
            );
          },
        ),

        ///week menu
        GoRoute(
          path: Routes.weekMenu,
          name: Routes.weekMenu,
          parentNavigatorKey: _rootNavigatorKey,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              key: state.pageKey,
              child: const WeekMenuScreen(),
            );
          },
        ),

        ///chooseRecipes
        GoRoute(
          path: Routes.chooseRecipes,
          name: Routes.chooseRecipes,
          parentNavigatorKey: _rootNavigatorKey,
          pageBuilder: (context, state) {
            final params = state.extra as Map;
            final type = MealType.fromJson(params['mealType']);
            final bool itemsSelectables = params['itemsSelectables'] ?? false;
            return NoTransitionPage(
              key: state.pageKey,
              child: ChooseRecipesScreen(
                params: ChooseRecipesScreenParams(type, itemsSelectables),
              ),
            );
          },
        ),

        ///settings
        GoRoute(
          path: Routes.settings,
          name: Routes.settings,
          parentNavigatorKey: _rootNavigatorKey,
          pageBuilder: (context, state) {
            return NoTransitionPage(
              key: state.pageKey,
              child: const SettingsScreen(),
            );
          },
        ),
      ],
    );
  },
);

class Routes {
  static const splash = '/';
  static const home = '/home';
  static const recipes = '/recipes';
  static const mealType = '/mealType';
  static const recipeDetails = '/recipeDetails';
  static const cart = '/cart';
  static const shoppingList = '/shoppingList';
  static const weekMenu = '/weekMenu';
  static const chooseRecipes = '/chooseRecipes';
  static const settings = '/settings';
  static const defaultPage = Routes.mealType;
}
