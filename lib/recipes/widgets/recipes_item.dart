import 'package:challenge/cart/cart_provider.dart';
import 'package:challenge/domain/recipe.dart';
import 'package:challenge/favorites/fav_widget.dart';
import 'package:challenge/home/home_style.dart';
import 'package:challenge/utils/colors.dart';
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
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _Buttons(
                receta: receta,
                onTap: () {
                  ref.read(cartProvider.notifier).addOrRemoveItem(receta);
                },
                color: color,
                inCart: inCart,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        receta.name.toUpperCase(),
                        style: HomeStyle.itemTitle,
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
              const Icon(Icons.keyboard_arrow_right,
                  color: AppColors.grey, size: 30.0),
            ],
          ),
        ),
      ),
    );
  }
}

class _Buttons extends StatelessWidget {
  const _Buttons({
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
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FavRecipeWidget(
          recipe: receta,
        ),
        IconButton(
          icon: Icon(
            inCart ? Icons.shopping_cart : Icons.shopping_cart_outlined,
            color: inCart ? AppColors.primary : Colors.grey.shade700,
          ),
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          onPressed: onTap,
        ),
      ],
    );
  }
}
