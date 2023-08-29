import 'package:challenge/domain/meal_type.dart';
import 'package:challenge/domain/recipe.dart';
import 'package:challenge/features/home/home_style.dart';
import 'package:challenge/features/week_menu/application/week_menu_provider.dart';
import 'package:challenge/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

///show mealtype values in a card with a image
class DayMenuItem extends ConsumerStatefulWidget {
  const DayMenuItem({
    required this.type,
    required this.week,
    required this.day,
    Key? key,
  }) : super(key: key);

  final MealType type;
  final int week;
  final int day;

  @override
  ConsumerState<DayMenuItem> createState() => _WeekMenuItemState();
}

class _WeekMenuItemState extends ConsumerState<DayMenuItem> {
  void onWatch(Recipe? recipe) async {
    if (recipe != null) {
      final response = await context.pushNamed(Routes.recipeDetails,
          extra: {'recipe': recipe, 'mealType': widget.type});
      if (response is Recipe) {
        ref.read(weekMenuProvider.notifier).addRecipeForDay(
              day: widget.day,
              type: widget.type,
              recipe: response,
            );
      }
    } else {
      onChange();
    }
  }

  void onChange() async {
    final response = await context.pushNamed(Routes.chooseRecipes, extra: {
      'mealType': widget.type.toRawValue(),
      'itemsSelectables': true,
    });
    if (response is Recipe) {
      ref.read(weekMenuProvider.notifier).addRecipeForDay(
            day: widget.day,
            type: widget.type,
            recipe: response,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final color = widget.type.color();
    final url = widget.type.imageURL();
    final text = widget.type.toString();

    ///read weekMenuProvider
    final weekMenus = ref.watch(weekMenuProvider);
    final menuForDay = weekMenus.getMealsForDay(widget.day);
    Recipe? recipe;
    if (menuForDay != null) {
      recipe = menuForDay.meals[widget.type];
    }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Stack(children: [
          GestureDetector(
            onTap: () => onWatch(recipe),
            child: Container(
              padding: const EdgeInsets.all(4),
              color: recipe != null ? color : Colors.grey.shade300,
              child: ConstrainedBox(
                constraints: const BoxConstraints(minHeight: 60),
                child: ListTile(
                  leading: Image.asset(
                    url,
                    fit: BoxFit.fill,
                    width: 70,
                    height: 100,
                  ),
                  title: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      text,
                      style: HomeStyle.title,
                    ),
                  ),
                  subtitle: (recipe != null)
                      ? Text(recipe.name)
                      : const SizedBox.shrink(),

                  ///add or update recipe button in trailing

                  trailing: const SizedBox(width: 60),
                ),
              ),
            ),
          ),
          if (recipe != null)
            Positioned.fill(
                child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                  onTap: onChange,
                  child: Container(
                    color: Colors.black.withAlpha(40),
                    width: 60,
                    child:
                        const Center(child: Icon(Icons.change_circle_outlined)),
                  )),
            ))
        ]),
      ),
    );
  }
}
