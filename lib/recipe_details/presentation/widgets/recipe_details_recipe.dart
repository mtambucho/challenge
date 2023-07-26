import 'package:challenge/domain/recipe.dart';
import 'package:challenge/recipe_details/presentation/widgets/recipe_details_section.dart';
import 'package:challenge/utils/string_extensions.dart';
import 'package:flutter/material.dart';

class RecepyDetailsRecipe extends StatelessWidget {
  const RecepyDetailsRecipe({
    super.key,
    required this.recipe,
  });

  final Recipe recipe;

  @override
  Widget build(BuildContext context) {
    return RecipeDetailsSection(
      title: 'Preparación',
      items: recipe.receta!.map((e) => e.capitalize()).toList(),
    );
  }
}
