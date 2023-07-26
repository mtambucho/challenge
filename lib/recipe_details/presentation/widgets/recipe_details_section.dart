import 'package:challenge/recipe_details/presentation/recipe_details_styles.dart';
import 'package:flutter/material.dart';

class RecipeDetailsSection extends StatelessWidget {
  const RecipeDetailsSection(
      {super.key, required this.title, required this.items});
  final String title;
  final List<String> items;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 16,
        ),
        Text(
          title,
          style: RecipeDetailsStyles.sectionTitleStyle,
        ),
        const SizedBox(height: 8),
        ...List.generate(
            items.length,
            (index) =>
                _Items(items[index], index == 0, index == items.length - 1)),
      ],
    );
  }
}

class _Items extends StatelessWidget {
  const _Items(this.item, this.isFirstItem, this.isLastItem);
  final String item;
  final bool isFirstItem;
  final bool isLastItem;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.2),
      child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: isFirstItem ? const Radius.circular(8) : Radius.zero,
              topRight: isFirstItem ? const Radius.circular(8) : Radius.zero,
              bottomLeft: isLastItem ? const Radius.circular(8) : Radius.zero,
              bottomRight: isLastItem ? const Radius.circular(8) : Radius.zero,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                item,
                style: RecipeDetailsStyles.sectionTextStyle,
              ),
            ),
          )),
    );
  }
}
