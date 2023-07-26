import 'package:challenge/cart/cart_provider.dart';
import 'package:challenge/domain/recipe.dart';
import 'package:challenge/drawer/drawer.dart';
import 'package:challenge/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

///create cart widget
class CartScreen extends ConsumerWidget {
  const CartScreen(this.showDrawer, {Key? key}) : super(key: key);
  final bool showDrawer;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    return Scaffold(
      drawer: showDrawer ? const AppDrawer() : null,
      appBar: AppBar(
        title: const Text('Carrito'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final item = cart[index];
                return CartItem(
                  recipe: item.recipe,
                  count: item.count,
                  onCountChanged: (count) {
                    ref.read(cartProvider.notifier).addItemCount(item, count);
                  },
                  onRemoved: () {
                    ref.read(cartProvider.notifier).removeItem(item);
                  },
                );
              },
            ),
          ),
          CartButton(enabled: ref.read(cartProvider.notifier).totalItems > 0)
        ],
      ),
    );
  }
}

///create a cart item widget when the name adn the count of the recipe is shown
///user can change the count of the recipe and delete the recipe from the cart

class CartItem extends ConsumerWidget {
  const CartItem({
    Key? key,
    required this.recipe,
    required this.count,
    required this.onCountChanged,
    required this.onRemoved,
  }) : super(key: key);

  final Recipe recipe;
  final int count;
  final ValueChanged<int> onCountChanged;
  final VoidCallback onRemoved;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: ListTile(
        title: Text(recipe.name),
        // subtitle: Text(recipe.type.toString().capitalize()),
        leading: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: onRemoved,
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                onCountChanged(count - 1);
              },
            ),
            Text(count.toString()),
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                onCountChanged(count + 1);
              },
            ),
          ],
        ),
      ),
    );
  }
}

///Create a "Comprar" button to finish the purchase
class CartButton extends ConsumerWidget {
  const CartButton({required this.enabled, Key? key}) : super(key: key);
  final bool enabled;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: ElevatedButton(
        onPressed: enabled
            ? () {
                ///use go router to navigate to shopping list screen
                context.pushNamed(Routes.shoppingList);
              }
            : null,

        ///rounded borders
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          backgroundColor: enabled ? null : Colors.grey,
        ),
        child: const Padding(
          padding: EdgeInsets.all(20.0),
          child: Text(
            'Lista de compras',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
