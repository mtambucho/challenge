import 'package:challenge/cart/cart_provider.dart';
import 'package:challenge/domain/recipe.dart';
import 'package:challenge/favorites/fav_widget.dart';
import 'package:challenge/global_widgets/app_card.dart';
import 'package:challenge/home/home_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///create another ItemWidge
///create another ItemWidget but receive a receta and show all the information
///in a blue card with rounded borders
class RecipesItem extends ConsumerWidget {
  const RecipesItem({
    Key? key,
    required this.receta,
    required this.onTap,
    required this.color,
    required this.inCart,
  }) : super(key: key);

  final Recipe receta;
  final VoidCallback onTap;
  final Color color;
  final bool inCart;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppCard(
      color: color,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        receta.name,
                        style: HomeStyle.title,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        receta.description,
                        style: HomeStyle.item,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FavRecipeWidget(
                    recipe: receta,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.shopping_cart,
                      color: inCart
                          ? Colors.yellow.shade700
                          : Colors.grey.shade700,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    onPressed: () {
                      ref.read(cartProvider.notifier).addItem(receta);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
