import 'package:challenge/cart/cart_provider.dart';
import 'package:challenge/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

///create a cart widget to put in the appbar
///with a cant of items to put in a badge
class CartWidget extends ConsumerWidget {
  const CartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ///watch the cant of ingredients in the cart with ref.watch(cartProvider)
    final cart = ref.watch(cartProvider);

    return IconButton(
      onPressed: () {
        context.pushNamed(Routes.cart);
      },
      icon: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Icon(cart.isNotEmpty
                ? Icons.shopping_cart
                : Icons.shopping_cart_outlined),
          ),
          if (cart.isNotEmpty)
            Positioned(
              right: -2,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                constraints: const BoxConstraints(
                  minWidth: 16,
                  minHeight: 16,
                ),
                child: Text(
                  cart.length.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
        ],
      ),
    );
  }
}
