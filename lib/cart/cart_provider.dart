import 'package:challenge/cart/model/cart_item.dart';
import 'package:challenge/domain/recipe.dart';
import 'package:challenge/services/local_storage_manager.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///create a cart provider with Riverpod to get the list of ingredients from the local storage

final cartProvider = StateNotifierProvider<CartProvider, List<CartItem>>((ref) {
  final cart = <CartItem>[];
  return CartProvider(
    cart,
    ref.read(localStorageManagerProvider),
  );
});

///create CartProvider
class CartProvider extends StateNotifier<List<CartItem>> {
  CartProvider(List<CartItem> state, this.localStorageManager) : super(state);
  final LocalStorageManager localStorageManager;

  ///total items in the cart
  int get totalItems => state.length;

  ///create a function to add ingredients to the cart
  void addOrRemoveItem(Recipe recipe) {
    ///check if the item recipe exist in the cart increment the count
    if (state.any((element) => element.recipe.name == recipe.name)) {
      ///remove from state
      state =
          state.where((element) => element.recipe.name != recipe.name).toList();
    }

    ///create a new item
    else {
      state = [...state, CartItem(recipe: recipe)];
      localStorageManager.saveCartList(state);
    }
  }

  ///create a function to add ingredients to the cart
  void addItemCount(CartItem item, int count) {
    ///check if the item recipe exist in the cart increment the count
    if (state.any((element) => element.recipe.name == item.recipe.name)) {
      state = state
          .map((e) => e.recipe.name == item.recipe.name
              ? CartItem(recipe: e.recipe, count: count)
              : e)
          .toList();
      localStorageManager.saveCartList(state);
      return;
    }
  }

  ///create a function to remove ingredients from the cart
  void removeItem(CartItem ingredient) {
    state = state
        .where((element) => element.recipe.name != ingredient.recipe.name)
        .toList();
    localStorageManager.saveCartList(state);
  }

  void init() {
    final value = localStorageManager.getCartList();
    if (value.isNotEmpty) {
      state = value;
    }
  }

  ///clear the cart
  void clear() {
    state = [];
    localStorageManager.saveCartList(state);
  }
}
