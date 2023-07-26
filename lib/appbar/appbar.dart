import 'package:challenge/cart/cart_widget.dart';
import 'package:challenge/favorites/fav_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///create a custom app bar to reuse in the hole application
class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.leading,
    this.showFav = false,
  }) : super(key: key);

  final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool showFav;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Theme(
      data: Theme.of(context).copyWith(brightness: Brightness.light),
      child: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        actions: [
          ...?actions,
          if (showFav) const FavWidget(),
          const CartWidget(),
        ],
        leading: leading,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
