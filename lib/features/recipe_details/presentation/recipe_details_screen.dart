import 'package:challenge/appbar/appbar.dart';
import 'package:challenge/constants/colors.dart';
import 'package:challenge/domain/meal_type.dart';
import 'package:challenge/domain/recipe.dart';
import 'package:challenge/features/recipe_details/presentation/recipe_details_styles.dart';
import 'package:challenge/features/recipe_details/presentation/widgets/recipe_details_icons.dart';
import 'package:challenge/features/recipe_details/presentation/widgets/recipe_details_ingredients.dart';
import 'package:challenge/features/recipe_details/presentation/widgets/recipe_details_recipe.dart';
import 'package:flutter/material.dart';

///create a widget to show the details of a recepy
/// `name` `type` `week` `description` `ingredients`

class RecipeDetailsScreen extends StatefulWidget {
  final Recipe recipe;
  final MealType mealType;
  const RecipeDetailsScreen(
      {Key? key, required this.recipe, required this.mealType})
      : super(key: key);

  @override
  State<RecipeDetailsScreen> createState() => _RecipeDetailsScreenState();
}

class _RecipeDetailsScreenState extends State<RecipeDetailsScreen> {
  late int people;
  @override
  void initState() {
    people = widget.recipe.rendimiento;
    super.initState();
  }

  void changePeople(RecipePortionsChange value) {
    switch (value) {
      case RecipePortionsChange.add:
        setState(() {
          people++;
        });
        break;
      case RecipePortionsChange.remove:
        if (people > 1) {
          setState(() {
            people--;
          });
        }
        break;
      case RecipePortionsChange.defaultPortions:
        setState(() {
          people = widget.recipe.rendimiento;
        });

        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.mealType.toString().toUpperCase(),
                    style: RecipeDetailsStyles.mealTypeStyle,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.recipe.name,
                    style: RecipeDetailsStyles.titleStyle,
                  ),
                  RecipeDetailsIcons(
                    portions: people,
                    onChange: changePeople,
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  IngredientsWidget(
                    recipe: widget.recipe,
                    people: people,
                  ),
                  if (widget.recipe.receta != null &&
                      (widget.recipe.receta?.isNotEmpty ?? false))
                    RecepyDetailsRecipe(recipe: widget.recipe),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
