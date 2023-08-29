import 'dart:async';
import 'dart:convert';

import 'package:challenge/domain/recipe.dart';
import 'package:challenge/features/cart/domain/cart_item.dart';
import 'package:challenge/features/preferences/domain/preferences.dart';
import 'package:challenge/features/week_menu/domain/day_meals.dart';
import 'package:challenge/utils/router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'local_storage_manager.g.dart';

class LocalStorageManager {
  late SharedPreferences manager;

  Future<void> init() async {
    manager = await SharedPreferences.getInstance();
  }

  static const hasSignedIn = 'hasSignedIn';

  Future<bool> write<T>({
    required String key,
    required T value,
  }) async {
    var isValueStored = false;
    switch (T) {
      case String:
        isValueStored = await manager.setString(key, value as String);
        break;
      case bool:
        isValueStored = await manager.setBool(key, value as bool);
        break;
      case int:
        isValueStored = await manager.setInt(key, value as int);
        break;
      default:
        final jsonValue = json.encode(value);
        isValueStored = await manager.setString(key, jsonValue);
        break;
    }
    return isValueStored;
  }

  T? read<T>({
    required String key,
  }) {
    switch (T) {
      case String:
        return manager.getString(key) as T?;
      case bool:
        return manager.getBool(key) as T?;
      case int:
        return manager.getInt(key) as T?;
    }
    return null;
  }

  ///save the cart list in the local storage
  void saveCartList(List<CartItem> item) {
    final List<dynamic> encodedJson =
        item.map((dayMeals) => dayMeals.toJson()).toList();
    write(key: 'cart', value: encodedJson);
  }

  ///get the cart list from the local storage
  List<CartItem> getCartList() {
    final jsonStr = read<String>(key: 'cart');
    if (jsonStr == null) {
      return [];
    }
    final List<dynamic> decodedJson = json.decode(jsonStr);
    return decodedJson.map((json) => CartItem.fromJson(json)).toList();
  }

  ///save List<WeekMeals> meals
  void saveWeeksRecipes(List<DayMeals> meals) {
    final List<dynamic> encodedJson =
        meals.map((dayMeals) => dayMeals.toJson()).toList();
    write(key: 'meals', value: encodedJson);
  }

  ///get List<WeekMeals> meals
  List<DayMeals> getWeeksRecipes() {
    final jsonStr = read<String>(key: 'meals');
    if (jsonStr == null) {
      return [];
    }
    final List<dynamic> decodedJson = json.decode(jsonStr);
    return decodedJson.map((json) => DayMeals.fromJson(json)).toList();
  }

  ///save the starting date of the week
  Preferences getPreferences() {
    final jsonStr = read<String>(key: 'preferences');
    if (jsonStr == null) {
      return Preferences(DateTime(2023, 7, 3));
    }
    return Preferences.fromJson(json.decode(jsonStr));
  }

  void saveStartupPage(String startupPage) {
    write(key: 'startup_page', value: startupPage);
  }

  String getStartupPage() {
    return read<String>(key: 'startup_page') ?? Routes.defaultPage;
  }

  ///get the starting date of the week
  void savePreferences(Preferences preferences) {
    write(key: 'preferences', value: preferences.toJson());
  }

  ///save the favorites recipes
  List<Recipe> getFavorites() {
    final jsonStr = read<String>(key: 'favorites');
    if (jsonStr == null) {
      return [];
    }
    final List<dynamic> decodedJson = json.decode(jsonStr);
    return decodedJson.map((json) => Recipe.fromJson(json)).toList();
  }

  ///save the favorites recipes
  void saveFavorite(Recipe recipe) {
    final fav = getFavorites();
    fav.add(recipe);
    final List<dynamic> encodedJson = fav.map((f) => f.toJson()).toList();
    write(key: 'favorites', value: encodedJson);
  }

  ///remove the favorites recipes
  void removeFavorite(Recipe recipe) {
    final fav = getFavorites();
    fav.remove(recipe);
    final List<dynamic> encodedJson = fav.map((f) => f.toJson()).toList();
    write(key: 'favorites', value: encodedJson);
  }
}

@riverpod
LocalStorageManager localStorageManager(LocalStorageManagerRef ref) {
  return LocalStorageManager();
}
