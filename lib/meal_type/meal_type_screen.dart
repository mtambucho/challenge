import 'package:challenge/appbar/appbar.dart';
import 'package:challenge/domain/meal_type.dart';
import 'package:challenge/drawer/drawer.dart';
import 'package:challenge/global_widgets/app_card.dart';
import 'package:challenge/home/home_style.dart';
import 'package:challenge/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MealTypeScreen extends StatelessWidget {
  const MealTypeScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: const CustomAppBar(
        title: 'Tipo',
      ),
      body: Center(
        child: Column(
            children: List.generate(
          MealType.values.length,
          (index) => Expanded(
            child: MealItem(
              text: MealType.values[index].toString(),
              imageURL: MealType.values[index].imageURL(),
              onTap: () {
                context.pushNamed(Routes.recipes, extra: {
                  'type': MealType.values[index],
                });
              },
              color: MealType.values[index].color(),
            ),
          ),
        )),
      ),
    );
  }
}

///show mealtype values in a card with a image
class MealItem extends StatelessWidget {
  const MealItem({
    Key? key,
    required this.text,
    required this.imageURL,
    required this.onTap,
    required this.color,
  }) : super(key: key);

  final String text;
  final String imageURL;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: AppCard(
          color: color,
          child: Center(
            child: ListTile(
              leading: Image.asset(
                imageURL,
                fit: BoxFit.fill,
                width: 70,
                height: 100,
              ),
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: HomeStyle.title,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
