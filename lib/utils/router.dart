import 'package:challenge/cart/cart_screen.dart';
import 'package:challenge/choose_reciepes/presentation/choose_recipes_screen.dart';
import 'package:challenge/domain/meal_type.dart';
import 'package:challenge/domain/recipe.dart';
import 'package:challenge/navbar/navbar.dart';
import 'package:challenge/navbar/scaffold_with_nested_navigation.dart';
import 'package:challenge/recipe_details/presentation/recipe_details_screen.dart';
import 'package:challenge/recipes/presentation/recipes_screen.dart';
import 'package:challenge/settings/settings_screen.dart';
import 'package:challenge/shopping_list/shopping_list_screen.dart';
import 'package:challenge/splash_screen.dart';
import 'package:challenge/week_menu/presentation/week_menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorRecipesKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellRecipes');
final _shellNavigatorChallengeKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellChallenge');
final _shellNavigatorSettingsKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellSettings');
final _shellNavigatorExcerciseKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellExcercise');

final goRouterProvider = Provider<GoRouter>(
  (ref) {
    return GoRouter(
      // initialLocation: Routes.mealType,
      initialLocation: Routes.splash,

      navigatorKey: _rootNavigatorKey,
      debugLogDiagnostics: true,
      routes: [
        StatefulShellRoute.indexedStack(
          builder: (context, state, navigationShell) {
            return ScaffoldWithNestedNavigation(
                navigationShell: navigationShell);
          },
          branches: List.generate(
            NavBar.enabledValues.length,
            (index) => NavBar.enabledValues[index].branch,
          ),
        ),

        // /splash screen
        GoRoute(
          path: Routes.splash,
          name: Routes.splash,
          parentNavigatorKey: _rootNavigatorKey,
          pageBuilder: (context, state) => NoTransitionPage(
            key: state.pageKey,
            child: const SplashScreen(),
          ),
        ),

        // ///recipes screen
        // GoRoute(
        //     path: Routes.recipes,
        //     name: Routes.recipes,
        //     parentNavigatorKey: _rootNavigatorKey,
        //     pageBuilder: (context, state) {
        //       return NoTransitionPage(
        //         key: state.pageKey,
        //         child: const RecipesScreen(),
        //       );
        //     }),

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
      ],
    );
  },
);

class Routes {
  static const splash = '/';
  static const home = '/home';
  static const recipes = '/recipes';
  // static const mealType = '/mealType';
  static const recipeDetails = '/details';
  static const cart = '/cart';
  static const shoppingList = '/shoppingList';
  static const weekMenu = '/weekMenu';
  static const chooseRecipes = '/chooseRecipes';
  static const settings = '/settings';
  static const defaultPage = Routes.recipes;
}

extension NavBarNavigation on NavBar {
  StatefulShellBranch get branch {
    return switch (this) {
      NavBar.home =>

        ///recipes
        StatefulShellBranch(
          navigatorKey: _shellNavigatorRecipesKey,
          routes: [
            GoRoute(
              path: Routes.recipes,
              name: Routes.recipes,
              pageBuilder: (context, state) => NoTransitionPage(
                key: state.pageKey,
                child: const RecipesScreen(),
              ),
            ),
          ],
        ),
      NavBar.challenge =>

        ///challenge
        StatefulShellBranch(
          navigatorKey: _shellNavigatorChallengeKey,
          routes: [
            GoRoute(
              path: Routes.weekMenu,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: WeekMenuScreen(),
              ),
            ),
          ],
        ),
      NavBar.excercise =>

        ///excercise
        StatefulShellBranch(
          navigatorKey: _shellNavigatorExcerciseKey,
          routes: [
            GoRoute(
              path: Routes.settings,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: SettingsScreen(),
              ),
            ),
          ],
        ),
      NavBar.settings =>

        ///settings
        StatefulShellBranch(
          navigatorKey: _shellNavigatorSettingsKey,
          routes: [
            GoRoute(
              path: Routes.settings,
              pageBuilder: (context, state) => const NoTransitionPage(
                child: SettingsScreen(),
              ),
            ),
          ],
        ),
    };
  }
}
