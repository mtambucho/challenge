import 'package:challenge/constants/colors.dart';
import 'package:challenge/constants/strings.dart';
import 'package:challenge/features/shopping_list/shopping_list_provider.dart';
import 'package:challenge/utils/double_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///create a shopping list screen to show the list of ingredients to buy
///using shoppingListProvider and receive the list of ShoppingListItem
class ShoppingListScreen extends ConsumerWidget {
  const ShoppingListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shoppingList = ref.watch(shoppingListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStrings.purchaseList),
      ),
      body: ListView.builder(
        itemCount: shoppingList.length,
        itemBuilder: (context, index) {
          final item = shoppingList[index];
          return ShoppingListItemWidget(
            item: item,
            onStatusChanged: (status) {
              ref
                  .read(shoppingListProvider.notifier)
                  .changePurchaseStatus(item, status);
            },
          );
        },
      ),
    );
  }
}

///create a shopping list item widget to show the name of the ingredient and the
///and the quantity to buy
///recieve a ShoppingListItem and a function to change the status of the item
///user can change the status of the item to purchased or to buy
///use the status to change the color of the widget
///use the status to show the button to change the status
class ShoppingListItemWidget extends StatelessWidget {
  const ShoppingListItemWidget({
    Key? key,
    required this.item,
    required this.onStatusChanged,
  }) : super(key: key);

  final ShoppingListItem item;
  final Function(ShoppingListItemStatus) onStatusChanged;

  @override
  Widget build(BuildContext context) {
    final quantity = item.ingredient.quantity;
    final unit = item.ingredient.unit;
    final subtitle = '${quantity.formatDouble()} ${unit ?? ''}';
    return InkWell(
      onTap: () {
        onStatusChanged(item.status == ShoppingListItemStatus.toBuy
            ? ShoppingListItemStatus.purchased
            : ShoppingListItemStatus.toBuy);
      },
      child: ListTile(
        title: Text(
          item.ingredient.name,
          style: item.status == ShoppingListItemStatus.purchased
              ? const TextStyle(decoration: TextDecoration.lineThrough)
              : null,
        ),
        subtitle: (subtitle.trim() == '0') ? null : Text(subtitle),
        trailing: item.status == ShoppingListItemStatus.toBuy
            ? Icon(
                Icons.shopping_cart,
                color: AppColors.primary.shade200,
              )
            : const Icon(
                Icons.remove_shopping_cart,
                color: Colors.grey,
              ),
      ),
    );
  }
}
