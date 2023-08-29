import 'package:challenge/domain/recipe.dart';
import 'package:challenge/features/recipe_details/presentation/widgets/recipe_details_section.dart';
import 'package:challenge/utils/double_extensions.dart';
import 'package:challenge/utils/string_extensions.dart';
import 'package:flutter/material.dart';

class IngredientsWidget extends StatefulWidget {
  const IngredientsWidget({
    super.key,
    required this.recipe,
    required this.people,
  });

  final Recipe recipe;
  final int people;

  @override
  State<IngredientsWidget> createState() => _IngredientsWidgetState();
}

class _IngredientsWidgetState extends State<IngredientsWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final items = widget.recipe.ingredients
        .map((e) =>
            getIngredientText(e, widget.people, widget.recipe.rendimiento))
        .toList();
    return RecipeDetailsSection(items: items, title: 'Ingredientes');
  }

  String getIngredientText(
      Ingredient recepyIngredient, int people, int rendimiento) {
    final totalQuantity = (recepyIngredient.quantity * people) / rendimiento;
    final cant = totalQuantity.format();
    final unit = recepyIngredient.unit?.toString() ?? '';
    final hasQuantity = cant.isNotEmpty || unit.isNotEmpty;
    final quantity =
        hasQuantity ? ' $cant${unit.isNotEmpty ? ' $unit de' : ''} ' : null;

    return (quantity ?? '') + recepyIngredient.name.capitalize();
  }
}
