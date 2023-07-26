import 'package:challenge/domain/recipe.dart';
import 'package:challenge/global_widgets/app_card.dart';
import 'package:challenge/home/home_style.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///create another ItemWidge
///create another ItemWidget but receive a receta and show all the information
///in a blue card with rounded borders
class ChoseRecipesItem extends ConsumerWidget {
  const ChoseRecipesItem({
    Key? key,
    required this.recipe,
    required this.onTap,
    required this.color,
    required this.inCart,
  }) : super(key: key);

  final Recipe recipe;
  final VoidCallback onTap;
  final Color color;
  final bool inCart;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppCard(
      color: color,
      child: ListTile(
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            recipe.name,
            style: HomeStyle.title,
          ),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            recipe.description,
            style: HomeStyle.item,
          ),
        ),
        onTap: onTap,
      ),
    );
  }
}
