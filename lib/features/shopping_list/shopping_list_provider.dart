import 'package:challenge/domain/recipe.dart';
import 'package:challenge/features/cart/application/cart_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///create a state notifier provider for shopping list provider
final shoppingListProvider =
    StateNotifierProvider<ShoppingListProvider, List<ShoppingListItem>>((ref) {
  ///get items from cart
  final cart = ref.watch(cartProvider);

  List<ShoppingListItem> items = [];

  ///add all ingredients from the cart to items
  for (var element in cart) {
    for (var ingredient in element.recipe.ingredients) {
      ///check if ingredient exists in item, if exists add the quantities in the
      ///ingredients if not add a new item
      if (items.any((e) => e.ingredient.name == ingredient.name)) {
        items = items
            .map((e) => e.ingredient.name == ingredient.name &&
                    e.ingredient.unit == e.ingredient.unit
                ? ShoppingListItem(
                    ingredient: e.ingredient.copyWith(
                        quantity: e.ingredient.quantity +
                            (ingredient.quantity * element.count)),
                    status: e.status,
                  )
                : e)
            .toList();
        continue;
      } else {
        ///multiply all ingredients in ingredient with the count of the recipe
        ///and addit to the items
        items.add(ShoppingListItem(
            ingredient: ingredient.copyWith(
                quantity: ingredient.quantity * element.count)));
      }
    }
  }

  return ShoppingListProvider(
    items,
    ref.read(cartProvider.notifier),
  );
});

//create ShoppingListProvider class
class ShoppingListProvider extends StateNotifier<List<ShoppingListItem>> {
  ShoppingListProvider(List<ShoppingListItem> state, this.cartProvider)
      : super(state);
  final CartProvider cartProvider;

  ///create a function to change the purchase status of the item
  void changePurchaseStatus(
      ShoppingListItem item, ShoppingListItemStatus status) {
    state = state
        .map((e) => e.ingredient.name == item.ingredient.name
            ? ShoppingListItem(ingredient: e.ingredient, status: status)
            : e)
        .toList()
      ..sort((a, b) => b.status.index.compareTo(a.status.index));
  }
}

class ShoppingListItem {
  final Ingredient ingredient;
  final ShoppingListItemStatus status;

  ShoppingListItem(
      {required this.ingredient, this.status = ShoppingListItemStatus.toBuy});
}

enum ShoppingListItemStatus {
  purchased,
  toBuy,
}
