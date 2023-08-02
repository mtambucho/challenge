import 'package:challenge/cart/cart_widget.dart';
import 'package:challenge/favorites/fav_widget.dart';
import 'package:challenge/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///create a custom app bar to reuse in the hole application
class CustomAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.titleImage,
    this.actions,
    this.leading,
    this.showFav = false,
  }) : super(key: key);

  final String? title;
  final String? titleImage;
  final List<Widget>? actions;
  final Widget? leading;
  final bool showFav;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Theme(
      data: Theme.of(context).copyWith(brightness: Brightness.light),
      child: AppBar(
        elevation: 0,
        backgroundColor: AppColors.scaffold,
        title: title != null
            ? titleImage != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        titleImage!,
                        height: 40,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        title!,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 17),
                      ),
                    ],
                  )
                : Text(
                    title!,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 17),
                  )
            : null,
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
